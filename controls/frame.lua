local addon, ns = ...

local control = ns.controls.control

local frame = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("Frame", options.name, parent)

	end,

	children = function(self, childrenTable)
		for i, control in ipairs(childrenTable) do
			self:add(control)
		end
	end,

	add = function(self, control)

		local child = control.frame
		child:SetParent(self.frame)

	end,
})

ns.controls.frame = frame
