local addon, ns = ...

local control = ns.class:extend({

	ctor = function(self, options)

		options = options or {}

		self:create(options)
		self:applyOptions(options)
	end,

	create = function(self, options)
		self.frame = CreateFrame("Frame", options.name, options.parent)
	end,

	applyOptions = function(self, options)

		if not options then
			return
		end

		for key, value in pairs(options) do
			local method = self[key]

			if method then
				method(self, value)
			end
		end

	end,

	size = function(self, config)
		self.frame:SetSize(unpack(config))
	end,

	point = function(self, config)
		self.frame:SetPoint(unpack(config))
	end,
})

ns.controls.control = control
