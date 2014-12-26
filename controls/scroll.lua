local addon, ns = ...

local control = ns.controls.control

local scroll = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("Frame", options.name, parent, "UIPanelScrollFrameTemplate")

	end,

	applyStyle = function(self, styler)
		styler:frame(self.frame)
	end,

	add = function(self, control)

		local parent = self.frame
		local child = control.frame

		child:SetParent(parent)
		parent:SetScrollChild(child)

	end,
})

ns.controls.scroll = scroll
