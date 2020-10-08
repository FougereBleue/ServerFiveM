 local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PID           			= 0
local GUI           			= {}
local cokeQTE       			= 0
ESX 			    			= nil
GUI.Time            			= 0
local coke_poochQTE 			= 0
local weedQTE					= 0
local weed_poochQTE 			= 0
local methQTE					= 0
local meth_poochQTE 			= 0
local opiumQTE					= 0
local opium_poochQTE 			= 0
local myJob 					= nil
local PlayerData 				= {}
local GUI 						= {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
 local myJob     = nil
 local selling       = false
 local has       = false
 local copsc     = false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

 RegisterNetEvent('esx:playerLoaded')
 AddEventHandler('esx:playerLoaded', function()
     TriggerServerEvent('fetchjob')
 end)

 -- RETURN NUMBER OF ITEMS FROM SERVER
 RegisterNetEvent('getjob')
 AddEventHandler('getjob', function(jobName)
     myJob = jobName
 end)

AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)

        ESX.UI.Menu.CloseAll()

        --coke
        if zone == 'CokeFarm' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                CurrentAction     = 'coke_harvest'
                CurrentActionMsg  = _U('press_collect_coke')
                CurrentActionData = {}
            end
        end

        if zone == 'CokeTreatment' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if cokeQTE >= 5 then
                    CurrentAction     = 'coke_treatment'
                    CurrentActionMsg  = _U('press_process_coke')
                    CurrentActionData = {}
                end
            end
        end

        if zone == 'CokeResell' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if coke_poochQTE >= 1 then
                    CurrentAction     = 'coke_resell'
                    CurrentActionMsg  = _U('press_sell_coke')
                    CurrentActionData = {}
                end
            end
        end

        --meth
        if zone == 'MethFarm' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                CurrentAction     = 'meth_harvest'
                CurrentActionMsg  = _U('press_collect_meth')
                CurrentActionData = {}
            end
        end

        if zone == 'MethTreatment' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if methQTE >= 5 then
                    CurrentAction     = 'meth_treatment'
                    CurrentActionMsg  = _U('press_process_meth')
                    CurrentActionData = {}
                end
            end
        end

        if zone == 'MethResell' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if meth_poochQTE >= 1 then
                    CurrentAction     = 'meth_resell'
                    CurrentActionMsg  = _U('press_sell_meth')
                    CurrentActionData = {}
                end
            end
        end

        --weed
        if zone == 'WeedFarm' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                CurrentAction     = 'weed_harvest'
                CurrentActionMsg  = _U('press_collect_weed')
                CurrentActionData = {}
            end
        end

        if zone == 'WeedTreatment' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if weedQTE >= 5 then
                    CurrentAction     = 'weed_treatment'
                    CurrentActionMsg  = _U('press_process_weed')
                    CurrentActionData = {}
                end
            end
        end

        if zone == 'WeedResell' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if weed_poochQTE >= 1 then
                    CurrentAction     = 'weed_resell'
                    CurrentActionMsg  = _U('press_sell_weed')
                    CurrentActionData = {}
                end
            end
        end

        --opium
        if zone == 'OpiumFarm' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                CurrentAction     = 'opium_harvest'
                CurrentActionMsg  = _U('press_collect_opium')
                CurrentActionData = {}
            end
        end

        if zone == 'OpiumTreatment' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if opiumQTE >= 5 then
                    CurrentAction     = 'opium_treatment'
                    CurrentActionMsg  = _U('press_process_opium')
                    CurrentActionData = {}
                end
            end
        end

        if zone == 'OpiumResell' then
            if myJob ~= "police" and myJob ~= "sheriff" and myJob ~= "gouvernor" then
                if opium_poochQTE >= 1 then
                    CurrentAction     = 'opium_resell'
                    CurrentActionMsg  = _U('press_sell_opium')
                    CurrentActionData = {}
                end
            end
        end
end)

AddEventHandler('esx_drugs:hasExitedMarker', function(zone)

        CurrentAction = nil
        ESX.UI.Menu.CloseAll()

        TriggerServerEvent('esx_drugs:stopHarvestCoke')
        TriggerServerEvent('esx_drugs:stopTransformCoke')
        TriggerServerEvent('esx_drugs:stopSellCoke')
        TriggerServerEvent('esx_drugs:stopHarvestMeth')
        TriggerServerEvent('esx_drugs:stopTransformMeth')
        TriggerServerEvent('esx_drugs:stopSellMeth')
        TriggerServerEvent('esx_drugs:stopHarvestWeed')
        TriggerServerEvent('esx_drugs:stopTransformWeed')
        TriggerServerEvent('esx_drugs:stopSellWeed')
        TriggerServerEvent('esx_drugs:stopHarvestOpium')
        TriggerServerEvent('esx_drugs:stopTransformOpium')
        TriggerServerEvent('esx_drugs:stopSellOpium')
end)

-- Weed Effect
RegisterNetEvent('esx_drugs:onPot')
AddEventHandler('esx_drugs:onPot', function()
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(600000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Render markers
-- Citizen.CreateThread(function()
    -- while true do

        -- Wait(0)

        -- local coords = GetEntityCoords(GetPlayerPed(-1))

        -- for k,v in pairs(Config.Zones) do
            -- if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                -- DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            -- end
        -- end

    -- end
-- end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, methNbr, methpNbr, weedNbr, weedpNbr, opiumNbr, opiumpNbr, jobName, currentZone)
    cokeQTE       = cokeNbr
    coke_poochQTE = cokepNbr
    methQTE 	  = methNbr
    meth_poochQTE = methpNbr
    weedQTE 	  = weedNbr
    weed_poochQTE = weedpNbr
    opiumQTE       = opiumNbr
    opium_poochQTE = opiumpNbr
    myJob         = jobName
    TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
                isInMarker  = true
                currentZone = k
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
        end

    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'coke_harvest' then
                    TriggerServerEvent('esx_drugs:startHarvestCoke')
                end
                if CurrentAction == 'coke_treatment' then
                    TriggerServerEvent('esx_drugs:startTransformCoke')
                end
                if CurrentAction == 'coke_resell' then
                    TriggerServerEvent('esx_drugs:startSellCoke')
                end
                if CurrentAction == 'meth_harvest' then
                    TriggerServerEvent('esx_drugs:startHarvestMeth')
                end
                if CurrentAction == 'meth_treatment' then
                    TriggerServerEvent('esx_drugs:startTransformMeth')
                end
                if CurrentAction == 'meth_resell' then
                    TriggerServerEvent('esx_drugs:startSellMeth')
                end
                if CurrentAction == 'weed_harvest' then
                    TriggerServerEvent('esx_drugs:startHarvestWeed')
                end
                if CurrentAction == 'weed_treatment' then
                    TriggerServerEvent('esx_drugs:startTransformWeed')
                end
                if CurrentAction == 'weed_resell' then
                    TriggerServerEvent('esx_drugs:startSellWeed')
                end
                if CurrentAction == 'opium_harvest' then
                    TriggerServerEvent('esx_drugs:startHarvestOpium')
                end
                if CurrentAction == 'opium_treatment' then
                    TriggerServerEvent('esx_drugs:startTransformOpium')
                end
                if CurrentAction == 'opium_resell' then
                    TriggerServerEvent('esx_drugs:startSellOpium')
                end
                CurrentAction = nil
            end
        end
    end
end)


 -----------------------------------------------
 --------------------EFFETS---------------------
 -----------------------------------------------

 RegisterNetEvent('esx_drugs:onCoke')
 AddEventHandler('esx_drugs:onCoke', function()
     RequestAnimSet("move_m@quick")
     while not HasAnimSetLoaded("move_m@quick") do
         Citizen.Wait(0)
     end
     TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
     Citizen.Wait(5000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     ClearPedTasksImmediately(GetPlayerPed(-1))
     TriggerEvent('shakeCam', true)
     local player = PlayerId()
     SetRunSprintMultiplierForPlayer(player, 1.15)
     SetPlayerMeleeWeaponDamageModifier(player, 2.0)
     SetPlayerMeleeWeaponDefenseModifier(player, 2.0)
     SetTimecycleModifier("spectator9")
     SetPedMotionBlur(GetPlayerPed(-1), true)
     SetPedMovementClipset(GetPlayerPed(-1), "move_m@quick", true)
     SetPedIsDrunk(GetPlayerPed(-1), true)
     DoScreenFadeIn(1000)
     Citizen.Wait(600000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     DoScreenFadeIn(1000)
     ClearTimecycleModifier()
     ResetScenarioTypesEnabled()
     ResetPedMovementClipset(GetPlayerPed(-1), 0)
     SetPedIsDrunk(GetPlayerPed(-1), false)
     SetPedMotionBlur(GetPlayerPed(-1), false)
 end)

 RegisterNetEvent('esx_drugs:onMeth')
 AddEventHandler('esx_drugs:onMeth', function()
     RequestAnimSet("move_m@quick")
     while not HasAnimSetLoaded("move_m@quick") do
         Citizen.Wait(0)
     end
     TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
     Citizen.Wait(5000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     ClearPedTasksImmediately(GetPlayerPed(-1))
     TriggerEvent('shakeCam', true)
     SetTimecycleModifier("spectator9")
     SetPedMotionBlur(GetPlayerPed(-1), true)
     SetPedMovementClipset(GetPlayerPed(-1), "move_m@quick", true)
     SetPedIsDrunk(GetPlayerPed(-1), true)
     DoScreenFadeIn(1000)
     Citizen.Wait(1000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     TriggerEvent('shakeCam', true)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     Citizen.Wait(4000)
     ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 999100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
     TriggerEvent('shakeCam', true)
     Citizen.Wait(600000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     DoScreenFadeIn(1000)
     ClearTimecycleModifier()
     ResetScenarioTypesEnabled()
     ResetPedMovementClipset(GetPlayerPed(-1), 0)
     SetPedIsDrunk(GetPlayerPed(-1), false)
     SetPedMotionBlur(GetPlayerPed(-1), false)
 end)
 RegisterNetEvent('esx_drugs:onMush')
 AddEventHandler('esx_drugs:onMush', function()
     RequestAnimSet("move_m@hobo@a")
     while not HasAnimSetLoaded("move_m@hobo@a") do
         Citizen.Wait(0)
     end
     TaskStartScenarioInPlace(GetPlayerPed(-1), "mp_player_inteat@burger", 0, true)
     Citizen.Wait(5000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     ClearPedTasksImmediately(GetPlayerPed(-1))
     SetTimecycleModifier("spectator5")
     SetPedMotionBlur(GetPlayerPed(-1), true)
     SetPedMovementClipset(GetPlayerPed(-1), "move_m@hobo@a", true)
     SetPedIsDrunk(GetPlayerPed(-1), true)
     DoScreenFadeIn(1000)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 30.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 20.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 29.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 19.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 28.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 18.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 27.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 17.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 26.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 16.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 25.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 15.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 24.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 14.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 23.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 13.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 22.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 12.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 20.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 10.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 18.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 8.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 16.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 7.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 14.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 6.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 12.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.5)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 10.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 8.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 7.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 6.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 5.0)
     Citizen.Wait(10000)
     ShakeGameplayCam("VIBRATE_SHAKE", 5.0)
     Citizen.Wait(1500)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 5.0)
     Citizen.Wait(100000)
     DoScreenFadeOut(1000)
     Citizen.Wait(1000)
     DoScreenFadeIn(1000)
     ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 0.0)
     ShakeGameplayCam("VIBRATE_SHAKE", 0.0)
     ClearTimecycleModifier()
     ResetScenarioTypesEnabled()
     ResetPedMovementClipset(GetPlayerPed(-1), 0)
     SetPedIsDrunk(GetPlayerPed(-1), false)
     SetPedMotionBlur(GetPlayerPed(-1), false)
 end)
------------------------------------------------------------------
 currentped = nil
 Citizen.CreateThread(function()

     while true do
         Wait(0)
         local player = GetPlayerPed(-1)
         local playerloc = GetEntityCoords(player, 0)
         local handle, ped = FindFirstPed()
         repeat
             success, ped = FindNextPed(handle)
             local pos = GetEntityCoords(ped)
             local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
             if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
                 if DoesEntityExist(ped)then
                     if IsPedDeadOrDying(ped) == false then
                         if IsPedInAnyVehicle(ped) == false then
                             local pedType = GetPedType(ped)
                             if pedType ~= 28 and IsPedAPlayer(ped) == false then
                                 currentped = pos
                                 if distance <= 2 and ped  ~= GetPlayerPed(-1) and ped ~= oldped then
                                     TriggerServerEvent('checkD')
                                     if has == true then
                                         drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Appuyez sur ~g~E ~w~pour vendre du cannabis", 255, 255, 255, 255)
                                         if IsControlJustPressed(1, 86) then
                                             oldped = ped
                                             SetEntityAsMissionEntity(ped)
                                             TaskStandStill(ped, 9.0)
                                             pos1 = GetEntityCoords(ped)
                                             TriggerServerEvent('drugs:trigger')
                                             Citizen.Wait(2850)
                                             TriggerEvent('sell')
                                             SetPedAsNoLongerNeeded(oldped)
                                         end
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
         until not success
         EndFindPed(handle)
     end
 end)

 RegisterNetEvent('sell')
 AddEventHandler('sell', function()
     local player = GetPlayerPed(-1)
     local playerloc = GetEntityCoords(player, 0)
     local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

     if distance <= 2 then
         TriggerServerEvent('drugs:sell')
     elseif distance > 2 then
         TriggerServerEvent('sell_dis')
     end
 end)


 RegisterNetEvent('checkR')
 AddEventHandler('checkR', function(test)
     has = test
 end)

 RegisterNetEvent('notifyc')
 AddEventHandler('notifyc', function()

     local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
     local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
     local street1 = GetStreetNameFromHashKey(s1)
     local street2 = GetStreetNameFromHashKey(s2)
     DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local sex = nil
                if skin.sex == 0 then
                    sex = "Un homme"
                else
                    sex = "Une femme"
                end
                TriggerServerEvent('drugInProgressPos', plyPos.x, plyPos.y, plyPos.z)
                if s2 == 0 then
                    TriggerServerEvent('drugInProgressS1', street1, sex)
                elseif s2 ~= 0 then
                    TriggerServerEvent("drugInProgress", street1, street2, sex)
                end
            end)


    --[[ local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
     local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
     local streetName, crossing = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
     local streetName, crossing = GetStreetNameAtCoord(x, y, z)
     streetName = GetStreetNameFromHashKey(streetName)
     TriggerServerEvent('fetchjob')
     local plyCoords = GetEntityCoords(GetPlayerPed(-1), 1)
     TriggerServerEvent('phone:call', 'police', 'drogue', plyCoords['x'], plyCoords['y'], plyCoords['z'])
     TriggerServerEvent('phone:call', 'sheriff', 'drogue', plyCoords['x'], plyCoords['y'], plyCoords['z'])
     if myJob == 'police' or myJob == 'sheriff' then
         if crossing ~= nil then
             crossing = GetStreetNameFromHashKey(crossing)
             TriggerEvent('chatMessage', "^4911", {0, 153, 204}, "^7Quelqu'un a essayé de vendre de la drogue entre ^1" .. streetName .. " ^7et ^1" .. crossing .. " ^7besoin d'une patrouille")
         else
             TriggerEvent('chatMessage', "^4911", {0, 153, 204}, "^7Quelqu'un a essayé de vendre de la drogue sur ^1" .. streetName .. " ^7besoin d'une patrouille")
         end
     end]]--

 end)

 RegisterNetEvent('animation')
 AddEventHandler('animation', function()
     local pid = PlayerPedId()
     RequestAnimDict("amb@prop_human_bum_bin@idle_b")
     while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
     TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
     Wait(750)
     StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
 end)

 function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
     SetTextFont(0)
     SetTextProportional(0)
     SetTextScale(scale, scale)
     SetTextColour(r, g, b, a)
     SetTextDropShadow(0, 0, 0, 0,255)
     SetTextEdge(1, 0, 0, 0, 255)
     SetTextDropShadow()
     if(outline)then
         SetTextOutline()
     end
     SetTextEntry("STRING")
     AddTextComponentString(text)
     DrawText(x - width/2, y - height/2 + 0.005)
 end