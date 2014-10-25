local addon, ns = ...

local layout = ns.lib.layout

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
