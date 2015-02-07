local addon, ns = ...

local strategy = function(settings, container, children)

	local previous = nil

	for i, child in ipairs(children) do

		child:SetSize(settings.itemSize, settings.itemSize)
		child:ClearAllPoints()

		if (i - 1) % settings.columns == 0 then

			local row = math.floor((i - 1) / settings.columns)
			local offset = (settings.itemSize + settings.itemSpacing) * row

			child:SetPoint("TOPLEFT", container, "TOPLEFT", 0, -offset)
		else
			child:SetPoint("LEFT", previous, "RIGHT", settings.itemSpacing, 0)
		end

		previous = child

	end

	local containerWidth = ((settings.itemSize + settings.itemSpacing) * settings.columns) - settings.itemSpacing
	local containerHeight = ((settings.itemSize + settings.itemSpacing) * settings.rows) - settings.itemSpacing

	container:SetSize(containerWidth, containerHeight)


end

ns.layoutEngine:addStrategy("series", strategy)
