local addon, ns = ...

local colors = ns.media.colors
local textures = ns.media.textures
local fonts = ns.media.fonts

local BORDER_OFFSET = 3
local BORDER_INSET = 3

local EMPTY = {}

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

		local shadow = CreateFrame("Frame", nil, target)
		target.shadow = shadow

		shadow:SetFrameLevel(1)
		shadow:SetFrameStrata(target:GetFrameStrata())
		shadow:SetPoint("TOPLEFT", -BORDER_OFFSET, BORDER_OFFSET)
		shadow:SetPoint("BOTTOMLEFT", -BORDER_OFFSET, -BORDER_OFFSET)
		shadow:SetPoint("TOPRIGHT", BORDER_OFFSET, BORDER_OFFSET)
		shadow:SetPoint("BOTTOMRIGHT", BORDER_OFFSET, -BORDER_OFFSET)

		shadow:SetBackdrop( {
			edgeFile = textures.shadow,
			edgeSize = BORDER_OFFSET,
			insets = {
				left = BORDER_INSET,
				right = BORDER_INSET,
				top = BORDER_INSET,
				bottom = BORDER_INSET
			},
		})

		shadow:SetBackdropBorderColor(unpack(colors.shadow))

	end,

	frame = function(self, target, overrides)

		overrides = overrides or EMPTY

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

		bg:SetBackdropColor(unpack(overrides.backgroundColor or colors.background))
		bg:SetBackdropBorderColor(unpack(overrides.borderColor or colors.shadow))

		target.bg = bg
	end,

	button = function(self, target, overrides)

		self:frame(target, overrides)

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

	actionButton = function(self, target, overrides)

		self:button(target, overrides)

		local icon = target.icon
		icon:SetTexCoord(.08, .92, .08, .92)
		icon:SetPoint("TOPLEFT", target, 0, 0)
		icon:SetPoint("BOTTOMRIGHT", target, 0, 0)

		local flash = target.Flash
		flash:SetTexture("")

		local border = target.Border
		border:SetTexture(nil)
		border:Hide()

		local floatingBackground = _G[target:GetName().."FloatingBG"]

		if floatingBackground then
			floatingBackground:SetTexture(nil)
		end

		local hotkey = target.HotKey
		hotkey:ClearAllPoints()
		hotkey:SetPoint("TOPRIGHT", 2, 0)
		hotkey:SetFont(fonts.normal, 10, "OUTLINE")
		hotkey:SetJustifyH("RIGHT")

		local buttonName = target.Name
		buttonName:SetTextColor(hotkey:GetTextColor())
		buttonName:SetFont(fonts.normal, 10, "OUTLINE")
		buttonName:SetJustifyH("LEFT")
		buttonName:ClearAllPoints()
		buttonName:SetPoint("TOPLEFT", target, 0, 0)

		local count = target.Count
		count:ClearAllPoints()
		count:SetPoint("BOTTOMRIGHT", 0, 2)
		count:SetFont(fonts.normal, 12, "OUTLINE")

	end,

	petActionButton = function(self, target, overrides)

		self:actionButton(target, overrides)

		local name = target:GetName()

		local normal =_G[name.."NormalTexture2"]
		normal:SetTexture(nil)
		normal:Hide()
		normal:SetAlpha(0)

		local autoCast = _G[name.."AutoCastable"]
		autoCast:SetAlpha(0)

	end,

	itemButton = function(self, target, overrides)

		self:button(target, overrides)

		local icon = target.icon
		icon:SetTexCoord(.08, .92, .08, .92)
		icon:SetPoint("TOPLEFT", target, 0, 0)
		icon:SetPoint("BOTTOMRIGHT", target, 0, 0)

		local count = target.Count
		count:ClearAllPoints()
		count:SetPoint("BOTTOMRIGHT", 0, 2)
		count:SetFont(fonts.normal, 12, "OUTLINE")

	end,


	textbox = function(self, target, overrides)

		self:frame(target, overrides)

		target.Left:Hide()
		target.Right:Hide()
		target.Middle:Hide()

		target.bg:SetBackdropBorderColor(unpack(colors.border))

	end,

}

ns.style = style
