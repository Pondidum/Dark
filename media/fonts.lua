local addon, ns = ...

local fonts = {
	normal 		= [[Interface\AddOns\Dark\media\fonts\PT-Sans-Narrow.ttf]],
	unitframes	= [[Interface\AddOns\Dark\media\fonts\BigNoodleTitling.ttf]],
	combat		= [[Interface\AddOns\Dark\media\fonts\Ultima_Campagnoli.ttf]],


	create = function(self, parent, fontName, fontSize)

		local font = fontName or self.normal
		local size = fontSize or 12

		local fs = parent:CreateFontString(nil, "OVERLAY")

		fs:SetFont(font, size)
		fs:SetJustifyH("LEFT")
		fs:SetShadowColor(0, 0, 0)
		fs:SetShadowOffset(1.25, -1.25)

	return fs

end
}

ns.media.fonts = fonts
