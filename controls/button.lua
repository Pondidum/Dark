local addon, ns = ...
local controls = ns.controls

controls.button = function(self, config)

	config = config or {}
	config.type = config.type or "Button"
	config.template = "ActionButtonTemplate"

	local button = self:frame(config)
	local font = self:font({ parent = button, text = config.text })
	font:SetAllPoints(button)
	font:SetJustifyH("CENTER")

	if config.respondsTo then
		button:RegisterForClicks(config.respondsTo)
	end

	if config.onClick then
		button:SetScript("OnClick", config.onClick)
	end

	if config.icon then
		button.icon:SetTexture(config.icon)
	end

	return button

end
