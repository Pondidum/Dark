local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local label = control:extend({

	create = function(self, options)

		self.frame = CreateFrame("Frame", options.name, options.parent)
		self.label = self.frame:CreateFontString()

		self.label:SetAllPoints(self.frame)
		self.label:SetFont(fonts.normal, 12)

	end,

	text = function(self, value)
		self.label:SetText(value)
	end,

})

ns.controls.label = label
