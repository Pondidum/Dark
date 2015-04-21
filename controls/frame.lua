local addon, ns = ...
local controls = ns.controls

controls.frame = function(self, config)

	config = config or {}

	local type = config.type or self.defaults.type or "Frame"
	local name = config.name
	local parent = config.parent or self.defaults.parent
	local template = config.template

	local frame = CreateFrame(type, name, parent, template)

	local w = config.width or self.defaults.width or 0
	local h = config.height or self.defaults.height or 0

	frame:SetSize(w, h)

	return frame

end
