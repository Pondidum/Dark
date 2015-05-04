local addon, ns = ...
local controls = ns.controls
local fonts = ns.media.fonts

controls.font = function(self, config)

	local parent = config.parent or self.defaults.parent
	local fontName = config.font or self.defaults.font
	local fontSize = config.fontSize or self.defaults.fontSize
	local style = config.fontStyle or self.defaults.fontStyle

	local font = fonts:create(parent, fontName, fontSize, fontStyle)

	if config.width then
		font:SetWidth(config.width)
	end

	if config.align then
		font:SetJustifyH(config.align)
	end

	if config.text then
		font:SetText(config.text)
	end

	return font
end
