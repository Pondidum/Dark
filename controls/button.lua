local addon, ns = ...

local control = ns.controls.control
local fonts = ns.media.fonts

local button = control:extend({

	create = function(self, parent, options)

		local button = CreateFrame("Button", options.name, parent, "ActionButtonTemplate")

		button.text = button:CreateFontString()
		button.text:SetFont(fonts.normal, 12)
		button.text:SetAllPoints(button)
		button.text:SetJustifyH("CENTER")

		self.frame = button

	end,

	applyStyle = function(self, styler)
		styler:actionButton(self.frame)
	end,

	icon = function(self, value)
		self.frame.icon:SetTexture(value)
	end
})

ns.controls.button = button
