local addon, ns = ...

local horizontal = function(settings, container, children)


	local direction = 1

	if settings.origin:find("RIGHT") then
		direction = -1
	end


	local x = 0
	local y = 0

	local rowHeight = 0

	for i, child in ipairs(children) do

		if settings.wrap and x + child:GetWidth() > container:GetWidth() then
			x = 0
			y = y + rowHeight + settings.itemSpacing
			rowHeight = 0
		end

		child:ClearAllPoints()
		child:SetPoint(settings.origin, container, settings.origin, x * direction, -y)

		x = x + child:GetWidth() + settings.itemSpacing

		if child:GetHeight() > rowHeight then
			rowHeight = child:GetHeight()
		end

	end

	if settings.autosize == "x" or settings.autosize == "both" then

		x = x - settings.itemSpacing
		container:SetWidth(x)

	end

	if settings.autosize == "y" or settings.autosize == "both" then
		y = y + rowHeight
		container:SetHeight(y)
	end

end

ns.layoutEngine:addStrategy("horizontal", horizontal)
