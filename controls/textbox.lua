local addon, ns = ...
local controls = ns.controls
local style = ns.style

controls.textbox = function(self, config)

	config = config or {}
	config.type = "editbox"
	config.template = "InputBoxTemplate"

	local edit = self:frame(config)
	edit:SetAutoFocus(false)
	edit:SetFont(fonts.normal, 12)

	style:textbox(edit)

	return edit

end
