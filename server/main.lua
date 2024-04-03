RegisterNetEvent(name..'removeKit', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, count)
end)