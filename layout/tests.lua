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
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)

		engine.horizontal(settings, container, { first, second })

		assert(container.width == 25, container.width)
		assert(container.height == 10, container.height)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 15, second.xoffset)
		assert(second.yoffset == 0, second.yoffset)
	end,

	horizontal_autosize_two_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(15, 500)
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)

		engine.horizontal(settings, container, { first, second })

		assert(container.width == 10, container.width)
		assert(container.height == 25, container.height)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 0, second.xoffset)
		assert(second.yoffset == -15, second.yoffset)
	end,

	horizontal_auto_size_three_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(30, 500)
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)
		local third = Frame:new(55, 10)

		engine.horizontal(settings, container, { first, second, third })

		assert(container.width == 55, container.width)
		assert(container.height == 25, container.height)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 15, second.xoffset)
		assert(second.yoffset == 0, second.yoffset)

		assert(third.xoffset == 0, third.xoffset)
		assert(third.yoffset == -15, third.yoffset)

	end,

	vertical_autosize_two_frames_no_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = false,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 500)
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)

		engine.vertical(settings, container, { first, second })

		assert(container.width == 10, container.width)
		assert(container.height == 25, container.height)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 0, second.xoffset)
		assert(second.yoffset == -15, second.yoffset)

	end,

	vertical_autosize_two_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 15)
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)

		engine.vertical(settings, container, { first, second })

		assert(container.width == 25, container.width)
		assert(container.height == 10, container.height)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 15, second.xoffset)
		assert(second.yoffset == 0, second.yoffset)

	end,

	vertical_auto_size_three_frames_wrap = function(engine)

		local settings = {
			origin = "TOPLEFT",
			wrap = true,
			itemSpacing = 5,
			autosize = "both",
		}

		local container = Frame:new(500, 30)
		local first = Frame:new(10, 10)
		local second = Frame:new(10, 10)
		local third = Frame:new(10, 55)

		engine.vertical(settings, container, { first, second, third })

		assert(container.width == 25)
		assert(container.height == 55)

		assert(first.xoffset == 0, first.xoffset)
		assert(first.yoffset == 0, first.yoffset)

		assert(second.xoffset == 0, second.xoffset)
		assert(second.yoffset == -15, second.yoffset)

		assert(third.xoffset == 15, third.xoffset)
		assert(third.yoffset == 0, third.yoffset)

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








