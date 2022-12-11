Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(805869959824801812)
		SetDiscordRichPresenceAsset('descarga_1_')
        SetDiscordRichPresenceAssetText('SpainCity')
        SetDiscordRichPresenceAssetSmall('info')
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/spaincity')
		SetDiscordRichPresenceAction(0, "DISCORD!", "https://discord.gg/spaincity")
        SetDiscordRichPresenceAction(1, "CONECTATE!", "fivem://connect:/cfx.re/join/mmlzra")

		Citizen.Wait(60000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		SetRichPresence("[+500 Slots y 0 Lag]" .. " ID: "..pId.." | "..pName)
		Citizen.Wait(10000)
	end
end)

--[[
    
Citizen.CreateThread(function()
	while true do
		local xAll = ESX.GetExtendedPlayers()

		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		SetRichPresence("[+500 Slots y 0 Lag] | Jugadores: "..#xAll.." |  ID: "..pId.." | "..pName)
		Citizen.Wait(100000)
	end
end)

]]