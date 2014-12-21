local addon, ns = ...

local configReaderMixer = ns.mixin:extend({

	readConfig = function(self, config)

		for i, row in ipairs(config) do

			local methodName = row[1]
			local method = self[methodName]

			if not method then
				error(string.format("Unable to find a method called '%s'", methodName))
			end

			method(self, select(2, unpack(row)))

		end
	end,
})

ns.mixins.configReader = configReaderMixer
