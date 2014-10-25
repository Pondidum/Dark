local addon, ns = ...

local control = ns.class:extend({

	ctor = function(self, options)

		self.frame = CreateFrame("Frame", options.name, options.parent)

	end,

})

ns.controls.control = {}
