local addon, ns = ...

local configReaderMixer = ns.mixin:extend({

	readConfig = function(self, config)

		local readRowMethodName = "readConfigRow"
		local readRowMethod = self[readRowMethodName]

		for i, row in ipairs(config) do

			local methodName = row[1]
			local method = self[methodName]

			if readRowMethod then
				readRowMethod(self, unpack(row))

			elseif method then
				method(self, select(2, unpack(row)))

			else
				error(string.format(
					"Unable to find a method called '%s' or '%s'",
					methodName,
					readRowMethodName))

			end

		end

	end,
})

ns.mixins.configReader = configReaderMixer
