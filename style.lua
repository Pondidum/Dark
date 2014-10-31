local addon, ns = ...

local colors = ns.media.colors
local textures = ns.media.textures

local BORDER_OFFSET = 3
local BORDER_INSET = 3

local style = {

	background = function(self, target)

		target:SetBackdrop( {
			bgFile = textures.normal,
			edgeSize = 0,
			tile = true,
		})

		target:SetBackdropColor(unpack(colors.background))

	end,

	border = function(self, target)

		target:SetBackdrop( {
			edgeFile = textures.shadow,
			edgeSize = offset,
			insets = {
				left = BORDER_INSET,
				right = BORDER_INSET,
				top = BORDER_INSET,
				bottom = BORDER_INSET
			},
		})

		target:SetBackdropBorderColor(unpack(colors.shadow))

	end,

	frame = function(self, target)

		if target.bg then return end

		local bg = CreateFrame("Frame", nil, target)

		bg:SetFrameLevel(1)
		bg:SetFrameStrata(bg:GetFrameStrata())
		bg:SetPoint("TOPLEFT", -BORDER_OFFSET, BORDER_OFFSET)
		bg:SetPoint("BOTTOMLEFT", -BORDER_OFFSET, -BORDER_OFFSET)
		bg:SetPoint("TOPRIGHT", BORDER_OFFSET, BORDER_OFFSET)
		bg:SetPoint("BOTTOMRIGHT", BORDER_OFFSET, -BORDER_OFFSET)

		bg:SetBackdrop( {
			bgFile = textures.normal,
			tile = true,
			edgeFile = textures.shadow,
			edgeSize = BORDER_OFFSET,
			insets = {
				left = BORDER_INSET,
				right = BORDER_INSET,
				top = BORDER_INSET,
				bottom = BORDER_INSET
			},
		})

		bg:SetBackdropColor(unpack(colors.background))
		bg:SetBackdropBorderColor(unpack(colors.shadow))

		target.bg = bg
	end,

}

ns.style = style
