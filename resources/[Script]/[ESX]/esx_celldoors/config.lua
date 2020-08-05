Config = {}
Config.Locale = 'fr'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		objName = 'v_ilev_ph_door01',
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_door002',
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	--[[ {
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 423.51229858398, y = -993.19964599609, z = 29.710416793823},
		textCoords = {x = 423.51229858398, y = -993.19964599609, z = 31.710416793823},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5
	}, ]]

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 4
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -433.00, y = 5992.68, z = 31.70},
		textCoords = {x = -433.00, y = 5992.68, z = 31.70},
		authorizedJobs = { 'sheriff' },
		locked = true
	},

	-- Cell 5
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -428.96, y = 5997.19, z = 31.70},
		textCoords = {x = -428.96, y = 5997.19, z = 31.70},
		authorizedJobs = { 'sheriff' },
		locked = true
	},

	-- Cell 6
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -432.07, y = 6000.29, z = 31.70},
		textCoords = {x = -432.07, y = 6000.29, z = 31.70},
		authorizedJobs = { 'sheriff' },
		locked = true
	},



	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)z
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'sheriff' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'sheriff' },
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	-- Mapping

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 468.01, y = -995.93, z = 24.91},
		textCoords = {x = 468.01, y = -995.93, z = 24.91},
	    authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 472.31, y = -996.55, z = 24.91},
		textCoords = {x = 472.31, y = -996.55, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},
	
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.39, y = -995.92, z = 24.91},
		textCoords = {x = 476.39, y = -995.92, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 481.09, y = -996.67, z = 24.91},
		textCoords = {x = 481.09, y = -996.67, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.14, y = -1003.63, z = 24.91},
		textCoords = {x = 476.14, y = -1003.63, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 472.51, y = -1003.41, z = 24.91},
		textCoords = {x = 472.51, y = -1003.41, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.45, y = -1003.46, z = 24.91},
		textCoords = {x = 467.45, y = -1003.46, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 480.70, y = -1003.01, z = 24.91},
		textCoords = {x = 480.70, y = -1003.01, z = 24.91},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = -453.49, y = 6011.33, z = 31.71},
		textCoords = {x = -453.49, y = 6011.33, z = 31.71},
		authorizedJobs = { 'sheriff' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1387.0255126953125, y = -586.6138305664062, z = 30.495628356933594},
		textCoords = {x = -1387.0255126953125, y = -586.9138305664062, z = 30.495628356933594},
		authorizedJobs = { 'bahama' },
		locked = true,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = -1389.2120361328125, y = -588.0406494140625, z = 30.495628356933594},
		textCoords = {x = -1389.2120361328125, y = -588.3406494140625, z = 30.491317749023438},
		authorizedJobs = { 'bahama' },
		locked = true,
		distance = 2.5
	},

	--
	-- MECANO
	--
	--[[
	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x = -205.6828, y = -1310.683, z = 30.29572},
		textCoords = {x = -205.73, y = -1310.55, z = 32.37},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 12,
		size = 2
	},
	--]]
	

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}