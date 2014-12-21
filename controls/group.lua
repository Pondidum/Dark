local addon, ns = ...

local layout = ns.layout
local control = ns.controls.control

local group = control:extend({

	create = function(self, options)

		self.frame = CreateFrame("Frame", options.name, options.parent)
		self.engine = ns.layoutEngine:new(self.frame, options)

	end,

	children = function(self, childrenTable)
		for i, control in ipairs(childrenTable) do
			self:add(control)
		end
	end,

	add = function(self, control)

		local child = control.frame

		child:SetParent(self.frame)
		self.engine:addChild(child)

	end,
})

ns.controls.group = group
