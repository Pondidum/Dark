local addon, ns = ...
local controls = ns.controls
local layout = ns.layoutEngine

controls.listbox = function(self, config)

	config = config or {}

	local scrollBox = self:scrollFrame({ name = config.name, width = config.width })
	local contents = scrollBox:GetScrollChild()
	local engine = layout:new(contents, {
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
