ESX = nil
NivelDeAlerta = 0
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)
RegisterServerEvent('HSDBAJKDBAKBDJKABSKDBAKDHNUI126789UYGHU76TYI87YHI7YHJ9')
AddEventHandler('HSDBAJKDBAKBDJKABSKDBAKDHNUI126789UYGHU76TYI87YHI7YHJ9', function()
    local _source = source
    if source ~= 0 then  
        local xPlayer = ESX.GetPlayerFromId(_source)
        local dineromano = xPlayer.getMoney()
        local dinerobanco = xPlayer.getAccount('bank')
        local dieneronegro = xPlayer.getAccount('black_money')
        local jobnamelabel = xPlayer.job.label
    
        local jobnameranklabel = xPlayer.job.grade_label
        local jobnamesalary = xPlayer.job.grade_salary
    
        local nombrepj = xPlayer.getName()
    
        TriggerClientEvent("AbrirMenuPersonalSpainCity",xPlayer.source,dineromano,dinerobanco,dieneronegro,jobnamelabel,jobnameranklabel,jobnamesalary,nombrepj,NivelDeAlerta)
    end
end)



RegisterCommand(Config.Comandoparaabrirmenudealertas, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'cnp' then
        TriggerClientEvent("HGSBNDN9876RFGHJI765RFGHJUYTR", source)
    else
       print("No eres policia")
    end
end, false)


RegisterServerEvent('draik_alerts:ponernivel')
AddEventHandler('draik_alerts:ponernivel', function(nivel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'cnp' then
   print("Cambio de nivel a: "..nivel.."")
    NivelDeAlerta = tonumber(nivel)
    TriggerClientEvent('chat:addMessage', -1, { args = { '^1CNP', ''..source..' ^5^_SE INFORMA DEL CAMBIO DE NIVEL DE ALERTA EN LA CIUDAD A ALERTA:^3^* '..NivelDeAlerta..'.' } } )

    else 
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",source, "INTENTOCAMBIARALERTAYSOYSUBNORMAL")
end
end)

