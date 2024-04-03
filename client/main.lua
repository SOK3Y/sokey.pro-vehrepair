Citizen.CreateThread(function()
    exports.ox_target:addGlobalVehicle({
        {
            name = name..'repairVehicle',
            event = name..'repairVehicle',
            icon = 'fa-solid fa-car',
            label = 'Napraw pojazd',
            canInteract = function(entity)
                local count = exports.ox_inventory:Search('count', 'repairkit')
                if count >= 1 then
                    return true
                end
                return false
            end,
        }
    })
end)

RegisterNetEvent(name..'repairVehicle', function(data)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskTurnPedToFaceCoord(ped, GetEntityCoords(data.entity))
	Citizen.Wait(1000)
    if lib.progressBar({
        duration = Config['RepairTime'] * 1000,
        label = 'Naprawianie pojazdu...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            scenario = 'PROP_HUMAN_BUM_BIN',
        },
    }) then
        SetVehicleFixed(data.entity)
        SetVehicleEngineOn(data.entity, true, true)
        TriggerServerEvent(name..'removeItem', 'repairkit', 1)
    else
        Notify('Powiadomienie', 'Anulowano naprawianie pojazdu', 'error')
    end
end)