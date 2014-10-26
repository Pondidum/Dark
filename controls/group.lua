local addon, ns = ...

local layout = ns.layout
local control = ns.controls.control

local group = control:extend({

	create = function(self, options)

		self.base:create(options)
		layout.init(self.frame, options)

	end,

	children = function(self, childrenTable)
		for i, control in ipairs(childrenTable) do
			self:add(control)
		end
	end,

	add = function(self, control)
		self.frame.add(control.frame)
	end,
})

ns.controls.group = group
