--[[--------------------------------------------------------------------
	HealShamanCDChat
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
------------------------------------------------------------------------
--	German | Deutsch
------------------------------------------------------------------------

if LOCALE == "deDE" then
	-- German translations go here
	L["test"] = "Deutsch"
	L["Healing Tide aktiv!"] = "Heilungsflut aktiv!"
	L["Healing Tide ready in 15 Seconds!"] = "Heilungsflut bereit in 15 Sekunden!"
	L["Healing Tide ready!"] = "Heilungsflut bereit!"
return end