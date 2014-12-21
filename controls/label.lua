local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local label = control:extend({

	defaultWidth = 50,

	create = function(self, options)

		self.frame = CreateFrame("Frame", options.name, options.parent)
		self.label = self.frame:CreateFontString()

		self.label:SetAllPoints(self.frame)
		self.label:SetFont(fonts.normal, 12)

		self.style:frame(self.frame)

	end,

	text = function(self, value)
		self.label:SetText(value)
	end,

	align = function(self, value)
		self.label:SetJustifyH(value)
	end,

})

ns.controls.label = label
