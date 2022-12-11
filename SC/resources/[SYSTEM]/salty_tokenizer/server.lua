local didPlayerLoad = {}
local resourceNames = {}
local resourceTokens = {}
local initComplete = false

function init()

	math.randomseed(os.time())
	TriggerEvent('salty_tokenizer:serverReady')
end

function initNewPlayer(source)
	if didPlayerLoad[source] == nil or resourceNames[source] == nil then
		didPlayerLoad[source] = false
		resourceNames[source] = {}
	end
end

function isTokenUnique(token)
	if #resourceNames > 0 then
		for i=1, #resourceNames, 1 do
			if resourceNames[i] ~= nil then
				for id,resource in pairs(resourceNames[i]) do
					if resource == token then
						if true then
							print("Token collision, generating new token.")
						end
						return false
					end
				end
			end
		end
		for resource,storedToken in pairs(resourceTokens) do
			if storedToken == token then
				if true then
					print("Token collision, generating new token.")
				end
				return false
			end
		end
	end
	return true
end

function getObfuscatedEvent(source, resourceName)
	initNewPlayer(source)
	if resourceNames[source][resourceName] == nil then
		resourceNames[source][resourceName] = exports[GetCurrentResourceName()]:generateToken()
		--if true then
		--	print("Obfuscated Event for Player ID " .. tostring(source) .. ": Original - " .. tostring(resourceName) .. " Obfuscated - "  .. tostring(resourceNames[source][resourceName]))
		--end
	end
	return(resourceNames[source][resourceName])
end

function getResourceToken(resourceName)
	return resourceTokens[resourceName]
end

function setupServerResource(resource)
	resourceTokens[resource] = exports[GetCurrentResourceName()]:generateToken()
	if true then
		print("Generated token for resource " .. tostring(resource) .. ": " .. tostring(resourceTokens[resource]))
	end
	AddEventHandler('salty_tokenizer:playerLoaded', function(player)
		local _source = player
		if Config.VerboseServer then
			print("Sending token for " .. tostring(resource) .. " (Event: " .. tostring(getObfuscatedEvent(_source, resource)) .. " Token: " .. tostring(resourceTokens[resource]) .. ") to Player ID " .. tostring(_source) .. ".")
		end
		TriggerClientEvent(getObfuscatedEvent(_source, resource), _source, resourceTokens[resource])
	end)
end

function secureServerEvent(resource, player, token)
	local _source = player
	local resource = "SaltyTok"

	if resourceTokens[resource] == nil then
		return true
	elseif _source == "" then -- If the request came from the server, then no need to authenticate the token
		return true
	else
		if Config.VerboseServer then
			print("Validating token for " .. tostring(resource) .. " for Player ID " .. tostring(_source) .. ". Provided: " .. tostring(token) .. " Stored: " .. tostring(resourceTokens[resource]))
		end
		if token ~= resourceTokens[resource] then
			if true then
				print("Invalid token detected! Resource: " .. tostring(resource) .. ", Player ID: " .. tostring(_source) .. ". Provided: " .. tostring(token) .. " Stored: " .. tostring(resourceTokens[resource]))
			end
			if Config.CustomAction then
				TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,resource)
			else
				DropPlayer(_source, Config.KickMessage)
			end
			return false
		end
	end
	return true
end

RegisterNetEvent('salty_tokenizer:requestObfuscation')
AddEventHandler('salty_tokenizer:requestObfuscation', function(resourceName, id)
	local _source = source
	TriggerClientEvent('salty_tokenizer:obfuscateReceived', _source, id, getObfuscatedEvent(_source, resourceName))
end)

RegisterNetEvent('salty_tokenizer:playerSpawned')
AddEventHandler('salty_tokenizer:playerSpawned', function()
	local _source = source
	initComplete = true
	
	initNewPlayer(_source)
	
	if not didPlayerLoad[_source] then
		didPlayerLoad[_source] = true
		if Config.VerboseServer then
			print("Player ID " .. tostring(_source) .. " loaded.")
		end
		TriggerEvent('salty_tokenizer:playerLoaded', _source)
	else
		print("Player ID " .. tostring(_source) .. " requested another security token, potential cheater?")
	end
end)

AddEventHandler('onServerResourceStart', function (resource)
	if resource == GetCurrentResourceName() then
	init()
	elseif resourceTokens[resource] ~= nil and initComplete then
		if true then
			print("NOTICE: " .. resource .. " was restarted and is no longer protected with security tokens!")
		end
		resourceTokens[resource] = nil
	end
end)

AddEventHandler("playerDropped", function(player, reason)
	local _source = source
	if Config.VerboseServer then
		print("Player ID " .. tostring(_source) .. " dropped, purged obfuscated events.")
	end
	didPlayerLoad[_source] = false
	resourceNames[_source] = {}
end)
