ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'gouvernor' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police'))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCokeR then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police2'))
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 45 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 2)
				xPlayer.addInventoryItem('coke_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCokeT then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police3'))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 50)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 60)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 70)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 80)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 90)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 100)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 6 then
                    xPlayer.addAccountMoney('black_money', 110)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMethR then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police'))
		return
	end
	
	SetTimeout(5000, function()

		if PlayersHarvestingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMethT then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police2'))
		return
	end

	SetTimeout(12000, function()

		if PlayersTransformingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 45 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 2)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police3'))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingMeth[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 900)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 1250)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 1600)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1950)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money',2550)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 5 then
                    xPlayer.addAccountMoney('black_money', 3050)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected >= 6 then
                    xPlayer.addAccountMoney('black_money', 4050)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeedR then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police'))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeedT then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police2'))
		return
	end

	SetTimeout(7500, function()

		if PlayersTransformingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 45 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 2)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police3'))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingWeed[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)
                if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 1000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1200)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected >= 4 then
                    xPlayer.addAccountMoney('black_money', 1400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpiumR then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police'))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpiumT then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police2'))
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 45 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 2)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police3'))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingOpium[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 1000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 1350)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 2450)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 3550)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 4650)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 5750)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_drugs:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)

-- Register Usable Item
ESX.RegisterUsableItem('weed', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
    TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))

end)
ESX.RegisterUsableItem('lweed', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lweed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))

end)

ESX.RegisterUsableItem('coke_pooch', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('coke_pooch', 1)

	TriggerClientEvent('esx_drugs:onCoke', _source)
	TriggerClientEvent('esx:showNotification', _source, ('Vous avez tappé un rail'))

end)
ESX.RegisterUsableItem('meth_pooch', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('meth_pooch', 1)

	TriggerClientEvent('esx_drugs:onMeth', _source)
	TriggerClientEvent('esx:showNotification', _source, ('Vous avez pris de la meth'))

end)
ESX.RegisterUsableItem('mush_pooch', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('mush_pooch', 1)

	TriggerClientEvent('esx_drugs:onMush', _source)
	TriggerClientEvent('esx:showNotification', _source, ('Vous machez un champignon halucinogène'))

end)

---------------------------------------------------------------------------------
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local selling = false
local success = false
local copscalled = false
local notintrested = false

RegisterNetEvent('drugs:trigger')
AddEventHandler('drugs:trigger', function()
	selling = true
	if selling == true then
		TriggerEvent('pass_or_fail')
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 1)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "Hé fraté ! Tu veux de la bonne ganja",
			type = "error",
			queue = "lmao",
			timeout = 2500,
			layout = "Centerleft"
		})
	end
end)

RegisterServerEvent('fetchjob')
AddEventHandler('fetchjob', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


RegisterNetEvent('drugs:sell')
AddEventHandler('drugs:sell', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local paymentw = math.random (99,100)



	if weed >= 1 and success == true then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "Vous avez vendu un pochon pour $" .. paymentw ,
			type = "success",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("animation", source)
		TriggerClientEvent("test", source)
		xPlayer.removeInventoryItem('weed_pooch', 1)
		xPlayer.addAccountMoney('black_money', paymentw)
		selling = false

	elseif selling == true and success == false and notintrested == true then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "Je touche pas à ça moi",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		selling = false
	elseif  weed < 1  then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "C'est la crise t'a rien à vendre",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
	elseif copscalled == true and success == false then
		TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = "J'appelle les hendeks",
			type = "error",
			progressBar = false,
			queue = "lmao",
			timeout = 2000,
			layout = "CenterLeft"
		})
		TriggerClientEvent("notifyc", source)
		selling = false
	end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()

	local percent = math.random(1, 11)

	if percent == 7 or percent == 8 or percent == 9 then
		success = false
		notintrested = true
	 elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
		success = true
		notintrested = false
	else
		notintrested = false
		success = false
		copscalled = true
	end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
	TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Tu t'es trop éloigné",
		type = "error",
		progressBar = false,
		queue = "lmao",
		timeout = 2000,
		layout = "CenterLeft"
	})
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local weed = xPlayer.getInventoryItem('weed_pooch').count

	if weed >= 1then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end

end)