ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('wheel', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	TriggerClientEvent('gln_oponazapasowa:uzyj', _source)
end)

RegisterNetEvent('gln_oponazapasowa:usunOpone')
AddEventHandler('gln_oponazapasowa:usunOpone', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('wheel', 1)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez utilisé une roue de secours!')
end)