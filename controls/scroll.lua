local addon, ns = ...

local control = ns.controls.control

local scroll = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("ScrollFrame", options.name, parent, "UIPanelScrollFrameTemplate")
		self.bar = self.frame.ScrollBar

		self.bar:ClearAllPoints()
		self.bar:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", 0, -16)
		self.bar:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", 0, 16)

	end,

	applyStyle = function(self, styler)
		styler:frame(self.frame)
	end,

	add = function(self, control)

		local parent = self.frame
		local child = control.frame and control.frame or control

		child:SetParent(parent)
		parent:SetScrollChild(child)

		local onSizeChanged = function(parent, width, height)

			local barWidth = self.bar:GetWidth()

			child:SetWidth(width - barWidth)

		end

		parent:SetScript("OnSizeChanged", onSizeChanged)

	end,
})

ns.controls.scroll = scroll
