local addon, ns = ...

local layout = ns.layout
local control = ns.controls.control

local group = control:extend({

	ctor = function(self, options)
		self._base:ctor(options)

		layout.init(self.frame, options)
	end,

	add = function(self, control)
		self.frame.add(control.frame)
	end,
})

ns.controls.group = group
