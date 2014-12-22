local addon, ns = ...

local controls = ns.controls

local controlDsl = {

	multiple = function(self, parent, input)

		for i, config in ipairs(input) do

			self:single(parent, config)

		end

		return parent

	end,

	single = function(self, parent, config)

		local controlType = config.type:lower()
		local controlClass = controls[controlType]

		if not controlClass then
			error(string.format("Cannot find a control type called '%s'.", controlType))
		end

		local p = config.parent or parent

		if p.frame then
			p = p.frame
		end

		local instance = controlClass:new(p, config)

		if config.controls then
			self:multiple(instance, config.controls)
		end

		return instance

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