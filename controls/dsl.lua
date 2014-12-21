local addon, ns = ...

local controls = ns.controls

local controlDsl = {

	process = function(self, parent, input)

		for i, config in ipairs(input) do

			local controlType = config.type:lower()
			local controlClass = controls[controlType]

			if not controlClass then
				error(string.format("Cannot find a control type called '%s'.", controlType))
			end

			config.parent = config.parent or parent

			local instance = controlClass:new(config)

			if config.controls then
				self:process(instance, config.controls)
			end

		end

		return parent

	end,
}

ns.controls.dsl = controlDsl


--[[
local example = {
	{
		type = "label",
		name = "$parentHeader",
		points = { {} },
		size = { 125, 20 }
	},
	{
		type = "group",
		name = "$parentGroup",
		points = {
			{ "TOPLEFT", "$parentHeader", "BOTTOMLEFT", 0, -5 },
			{ "TOPRIGHT", "$parentHeader", "BOTTOMRIGHT", 0, -5 }
		},
		height = 200,
		controls = {
			{
				type = "label",
				name = "$parentLeft",
				points = { {} },
				size = { 125, 20 }
			},
			{
				type = "label",
				name = "$parentRight",
				points = { {} },
				size = { 125, 20 }
			}
		}
	}
}
]]--