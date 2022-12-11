--------------------------------- Config ----------------------------------
ESX = nil 
lastcall = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


webhookUrl = 'https://discord.com/api/webhooks/867424105933832222/5_gor2gV-E6fpXCsSDUW7iIlnI-mfcpji6rkT-fPxff9I-lPVlVAPTpLNmMkTdEUPXuJ'
callBlips = true -- If you change this to "false", it will turn off the circle that is created when you use the /911 command


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




print("██████╗░██████╗░░█████╗░██╗██╗░░██╗  ██████╗░███████╗██╗░░░██╗")
print("██╔══██╗██╔══██╗██╔══██╗██║██║░██╔╝  ██╔══██╗██╔════╝██║░░░██║")
print("██║░░██║██████╔╝███████║██║█████═╝░  ██║░░██║█████╗░░╚██╗░██╔╝")
print("██║░░██║██╔══██╗██╔══██║██║██╔═██╗░  ██║░░██║██╔══╝░░░╚████╔╝░")
print("██████╔╝██║░░██║██║░░██║██║██║░╚██╗  ██████╔╝███████╗░░╚██╔╝░░")
print("╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚═╝  ╚═════╝░╚══════╝░░░╚═╝░░░")

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



RegisterServerEvent('llamarambulance')
AddEventHandler('llamarambulance', function(location, msg, x, y, z, name, p)
	local xPlayers = ESX.GetExtendedPlayers('job', 'ambulance')
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
			TriggerClientEvent('JSHDAJKHDJKAHSDJAHSD', xPlayer.source, name, x, y, z)
			TriggerClientEvent('chatMessage', xPlayer.source, '^5----------------------------------------------', {0, 255, 238})
			end
			LogsEntornos('**Auxilios:**\n\n **ID del Player:** '..source..'  \n**Mensaje:** '..msg..  '\n**ID de steam:** '..pName..  '\n **Localización:** ' ..location.. '')	

end)


RegisterServerEvent('PUTOSENTORNOS1')
AddEventHandler('PUTOSENTORNOS1', function(source, args, location, args,x,y)
	table.insert( lastcall, 1, x )
	table.insert( lastcall, 2, y )

	TriggerClientEvent("JHSDKJAHDJKASHDJKSDNAJD", -1, source, args, location, args)
end)


RegisterServerEvent('TEMARCOENEELMAPA1')
AddEventHandler('TEMARCOENEELMAPA1', function()
local x = lastcall[1]
local y = lastcall[2]
print (lastcall[1])  
print (lastcall[2])  
	TriggerClientEvent("TERECIBOYTEMARCO1", source, x, y)
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

