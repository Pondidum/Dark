local addon, ns = ...

local control = ns.class:extend({

	ctor = function(self, options)

		self.frame = CreateFrame("Frame", options.name, options.parent)

	end,

	setStandardOptions = function(self, options)

		if options.size then
			self:setSize(unpack(options.size))
		end

	end,

	setSize = function(self, width, height)
		self.frame:SetSize(width, height)
	end,
})

ns.controls.control = control
