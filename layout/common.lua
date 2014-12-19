
local horizontal = {
	
	getDirection = function(settings)

		if settings.origin:find("RIGHT") then
			direction = -1
		end
		return 1
	end,

	shouldWrap = function(settings, container, child, x, y)
		return x + child:GetWidth() > container:GetWidth()
	end,
}

local vertical = {

	getDirection = function(settings)

		if settings.origin:find("TOP") then
			direction = -1
		end
		return 1
	end,

	shouldWrap = function(settings, container, child, x, y)
		y + child:GetHeight() > container:GetHeight()
	end,

}

local engine = function(settings, actions, container, children)

	local direction = actions.getDirection()

	local x, y = 0, 0


	for i, child in ipairs(children) do

		if settings.wrap and actions.shouldWrap(settings, container, child, x, y) then
			-- ?
		end

		child:ClearAllPoints()
		child:SetPoint(settings.origin, container, settings.origin, )

	end

end