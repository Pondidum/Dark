local addon, ns = ...

local fonts = ns.lib.media.fonts
local control = ns.controls.control

local textbox = control:extend({

	ctor = function(self, options)

		local edit = CreateFrame("editbox", options.name, options.parent, "InputBoxTemplate")
		edit:SetAutoFocus(false)
		edit:SetFont(fonts.normal, 12)

		self.frame = edit

	end,

})

ns.controls.textbox = textbox
