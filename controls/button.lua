local addon, ns = ...

local control = ns.controls.control
local fonts = ns.media.fonts

local button = control:extend({

	create = function(self, parent, options)

		local button = CreateFrame("Button", options.name, parent, "ActionButtonTemplate")
		local text = button:CreateFontString()
		text:SetFont(fonts.normal, 12)
		text:SetAllPoints(button)
		text:SetJustifyH("CENTER")

		self.frame = button
		self.label = text

	end,

	applyStyle = function(self, styler)
		styler:actionButton(self.frame)
	end,

	icon = function(self, value)
		self.frame.icon:SetTexture(value)
	end,

	text = function(self, value)
		self.label:SetText(value)
	end,

	click = function(self, handler)
		self.frame:SetScript("OnClick", function(f, mouseButton, down)
			handler(self, mouseButton, down)
		end)
	end,
})

ns.controls.button = button
