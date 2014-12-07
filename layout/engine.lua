local addon, ns = ...

local strategies = {}

local engine = ns.class:extend({

	ctor = function(self, container, options)

		self.container = container
		self.options = options
		self.children = {}

		local stratType = options.type:lower()
		local strat = strategies[stratType]

		if not strat then
			error(string.format("No layout stragey called %s could be found", stratType))
		end

		self.strategy = strat

	end,

	addStrategy = function(self, name, strat)
		strategies[name:lower()] = strat
	end,

	addChild = function(self, child)
		table.insert(self.children, child)
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
		self.strategy(self.options, self.container, self.children)
	end,

	debug = function(self)
		print("Available strategies:")

		for name, strat in pairs(strategies) do
			print("", name)
		end
	end,
})

ns.layoutEngine = engine
