local addon, ns = ...

local cache = ns.class:extend({

	ctor = function(self)
		self:postMix(self)
	end,

	preMix = function(self, target)
	end,

	postMix = function(self, target)
		target._count = 0
		target._items = {}
	end,

	onRecycle = function(self)

	end,

	onCreate = function(self, i)

	end,

	get = function(self)

		local items = self._items

		for entry, active in pairs(items) do

			if active == false then
				return self:activate(entry)
			end

		end

		self._count = self._count + 1
		local entry = self:onCreate(self._count)

		return self:activate(entry)

	end,

	activate = function(self, item)
		self._items[item] = true
		return item
	end,

	recycle = function(self, item)
		self:onRecycle(item)
		self._items[item] = false
	end,

	recycleAll = function(self)

		for entry, active in pairs(self._items) do
			self:recycle(entry)
		end

	end,
})

ns.mixins.cache = cache
