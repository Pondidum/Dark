local addon,ns = ...
local controls = ns.controls

controls.scrollFrame = function(self, config)

	config = config or {}
	config.type = "ScrollFrame"
	config.template = "UIPanelScrollFrameTemplate"

	local frame = self:frame(config)
	local bar = frame.ScrollBar

	bar:ClearAllPoints()
	bar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, -16)
	bar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 16)

    frame.addChild = function(f, child)

        child:SetParent(frame)
        frame:SetScrollChild(child)

        local onSizeChanged = function(frame, width, height)

            local barWidth = bar:GetWidth()

            child:SetWidth(width - barWidth)

        end

        frame:SetScript("OnSizeChanged", onSizeChanged)

    end,

end
