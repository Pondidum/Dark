local addon, ns = ...

local controls = {

	defaults = {
		parent = UIParent
	},

	createDefaults = function(self, defaults)

		local this = {
			defaults = defaults
		}

		setmetatable(this, { __index = self })

		return this
	end,

}

ns.controls = controls
