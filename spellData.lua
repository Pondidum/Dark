local addon, ns = ...

local spellData = ns.class:extend({

	defaults = {
		spellID = 0,
		spellName = "",
		maxCharges = 0,
		useableCharges = 0,
	},

	ctor = function(self)
		self:include(ns.mixins.configReader)

		self.byID = {}
		self.byName = {}

		self:readConfig(ns.config.spellData)
	end,

	register = function(self, spellID, spellName, maxCharges, useableCharges)

		local info = {
			spellID = spellID,
			spellName = spellName,
			maxCharges = maxCharges,
			useableCharges = useableCharges,
		}

		self.byID[info.spellID] = info
		self.byName[info.spellName] = info

	end,

	getMaxCharges = function(self, spell)
		local info = self.byID[spell] or self.byName[spell] or self.defaults

		return info.maxCharges
	end,

	getUsableCharges = function(self, spell)
		local info = self.byID[spell] or self.byName[spell] or self.defaults

		return info.useableCharges
	end,

})

ns.spellData = spellData
