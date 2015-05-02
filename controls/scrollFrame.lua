local addon,ns = ...
local controls = ns.controls

controls.scrollFrame = function(self, config)

	config = config or {}
	config.type = "ScrollFrame"
	config.template = "UIPanelScrollFrameTemplate"

	local scrollParent = self:frame(config)
	local bar = scrollParent.ScrollBar

	bar:ClearAllPoints()
	bar:SetPoint("TOPRIGHT", scrollParent, "TOPRIGHT", 0, -16)
	bar:SetPoint("BOTTOMRIGHT", scrollParent, "BOTTOMRIGHT", 0, 16)

    local child = self:frame({ parent = scrollParent })

    scrollParent:SetScrollChild(child)
    scrollParent:SetScript("OnSizeChanged", function(s, width, height)
        child:SetWidth(width - bar:GetWidth())
    end)

    return scrollParent

end
