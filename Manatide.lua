local ADDON_NAME, namespace = ...
local L = namespace.L

-- local kanal = 5                                  -- aktivieren wenn die Nachricht in einem Channel (hier die 5) wiedergegeben werden soll
	  local messages = {
          { time = 0, channels = "SAY", message = "Manaflut aktiv!" },
-- { time = 0, channels = "CHANNEL", message = "Manaflut aktiv!" },  -- für Meldung in einem Channel aktivieren
		  { time = 165, channels = "SAY", message = "Manaflut bereit in 15 Sekunden!" },
--{ time = 150, channels = "CHANNEL", message = "Manaflut 30 sec CD" },  -- für Meldung in einem Channel aktivieren
		  { time = 180, channels = "SAY", message = "Manaflut bereit !" },
--{ time = 180, channels = "CHANNEL", message = "Manaflut Ready !" },  -- für Meldung in einem Channel aktivieren
      }
       
      local counter, nextMessage = 0, 1
       
      local addon = CreateFrame( "Frame" )
      addon:RegisterEvent( "UNIT_SPELLCAST_SUCCEEDED" )
      addon:SetScript( "OnEvent", function( self, event, unit, _, _, _, spell )
          --if unit == "player" and spell == 51886 then -- for Testing
		  if unit == "player" and spell == 16190 then
              -- You cast Mana Tide!
              -- Start running the messages.
              counter, nextMessage = 0, 1
              self:Show()
          end
      end )
       
      addon:Hide()
      addon:SetScript( "OnUpdate", function( self, elapsed )
          -- Add up how much time has passed
          -- since you cast Mana Tide.
          counter = counter + elapsed
       
          local m = messages[ nextMessage ]
          if counter < m.time then
              -- It's not time for a message yet.
              return
          end
       
          -- Send the message!
          for channel in m.channels:gmatch("%S+") do
              SendChatMessage( m.message, channel)
--SendChatMessage( m.message, channel, nil, kanal)     -- Wenn die Nachricht in einem Channel wiedergegeben werden soll z.B. HeilerChannel "5"
			 end
       
          -- Queue up the next message.
          nextMessage = nextMessage + 1
       
          -- Find out if it's done.
          if not messages[ nextMessage ] then
              self:Hide()
              counter, nextMessage = 0, 1
          end
      end )
	  
	  
	