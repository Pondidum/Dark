local addon, ns = ...

local mixin = {

	extend = function(self, this)
		return setmetatable(this, { __index = self })
	end,

	preMix = function(self, target)
	end,

	postMix = function(self, target)
	end,

}

ns.mixin = mixin
