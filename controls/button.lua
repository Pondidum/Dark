local addon, ns = ...

local control = ns.controls.control

local button = control:extend({

	create = function(self, options)

		self.frame = CreateFrame("Button", options.name, options.parent, "ActionButtonTemplate")
		self.style:actionButton(self.frame)

	end,

	text = function(self, value)
		self.frame:SetText(value)
	end,
})

ns.controls.button = button
