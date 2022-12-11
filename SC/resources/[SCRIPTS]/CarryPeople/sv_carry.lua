ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('carloslr:solicitarpago', function(can, cb)
	uniqueid= "435346457234642343214234"
	cb(uniqueid)
end)
RegisterNetEvent('CarryPeople:sync')
AddEventHandler('CarryPeople:sync', function(target, can, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	local resource = GetCurrentResourceName()
	if can == "435346457234642343214234" then
		TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
		TriggerClientEvent('CarryPeople:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
	else
		TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source,resource)
		
	end
end)



RegisterServerEvent('CarryPeople:stop')
AddEventHandler('CarryPeople:stop', function(targetSrc)
    TriggerClientEvent('CarryPeople:cl_stop', targetSrc)
end)