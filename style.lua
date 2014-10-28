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

		target:SetBackdrop( {
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

		target:SetBackdropColor(unpack(colors.background))
		target:SetBackdropBorderColor(unpack(colors.shadow))

	end,

}

ns.style = style
