local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local label = control:extend({

	ctor = function(self, opitons)

		self.frame = CreateFrame("Frame", options.name, options.parent)
		self.label = self.frame:CreateFontString()

		self.label:SetAllPoints(self.frame)
		self.label:SetFont(fonts.normal, 12)

		self:setText(options.text)
	end,

	setText = function(self, value)
		self.label:SetText(value)
	end,

})

ns.controls.label = label
