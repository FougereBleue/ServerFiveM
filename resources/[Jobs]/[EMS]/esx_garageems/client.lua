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



RegisterNetEvent('esx:setJob')

AddEventHandler('esx:setJob', function(job)

    PlayerData.job = job

end)



_menuPool = NativeUI.CreatePool()

mainMenu = NativeUI.CreateMenu("Garage Ambulance", "~b~Choisis ton véhicule")

_menuPool:Add(mainMenu)



function AddVoitureMenu(menu)

    local ambulance = NativeUI.CreateItem("Ambulance", "")

    ambulance:SetRightBadge(12)

    menu:AddItem(ambulance)

    local dodgeems = NativeUI.CreateItem("Dodge Ambulance", "")

    dodgeems:SetRightBadge(12)

    menu:AddItem(dodgeems)



    menu:SetMenuWidthOffset(20)



    menu.OnItemSelect = function(sender, item, index)  

      if item == ambulance then

        DrawMissionText('~g~Votre véhicule est en cours de préparation...', 5000)

        Citizen.Wait(5000)

        spawnCar("ambulance")

        ESX.ShowNotification("~b~Garage~s~\nVotre véhicule est prêt !")

        _menuPool:CloseAllMenus(true)

      elseif item == dodgeems then

        DrawMissionText('~g~Votre véhicule est en cours de préparation...', 5000)

        Citizen.Wait(5000)

        spawnCar("dodgeems")

        _menuPool:CloseAllMenus(true)   

        end

      end

    end 



AddVoitureMenu(mainMenu)

_menuPool:RefreshIndex()



local polo = {

    {x = 295.71, y = -601.59, z = 43.30, plate = "Ambulance", xv = 293.38, yv = -612.25, zv = 43.38, hv = 65.95},

}



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        _menuPool:ProcessMenus()

        _menuPool:MouseEdgeEnabled (false);



        for k in pairs(polo) do



            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, polo[k].x, polo[k].y, polo[k].z)



            if dist <= 1.2 then 

                ESX.ShowHelpNotification("Appuie sur ~g~E~s~ pour ouvrir le garage")

                if IsControlJustPressed(1,51) then 

                    mainMenu:Visible(not mainMenu:Visible())

                end

                

            end

        end

    end

end)



--━━━━━━━━━━━━━━━━FUNCTION━━━━━━━━━━━━━━━━



function DrawMissionText(msg, time)

    ClearPrints()

    SetTextEntry_2('STRING')

    AddTextComponentString(msg)

    DrawSubtitleTimed(time, 1)

end



function SetVehicleMaxMods(vehicle)

    local props = {

        modEngine       = 3,

        modBrakes       = 3,

        modTransmission = 3,

        modSuspension   = 3,

        modTurbo        = true,

        windowTint = 2,

        plateIndex = 1,

    }

    SetVehicleDirtLevel(vehicle, 0.0)



    ESX.Game.SetVehicleProperties(vehicle, props)

end



spawnCar = function(car)

    local car = GetHashKey(car)



    RequestModel(car)

    while not HasModelLoaded(car) do

        RequestModel(car)

        Citizen.Wait(50)

    end

     

    for f in pairs(polo) do

      local vehicle = CreateVehicle(car, polo[f].xv, polo[f].yv, polo[f].zv, polo[f].hv, true, false)

      SetVehicleMaxMods(vehicle)

      SetEntityAsNoLongerNeeded(vehicle)

      SetModelAsNoLongerNeeded(vehicleName)

      SetVehicleNumberPlateText(vehicle, polo[f].plate)

      SetVehicleDirtLevel(vehicle, 0.1)

      WashDecalsFromVehicle(vehicle, 1.0)

      SetVehicleEngineOn(vehicle, true, true, true)

      SetVehicleLights(vehicle, 2)

      PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)

      --

      blip = AddBlipForEntity(vehicle)

      SetBlipSprite(blip, 225)

      ShowHeadingIndicatorOnBlip(blip, true)

      SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))

      SetBlipScale(blip, 0.65)

      SetBlipShrink(blip, true)

      ShowFriendIndicatorOnBlip(blip, true)

      BeginTextCommandSetBlipName("STRING")

      AddTextComponentString("~b~Véhicule de service")

      EndTextCommandSetBlipName(blip)

      --

    end   

end



local ped0 = {

  {models = "s_m_m_paramedic_01", x = 296.00, y = -600.23, z = 42.30, h = 164.60},

}



Citizen.CreateThread(function()

  for w in pairs(ped0) do

    local hash = GetHashKey(ped0[w].models)

    while not HasModelLoaded(hash) do

    RequestModel(hash)

    Wait(20)

    end

    ped = CreatePed("PED_TYPE_CIVFEMALE", ped0[w].models, ped0[w].x, ped0[w].y, ped0[w].z, ped0[w].h, false, true)

    FreezeEntityPosition(ped, true)

    SetEntityInvincible(ped, true)

    SetBlockingOfNonTemporaryEvents(ped, true)

    FreezeEntityPosition(ped, true)

  end

end)