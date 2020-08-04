--discord shop : https://discord.gg/3wwzfmf---
--discord leaks : https://discord.gg/39mJqPU--
----------------------SP#5201------------------
local input = {["E"] = 38,["DOWN"] = 173,["TOP"] = 27,["NENTER"] =  201}
ESX                           = nil
local PlayerData                = {}



Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


Citizen.CreateThread(function()
SetNuiFocus(false, false)
end)


RegisterNetEvent('errormessage2')
AddEventHandler('errormessage2', function()
PlaySound(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNetEvent('spinit2')
AddEventHandler('spinit2', function()
	PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
	
	SendNUIMessage({
			canspin = true
		})
	Citizen.Wait(100)
	
		SendNUIMessage({
			canspin = false
		})

end)


RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
	
end)




RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 1)
	TriggerServerEvent('payforplayer2',winnings)
end)


RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays2',bet)
end)

local moneymachine_slot = {
	{ ['x'] = 969.25, ['y'] = 71.35, ['z'] = 75.74 },
	{ ['x'] = 972.31, ['y'] = 73.82, ['z'] = 75.74 },
	{ ['x'] = 969.46, ['y'] = 74.03, ['z'] = 75.74 },
	{ ['x'] = 972.26, ['y'] = 71.08, ['z'] = 75.74 },
	
	{ ['x'] = 967.61, ['y'] = 65.98, ['z'] = 75.74 },
	{ ['x'] = 970.20, ['y'] = 64.97, ['z'] = 75.74 },
	{ ['x'] = 971.27, ['y'] = 67.56, ['z'] = 75.74 },
	{ ['x'] = 968.65, ['y'] = 68.62, ['z'] = 75.74 },
	
	{ ['x'] = 974.09, ['y'] = 65.92, ['z'] = 75.74 },
	{ ['x'] = 972.46, ['y'] = 63.75, ['z'] = 75.74 },
	{ ['x'] = 974.70, ['y'] = 61.62, ['z'] = 75.74 },
	{ ['x'] = 976.66, ['y'] = 64.02, ['z'] = 75.74 },
	
	{ ['x'] = 978.45, ['y'] = 65.55, ['z'] = 75.74 },
	{ ['x'] = 980.92, ['y'] = 67.11, ['z'] = 75.74 },
	{ ['x'] = 979.36, ['y'] = 69.32, ['z'] = 75.74 },
	{ ['x'] = 977.07, ['y'] = 68.00, ['z'] = 75.74 },
	
	{ ['x'] = 975.68, ['y'] = 71.17, ['z'] = 75.74 },
	{ ['x'] = 978.42, ['y'] = 72.03, ['z'] = 75.74 },
	{ ['x'] = 977.72, ['y'] = 74.68, ['z'] = 75.74 },
	{ ['x'] = 974.96, ['y'] = 73.97, ['z'] = 75.74 },
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(29, v.x, v.y, v.z - 0, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 0, 325, 165, 165, 0,0, 0,0)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
						DisplayHelpText("Appuis ~INPUT_CONTEXT~   ~y~pour jouer")
					if IsControlJustPressed(1,input["E"]) then
						SendNUIMessage({
							show = true
						})
						SetNuiFocus(true,true)
						PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

