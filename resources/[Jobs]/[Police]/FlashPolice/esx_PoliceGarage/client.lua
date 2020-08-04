--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Blip on Map for Car Garages:
Citizen.CreateThread(function()
	if Config.garage.EnableCarGarageBlip == true then	
		for k,v in pairs(Config.garage.CarZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.garage.CarGarageSprite)
				SetBlipDisplay(blip, Config.garage.CarGarageDisplay)
				SetBlipScale  (blip, Config.garage.CarGarageScale)
				SetBlipColour (blip, Config.garage.CarGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.garage.CarGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end	
end)

-- Blip on Map for Heli Garages:
Citizen.CreateThread(function()
	if Config.garage.EnableHeliGarageBlip == true then
		for k,v in pairs(Config.garage.HeliZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.garage.HeliGarageSprite)
				SetBlipDisplay(blip, Config.garage.HeliGarageDisplay)
				SetBlipScale  (blip, Config.garage.HeliGarageScale)
				SetBlipColour (blip, Config.garage.HeliGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.garage.HeliGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Blip on Map for Boat Garages:
Citizen.CreateThread(function()
	if Config.garage.EnableBoatGarageBlip == true then
		for k,v in pairs(Config.garage.BoatZones) do
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				SetBlipSprite(blip, Config.garage.BoatGarageSprite)
				SetBlipDisplay(blip, Config.garage.BoatGarageDisplay)
				SetBlipScale  (blip, Config.garage.BoatGarageScale)
				SetBlipColour (blip, Config.garage.BoatGarageColour)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.garage.BoatGarageName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

local insideMarker = false

-- Core Thread Function:
Citizen.CreateThread(function()
	while Config.garage.Enable do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		local veh = GetVehiclePedIsIn(PlayerPedId(), false)
		local pedInVeh = IsPedInAnyVehicle(PlayerPedId(), true)
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.garage.PoliceDatabaseName) then
			for k,v in pairs(Config.garage.CarZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.garage.PoliceCarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.97, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.garage.PoliceCarMarkerScale.x, Config.garage.PoliceCarMarkerScale.y, Config.garage.PoliceCarMarkerScale.y, Config.garage.PoliceCarMarkerColor.r,Config.garage.PoliceCarMarkerColor.g,Config.garage.PoliceCarMarkerColor.b,Config.garage.PoliceCarMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 2.5 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.garage.CarDraw3DText)
						if IsControlJustPressed(0, Config.garage.KeyToOpenCarGarage) then
							PoliceGarage('car')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.garage.HeliZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 10.0) and insideMarker == false then
						DrawMarker(Config.garage.PoliceHeliMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.95, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.garage.PoliceHeliMarkerScale.x, Config.garage.PoliceHeliMarkerScale.y, Config.garage.PoliceHeliMarkerScale.z, Config.garage.PoliceHeliMarkerColor.r,Config.garage.PoliceHeliMarkerColor.g,Config.garage.PoliceHeliMarkerColor.b,Config.garage.PoliceHeliMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.garage.HeliDraw3DText)
						if IsControlJustPressed(0, Config.garage.KeyToOpenHeliGarage) then
							PoliceGarage('helicopter')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end

			for k,v in pairs(Config.garage.BoatZones) do
				for i = 1, #v.Pos, 1 do
					local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
					if (distance < 20.0) and insideMarker == false then
						DrawMarker(Config.garage.PoliceBoatMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.garage.PoliceBoatMarkerScale.x, Config.garage.PoliceBoatMarkerScale.y, Config.garage.PoliceBoatMarkerScale.z, Config.garage.PoliceBoatMarkerColor.r,Config.garage.PoliceBoatMarkerColor.g,Config.garage.PoliceBoatMarkerColor.b,Config.garage.PoliceBoatMarkerColor.a, false, true, 2, true, false, false, false)						
					end
					if (distance < 3.0 ) and insideMarker == false then
						DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.garage.BoatDraw3DText)
						if IsControlJustPressed(0, Config.garage.KeyToOpenBoatGarage) then
							PoliceGarage('boat')
							insideMarker = true
							Citizen.Wait(500)
						end
					end
				end
			end
		end
	end
end)

-- Police Garage Menu:
PoliceGarage = function(type)
	local elements = {
		{ label = Config.garage.LabelStoreVeh, action = "store_vehicle" },
		{ label = Config.garage.LabelGetVeh, action = "get_vehicle" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_menu",
		{
			title    = Config.garage.TitlePoliceGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		local action = data.current.action
		if action == "get_vehicle" then
			if type == 'car' then
				VehicleMenu('car')
			elseif type == 'helicopter' then
				VehicleMenu('helicopter')
			elseif type == 'boat' then
				VehicleMenu('boat')
			end
		elseif data.current.action == 'store_vehicle' then
			local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
			if dist < 3 then
				DeleteEntity(veh)
				ESX.ShowNotification(Config.garage.VehicleParked)
			else
				ESX.ShowNotification(Config.garage.NoVehicleNearby)
			end
			insideMarker = false
		end
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Vehicle Spawn Menu:
VehicleMenu = function(type)
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(ped)
	
	if type == 'car' then
		for k,v in pairs(Config.garage.PoliceVehicles) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'car'})
		end
	elseif type == 'helicopter' then
		for k,v in pairs(Config.garage.PoliceHelicopters) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'helicopter'})
		end
	elseif type == 'boat' then
		for k,v in pairs(Config.garage.PoliceBoats) do
			table.insert(elements,{label = v.label, name = v.label, model = v.model, price = v.price, type = 'boat'})
		end
	end
		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeGarage_vehicle_garage",
		{
			title    = Config.garage.TitlePoliceGarage,
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		insideMarker = false
		local plate = exports['esx_vehicleshop']:GeneratePlate()
		VehicleLoadTimer(data.current.model)
		local veh = CreateVehicle(data.current.model,pos.x,pos.y,pos.z,GetEntityHeading(playerPed),true,false)
		SetPedIntoVehicle(GetPlayerPed(-1),veh,-1)
		SetVehicleNumberPlateText(veh,plate)
		
		if type == 'car' then
			ESX.ShowNotification(Config.garage.CarOutFromPolGar)
		elseif type == 'helicopter' then
			ESX.ShowNotification(Config.garage.HeliOutFromPolGar)
		elseif type == 'boat' then
			ESX.ShowNotification(Config.garage.BoatOutFromPolGar)
		end
		
		TriggerEvent("fuel:setFuel",veh,100.0)
		SetVehicleDirtLevel(veh, 0.1)		
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Load Timer Function for Vehicle Spawn:
function VehicleLoadTimer(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)

			drawLoadingText(Config.garage.VehicleLoadText, 255, 255, 255, 255)
		end
	end
end

-- Loading Text for Vehicles Function:
function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

-- Fix Police Vehicle Command:
--[[ RegisterCommand('policeRepair', function(source, args)
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == Config.garage.PoliceDatabaseName) then
		policeFix()
	end
end,false) ]]

-- Fix Police Vehicle Function:
function policeFix()
	local ped = GetPlayerPed(-1)
	if Config.garage.Enable then
		for k,v in pairs(Config.garage.CarZones) do
			for i = 1, #v.Pos, 1 do
				if IsPedInAnyVehicle(ped, true) then
					local veh = GetVehiclePedIsIn(ped, false)
					if GetDistanceBetweenCoords(GetEntityCoords(ped), v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) <= Config.garage.Distance then
						ESX.ShowNotification(Config.garage.VehRepNotify)
						FreezeEntityPosition(veh, true)
						exports['progressBars']:startUI((Config.garage.RepairTime * 1000), Config.garage.Progress1)
						Citizen.Wait((Config.garage.RepairTime * 1000))
						ESX.ShowNotification(Config.garage.VehRepDoneNotify)
						SetVehicleFixed(veh)
						FreezeEntityPosition(veh, false)
					end
				end
			end	
		end
	end
end

-- Clean Police Vehicle Command:
--[[ RegisterCommand('policeClean', function(source, args)
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == Config.garage.PoliceDatabaseName) then
		policeClean()
	end
end,false) ]]

-- Clean Police Vehicle Command:
function policeClean()
	local ped = GetPlayerPed(-1)
	for k,v in pairs(Config.garage.CarZones) do
		for i = 1, #v.Pos, 1 do
			if IsPedInAnyVehicle(ped, true) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetDistanceBetweenCoords(GetEntityCoords(ped), v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) <= Config.garage.Distance then
					ESX.ShowNotification(Config.garage.VehCleanNotify)
					FreezeEntityPosition(veh, true)
					exports['progressBars']:startUI((Config.garage.CleanTime * 1000), Config.garage.Progress2)
					Citizen.Wait((Config.garage.CleanTime * 1000))
					ESX.ShowNotification(Config.garage.VehCleanDoneNotify)
					SetVehicleDirtLevel(veh, 0.1)
					FreezeEntityPosition(veh, false)
				end
			end
		end	
	end
end