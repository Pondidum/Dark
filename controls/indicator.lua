local addon, ns = ...
local colors = ns.media.colors
local controls = ns.controls

local style = ns.style
local highlightColor = { 41/255, 79/255, 155/255, 1 }

controls.indicator = function(self, config)

	config = config or {}

	local frame = self:frame(config)
	local glow = self:frame({ parent = frame, template = "ActionBarButtonSpellActivationAlert"})

	local xoffset = config.xoffset or 8
	local yoffset = config.yoffset or 6

	glow:SetPoint("TOPLEFT", frame, "TOPLEFT", -xoffset , yoffset)
	glow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", xoffset, -yoffset)

	style:background(frame)
	style:border(frame)

	glow.animOut:SetScript("OnFinished", function(self) glow:Hide() end)

	frame.setState = function(self, state)

		if state then
			frame:SetBackdropColor(unpack(config.color or highlightColor))
		else
			frame:SetBackdropColor(unpack(colors.background))
		end

	end

	frame.showGlow = function()

		if glow.animOut:IsPlaying() then
			glow.animOut:Stop()
		end

		if not glow:IsVisible() then
			glow.animIn:Play()
		end
	end

	frame.hideGlow = function()

		if glow.animIn:IsPlaying() then
			glow.animIn:Stop()
		end

		if glow:IsVisible() then
			glow.animOut:Play()
		end

	end

	return frame

end
