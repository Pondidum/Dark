local addon, ns = ...
local class = ns.class

local slash = class:extend({

	ctor = function(self, prefix)
		self.handlers = {}

		local up = string.upper(prefix)
		local down = string.lower(prefix)

		_G["SLASH_"..up.."1"] = "/"..down

		SlashCmdList[up] = function (args)
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
