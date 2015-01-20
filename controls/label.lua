local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local label = control:extend({

	defaultWidth = 50,

	create = function(self, parent, options)

		self.frame = parent:CreateFontString(options.name, "OVERLAY")

		self.frame:SetFont(fonts.normal, 12)
		self.frame:SetShadowColor(0, 0, 0)
		self.frame:SetShadowOffset(1.25, -1.25)

	end,

	applyStyle = function(self, styler)
		styler:frame(self.frame)
	end,

	text = function(self, value)
		self.frame:SetText(value)
	end,

	align = function(self, value)
		self.frame:SetJustifyH(value)
	end,

})

ns.controls.label = label
