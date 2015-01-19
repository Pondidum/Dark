local addon, ns = ...

local sharedStore = {}
local sharedFrame = CreateFrame("Frame")

sharedFrame:SetScript("OnUpdate", function(frame, elapsed)

	for target, active in pairs(sharedStore) do

		if active and target.onUpdate then
			target:onUpdate(elapsed)
		end

	end

end)

local updateMixer = ns.mixin:extend({

	startUpdates = function(self)
		sharedStore[self] = true
	end,

	stopUpdates = function(self)

		if sharedStore[self] then
			sharedStore[self] = nil
		end

	end,

	postMix = function(self, target)
		target:startUpdates()
	end,
})

ns.mixins.updates = updateMixer
