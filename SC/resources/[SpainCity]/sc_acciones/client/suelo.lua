local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if ragdoll then
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    end
  end
end)

ragdol = true
RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
	if ( ragdol ) then
		setRagdoll(true)
		ragdol = false
	else
		setRagdoll(false)
		ragdol = true
	end
end)

RegisterCommand("suelo", function(source, args, raw) --change command here
    TriggerEvent("Ragdoll")
end, false)

RegisterCommand("help", function()
  msg("Bienvenido a SpainCity!")
  msg("Discord: https://discord.gg/spaincity")
end, false)
RegisterCommand("ayuda", function()
  msg("Bienvenido a SpainCity!")
  msg("Discord: https://discord.gg/spaincity")
end, false)
RegisterCommand("discord", function()
  msg("Discord: https://discord.gg/spaincity")
end, false)


function msg(text)
 TriggerEvent("chatMessage", "[SpainCity]", {255,0,0}, text)
end
