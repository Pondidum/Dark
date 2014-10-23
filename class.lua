local addon, ns = ...

local class = {

	extend = function(self, this)

		this.base = self
		return setmetatable(this, { __index = self })

	end,

	new = function(self)

		local this = setmetatable({}, { __index = self })
		this:ctor()

		return this

	end,

	ctor = function(self)
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
