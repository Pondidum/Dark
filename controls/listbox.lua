local addon, ns = ...
local controls = ns.controls
local layout = ns.layoutEngine

local listEngine = layout:extend({

	afterLayout = function(self)

		for i, child in ipairs(self.children) do
			child:SetPoint("LEFT", self.container, "LEFT", 2, 0)
			child:SetPoint("RIGHT", self.container, "RIGHT", -2, 0)
		end

	end,
})

controls.listbox = function(self, config)

	config = config or {}

	local scrollBox = self:scrollFrame({ name = config.name, width = config.width })
	local contents = scrollBox:GetScrollChild()
	local engine = listEngine:new(contents, {
		layout = "vertical",
		origin = "TOP",
		wrap = false,
		autosize = "y",
		itemSpacing = 5
	})

	scrollBox.addItem = function(box, frame)
		engine:addChild(frame)
		engine:performLayout()
	end

	return scrollBox

end
