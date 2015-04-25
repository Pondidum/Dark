local addon, ns = ...
local controls = ns.controls

controls.spacer = {

	insetTop = function(self, frame, spacing, parent)

		parent = parent or frame:GetParent()

		frame:SetPoint("TOPLEFT", parent, "TOPLEFT", spacing, -spacing)
		frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -spacing, -spacing)

	end,

	insetBottom = function(self, frame, spacing, parent)

		parent = parent or frame:GetParent()

		frame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", spacing, spacing)
		frame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -spacing, spacing)

	end,

	between = function(self, frame, spacing, points)

		for point, targetFrame in pairs(points) do

			local x = self:adjustX(point, spacing)
			local y = self:adjustY(point, spacing)

			frame:SetPoint(point, targetFrame, point, x, y)
		end

	end,

	adjustX = function(self, point, value)

		point = string.upper(point)

		if point == "TOP" or point == "BOTTOM" then
			return 0
		end

		if point == "RIGHT" then
			return spacing * -1
		end

		return spacing

	end,

	adjustY = function(self, point, value)

		point = string.upper(point)

		if point == "LEFT" or point == "RIGHT" then
			return 0
		end

		if point == "TOP" then
			return spacing * -1
		end

		return spacing

	end,

}