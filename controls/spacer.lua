local addon, ns = ...
local controls = ns.controls

controls.spacer = {

	between = function(self, frame, spacing, points)

		for point, targetFrame in pairs(points) do

			local x = self:adjustX(point, spacing)
			local y = self:adjustY(point, spacing)

			frame:SetPoint(point, targetFrame, self:invertPoint(point), x, y)
		end

	end,

	align = function(self, frame, spacing, points)

		for point, targetFrame in pairs(points) do

			local x = self:adjustX(point, spacing)
			local y = self:adjustY(point, spacing)

			frame:SetPoint(point, targetFrame, point, x, y)
		end

	end,


	adjustX = function(self, point, spacing)

		point = string.upper(point)

		if point == "TOP" or point == "BOTTOM" then
			return 0
		end

		if point == "RIGHT" then
			return spacing * -1
		end

		return spacing

	end,

	adjustY = function(self, point, spacing)

		point = string.upper(point)

		if point == "LEFT" or point == "RIGHT" then
			return 0
		end

		if point == "TOP" then
			return spacing * -1
		end

		return spacing

	end,

	invertPoint = function(self, point)

		point = string.upper(point)

		if point == "LEFT" then return "RIGHT" end
		if point == "RIGHT" then return "LEFT" end
		if point == "TOP"  then return "BOTTOM" end
		if point == "BOTTOM" then return "TOP" end

	end,

}