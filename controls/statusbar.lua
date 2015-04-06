local addon, ns = ...
local textures = ns.media.textures
local controls = ns.controls

controls.statusbar = function(self, config)

	config = config or {}
	config.type = "Statusbar"

	local frame = self:frame(config)
	style:frame(frame)

	frame:SetStatusBarTexture(textures.normal)
	frame:SetStatusBarColor(unpack(config.color))

	return frame
end
