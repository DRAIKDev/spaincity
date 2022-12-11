--------------------------------- Config ----------------------------------
ESX = nil 
lastcall = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


webhookUrl = 'https://discord.com/api/webhooks/867424105933832222/5_gor2gV-E6fpXCsSDUW7iIlnI-mfcpji6rkT-fPxff9I-lPVlVAPTpLNmMkTdEUPXuJ'


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




print("██████╗░██████╗░░█████╗░██╗██╗░░██╗  ██████╗░███████╗██╗░░░██╗")
print("██╔══██╗██╔══██╗██╔══██╗██║██║░██╔╝  ██╔══██╗██╔════╝██║░░░██║")
print("██║░░██║██████╔╝███████║██║█████═╝░  ██║░░██║█████╗░░╚██╗░██╔╝")
print("██║░░██║██╔══██╗██╔══██║██║██╔═██╗░  ██║░░██║██╔══╝░░░╚████╔╝░")
print("██████╔╝██║░░██║██║░░██║██║██║░╚██╗  ██████╔╝███████╗░░╚██╔╝░░")
print("╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚═╝  ╚═════╝░╚══════╝░░░╚═╝░░░")

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



RegisterServerEvent('llamarcnp')
AddEventHandler('llamarcnp', function(location, msg, x, y, z, name, p)
	local xPlayers = ESX.GetExtendedPlayers('job', 'cnp')
	-- local draik = ESX.GetExtendedPlayers('job', 'military') -- Returns xPlayers with the police job
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)
	local pos = GetEntityCoords(GetPlayerPed(-1))
--------------------------------------CNP-----------------------------------------
		    for _, xPlayer in pairs(xPlayers) do
			TriggerClientEvent('chatMessage', xPlayer.source, '^5----------------------------------------------', {0, 255, 238})
			TriggerClientEvent('chatMessage', xPlayer.source, '^*^5Nueva alerta: ^1'..source..'', {0, 255, 238})
			--TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Nombre de bolsillo]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
			TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Localización]^r^7', {0, 255, 238}, location)
			TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Llamada]^r^7', {0, 255, 238}, msg)
			TriggerClientEvent('setBlip', xPlayer.source, name, x, y, z)
			TriggerClientEvent('chatMessage', xPlayer.source, '^5----------------------------------------------', {0, 255, 238})
			end
			LogsEntornos('**Entornos:**\n\n **ID del Player:** '..source..'  \n**Mensaje:** '..msg..  '\n**ID de steam:** '..pName..  '\n **Localización:** ' ..location.. '')	

end)

RegisterServerEvent('llamargc')
AddEventHandler('llamargc', function(location, msg, x, y, z, name, p)
	local xPlayers = ESX.GetExtendedPlayers('job', 'military')
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)
	local pos = GetEntityCoords(GetPlayerPed(-1))
--------------------------------------gc-----------------------------------------
for _, xPlayer in pairs(xPlayers) do
	TriggerClientEvent('chatMessage', xPlayer.source, '^5----------------------------------------------', {0, 255, 238})
	TriggerClientEvent('chatMessage', xPlayer.source, '^*^5Nueva alerta: ^1'..source..'', {0, 255, 238})
	--TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Nombre de bolsillo]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
	TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Localización]^r^7', {0, 255, 238}, location)
	TriggerClientEvent('chatMessage', xPlayer.source, '   ^*^5[Llamada]^r^7', {0, 255, 238}, msg)
	TriggerClientEvent('setBlip', xPlayer.source, name, x, y, z)
	TriggerClientEvent('chatMessage', xPlayer.source, '^5----------------------------------------------', {0, 255, 238})
	end
LogsEntornos('**Entornos:**\n\n **ID del Player:** '..source..'  \n**Mensaje:** '..msg..  '\n**ID de steam:** '..pName..  '\n **Localización:** ' ..location.. '')	
end)
RegisterServerEvent('PUTOSENTORNOS')
AddEventHandler('PUTOSENTORNOS', function(source, args, location, args,x,y)
table.insert( lastcall, 1, x )
table.insert( lastcall, 2, y )

	TriggerClientEvent("AJHD", -1, source, args, location, args,x,y)
end)

RegisterServerEvent('TEMARCOENEELMAPA')
AddEventHandler('TEMARCOENEELMAPA', function()
local x = lastcall[1]
local y = lastcall[2]

	TriggerClientEvent("TERECIBOYTEMARCO", source, x, y)
end)
--------------------- Functions -----------------------

LogsEntornos = function(message)
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 
    'POST', json.encode(
        {username = "DRAIK ᵈᵉᵛ", 
        embeds = {
            {["color"] = color, 
            ["author"] = {
            ["name"] = "DRAIK ᵈᵉᵛ",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png"},
            ["description"] = "".. message .."",
            ["footer"] = {
            ["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
        }, avatar_url = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png"}), {['Content-Type'] = 'application/json' })
end
--------------------------------------------------------

