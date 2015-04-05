local addon, ns = ...
local controls = ns.controls

controls.frame = function(self, config)

	local frame = CreateFrame(config.type or self.defaults.type or "Frame", config.name, config.parent or self.defaults.parent)

	frame:SetSize(config.width or self.defaults.width, config.height or self.defaults.height)

	return frame

end
