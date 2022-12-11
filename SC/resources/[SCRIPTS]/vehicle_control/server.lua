-- E N G I N E --
RegisterCommand('engine', function(source, args, rawCommand)
local message = args[1]

if message == "off" then
	CancelEvent()
	--------------
	TriggerClientEvent('engineoff', source)

elseif message == "on" then
	CancelEvent()
	--------------
	TriggerClientEvent('engineon', source)

elseif message == nil then
	CancelEvent()
	--------------
	TriggerClientEvent('engine', source)
end

end, false) 

-- T R U N K --
RegisterCommand('trunk', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('trunk', source)
end, false) 

-- R E A R  D O O R S --
RegisterCommand('rdoors', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('rdoors', source)
end, false) 

-- H O O D --
RegisterCommand('hood', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('hood', source)
end, false) 

-- L O C K --
RegisterCommand('lock', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('lock', source)
end, false) 

-- S A V E --
RegisterCommand('save', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('save', source)
end, false) 

-- R E M O T E --
RegisterCommand('sveh', function(source, args, rawCommand)
	CancelEvent()
	--------------
	TriggerClientEvent('controlsave', source)
end, false) 