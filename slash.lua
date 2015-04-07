local addon, ns = ...
local class = ns.class

local slash = class:extend({

	ctor = function(self, prefix, handlers)
		self.prefix = prefix
		self.handlers = handlers or {}

		local up = string.upper(prefix)
		local down = string.lower(prefix)

		_G["SLASH_"..up.."1"] = "/"..down

		SlashCmdList[up] = function(args)
			self:process(args)
		end

	end,

	add = function(self, argument, subhandlers)
		self.handlers[argument] = subhandlers
	end,

	process = function(self, args)

		local parts = self:splitParts(args)
		local parent = self.handlers

		if #parts == 0 then

			local action = parent._default or self.print

			action(self)
			return

		end

		for i, part in ipairs(parts) do

			local current = parent[part]
			local t = type(current)

			if current == nil then
				print(string.format("Unknown argument '%s'", part))
				return
			elseif t == "table" then
				parent = current
			elseif t == "function" then
				current(self, select(i+1, unpack(parts)))
				return
			else
				return
			end

		end

	end,

	print = function(self)

		print(self.prefix .. ":")

		for name, handler in pairs(self.handlers) do
			print("", name)
		end

	end,

	splitParts = function(self, args)

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

	end,


})

ns.slash = slash
