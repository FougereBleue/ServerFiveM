ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx_policedog:hasClosestDrugs')
AddEventHandler('esx_policedog:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
        for k, v in pairs(Config.Drugs) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('esx_policedog:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('esx_policedog:hasDrugs', src, false)
end)

RegisterNetEvent('esx_policedog:hasClosestItems')
AddEventHandler('esx_policedog:hasClosestItems', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
        for k, v in pairs(Config.Items) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('esx_policedog:hasItems', src, true)
                return
            end
        end
    end
    TriggerClientEvent('esx_policedog:hasItems', src, false)
end)