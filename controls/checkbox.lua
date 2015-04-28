local addon, ns = ...
local controls = ns.controls
local style = ns.style

controls.checkbox = function(self, config)

	config = config or {}
	config.type = "checkbutton"
	config.template = "UICheckButtonTemplate"
	config.width = config.width or 32
	config.height = config.height or 32

	return self:frame(config)

end
