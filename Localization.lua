--[[--------------------------------------------------------------------
	Totem Information
	Display Totems CD on say Chat...
	Written by Junxx EU-Khaz'goroth <addons@colordesigns.de>
	http://wow.curseforge.com/addons/totems-infomation/
----------------------------------------------------------------------]]

local _, namespace = ...

local L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

namespace.L = L

local LOCALE = GetLocale()

if LOCALE:match("^en") then
return end

if LOCALE == "deDE" then
	-- German Mana Tide
    --	L["Mana Tide aktiv!"] = "Manaflut aktiv!"
    --	L["Mana Tide ready in 15 sec!"] = "Manaflut bereit in 15 Sekunden!"
    --	L["Mana Tide ready!"] = "Manaflut bereit !"
	-- German Healing Tide
	L["Healing Tide aktiv!"] = "Heilungsflut aktiv!"
	L["Healing Tide ready in 15 sec!"] = "Heilungsflut bereit in 15 Sekunden!"
	L["Healing Tide ready!"] = "Heilungsflut bereit!"
	-- German Stormlash Totem
	L["Stormlash Totem aktiv!"] = "Sturmpeitsche aktiv!"
	L["Stormlash Totem run out!"] = "Sturmpeitsche ausgelaufen!"
	L["Stormlash Totem ready in 15 sec!"] = "Sturmpeitsche bereit in 15 Sekunden!"
	L["Stormlash Totem ready!"] = "Sturmpeitsche bereit!"
return end