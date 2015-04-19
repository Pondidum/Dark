local addon, ns = ...
local controls = ns.controls

controls.button = function(self, config)

	config = config or {}
	config.type = "Button"
	config.template = "ActionButtonTemplate"

	local button = self:frame(config)
	local font = self:font({ parent = button, text = config.text })
	font:SetAllPoints(button)

	if config.respondsTo then
		button:RegisterForClicks(config.respondsTo)
	end

	if config.onClick then
		button:SetScript("OnClick", config.onClick)
	end

	return button

end
