-- breakehh_#2891
-- I know this script is very shit and fucking simple
local Keys = {["E"] = 38}

ESX = nil

local playerCoords = GetEntityCoords(GetPlayerPed(-1))
local objectCoords = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
--------------------
local WaitLol = 0
--------------------



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(WaitLol)

		local playerPed = PlayerPedId()
        local pedCoords = GetEntityCoords(PlayerPedId())
		local objectId = GetClosestObjectOfType(pedCoords, 1.5, GetHashKey("prop_watercooler"), false)
        local objectCoords = GetEntityCoords(objectId)
        local dist = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, objectCoords.x, objectCoords.y, objectCoords.z)
		
		if dist <= 1.5 then
		WaitLol = 0
		else
		WaitLol = 500
		end
		
        if DoesEntityExist(objectId) and IsControlJustPressed(0, Keys['E']) then
			ESX.ShowNotification('Napiłeś się wody z automatu.')
				local pedCoords = GetEntityCoords(PlayerPedId())
				local dist = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, objectCoords.x, objectCoords.y, objectCoords.z)
				if dist <= 1.5 then
				local pedCoords = GetEntityCoords(GetPlayerPed(-1))
				TriggerServerEvent('break_drinkwater:drink', source)
				ClearPedSecondaryTask(playerPed)
			end
        end
	end
end)

RegisterNetEvent('break_drinkwater:drink2')
AddEventHandler('break_drinkwater:drink2', function(prop_name)
	if not animation then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		animation = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				animation = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)