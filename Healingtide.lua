--[[--------------------------------------------------------------------
	Totem Information
	Display Totems CD on say Chat...
	Written by Junxx EU-Khaz'goroth <addons@colordesigns.de>
	http://wow.curseforge.com/addons/totems-infomation/
----------------------------------------------------------------------]]

local ADDON_NAME, namespace = ...
local L = namespace.L

	  local messages = {
        { time = 0, channels = "SAY", message = L["Healing Tide aktiv!"] },
		    { time = 165, channels = "SAY", message = L["Healing Tide ready in 15 sec!"] },
		    { time = 180, channels = "SAY", message = L["Healing Tide ready!"] },
        --{ time = 4, channels = "SAY", message = "SL 3" },
        --{ time = 5, channels = "SAY", message = "SL 2" },
        --{ time = 6, channels = "SAY", message = "SL 1" },
      }
       
      local counter, nextMessage = 0, 1
       
      local addon = CreateFrame( "Frame" )
      addon:RegisterEvent( "UNIT_SPELLCAST_SUCCEEDED" )
      addon:SetScript( "OnEvent", function( self, event, unit, _, _, _, spell )
          --if unit == "player" and spell == 108280 then -- for Testing
		  if unit == "player" and spell == 108280 then
              -- You cast Healing Tide!
              -- Start running the messages.
              counter, nextMessage = 0, 1
              self:Show()
          end
      end )
       
      addon:Hide()
      addon:SetScript( "OnUpdate", function( self, elapsed )
          -- Add up how much time has passed
          -- since you cast Healing Tide.
          counter = counter + elapsed
       
          local m = messages[ nextMessage ]
          if counter < m.time then
              -- It's not time for a message yet.
              return
          end
       
          -- Send the message!
        local inCombat = UnitAffectingCombat("player")
          -- Send the message!
          if inCombat then
            for channel in m.channels:gmatch("%S+") do
              SendChatMessage( m.message, channel)
            end
          else 
              self:Hide()
              counter, nextMessage = 0, 1
          end
       
          -- Queue up the next message.
          nextMessage = nextMessage + 1
       
          -- Find out if it's done.
          if not messages[ nextMessage ] then
              self:Hide()
              counter, nextMessage = 0, 1
          end
          
      end )
	  
	  
	