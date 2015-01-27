local addon, ns = ...


local dark = {

	class = ns.class,
	mixin = ns.mixin,
	mixins = ns.mixins,
	events = ns.mixins.events,
	controls = ns.controls,
	style = ns.style,
	layoutEngine = ns.layoutEngine,
	media = ns.media,
	slash = ns.slash,

	spellData = ns.spellData:new()
}

Darker = dark
