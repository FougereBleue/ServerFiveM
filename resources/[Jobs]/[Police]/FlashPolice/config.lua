Config = {}
Config.Version = '1.1.0'

------------------------------------------------------- ADN Tracker -----------------------------------------------------------------

DnaTracker = {}
local MFD = DnaTracker
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFD.Version = '1.0.10'

MFD.BloodObject = "p_bloodsplat_s"
MFD.ResidueObject = "w_pi_flaregun_shell"

-- JOB Database Table: LABEL
MFD.PoliceJob = "LSPD"
MFD.AmbulanceJob = "Ambulance"

MFD.DNAAnalyzePos = vector3(438.04, -973.57, 26.66)
MFD.AmmoAnalyzePos = vector3(459.74, -988.94, 24.91)
MFD.DrawTextDist = 3.0
MFD.MaxObjCount = 10
------------------------------------------------------------- Armory ------------------------------------------------------------------
Config.Armory = {}

-- Police Armory Positions:
Config.Armory.ArmoryZones = {
	PoliceArmory = {
		Pos = {
			{x = 0.0,  y = 0.0, z = 0.0},
			{x = 0.0,  y = 0.0, z = 0.0}
		}
	}
}

--Police Kevlar Positions:
Config.Armory.KevlarZones = {
	PoliceKevlar = {
		Pos = {
			{x = 450.24,  y = -990.61, z = 30.68},
			{x = 0,  y = 0, z = 0}
		}
	}
}

--Police Attachments Positions:
Config.Armory.AttachmentZones = {
	PoliceAttachments = {
		Pos = {
			{x = 456.61,  y = -982.79, z = 30.69},
			{x = 0,  y = 0, z = 0}
		}
	}
}

-- Police Armory Marker Settings:
Config.Armory.KeyToOpenArmory = 38															-- default 38 is E
Config.Armory.ArmoryMarker = 27 															-- marker type
Config.Armory.ArmoryMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.Armory.ArmoryMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.Armory.ArmoryDraw3DText = "Appuier sur ~g~[E]~s~ pour ~y~ Ouvrir L'armurie~s~"					-- set your desired text here

-- Police Kevlar Marker Settings:
Config.Armory.KeyToOpenKevlar = 38															-- default 38 is E
Config.Armory.KevlarMarker = 27 															-- marker type
Config.Armory.KevlarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 					-- rgba color of the marker
Config.Armory.KevlarMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  							-- the scale for the marker on the x, y and z axis
Config.Armory.KevlarDraw3DText = "Appuier sur ~g~[E]~s~ pour ~y~ Mettre un Gilet~s~"					-- set your desired text here

-- Police Attachments Marker Settings:
Config.Armory.KeyToOpenAttachments = 38													-- default 38 is E
Config.Armory.AttachmentsMarker = 27 														-- marker type
Config.Armory.AttachmentsMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 				-- rgba color of the marker
Config.Armory.AttachmentsMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }   					-- the scale for the marker on the x, y and z axis
Config.Armory.AttachmentsDraw3DText = "Appuier sur ~g~[E]~s~ pour ~y~Ouvrir Le Menu D\'accessoires~s~"		-- set your desired text here

-- Menu Element Labels:
Config.Armory.WeaponStorage = "Armes"
Config.Armory.RestockWeapon = "Deposer"
--Config.Armory.Vest1 = "Kevlar 1"					-- 25% armor
--Config.Armory.Vest2 = "Kevlar 2"					-- 50% armor
--Config.Armory.Vest3 = "Kevlar 3"					-- 75% armor
Config.Armory.Vest4 = "Gilet Pare-Balle"					-- 100% armor
Config.Armory.RemoveVest = "Enlever"			-- 0% armor

-- Menu Title Labels_
Config.Armory.PoliceArmoryTitle = "Armes"
Config.Armory.WeaponStorageTitle = "Armes"
Config.Armory.RestockWeaponTitle = "Deposer"
Config.Armory.PoliceKevlarTitle = "Gilet"
Config.Armory.ChooseWeaponTitle = "Choisis l'armes"
Config.Armory.AttachmentTitle = "Accessoires"

-- ESX Show Notifications_
Config.Armory.ContactSuperVisor = "Vous avez déjà sorti cette arme, contactez un superviseur"
Config.Armory.NoPoliceOnline = "Aucun officier de police n'est en ligne"
Config.Armory.WeaponMustBeInHand = "Vous devez tenir l'arme dans votre main"
Config.Armory.FlashlightEquipped = "Vous avez équipé une lampe de poche ~r~%s ~s~"
Config.Armory.FlashlightRemove = "Vous avez retiré une lampe de poche for ~r~%s ~s~"
Config.Armory.ScopeEquipped = "Vous avez équipé une portée pour ~r~%s ~s~"
Config.Armory.ScopeRemove = "Vous avez supprimé une étendue pour ~r~%s ~s~"
Config.Armory.SuppressorEquipped = "Vous avez équipé une lunette~s~ for ~r~%s ~s~"
Config.Armory.SuppressorRemove = "Vous avez supprimé une étendue~s~ for ~r~%s ~s~"

-- ProgressBar Text_
Config.Armory.Progress1 = "Range l'armes"
Config.Armory.Progress2 = "Enlève Le Gilet"
Config.Armory.Progress3 = "Mets Le Gilet"

-- ProgressBar Timer, in seconds:
Config.Armory.RestockTimer = 2
Config.Armory.RemoveVestTimer = 2
Config.Armory.WearVestTimer = 2

-- Ped Component Variation (Body Armor that player will wear)
--Config.Armory.VestVariation1 = { componentId = 9, drawableId = 12, textureId = 0, paletteId = 12 } -- 25%
--Config.Armory.VestVariation2 = { componentId = 9, drawableId = 1, textureId = 0, paletteId = 0 } -- 50%
--Config.Armory.VestVariation3 = { componentId = 9, drawableId = 1, textureId = 2, paletteId = 0 } -- 75%
Config.Armory.VestVariation4 = { componentId = 9, drawableId = 16, textureId = 0, paletteId = 16 } -- 100% 

-- Set the exact name from your jobs database for police
Config.Armory.PoliceDatabaseName = 'police'

-- Set required police job grade to restock weapon
Config.Armory.RestockGrade = 5

-- Set amount of ammo you want when taking a weapon out
Config.Armory.AmmountOfAmmo = 250

-- Here u add weapons and its components (set nil at a component to disable it).
Config.Armory.WeaponsInArmory = {
	{ weaponHash = 'WEAPON_FLASHLIGHT', label = 'Lampe Torche', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil},
	{ weaponHash = 'WEAPON_NIGHTSTICK', label = 'Matraque', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_STUNGUN', label = 'Taser', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_PISTOL', label = 'Pistoler', type = 'pistol', attachment = true, flashlight = 0x43FD595B, scope = nil, suppressor = 0x65EA7EBB},
	{ weaponHash = 'WEAPON_SMG', label = 'MP5 9MM', type = 'smg', attachment = true, flashlight = 0x7BC4CDDC, scope = 0x3CC6BA57, suppressor = 0xC304849A  },
	{ weaponHash = 'WEAPON_CARBINERIFLE', label = 'Carbine Rifle Mk II', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = 0x49B2945, suppressor = 0x837445AA  },
	{ weaponHash = 'WEAPON_BZGAS', label = 'Gaz', type = 'shotgun', attachment = true, flashlight = 0x7BC4CDDC, scope = nil, suppressor = nil  },
}

Config.Armory.DiscordWebook = "https://discordapp.com/api/webhooks/713089729612218459/2BChKpoiGT0aCYz_SOWOsRgjIY-NeMY_rX-NL4-njI5lxKLLeuKQxDuRD1qbrm2NYBhQ"

------------------------------------------------------------- PoliceDog ----------------------------------------------------------------

Config.policedog = {
    Job = {'police', 'sheriff'},
    Command = 'policechien', -- set to false if you dont want to have a command
    Model = 351016938,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'bagofdope', 'coke_pooch', 'meth_pooch', 'crack_pooch'}, -- add all drugs here for the dog to detect
}

Config.policedog.Strings = {
    ['not_police'] = 'Tu es ~r~pas ~s~ un officier!',
    ['menu_title'] = 'Chien police',
    ['take_out_remove'] = 'Le sortir / Mettre à la niche',
    ['deleted_dog'] = 'Renvoyez le chien',
    ['spawned_dog'] = 'Appelez le chien',
    ['sit_stand'] = 'Ne bouge pas reste ici!',
    ['no_dog'] = "Tu nas pas de chien",
    ['dog_dead'] = 'Ton chien est mort',
    ['search_drugs'] = 'Le chien cherche autour de lui',
    ['no_drugs'] = 'Aucune drogue trouver.', 
    ['drugs_found'] = 'Waf!Waf! de la drogue!',
    ['dog_too_far'] = 'Le chien est bien trop loin!',
    ['attack_closest'] = 'Attaquez joueur proche'
}

------------------------------------------------------------- Garage ------------------------------------------------------------------

Config.garage = {}

Config.garage.Locale = 'fr'
Config.garage.Enable = false
Config.garage.KeyToOpenCarGarage = 38			-- default 38 is E
Config.garage.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.garage.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.garage.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.garage.PoliceDatabaseName = 'police'	-- set the exact name from your jobs database for police

--Police Car Garage:
Config.garage.CarZones = {
	PoliceCarGarage = {
		Pos = {
			{x = 453.63,  y = -1017.6, z = 28.45},
		}
	}
}

--Police Heli Garage:
Config.garage.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = 448.65,  y = -981.25, z = 43.69},
			{x = 632.216,  y = -156.131, z = 54.037}
		}
	}
}

--Police Boat Garage:
Config.garage.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
			{x = 1538.69,  y = 3901.5, z = 30.35},
			{x = 2000.42,  y = 4500, z = 33.437}
		}
	}
}

--Police Car Garage Blip Settings:
Config.garage.CarGarageSprite = 357
Config.garage.CarGarageDisplay = 4
Config.garage.CarGarageScale = 0.65
Config.garage.CarGarageColour = 38
Config.garage.CarGarageName = "Politsei Garaaz"
Config.garage.EnableCarGarageBlip = false

-- Police Heli Garage Blip Settings:
Config.garage.HeliGarageSprite = 43
Config.garage.HeliGarageDisplay = 4
Config.garage.HeliGarageScale = 0.65
Config.garage.HeliGarageColour = 38
Config.garage.HeliGarageName = "Politsei helikopter"
Config.garage.EnableHeliGarageBlip = false

-- Police Boat Garage Blip Settings:
Config.garage.BoatGarageSprite = 427
Config.garage.BoatGarageDisplay = 4
Config.garage.BoatGarageScale = 0.65
Config.garage.BoatGarageColour = 38
Config.garage.BoatGarageName = "Politsei Paat"
Config.garage.EnableBoatGarageBlip = false

-- Police Extra Menu Blip Settings:
Config.garage.ExtraGarageSprite = 566
Config.garage.ExtraGarageDisplay = 4
Config.garage.ExtraGarageScale = 0.65
Config.garage.ExtraGarageColour = 38
Config.garage.ExtraGarageName = "Auto Lisad"
Config.garage.EnableExtraGarageBlip = false

-- Police Car Garage Marker Settings:
Config.garage.PoliceCarMarker = 27 												-- marker type
Config.garage.PoliceCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.garage.PoliceCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.garage.CarDraw3DText = "[E] Pour Ouvrir Le Garage"			-- set your desired text here

-- Police Heli Garage Marker Settings:
Config.garage.PoliceHeliMarker = 27 												-- marker type
Config.garage.PoliceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.garage.PoliceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.garage.HeliDraw3DText = "[E] Pour Ouvrir Le Garage"		-- set your desired text here

-- Police Boat Garage Marker Settings:
Config.garage.PoliceBoatMarker = 27 												-- marker type
Config.garage.PoliceBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.garage.PoliceBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.garage.BoatDraw3DText = "[E] Pour Ouvrir Le Garage"		-- set your desired text here

-- Police Extra Garage Marker Settings:
Config.garage.PoliceExtraMarker = 27 												-- marker type
Config.garage.PoliceExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.garage.PoliceExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.garage.ExtraDraw3DText = "Press ~g~[E]~s~ for ~y~Police Extra Menu~s~"		-- set your desired text here

-- Police Cars:
Config.garage.PoliceVehicles = {
		{ model = '', label = '-----Voitures-----'},
		{ model = 'pd2', label = 'Dodge Charger'},
		{ model = 'pd4', label = 'Ford Interceptor'},
		{ model = 'pd5', label = '4X4'},
		{ model = 'pd8', label = '4x4 Bana'},
		{ model = 'pd9', label = 'chevrolet'},
		{ model = 'pd11', label = 'Ford Unmarked'},
		{ model = '', label = '-----Motos--------'},		
		{ model = 'policeb', label = 'Moto'},		
		{ model = '', label = '-----Utilitaires--'},		
		{ model = 'police2', label = 'Véhicule de Formation'},
		{ model = 'pbus', label = 'Police Prison Bus'},
		{ model = 'policet', label = 'Fourgon de transport'},
		{ model = 'riot', label = 'Fourgon Blindé'},
		{ model = 'riot2', label = 'Fourgon antiémeute'}		
}

-- Police Helicopters:
Config.garage.PoliceHelicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 2, price = 0 }
}

-- Police Boats:
Config.garage.PoliceBoats = {
	{ model = 'predator', label = 'Police Predator', livery = 0, price = 0 }
}

-- Commands:
Config.garage.RepairCommand = 'paranda'
Config.garage.CleanCommand = 'puhasta'

-- Menu Labels & Titles:
Config.garage.LabelStoreVeh = "Rentrer un Véhicule"
Config.garage.LabelGetVeh = "Prendre un Véhicule"
Config.garage.TitlePoliceGarage = "Police Garage"

-- ESX.ShowNotifications:
Config.garage.VehicleParked = "ton véhicule est rangé!"
Config.garage.NoVehicleNearby = "tu n'as pas de véhicule!"
Config.garage.CarOutFromPolGar = "Vous avez sorti un ~b~Vehicule~s~ du ~y~Garage Police~s~!"
Config.garage.HeliOutFromPolGar = "Vous avez sorti un ~b~Helicopter~s~ du ~y~Garage helicopter Police~s~!"
Config.garage.BoatOutFromPolGar = "Vous avez sorti un ~b~Bateau~s~ du ~y~Garage bateau Police~s~!"
Config.garage.VehRepNotify = "Votre ~b~vehicule~s~ est en ~y~reparation~s~, S'il vous plaît, attendez!"
Config.garage.VehRepDoneNotify = "Votre ~b~vehicule~s~ est maintenant ~y~reparer~s~!"
Config.garage.VehCleanNotify = "Votre ~b~vehicule~s~ est bientot ~y~propre~s~, S'il vous plaît, attendez!"
Config.garage.VehCleanDoneNotify = "Votre ~b~vehicule~s~ est maintenant ~y~propre~s~!"

-- ProgressBars text
Config.garage.Progress1 = "AUTO PARANDAMINE"
Config.garage.Progress2 = "AUTO PUHASTAMINE"

-- ProgressBar Timers, in seconds:
Config.garage.RepairTime = 5					-- time to repair vehicle
Config.garage.CleanTime = 3.5					-- time to clean vehicle

Config.garage.VehicleLoadText = "Attendez que le véhicule apparaisse"			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.garage.Distance = 20

Config.garage.DrawDistance      = 100.0
Config.garage.TriggerDistance 	 = 3.0
Config.garage.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}

-- Police Extra Menu Positions:
Config.garage.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 454.7,  y = -1024.32, z = 28.49},
			{x = 467.6,  y = 2530.54, z = 33.437}
		}
	}
}

------------------------------------------------------------- MDT ---------------------------------------------------------------------
--Nothing?.

------------------------------------------------------------- Jail --------------------------------------------------------------------

Config.Jail = {}

Config.Jail.JailPositions = {
	["Cell"] = { ["x"] = 1799.8345947266, ["y"] = 2489.1350097656, ["z"] = -119.02998352051, ["h"] = 179.03021240234 }
}

Config.Jail.Cutscene = {
	["PhotoPosition"] = { ["x"] = 402.91567993164, ["y"] = -996.75970458984, ["z"] = -99.000259399414, ["h"] = 186.22499084473 },

	["CameraPos"] = { ["x"] = 402.88830566406, ["y"] = -1003.8851318359, ["z"] = -97.419647216797, ["rotationX"] = -15.433070763946, ["rotationY"] = 0.0, ["rotationZ"] = -0.31496068835258, ["cameraId"] = 0 },

	["PolicePosition"] = { ["x"] = 402.91702270508, ["y"] = -1000.6376953125, ["z"] = -99.004028320313, ["h"] = 356.88052368164 }
}

Config.Jail.PrisonWork = {
	["DeliverPackage"] = { ["x"] = 1027.2347412109, ["y"] = -3101.419921875, ["z"] = -38.999870300293, ["h"] = 267.89135742188 },

	["Packages"] = {
		[1] = { ["x"] = 1003.6661987305, ["y"] = -3108.4221191406, ["z"] = -38.999866485596, ["state"] = true },
		[2] = { ["x"] = 1006.0420532227, ["y"] = -3103.0024414063, ["z"] = -38.999866485596, ["state"] = true },
		[3] = { ["x"] = 1015.7958374023, ["y"] = -3102.8337402344, ["z"] = -38.99991607666, ["state"] = true },
		[4] = { ["x"] = 1012.8907470703, ["y"] = -3108.2907714844, ["z"] = -38.999912261963, ["state"] = true },
		[5] = { ["x"] = 1018.2017822266, ["y"] = -3109.1982421875, ["z"] = -38.999897003174, ["state"] = true },
		[6] = { ["x"] = 1018.0194091797, ["y"] = -3096.5700683594, ["z"] = -38.999897003174, ["state"] = true },
		[7] = { ["x"] = 1015.6422119141, ["y"] = -3091.7392578125, ["z"] = -38.999897003174, ["state"] = true },
		[8] = { ["x"] = 1010.7862548828, ["y"] = -3096.6135253906, ["z"] = -38.999897003174, ["state"] = true },
		[9] = { ["x"] = 1005.7819824219, ["y"] = -3096.8415527344, ["z"] = -38.999897003174, ["state"] = true },
		[10] = { ["x"] = 1003.4543457031, ["y"] = -3096.7048339844, ["z"] = -38.999897003174, ["state"] = true }
	}
}

Config.Jail.Teleports = {
	["Prison Work"] = { 
		["x"] = 992.51770019531, 
		["y"] = -3097.8413085938, 
		["z"] = -38.995861053467, 
		["h"] = 81.15771484375, 
		["goal"] = { 
			"Jail" 
		} 
	},

	["Boiling Broke"] = { 
		["x"] = 1845.6022949219, 
		["y"] = 2585.8029785156, 
		["z"] = 45.672061920166, 
		["h"] = 92.469093322754, 
		["goal"] = { 
			"Security" 
		} 
	},

	["Jail"] = { 
		["x"] = 1800.6979980469, 
		["y"] = 2483.0979003906, 
		["z"] = -122.68814849854, 
		["h"] = 271.75274658203, 
		["goal"] = { 
			"Prison Work", 
			"Security", 
			"Visitor" 
		} 
	},

	["Security"] = { 
		["x"] = 1706.7625732422,
		["y"] = 2581.0793457031, 
		["z"] = -69.407371520996, 
		["h"] = 267.72802734375, 
		["goal"] = { 
			"Jail",
			"Boiling Broke"
		} 
	},

	["Visitor"] = {
		["x"] = 1699.7196044922, 
		["y"] = 2574.5314941406, 
		["z"] = -69.403930664063, 
		["h"] = 169.65020751953, 
		["goal"] = { 
			"Jail" 
		} 
	}
}

----------------------------------------------------------- Illegal --------------------------------------------------------------------

Config.illegals = {}
 
Config.illegals.MarkerColor = {r = 0, g = 200, b = 204}
Config.illegals.JobName = "police" -- required  job
Config.illegals.Bonus = 25 -- money bonus

Config.illegals.CountMoney = 75
Config.illegals.BonusMoney = 25

Config.illegals.Items = {"weed", "coke", "meth", "opium"} -- List of the illegal items (do not add weapons!)

Config.illegals.Zones = { 
    {type = 22, x = 467.71, y = -992.69, z = 24.92} -- script zones
}

Config.illegals.Locale = 'fr'


------------------------------------------------------- CriminalRecord -----------------------------------------------------------------

Config.Criminal = {}
Config.Criminal.Marker = {
	Pos   = {x = 444.66662597656, y = -974.96911621094, z = 29.789599990845},
	Size  = {x = 2.0, y = 2.0, z = 1.0},
	Color = {r = 26, g = 55, b = 186},
	Hint = 'Appuyer sur ~INPUT_PICKUP~ pour ouvrir le casier judiciare',
	Type = 27,
}

------------------------------------------------------- PoliceArmory2 -----------------------------------------------------------------

Config.ArmoryP = {}

-- Turn this to false if you want everyone to use this.
Config.ArmoryP.OnlyPolicemen = true

-- This is how much ammo you should get per weapon you take out.
Config.ArmoryP.ReceiveAmmo = 230

-- You don't need to edit these if you don't want to.
Config.ArmoryP.Armory = { ["x"] = 452.32196044922, ["y"] = -980.03033447266, ["z"] = 30.689582824707, ["h"] = 270.0 }
Config.ArmoryP.ArmoryPed = { ["x"] = 454.18048095703, ["y"] = -980.11981201172, ["z"] = 30.689603805542, ["h"] = 90.0, ["hash"] = "s_m_y_cop_01" }

-- This is the available weapons you can pick out.
Config.ArmoryP.ArmoryWeapons = {
	{ ["hash"] = "WEAPON_VINTAGEPISTOL", ["type"] = "pistol" },
	{ ["hash"] = "weapon_stungun", ["type"] = "pistol" },
	{ ["hash"] = "weapon_nightstick", ["type"] = "pistol" },
	{ ["hash"] = "weapon_flashlight", ["type"] = "pistol" },
	{ ["hash"] = "weapon_combatpistol", ["type"] = "pistol" },
	{ ["hash"] = "weapon_combatpdw", ["type"] = "rifle" },
	{ ["hash"] = "weapon_carbinerifle", ["type"] = "rifle" },
	{ ["hash"] = "weapon_specialcarbine", ["type"] = "rifle" },
	{ ["hash"] = "weapon_pumpshotgun", ["type"] = "rifle" }
}
