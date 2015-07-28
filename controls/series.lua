local addon, ns = ...
local controls = ns.controls

controls.series = function(self, config, ...)

	config = config or {}

	local children = { ... }

	local point = config.point or self.defaults.point or "BOTTOMLEFT"
	local relPoint = config.relative or self.defaults.relative or "BOTTOMRIGHT"
	local xspacing = config.xspacing or self.defaults.xspacing or 0
	local yspacing = config.yspacing or self.defaults.yspacing or 0

	for i = 2, #children do

		local prev = children[i - 1]
		local current = children[i]

		current:SetPoint(point, prev, relPoint, xspacing, yspacing)

	end

	return ...

end
