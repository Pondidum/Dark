local addon, ns = ...

local horizontalActions = {

	getDirection = function(settings)

		if settings.origin:find("RIGHT") then
			return -1
		end
		return 1
	end,

	shouldWrap = function(settings, container, child, x, y)
		return x + child:GetWidth() > container:GetWidth()
	end,

	getXreset = function(settings, x, currentExpand)
		return 0
	end,

	getYreset = function(settings, y, currentExpand)
		return y + currentExpand + settings.itemSpacing
	end,

	getX = function(x, direction)
		return x * direction
	end,

	getY = function(y, direction)
		return -y
	end,

	getXnext = function(settings, x, child)
		return x + child:GetWidth() + settings.itemSpacing
	end,

	getYnext = function(settings, y, child)
		return y
	end,

	getExpand = function(currentExpand, child)

		if child:GetHeight() > currentExpand then
			currentExpand = child:GetHeight()
		end

		return currentExpand

	end,

	getContainerWidth = function(settings, currentExpand, x)
		return x - settings.itemSpacing
	end,

	getContainerHeight = function(settings, currentExpand, y)
		return y + currentExpand
	end,
}

local verticalActions = {

	getDirection = function(settings)

		if settings.origin:find("TOP") then
			return -1
		end
		return 1
	end,

	shouldWrap = function(settings, container, child, x, y)
		return y + child:GetHeight() > container:GetHeight()
	end,

	getXreset = function(settings, x, currentExpand)
		return x + currentExpand + settings.itemSpacing
	end,

	getYreset = function(settings, y, currentExpand)
		return 0
	end,

	getX = function(x, direction)
		return x
	end,

	getY = function(y, direction)
		return y * direction
	end,

	getXnext = function(settings, x, child)
		return x
	end,

	getYnext = function(settings, y, child)
		return y + child:GetHeight() + settings.itemSpacing
	end,

	getExpand = function(currentExpand, child)

		if child:GetWidth() > currentExpand then
			currentExpand = child:GetWidth()
		end

		return currentExpand

	end,

	getContainerWidth = function(settings, currentExpand, x)
		return x + currentExpand
	end,

	getContainerHeight = function(settings, currentExpand, y)
		return y - settings.itemSpacing
	end,
}

local engine = function(settings, actions, container, children)

	local direction = actions.getDirection(settings)

	local x, y = 0, 0
	local currentExpand = 0

	for i, child in ipairs(children) do

		if settings.wrap and actions.shouldWrap(settings, container, child, x, y) then
			x = actions.getXreset(settings, x, currentExpand)
			y = actions.getYreset(settings, y, currentExpand)
			currentExpand = 0
		end

		child:ClearAllPoints()
		child:SetPoint(settings.origin, container, settings.origin, actions.getX(x, direction), actions.getY(y, direction) )

		x = actions.getXnext(settings, x, child)
		y = actions.getYnext(settings, y, child)

		currentExpand = actions.getExpand(currentExpand, child)

	end

	if settings.autosize == "x" or settings.autosize == "both" then
		container:SetWidth(actions.getContainerWidth(settings, currentExpand, x))
	end

	if settings.autosize == "y" or settings.autosize == "both" then
		container:SetHeight(actions.getContainerHeight(settings, currentExpand, y))
	end

end

local horizontal = function(settings, container, children)
	engine(settings, horizontalActions, container, children)
end

local vertical = function(settings, container, children)
	engine(settings, verticalActions, container, children)
end

ns.layoutEngine:addStrategy("horizontal", horizontal)
ns.layoutEngine:addStrategy("vertical", vertical)

