local addon, ns = ...

local layout = {

	extend = function(self, this)
		return setmetatable(this,  { __index = self })
	end,

	new = function(self)

		local this = {}
		this.children = {}

		return setmetatable(this, { __index = self })

	end,

	configure = function(self, options)

	end,

	add = function(self, frame)
		table.insert(self.children, frame)
		self:performLayout()
	end,

	clear = function(self)
		table.wipe(self.children)
		self:performLayout()
	end,

	performLayout = function(self)

	end,
}

ns.layouts.layout = layout
