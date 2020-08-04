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

local insideMarker = false

-- Core Thread Function:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local coords = GetEntityCoords(PlayerPedId())
		
		if (ESX.PlayerData.job and ESX.PlayerData.job.name == Config.Armory.PoliceDatabaseName) then
		for k,v in pairs(Config.Armory.ArmoryZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 7.0) and insideMarker == false then
					DrawMarker(Config.Armory.ArmoryMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.Armory.ArmoryMarkerScale.x, Config.Armory.ArmoryMarkerScale.y, Config.Armory.ArmoryMarkerScale.z, Config.Armory.ArmoryMarkerColor.r,Config.Armory.ArmoryMarkerColor.g,Config.Armory.ArmoryMarkerColor.b,Config.Armory.ArmoryMarkerColor.a, false, true, 2, true, false, false, false)						
				end
				if (distance < 1.0) and insideMarker == false then
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.Armory.ArmoryDraw3DText)
					if IsControlJustPressed(0, Config.Armory.KeyToOpenArmory) then
						ESX.TriggerServerCallback('esx_policeArmory:getWeaponState', function(stock) end)
						PoliceArmory()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		for k,v in pairs(Config.Armory.KevlarZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 7.0) and insideMarker == false then
				DrawMarker(Config.Armory.KevlarMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.Armory.KevlarMarkerScale.x, Config.Armory.KevlarMarkerScale.y, Config.Armory.KevlarMarkerScale.z, Config.Armory.KevlarMarkerColor.r,Config.Armory.KevlarMarkerColor.g,Config.Armory.KevlarMarkerColor.b,Config.Armory.KevlarMarkerColor.a, false, true, 2, true, false, false, false)						
				end
				if (distance < 1.0 ) and insideMarker == false then
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.Armory.KevlarDraw3DText)
					if IsControlJustPressed(0, Config.Armory.KeyToOpenKevlar) then
						KevlarMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end

		for k,v in pairs(Config.Armory.AttachmentZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
				if (distance < 7.0) and insideMarker == false then
				DrawMarker(Config.Armory.AttachmentsMarker, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z-0.975, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.Armory.AttachmentsMarkerScale.x, Config.Armory.AttachmentsMarkerScale.y, Config.Armory.AttachmentsMarkerScale.z, Config.Armory.AttachmentsMarkerColor.r,Config.Armory.AttachmentsMarkerColor.g,Config.Armory.AttachmentsMarkerColor.b,Config.Armory.AttachmentsMarkerColor.a, false, true, 2, true, false, false, false)						
				end
				if (distance < 1.0 ) and insideMarker == false then
					DrawText3Ds(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, Config.Armory.AttachmentsDraw3DText)
					if IsControlJustPressed(0, Config.Armory.KeyToOpenAttachments) then
						AttachmentMenu()
						insideMarker = true
						Citizen.Wait(500)
					end
				end
			end
		end
		end
		
	end
end)

-- Function for Weapon Armory:
PoliceArmory = function()
	local elements = {
		{ label = Config.Armory.WeaponStorage, action = "weapon_menu" },
	}
	
	if not IsEntityPlayingAnim(GetPlayerPed(-1), 'mini@repair', 'fixing_a_player', 3) then
        ESX.Streaming.RequestAnimDict('mini@repair', function()
            TaskPlayAnim(GetPlayerPed(-1), 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
        end)
    end
	
	if tonumber(ESX.PlayerData.job.grade) >= Config.Armory.RestockGrade then
		table.insert(elements, {label = Config.Armory.RestockWeapon, action = "restock_menu"})
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_main_menu",
		{
			title    = Config.Armory.PoliceArmoryTitle,
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		local action = data.current.action

		if action == "weapon_menu" then
			WeaponMenu()
		elseif action == "restock_menu" then
			RestockMenu()
		end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
	end, function(data, menu)
	end)
end

-- Function for splitting string:
function WeapSplit(inputstr, del)
    if del == nil then
            del = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..del.."]+)") do
            table.insert(t, str)
    end
    return t
end

-- Function to check if player has weapon:
function PedHasWeapon(hash)
	for k,v in pairs(ESX.GetPlayerData().loadout) do
		if v.name == hash then
			return true
		end
	end
	return false
end

-- Function for Weapon Menu:
WeaponMenu = function()
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	ESX.TriggerServerCallback("esx_policeArmory:getWeaponState", function(stock)	
	local weapons = WeapSplit(stock[1].weapons, ", ")
	
	for k,v in pairs(Config.Armory.WeaponsInArmory) do
		local takenOut = false
		for z,x in pairs(weapons) do
			if x == v.weaponHash then
				takenOut = true
				table.insert(elements,{label = v.label .. " --- "..('<span style="color:red;">%s</span>'):format("Taken out"), weaponhash = v.weaponHash, lendable = false})
			end
		end
		if takenOut == false then
			table.insert(elements,{label = v.label .. " --- "..('<span style="color:green;">%s</span>'):format("In Stock"), weaponhash = v.weaponHash, lendable = true})
		end
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_weapon_storage",
		{
			title    = Config.Armory.WeaponStorageTitle,
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		menu.close()
		
		if data.current.lendable == true then
			local giveAmmo = (GetWeaponClipSize(GetHashKey(data.current.weaponhash)) > 0)
			if data.current.weaponhash == "WEAPON_STUNGUN" then
				giveAmmo = false
			end
			TriggerServerEvent("esx_policeArmory:weaponTakenOut", data.current.weaponhash, giveAmmo)
		elseif PedHasWeapon(data.current.weaponhash) then
			local giveAmmo = (GetWeaponClipSize(GetHashKey(data.current.weaponhash)) > 0)
			if data.current.weaponhash == "WEAPON_STUNGUN" then
				giveAmmo = false
			end
			TriggerServerEvent("esx_policeArmory:weaponInStock", data.current.weaponhash,GetAmmoInPedWeapon(ped,GetHashKey(data.current.weaponhash)),giveAmmo)
		else
			ESX.ShowNotification(Config.Armory.ContactSuperVisor)
		end
		
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
	end)
end

-- Function for Restock Menu:
function RestockMenu()
	local police = {}
	local elements = {}
	ESX.TriggerServerCallback("esx_policeArmory:checkPoliceOnline", function(list) police = list end)
	Citizen.Wait(250)
	for k,v in pairs(police) do
		if v.job.name == Config.Armory.PoliceDatabaseName then
			table.insert(elements, {label = v.name, id = v.id})
		end
	end
	if next(elements) ~= nil then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_restock_menu",
			{
				title    = Config.Armory.RestockWeaponTitle,
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			menu.close()
			exports['progressBars']:startUI((Config.Armory.RestockTimer * 1000), Config.Armory.Progress1)
			Citizen.Wait((Config.Armory.RestockTimer * 1000))
			TriggerServerEvent("esx_policeArmory:restockWeapons",data.current.id)
		end, function(data, menu)
			
			menu.close()
		end, function(data, menu)
		end)
	else
		ESX.ShowNotification(Config.Armory.NoPoliceOnline)
	end
end

-- Function for Kevlar Menu:
function KevlarMenu()
	local ped = GetPlayerPed(-1)
	local elements = {}
	
	if not IsEntityPlayingAnim(GetPlayerPed(-1), 'mini@repair', 'fixing_a_player', 3) then
        ESX.Streaming.RequestAnimDict('mini@repair', function()
            TaskPlayAnim(GetPlayerPed(-1), 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
        end)
    end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_kevlar_menu",
			{
				title    = Config.Armory.PoliceKevlarTitle,
				align    = "top-left",
				elements = {
					--{label = Config.Armory.Vest1, armor = 25},
					--{label = Config.Armory.Vest2, armor = 50},
					--{label = Config.Armory.Vest3, armor = 75},
					{label = Config.Armory.Vest4, armor = 100},
					{label = Config.Armory.RemoveVest, armor = 0},
			}
			},
		function(data, menu)
			SetPedArmour(ped,data.current.armor)
			if data.current.armor == 0 then
				exports['progressBars']:startUI((Config.Armory.RemoveVestTimer * 1000), Config.Armory.Progress2)
				Citizen.Wait((Config.Armory.RemoveVestTimer * 1000))
				SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
			else
				exports['progressBars']:startUI((Config.Armory.WearVestTimer * 1000), Config.Armory.Progress3)
				Citizen.Wait((Config.Armory.RemoveVestTimer * 1000))
				if data.current.armor == 25 then
					SetPedComponentVariation(ped, Config.Armory.VestVariation1.componentId, Config.Armory.VestVariation1.drawableId, Config.Armory.VestVariation1.textureId, Config.Armory.VestVariation1.paletteId)
				elseif data.current.armor == 50 then
					SetPedComponentVariation(ped, Config.Armory.VestVariation2.componentId, Config.Armory.VestVariation2.drawableId, Config.Armory.VestVariation2.textureId, Config.Armory.VestVariation2.paletteId)
				elseif data.current.armor == 75 then
					SetPedComponentVariation(ped, Config.Armory.VestVariation3.componentId, Config.Armory.VestVariation3.drawableId, Config.Armory.VestVariation3.textureId, Config.Armory.VestVariation3.paletteId)
				elseif data.current.armor == 100 then
					SetPedComponentVariation(ped, Config.Armory.VestVariation4.componentId, Config.Armory.VestVariation4.drawableId, Config.Armory.VestVariation4.textureId, Config.Armory.VestVariation4.paletteId)
				end
			end
						
			menu.close()
			insideMarker = false
			ClearPedSecondaryTask(GetPlayerPed(-1))
		end, function(data, menu)
			menu.close()
			insideMarker = false
			ClearPedSecondaryTask(GetPlayerPed(-1))
		end, function(data, menu)
		end)
end

-- Function for Attachment menu:
function AttachmentMenu()
	local elements = {}
	local ped = GetPlayerPed(-1)
			
	for k,v in pairs(Config.Armory.WeaponsInArmory) do
		if v.attachment == true then
			table.insert(elements,{label = v.label, weaponhash = v.weaponHash, type = v.type, attachment = v.attachment, flashlight = v.flashlight, scope = v.scope, suppressor = v.suppressor})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_attachment_menu",
		{
			title    = Config.Armory.ChooseWeaponTitle,
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
			if data.current.weaponhash == data.current.weaponhash then
				if GetSelectedPedWeapon(ped) == GetHashKey(data.current.weaponhash) then
					ListOfAttachments(data.current.type, data.current.label, data.current.weaponhash, data.current.attachment, data.current.flashlight, data.current.scope, data.current.suppressor)
				else
					ESX.ShowNotification(Config.Armory.WeaponMustBeInHand)
				end
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Function for Attachment List Menu:
function ListOfAttachments(type,name,weaponhash,attachment,flashlight,scope,suppressor)
	local elements = {}
	
	local ped = GetPlayerPed(-1)
			
	if flashlight then
		local state = HasPedGotWeaponComponent(ped, weaponhash, flashlight)
		local text
		
		if state then
			text = "Flashlight: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Flashlight: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = flashlight,
			state = not state
		})
	end
			
	if scope then
		local state = HasPedGotWeaponComponent(ped, weaponhash, scope)
		local text
		
		if state then
			text = "Scope: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Scope: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = scope,
			state = not state
		})
	end
			
	if suppressor then
		local state = HasPedGotWeaponComponent(ped, weaponhash, suppressor)
		local text
		
		if state then
			text = "Suppressor: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Suppressor: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = suppressor,
			state = not state
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'policeArmory_list_of_attachments', {
		title    = Config.Armory.AttachmentTitle,
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		local newData = data.current
		
		if data.current.value == flashlight then
			if data.current.state then
				newData.label = "Flashlight: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.FlashlightEquipped,name))
			else
				newData.label = "Flashlight: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.FlashlightRemove,name))
			end
		elseif data.current.value == scope then
			if data.current.state then
				newData.label = "Scope: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.ScopeEquipped,name))
			else
				newData.label = "Scope: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.ScopeRemove,name))
			end
		elseif data.current.value == suppressor then
			if data.current.state then
				newData.label = "Suppressor: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.SuppressorEquipped,name))
			else
				newData.label = "Suppressor: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				ESX.ShowNotification(string.format(Config.Armory.SuppressorRemove,name))
			end
		end
				
		newData.state = not data.current.state
		menu.update({value = data.current.value}, newData)
		menu.refresh()
	end, function(data, menu)
		menu.close()		
	end)
end
