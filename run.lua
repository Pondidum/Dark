local addon, ns = ...


local dark = {

	class = ns.class,
	mixin = ns.mixin,
	mixins = ns.mixins,
	events = ns.mixins.events,
	controls = ns.controls,
	style = ns.style,
	layoutEngine = ns.layoutEngine,

	spellData = ns.spellData:new()
}

Darker = dark
