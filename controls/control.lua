local addon, ns = ...

local control = ns.class:extend({

	defaultWidth = 75,
	defaultHeight = 18,
	style = true,

	ctor = function(self, parent, options)

		options = options or {}

		self:create(parent, options)
		self:applyDefaults()
		self:applyOptions(options)

		if self.style then
			self:applyStyle(ns.style)
		end
	end,

	create = function(self, parent, options)
		--self.frame = CreateFrame("Frame", options.name, options.parent or UIParent)
	end,

	applyStyle = function(self, styler)

	end,

	applyDefaults = function(self)
		self:width(self.defaultWidth)
		self:height(self.defaultHeight)
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

	width = function(self, value)
		self.frame:SetWidth(value)
	end,

	height = function(self, value)
		self.frame:SetHeight(value)
	end,

	points = function(self, config)
		for i, point in ipairs(config) do
			self:point(point)
		end
	end,

	point = function(self, config)
		self.frame:SetPoint(unpack(config))
	end,

	parent = function(self, value)
		self.frame:SetParent(value)
	end,

})

ns.controls.control = control
