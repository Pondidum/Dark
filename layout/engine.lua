local addon, ns = ...

local strategies = {}

local engine = ns.class:extend({

	ctor = function(self, container, options)

		self.container = container
		self.options = options
		self.children = {}

	end,

	addStrategy = function(self, name, strat)
		strategies[name] = strat
	end,

	addChild = function(self, child)
		table.insert(self.children, child)
		self:performLayout()
	end,

	clearChildren = function(self, child)
		table.wipe(self.children)
		self:performLayout()
	end,

	beforeLayout = function(self)

	end,

	afterLayout = function(self)

	end,

	performLayout = function(self)
		self:beforeLayout()
		self:layout()
		self:afterLayout()
	end,

	layout = function(self)

		local strat = strategies[options.name]

		if not strat then
			error(string.format("No layout stragey called %s could be found", options.name))
		end
			strat(self.options, self.container, self.children)

	end,

})

ns.layoutEngine = engine