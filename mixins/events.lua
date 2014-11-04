local addon, ns = ...

local sharedStore = {}
local sharedFrame = CreateFrame("Frame")

sharedFrame:SetScript("OnEvent", function(frame, ...)

	local targets = sharedStore[name] or {}

	for target, active in pairs(targets) do

		if active and target[name] then
			target[name](target, ...)
		end

	end

end)

local eventMixer = ns.mixin:extend({

	register = function(self, name)
		sharedStore[name] = sharedStore[name] or {}
		sharedStore[name][self] = true

		frame:RegisterEvent(name)
	end,

	unregister = function(self, name)

		if sharedStore[name] then
			sharedStore[name][self] = nil
		end

	end,

	isRegistered = function(self, name)

		return sharedStore[name] and sharedStore[name][self]

	end,

	postMix = function(self, target)

		if target.events and type(target.events) == "table" then
			for i, event in ipairs(target.events) do
				target:register(event)
			end
		end

	end,

})

ns.mixins.events = eventMixer
