-- breakehh_#2891
-- I know this script is very shit and fucking simple

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('break_drinkwater:drink')
AddEventHandler('break_drinkwater:drink', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('break_drinkwater:drink2', source)
end)