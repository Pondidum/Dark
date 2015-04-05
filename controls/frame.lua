local addon, ns = ...
local controls = ns.controls

controls.frame = function(self, config)

	local type = config.type or self.defaults.type or "Frame"
	local name = config.name
	local parent = config.parent or self.defaults.parent
	local template = config.template

	local frame = CreateFrame(type, name, parent, template)

	frame:SetSize(config.width or self.defaults.width, config.height or self.defaults.height)

	return frame

end
