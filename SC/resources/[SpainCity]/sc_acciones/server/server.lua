webhookUrl = 'https://discord.com/api/webhooks/882934986884407296/YBe3fyNcAFNQ_kVH9848NlmimDjTqblD4Af2XVy6lyMySTXkBCctmOXFwmU-gEJBgSfP'

RegisterCommand('msg', function(source, args, raw)
	cm = stringsplit(raw, " ")
	local tPID = tonumber(args[1])
    if tPID then 
	local names2 = GetPlayerName(tPID)
	local names3 = GetPlayerName(source)
	local msgVar = {}
	local textmsg = ""
	for i=1, #cm do
		if i ~= 1 and i ~= 2 then
			textmsg = (textmsg .. " " .. tostring(cm[i]))
		end
	end	
	TriggerClientEvent('draik:textmsg', tPID, source, textmsg, names2, names3)
	TriggerClientEvent('draik:textsent', source, tPID, names2,textmsg)
	logslegacy('**LOG:**\n\n **Comando:** MSG\n **Argumento del comando:** ' ..textmsg..'\n**ID de steam:** De:'..names3..' a '..names2..'')	

end
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end



logslegacy = function(message)
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 
    'POST', json.encode(
        {username = "DRAIK ᵈᵉᵛ", 
        embeds = {
            {["color"] = color, 
            ["author"] = {
            ["name"] = "Msg Logs",
            ["icon_url"] = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"},
            ["description"] = "".. message .."",
            ["footer"] = {
            ["text"] = "DRAIK ᵈᵉᵛ - "..os.date("%x %X %p"),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/555311647460163584/858820409826082826/logo.png",},}
        }, avatar_url = "https://media.discordapp.net/attachments/780858275486498826/788121361624858625/logo.png"}), {['Content-Type'] = 'application/json' })
end

