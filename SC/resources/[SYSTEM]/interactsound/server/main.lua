RegisterServerEvent('InteractSound_SV:PlayOnOne')
AddEventHandler('InteractSound_SV:PlayOnOne', function(clientNetId, soundFile, soundVolume)
--    if clientNetId == -1 then 
     TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"PLAYSOUND 1")
  --  else
    --TriggerClientEvent('InteractSound_CL:PlayOnOne', clientNetId, soundFile, soundVolume)
      --end
end)

RegisterServerEvent('InteractSound_SV:PlayOnSource')
AddEventHandler('InteractSound_SV:PlayOnSource', function(soundFile, soundVolume)
   -- TriggerClientEvent('InteractSound_CL:PlayOnOne', source, soundFile, soundVolume)
   TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"PLAYSOUND 2")

end)

RegisterServerEvent('InteractSound_SV:PlaylrhackOnAll')
AddEventHandler('InteractSound_SV:PlaylrhackOnAll', function(soundFile, soundVolume)
   -- TriggerClientEvent('InteractSound_CL:PlayOnAll', -1, soundFile, soundVolume)
   TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"PLAYSOUND 3")

end)

RegisterServerEvent('InteractSound_SV:PlaylrhackWithinDistance')
AddEventHandler('InteractSound_SV:PlaylrhackWithinDistance', function(maxDistance, soundFile, soundVolume,token)
      
    local _source = source
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
    if maxDistance > 50 then 
            TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,"PLAYSOUND MAX DIST")
        else    
            TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
        end
  
end)
