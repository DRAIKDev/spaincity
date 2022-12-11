IS_NETWORKED = true

POOL_CUE_BONE = 28422

POOL_CUE_OFFSET_IDLE = vector3(0.06, 0.05, 0.0)
POOL_CUE_ROTATION_IDLE = vector3(-60.0, 0.0, 0.0)

POOL_CUE_OFFSET_AIM = vector3(0.199, 0.429, 0.119)
POOL_CUE_ROTATION_AIM = vector3(-65.0, 46.0, 0.0)

PickedPoolCueAtPos = nil

Citizen.CreateThread(function()
    while true do
        Wait(2100)

        if PickedPoolCueAtPos and InHandPoolCue then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            if #(coords - PickedPoolCueAtPos) > 20.0 then
                RemovePoolCueInHand()
            end
        end
    end
end)

RegisterNetEvent('rcore_pool:takeCue')
AddEventHandler('rcore_pool:takeCue', function()
    if not HasPoolCueInHand then
        CreatePoolCueInHand()
    end
end)

RegisterNetEvent('rcore_pool:removeCue')
AddEventHandler('rcore_pool:removeCue', function()
    RemovePoolCueInHand()
end)

function CreatePoolCueInHand()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)

    PickedPoolCueAtPos = pedCoords

    HasPoolCueInHand = true

    InHandPoolCue = CreateObject(
        GetHashKey('prop_pool_cue'), 
        pedCoords.x, pedCoords.y, pedCoords.z, 
        IS_NETWORKED, true, false
    )
    SetEntityCollision(InHandPoolCue, false, false)
    TriggerServerEvent('rcore_pool:internalPlayerHasTakenCue', ObjToNet(InHandPoolCue), pedCoords)

    PoolCueAnimReset()
end

function RemovePoolCueInHand()
    HasPoolCueInHand = false
    PickedPoolCueAtPos = nil
    DeleteObject(InHandPoolCue)
    
    InHandPoolCue = nil

    TriggerServerEvent('rcore_pool:internalDeleteCue')
end

function PoolCueAnimReset()
    local ped = PlayerPedId()

    AttachEntityToEntity(
        InHandPoolCue, ped, GetPedBoneIndex(ped, POOL_CUE_BONE), 
        POOL_CUE_OFFSET_IDLE.x, POOL_CUE_OFFSET_IDLE.y, POOL_CUE_OFFSET_IDLE.z, 
        POOL_CUE_ROTATION_IDLE.x, POOL_CUE_ROTATION_IDLE.y, POOL_CUE_ROTATION_IDLE.z, 
        true, true, false, true, 1, true
    )

    ClearPedTasksImmediately(ped)
    ResetEntityAlpha(ped)
    ResetEntityAlpha(InHandPoolCue)
end

function PoolCueAnimAim()
    local ped = PlayerPedId()
    local namespace = 'pool@cue_aim'
    local name = 'myrpcuepool'

    loadAnimDict(namespace)
    TaskPlayAnim(ped, namespace, name, 8.0, 8.0, -1, 16 + 1, 0, 0, 0, 0 )

    AttachEntityToEntity(
        InHandPoolCue, ped, GetPedBoneIndex(ped, POOL_CUE_BONE), 
        POOL_CUE_OFFSET_AIM.x, POOL_CUE_OFFSET_AIM.y, POOL_CUE_OFFSET_AIM.z, 
        POOL_CUE_ROTATION_AIM.x, POOL_CUE_ROTATION_AIM.y, POOL_CUE_ROTATION_AIM.z, 
        true, true, false, true, 1, true
    )
    SetEntityAlpha(ped, 0.0, false)
    SetEntityAlpha(InHandPoolCue, 0.0, false)
end
