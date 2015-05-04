local addon, ns = ...
local controls = ns.controls
local fonts = ns.media.fonts
local style = ns.style

controls.textbox = function(self, config)

	config = config or {}
	config.type = "editbox"
	config.template = "InputBoxTemplate"

	local edit = self:frame(config)

	edit:SetAutoFocus(false)
	edit:SetFont(fonts.normal, 12)
	edit:SetSize(config.width or self.defaults.width or 75, 18)

	style:textbox(edit)

	if config.text then
		edit:SetText(config.text)
	end

	return edit

end
