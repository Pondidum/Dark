local addon, ns = ...

local group = ns.controls.group

local optionsPanel = group:extend({

	create = function(self, parent, options)

		self.frame = CreateFrame("Frame", options.name, parent)
		self.frame.name = options.name

		InterfaceOptions_AddCategory(self.frame)
	end,

	add = function(self, control)
		self.base:add(control)

		control.parent = self.frame.name
		InterfaceOptions_AddCategory(control.frame)
	end,

	save = function(self, action)
		self.frame.okay = action
	end,

	load = function(self, action)
		self.frame.refresh = action
	end,

})

ns.controls.optionsPanel = optionsPanel
