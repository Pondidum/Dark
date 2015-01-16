local addon, ns = ...

local layout = ns.layout
local control = ns.controls.control

local group = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("Frame", options.name, parent)
		self.engine = ns.layoutEngine:new(self.frame, options)

		self.frame.add = function(child)
			self.engine:addChild(child)
			self.engine:performLayout()
		end
	end,

	applyStyle = function(self, styler)
		styler:frame(self.frame)
	end,

	add = function(self, control)

		local child = control.frame and control.frame or control

		child:SetParent(self.frame)
		self.engine:addChild(child)
		self.engine:performLayout()

	end,
})

ns.controls.group = group
