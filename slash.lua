local addon, ns = ...
local class = ns.class

local slash = class:extend({

	ctor = function(self)
		self.handlers = {}

		SLASH_DARK1 = "/dark"
		SlashCmdList["DARK"] = function (args)
			self:process(args)
		end

	end,

	register = function(self, name, graph)
		self.handlers[name] = graph
	end,

	process = function(args)

		local parts = splitParts(args)
		local parent = self.handlers

		for i, part in ipairs(parts) do

			local current = parent[part]
			local t = type(current)

			if current == nil then
				print(string.format("Unknown argument '%s'", part))
				return
			elseif t == "table" then
				parent = current
			elseif t == "function" then
				current(select(i+1, unpack(parts)))
			else
				return
			end

		end

	end,

	splitParts = function(args)

		local parts = {}
		local part = ''
		local inQuote = false

		for letter in args:gmatch(".") do

			if letter == ' ' and not inQuote then

				table.insert(parts, part)
				part = ''

			elseif letter == '"' or letter == "'" then

				inQuote = not inQuote

			else

				part = part .. letter

			end

		end

		if part ~= '' then
			table.insert(parts, part)
		end

		return parts

	end

})

ns.slash = slash

--[[
local s = slash.new()


local testGraph = {
	enable = function() print("enable") end,
	channel = function(value) print("channel", value) end,
	suffix = function(value) print("suffix", value) end,
}

s.register("omg", testGraph)

s.process('omg enable')
s.process('omg channel')
s.process('omg channel test')
s.process('omg channel party test')
s.process('omg suffix one')
s.process('omg suffix winkle next')
s.process('omg suffix "winkle next"')
]]