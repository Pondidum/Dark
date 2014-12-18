local addon, ns = ...

local vertical = function(settings, container, children)


	local direction = 1

	if settings.origin:find("TOP") then
		direction = -1
	end


	local x = 0
	local y = 0

	local colWidth = 0

	for i, child in ipairs(children) do

		if settings.wrap and y + child:GetHeight() > container:GetHeight() then
			y = 0
			x = x + colWidth + settings.itemSpacing
			colWidth = 0
		end

		child:ClearAllPoints()
		child:SetPoint(settings.origin, container, settings.origin, x, y * direction)

		y = y + child:GetHeight() + settings.itemSpacing

		if child:GetWidth() > colWidth then
			colWidth = child:GetWidth()
		end

	end

	if settings.autosize == "x" or settings.autosize == "both" then

		x = x + colWidth
		container:SetWidth(x)

	end

	if settings.autosize == "y" or settings.autosize == "both" then
		y = y - settings.itemSpacing
		container:SetHeight(y)
	end

end

ns.layoutEngine:addStrategy("vertical", vertical)
