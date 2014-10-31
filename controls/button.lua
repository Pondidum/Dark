local addon, ns = ...

local control = ns.controls.control

local button = control:extend({

	create = function(self, options)

		local button = CreateFrame("Button", options.name, options.parent, "ActionButtonTemplate")
		self.frame = button

	end,

	text = function(self, value)
		self.frame:SetText(value)
	end,
})

ns.controls.button = button
