local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local textbox = control:extend({

	create = function(self, parent, options)

		local edit = CreateFrame("editbox", options.name, parent, "InputBoxTemplate")
		edit:SetAutoFocus(false)
		edit:SetFont(fonts.normal, 12)

		self.frame = edit

	end,

	applyStyle = function(self, styler)
		styler:textbox(self.frame)
	end,

	text = function(self, value)
		self.frame:SetText(value)
	end,

})

ns.controls.textbox = textbox
