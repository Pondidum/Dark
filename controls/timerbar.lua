local addon, ns = ...
local controls = ns.controls

controls.timerbar = function(self, config)

	local frame = self:statusbar(config)

	local cdStart = 0
	local cdDuration = 0

	local onFinish = function()
		frame:SetScript("OnUpdate", nil)
		frame:SetMinMaxValues(0, 1)
		frame:SetValue(1)
	end

	local onUpdate = function()
		local t = GetTime() - cdStart

		if t >= cdDuration then
			onFinish()
		else
			frame:SetValue(t)
		end
	end

	frame.setCooldown = function(f, start, duration)
		cdStart = start
		cdDuration = duration

		if start == 0 and duration == 0 then
			onFinish()
		else
			frame:SetMinMaxValues(0, duration)
			frame:SetScript("OnUpdate", onUpdate)
		end

	end

	frame.setEmpty = function(f)
		onFinish()
		frame:SetValue(0)
	end

	return frame

end
