ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local quitardinero = false

function pagaranuncios (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local getmoney = xPlayer.getMoney()
    local dinero = Config.pagartrabajo
    if  getmoney >= dinero then
    	  xPlayer.removeMoney(dinero)
     	   quitardinero = true
  	    else
        quitardinero = false
    end
end

RegisterCommand("adgc", function(source, args)
local xPlayer = ESX.GetPlayerFromId(source)
local argString = table.concat(args, " ")
local _source = source
	if xPlayer.job.name == 'military' then
	  pagaranuncios(source, amount)
		if quitardinero then
			TriggerClientEvent('sc_anuncios:client:SendAlert', -1, { type = 'gc', text = argString})
		else
			print('No tienes dinero para pagar el anuncio')
		end
	else
		print('^3SpainCity.es Anuncios: ^1No eres policia')	
    end
end, false)

RegisterCommand("adcnp", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local argString = table.concat(args, " ")
	local _source = source
		if xPlayer.job.name == 'cnp' then
		  pagaranuncios(source, amount)
			if quitardinero then
				TriggerClientEvent('jmgarcia_anuncios:client:SendAlert', -1, { type = 'cnp', text = argString})
			else
				print('No tienes dinero para pagar el anuncio')
			end
		else
			print('^3SpainCity.es Anuncios: ^1No eres policia')	
		end
	end, false)

RegisterCommand("adems", function(source, args)
local xPlayer = ESX.GetPlayerFromId(source)
local argString = table.concat(args, " ")
local _source = source
	if xPlayer.job.name == 'ambulance' then
	  pagaranuncios(source, amount)
		if quitardinero then
			TriggerClientEvent('jmgarcia_anuncios:client:SendAlert', -1, { type = 'ems', text = argString})
		else
			print('No tienes dinero para pagar el anuncio')
		end
	else
		print('^3SpainCity.es Anuncios: ^1No eres ems')	
    end
end, false)

RegisterCommand("admecanico", function(source, args)
local xPlayer = ESX.GetPlayerFromId(source)
local argString = table.concat(args, " ")
local _source = source
	if xPlayer.job.name == 'mechanic' then
	  pagaranuncios(source, amount)
		if quitardinero then
			TriggerClientEvent('jmgarcia_anuncios:client:SendAlert', -1, { type = 'mecanico', text = argString})
		else
			print('No tienes dinero para pagar el anuncio')
		end
	else
		print('^3SpainCity.es Anuncios: ^1No eres mecanico')	
    end
end, false)

RegisterCommand("adbadu", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local argString = table.concat(args, " ")
	local _source = source
		if xPlayer.job.name == 'baducentral' then
		  pagaranuncios(source, amount)
			if quitardinero then
				TriggerClientEvent('jmgarcia_anuncios:client:SendAlert', -1, { type = 'badu', text = argString})
			else
				print('No tienes dinero para pagar el anuncio')
			end
		else
			print('^3SpainCity.es Anuncios: ^1No eres tendero/a')	
		end
	end, false)

RegisterCommand("adtaxi", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local argString = table.concat(args, " ")
	local _source = source
		if xPlayer.job.name == 'taxi' then
		  pagaranuncios(source, amount)
			if quitardinero then
				TriggerClientEvent('jmgarcia_anuncios:client:SendAlert', -1, { type = 'taxi', text = argString})
			else
				print('No tienes dinero para pagar el anuncio')
			end
	else
			print('^3SpainCity.es Anuncios: ^1No eres taxista!')	
	end
end, false)




