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
			edgeSize = BORDER_OFFSET,
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

		bg:SetFrameLevel(0)
		bg:SetFrameStrata(target:GetFrameStrata())

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

	button = function(self, target)

		self:frame(target)

		local normalTexture = target:GetNormalTexture()
		normalTexture:ClearAllPoints()
		normalTexture:SetPoint("TOPLEFT")
		normalTexture:SetPoint("BOTTOMRIGHT")
		normalTexture:SetTexture(nil)

		local pushed = target:GetPushedTexture()
		pushed:SetTexture(0.9,0.8,0.1,0.3)

		local highlight = target:GetHighlightTexture()
		highlight:SetTexture(1,1,1,0.3)

	end,

	actionButton = function(self, target)

		self:button(target)

		local icon = target.icon
		icon:SetTexCoord(.08, .92, .08, .92)
		icon:SetPoint("TOPLEFT", target, 0, 0)
		icon:SetPoint("BOTTOMRIGHT", target, 0, 0)

		local flash = target.Flash
		flash:SetTexture("")

		local border = target.Border
		border:SetTexture(nil)
		border:Hide()

	end,

	textbox = function(self, target)

		self:frame(target)

		target.Left:Hide()
		target.Right:Hide()
		target.Middle:Hide()

		target.bg:SetBackdropBorderColor(unpack(colors.border))

	end,

}

ns.style = style
