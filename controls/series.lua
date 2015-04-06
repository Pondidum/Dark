local addon, ns = ...
local controls = ns.controls

controls.series = function(self, ...)

	local children = { ... }

	for i = 2, #children do

		local prev = children[i - 1]
		local current = children[i]

		current:SetPoint("BOTTOMLEFT", prev, "BOTTOMRIGHT", self.defaults.spacing, 0)

	end

	return ...

end
