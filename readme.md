#Dark

Core Library for DarkUI v3

## Features

* Classes with inheritance
* Mixins

### Event Mixin usage:

	local goldPrinter = Dark.class:extend({

		ctor = function(self)

			self:include(Dark.events)

			self:register("COMBAT_LOG_EVENT_UNFILTERED")

		end,

		COMBAT_LOG_EVENT_UNFILTERED = function(self, timeStamp, event, hideCaster, sourceGUID, sourceName)

		end,
	})

