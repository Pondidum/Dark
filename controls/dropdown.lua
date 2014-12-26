local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local dropdown = control:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("frame", options.name, parent, "UIDropDownMenuTemplate")

		self.styler:button(_G[options.name .. "Button"])
	end,

	items = function(self, items)

		UIDropDownMenu_Initialize(self.frame, function(menu, level)

			for key, text in pairs(items) do

				local info = UIDropDownMenu_CreateInfo()
				info.text = text
				info.value = key

				info.func = function(item)
					UIDropDownMenu_SetSelectedValue(self.frame, item.value)
				end

				UIDropDownMenu_AddButton(info, level)

			end

		end)

		UIDropDownMenu_JustifyText(self.frame, "LEFT")

	end,

})

ns.controls.dropdown = dropdown
