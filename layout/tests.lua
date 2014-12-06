require("framemodel")

local horizontal = loadfile("horizontal.lua")
local vertical = loadfile("vertical.lua")

local engine = {}
local ns = {
	layoutEngine = {
		addStrategy = function(self, name, strat)
			engine[name] = strat
		end,
	}
}

horizontal(nil, ns)
vertical(nil, ns)

local tests = {

	horizontal_autosize_two_frames_no_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = false,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 500)
		local frames = { Frame:new(10, 10), Frame:new(10, 10)}

		engine.horizontal(settings, container, frames)

		assert(container.width == 25)
		assert(container.height == 10)

	end,

	horizontal_autosize_two_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(15, 500)
		local frames = { Frame:new(10, 10), Frame:new(10, 10)}

		engine.horizontal(settings, container, frames)

		assert(container.width == 10)
		assert(container.height == 25)

	end,

	horizontal_auto_size_three_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(30, 500)
		local frames = { Frame:new(10, 10), Frame:new(10, 10), Frame:new(55, 10)}

		engine.horizontal(settings, container, frames)

		assert(container.width == 55)
		assert(container.height == 25)

	end,


	vertical_autosize_two_frames_no_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = false,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 500)
		local frames = { Frame:new(10, 10), Frame:new(10, 10)}

		engine.vertical(settings, container, frames)

		assert(container.width == 10)
		assert(container.height == 25)

	end,

	vertical_autosize_two_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 15)
		local frames = { Frame:new(10, 10), Frame:new(10, 10)}

		engine.vertical(settings, container, frames)

		assert(container.width == 25)
		assert(container.height == 10)

	end,

	vertical_auto_size_three_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 30)
		local frames = { Frame:new(10, 10), Frame:new(10, 10), Frame:new(10, 55)}

		engine.vertical(settings, container, frames)

		assert(container.width == 25)
		assert(container.height == 55)

	end,
}

for name, test in pairs(tests) do

	local status, message = pcall(function() test(engine) end)

	if status then
		status = "passed"
	else
		status = message
	end

	print(string.format("Test %s: %s", name:gsub("_", " "), status))

end








