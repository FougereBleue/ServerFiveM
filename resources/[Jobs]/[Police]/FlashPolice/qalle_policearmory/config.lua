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
