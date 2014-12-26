local addon, ns = ...

local control = ns.controls.control

local frame = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("Frame", options.name, parent)

	end,

	applyStyle = function(self, styler)
		styler:frame(self.frame)
	end,

	add = function(self, control)

		local child = control.frame
		child:SetParent(self.frame)

	end,
})

ns.controls.frame = frame
