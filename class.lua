local addon, ns = ...

local class = {

	extend = function(self, this)

		--i could put this method on class itself,
		--but then i couldnt completely close over the self/base var

		this.base = function(child)

			local index = function(_, methodName)
				return function(_, ...)
					self[methodName](child, ...)
				end
			end

			return setmetatable({}, { __index = index })
		end

		return setmetatable(this, { __index = self })

	end,

	new = function(self, ...)

		local this = setmetatable({}, { __index = self })
		this:ctor(...)

		return this

	end,

	ctor = function(self, ...)
	end,

	include = function(self, mixin)

		mixin:preMix(self)

		for name, value in pairs(mixin) do
			if name ~= "preMix" and name ~= "postMix" then
				self[name] = value
			end
		end

		mixin:postMix(self)

	end,
}

ns.class = class
