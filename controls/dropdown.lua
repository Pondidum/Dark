local addon, ns = ...

local fonts = ns.media.fonts
local control = ns.controls.control

local textbox = control:extend({

	ctor = function(self, options)

		self.frame = CreateFrame("frame", options.name, options.parent, "UIDropDownMenuTemplate")

	end,

	addItems = function(self, items)

		UIDropDownMenu_Initialize(self, function(menu, level)

			for key, text in pairs(items) do

				local info = UIDropDownMenu_CreateInfo()
				info.text = text
				info.value = key

				info.func = function(item)
					UIDropDownMenu_SetSelectedValue(self, item.value)
				end

				UIDropDownMenu_AddButton(info, level)

			end

		end)

		UIDropDownMenu_JustifyText(self, "LEFT")

	end,

})

ns.controls.textbox = textbox
