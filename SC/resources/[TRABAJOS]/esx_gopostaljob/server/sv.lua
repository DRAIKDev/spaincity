ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--base

	
RegisterServerEvent('gopostal:cash')
AddEventHandler('gopostal:cash', function(currentJobPay,token)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local resource = GetCurrentResourceName()
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	if currentJobPay > 431  then
	TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,resource)	
	else
		if xPlayer.job.name == 'gopostal' then
		xPlayer.addMoney(currentJobPay)
		else
			TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,"GOPOSTALNOJOB")	
		end
		
	end	
	TriggerClientEvent('esx:showNotification', _source, ' Conseguiste $' .. currentJobPay)
end)	