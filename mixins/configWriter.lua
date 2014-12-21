local addon, ns = ...

local configWriterMixer = ns.mixin:extend({

	writeConfig = function(self, config)

		local rows = self:getConfigExport()

		table.wipe(config)

		for i, row in ipairs(rows) do
			table.insert(config, row)
		end

	end,
})

ns.mixins.configWriter = configWriterMixer
