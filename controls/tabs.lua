local addon, ns = ...

local layout = ns.layout
local control = ns.controls.control

local tabs = control:extend({

	create = function(self, parent, options)

		self.frame = dsl:single(parent, {
			type = "Group",
			name =  options.name .. "Bar",
			layout = "horizontal",
			origin = "BOTTOMLEFT",
			itemSpacing = 4,
			wrap = false,
			autosize = "y",
			width = 400,
			points = {
				{ "LEFT", "UIParent", "LEFT", 20, 0 } --temp
			},
		})

		self.container = dsl:single(parent, {
			type = "frame",
			name = options.name .. "Container",
			height = 120,
			points = {
				{ "TOPLEFT", options.name .. "Bar", "BOTTOMLEFT", 0, -4 },
				{ "TOPRIGHT", options.name .. "Bar", "BOTTOMRIGHT", 0, -4 }
			},
		})

	end,

	applyStyle = function(self, styler)
		styler:frame(self.container)
	end,

	add = function(self, control)

		local target = control.frame and control.frame or control

		local tab = dsl:single(self.frame, {
			type = "button",
			name = "$parentTab"..id,
			text = text,
			click = function(component, mouseButton)

				self:hideAllLinkedFrames()
				target:Show()

			end,
		})

		self.buttons[id] = tab
		self.linked[id] = target

		self.frame:add(tab)
		self.container:add(target)

		target:ClearAllPoints()
		target:SetAllPoints(self.container.frame)

	end,

	hideAllLinkedFrames = function(self)

		for id, frame in pairs(self.linked) do
			frame:Hide()
		end

	end,
})

ns.controls.tabs = tabs
