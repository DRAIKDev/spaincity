RegisterServerEvent('CarryPeople:sync')
AddEventHandler('CarryPeople:sync', function(target, targetid, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
    local _src = source
    local targetCoords = GetEntityCoords(GetPlayerPed(targetid))
    local sourceCoords = GetEntityCoords(GetPlayerPed(_src))
    if #(targetCoords - sourceCoords) < 10 then
        TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
        TriggerClientEvent('CarryPeople:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
    else
        DropPlayer(source, "Buenas^^ para evitar hackers se ha puesto esta medida, para la proxima no hagas /cargar tan lehos de la gente.")
    end
end)

RegisterServerEvent('CarryPeople:stop')
AddEventHandler('CarryPeople:stop', function(targetSrc)
    TriggerClientEvent('CarryPeople:cl_stop', targetSrc)
end)