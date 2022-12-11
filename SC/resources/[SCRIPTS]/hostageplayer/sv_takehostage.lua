RegisterServerEvent('cmg3_animations:sync')
AddEventHandler('cmg3_animations:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget,attachFlag)
    local _src = source
    local resource = GetCurrentResourceName()

    if #(GetEntityCoords(GetPlayerPed(_src)) - GetEntityCoords(GetPlayerPed(targetSrc))) > 10 then
        TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_src,resource)

        CancelEvent()
    else
        TriggerClientEvent('cmg3_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget,attachFlag)
        TriggerClientEvent('cmg3_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
    end

end)

RegisterServerEvent('cmg3_animations:stop')
AddEventHandler('cmg3_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg3_animations:cl_stop', targetSrc)
end)
