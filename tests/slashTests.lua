--global state required
SlashCmdList = {}

local classFile = loadfile("..\\class.lua")
local slashFile = loadfile("..\\slash.lua")

local ns = {}
classFile("TestHarness", ns)
slashFile("TestHarness", ns)

local tests = {

	processing_with_no_args = function()

		local firstRan = false

		local handler = ns.slash:new("dark", {
			first = function(self)
				firstRan = true
			end,
		})

		handler:process("first")
		assert(firstRan == true)

	end,

	processing_with_args = function()

		local firstRan = false
		local firstArgs = nil

		local handler = ns.slash:new("dark", {
			first = function(self, arg1)
				firstRan = true
				firstArgs = arg1
			end,
		})

		handler:process("first second")

		assert(firstRan == true)
		assert(firstArgs == "second", firstArgs)

	end,

	processing_with_no_args_and_custom_default_handler = function()

		local defaultRan = false

		local handler = ns.slash:new("dark", {
			_default = function(self)
				defaultRan = true
			end,
		})

		handler:process("")

		assert(defaultRan == true)

	end,

	adding_a_handler_later_can_be_invoked = function()

		local baseRan = false
		local testRan = false

		local handler = ns.slash:new("dark", {
			test = function(self)
				baseRan = true
			end,
		})

		handler:add("interrupt", {
			test = function(self)
				testRan = true
			end,
		})

		handler:process("interrupt test")

		assert(baseRan == false)
		assert(testRan == true)

	end,

	when_creating_a_handler_from_an_instance_and_running_instance = function()

		local darkHelpRan = false
		local lightHelpRan = false

		local builtin = ns.slash:new("dark", {
			help = function(self)
				darkHelpRan = true
			end,
		})

		local handler = builtin:new("light", {
			help = function(self)
				lightHelpRan = true
			end,
		})

		builtin:process("help")

		assert(lightHelpRan == false)
		assert(darkHelpRan == true)

	end,

	when_creating_a_handler_from_an_instance_and_running_handler = function()

		local darkHelpRan = false
		local lightHelpRan = false

		local builtin = ns.slash:new("dark", {
			help = function(self)
				darkHelpRan = true
			end,
		})

		local handler = builtin:new("light", {
			help = function(self)
				lightHelpRan = true
			end,
		})

		handler:process("help")

		assert(lightHelpRan == true)
		assert(darkHelpRan == false)

	end,
}

for name, test in pairs(tests) do

	local status, message = pcall(function() test(engine) end)
	local flag = "PASS"

	if status then
		status = ""
	else
		status = ": " .. message
		flag = "FAIL"
	end

	print(string.format("%s Test %s%s", flag, name:gsub("_", " "), status))
end


