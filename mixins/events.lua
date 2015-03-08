local addon, ns = ...

local eventMixer = ns.mixin:extend({

	register = function(self, name)
		self.__events[name] = self.__events[name] or {}
		self.__events[name][self] = true

		self.__frame:RegisterEvent(name)
	end,

	unregister = function(self, name)

		if self.__events[name] then
			self.__events[name][self] = nil
		end

	end,

	isRegistered = function(self, name)

		return self.__events[name] and self.__events[name][self]

	end,

	preMix = function(self, target)

		target.__events = {}
		target.__frame = CreateFrame("Frame")

		target.__frame:SetScript("OnEvent", function(frame, name, ...)

			local targets = target.__events[name] or {}

			for target, active in pairs(targets) do

				if active and target[name] then
					target[name](target, ...)
				end

			end

		end)
	end,

	postMix = function(self, target)
		if target.events and type(target.events) == "table" then
			for i, event in ipairs(target.events) do
				target:register(event)
			end
		end

	end,

	new = function(self, eventSet)

		local instance = {

			events = {},

			ctor = function(this)
				this:include(ns.mixins.events)
			end,
		}

		for eventName, handler in pairs(eventSet) do
			table.insert(instance.events, eventName)
			instance[eventName] = handler
		end

		return ns.class:extend(instance):new()

	end,
})

ns.mixins.events = eventMixer
