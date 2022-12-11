Config = {}
Config.Locale = "en"
-- MAIN CONFIG START
Config.framework = 'ESX' -- FRAMEWORK! , "ESX", "QBCORE"
Config.Mysql = 'mysql-async' -- "ghmattisql", "mysql-async", "oxmysql"
Config.renzu_vehicleshopTable = false -- will use exports from vehicleshop vehicles table renzu_vehicleshop/vehicles.lua for pricing and other data.
Config.usePopui = true -- POPUI or Drawmarker Floating Text https://github.com/renzuzu/renzu_popui
Config.showmarker = true -- Drawmarker and FLoating Text
Config.DisableRepair = false -- Disable Repairing before Showing Upgrade Menu
Config.OwnedVehiclesOnly = false -- set this to False if you want to allow modifying of non owned vehicles, AKA local cars, spawned cars
Config.DoNotShowEmptyMods = true -- hide mod menu if no available mod for current vehicle
--JOB
-- Config.job = 'mechanic' -- Default job (job permission if job is not indicated here Config.Customs) -- OBSOLETE , Configure jobs here Config.Customs
Config.DefaultJobGradePermmission = 0 -- default jobgrade in each job shop (ignored if its indicated at Config.VehicleMod)
Config.JobPermissionAll = true -- if this is true only mechanics can access even the upgrade menu (Main Menu)
--JOB
Config.InteractiveFeature = { -- Enable Disable All Extra Features like: Inventory, Stock Room, Paint Room
	['garage_inventory'] = false,
	['stockroom'] = false,
	['paintmenu'] = false,
}
--EXTRA OPTION
Config.PlateSpace = true -- is your plate is ABC 123 format
Config.VehicleValuetoFormula = false -- if true we will calculate the final cost for each upgrades from the original value from vehicles.table ----- ( IF THIS IS FALSE, the fixed value will be used (var cost from vehicle_mods table))
Config.VehicleValuePercent = 0.1 -- 0.1 = 10% 0.5 = 50%, 1.0 = 100% (this will be the formula to calculate the total cost for each upgrade)
Config.VehicleValueList = { -- custom cars that are not exist in vehicles table (vehicles pricing are automatic fetched from DB vehicles table by default)
	[1] = {model = 'zentorno', value = 100000},
}
Config.FreeUpgradeToClass = { -- want to have a free upgrade for a selected vehicles class?
	[18] = true, -- emergency class , ex. police, ambulance vehicle.
	[19] = true, -- military class
}
Config.EnableDiscounts = true -- discount for all jobs and per mods
Config.JobDiscounts = { -- global discount jobs
	['mechanic'] = 1.0, -- 0.2 == 20% , 1.0 == 100%
	['mechanic01'] = 1.0, -- 0.2 == 20% , 1.0 == 100%
	['mechanic02'] = 1.0, -- 0.2 == 20% , 1.0 == 100%

	--['ambulance'] = 0.1,
	--['police'] = 0.15,
}
--EXTRA OPTION
-- Main Config END

-- CUSTOM FEATURE CONFIG
Config.UseRenzu_jobs = false -- to have a profits for each upgrades https://github.com/renzuzu/renzu_jobs (This Have Crafting Table, Shop, Vehicle Shop, Garage and more Job Needs!) (NOT AVAILABLE IN QB)
Config.UseRenzu_progressbar = false -- Use Progressbar while repairing a vehicle and maybe more use case in future update https://github.com/renzuzu/renzu_progressbar
Config.PayoutShare = 0.0 -- 0.5 = 50% (how much profit share)
Config.DefaultProp = 'hei_prop_heist_box' -- default prop when carrying a parts

-- if you want CUSTOM ENGINE UPGRADE ,TURBO and TIRES make sure to true this all
Config.UseCustomTurboUpgrade = false -- use renzu_custom Turbo System -- enable disable custom turbo upgrade
Config.useturbosound = false -- use custom BOV Sound for each turbo
Config.turbosoundSync = false -- true = Server Sync Sound? or false = only the driver can hear it

Config.UseCustomEngineUpgrade = false -- enable disable custom engine upgrade
Config.UseCustomTireUpgrade = false -- enable disable custom tires upgrade

Config.RepairCost = 0 -- repair cost
-- CUSTOM END

-- FAQ
-- RADIUS = SHOP SIZE in radius
-- STOCK ROOM = COMPLETE LIST OF VEHICLE MOD LIST FOR EA VEHICLES IN AREA
-- PAINTMENU = CUSTOM PAINT MENU (SPRAY)
-- SHOPCOORDS = The main and center of the Shop Area
-- MOD.coord = Upgrade Section ( you can insert multiple )
-- garage_inventory = Custom Inventory for VEHICLE MOD PARTS
-- BLIPS = BLIP info sprite , color and scale.
-- grade = minimum job grade to access the feature/ menu/ options
-- Can a single job can owned both/multiple shop? = yes
Config.Customs = { -- Multiple Shop Start

    ['Bennys'] = { -- Shop id -- Sample bennys (IPL coordinates) Change this to your liking (CHANGE COORDINATES IF CUSTOM BENNYS MAP)
		job = 'mechanic', -- job name permmision for this shop
		min_grade = 0, -- min grade to access the whole shop feature
		radius = 100, -- radius for whole shop
		stockroom = {coord = vector4(-227.70811462402,-1322.9874267578,30.890409469604,90.902221679688), grade = 0}, -- vector 4 why the F is this vector4, x,y,z,w (heading)
		paintmenu = {coord = vector3(-228.27142333984,-1333.4058837891,30.89038848877), grade = 0},
		garage_inventory = {coord = vector4(-200.8703918457,-1317.6979980469,31.089340209961,267.89974975586), grade = 0},
		shopcoord = vector4(-212.58630371094,-1325.0119628906,30.89038848877,157.28034973145),
		mod = {
			-- {coord = vector4(-224.20236206055,-1329.8156738281,30.21583366394,87.278968811035), taken = false},
			-- {coord = vector4(-213.22569274902,-1331.546875,30.215799331665,356.6969909668), taken = false},
		},
		Blips = {sprite = 446, color = 68, scale = 0.8},
    },

	['Paleto-Bay'] = { -- Shop id -- Custom Map Tuner Garage (2372 Build only, canary and release) IPL and Int https://forum.cfx.re/t/free-mlo-tuner-auto-shop/4247145
		job = 'mechanic01', -- job name permmision for this shop
		min_grade = 0, -- min grade to access the whole shop feature
		radius = 100, -- radius for whole shop
		stockroom = {coord = vector4(818.46160888672,-969.87396240234,26.10876083374,269.27597045898), grade = 0},
		paintmenu = {coord = vector3(809.76037597656,-959.36596679688,26.10876083374), grade = 0},
		garage_inventory = {coord = vector4(807.99078369141,-979.44848632812,26.308683395386,165.16065979004), grade = 0},
		shopcoord = vector3(32.8082, 6461.9849, 33.2197),
		mod = {
			-- {coord = vector4(823.82153320312,-944.92102050781,25.440004348755,94.50008392334), taken = false},
			-- {coord = vector4(830.01727294922,-953.10614013672,25.440238952637,97.936683654785), taken = false},
		},
		Blips = {sprite = 446, color = 68, scale = 0.8},
    },

	['La-Messa'] = { -- Shop id -- Custom Map Tuner Garage (2372 Build only, canary and release) IPL and Int https://forum.cfx.re/t/free-mlo-tuner-auto-shop/4247145
		job = 'mechanic02', -- job name permmision for this shop
		min_grade = 0, -- min grade to access the whole shop feature
		radius = 100, -- radius for whole shop
		stockroom = {coord = vector4(826.7057, -953.3905, 22.0876, 181.1302), grade = 0},
		paintmenu = {coord = vector3(842.0502, -969.2002, 26.4989), grade = 0},
		garage_inventory = {coord = vector4(810.7130, -942.1724, 26.4989, 195.4181), grade = 0},
		shopcoord = vector4(823.3135, -989.7529, 26.4989, 185.0573),
		mod = {
			-- {coord = vector4(835.6618, -985.6235, 26.2338, 270), taken = false},
			-- {coord = vector4(835.8777, -976.9694, 26.2342, 270), taken = false},
			-- {coord = vector4(835.8311, -968.3001, 26.0863, 270), taken = false},
			-- {coord = vector4(835.7450, -959.5118, 26.0869, 270), taken = false},
			-- {coord = vector4(817.8661, -947.4370, 21.6848, 220.0918), taken = false},
		},
		Blips = {sprite = 446, color = 68, scale = 0.8},
    },

}

-- PAINT COLORS AND INDEX NAME
Config.Metallic = {
    ['Negro'] = 0,
    ['Negro carbon'] = 147,
    ['Grafito'] = 1,
    ['Negro antracita'] = 11,
    ['Acero negro'] = 2,
    ['Acero oscuro'] = 3,
    ['Plata'] = 4,
    ['Plata azulada'] = 5,
    ['Acero rolado'] = 6,
    ['Sombra de plata'] = 7,
    ['Plata de piedra'] = 8,
    ['Plata de medianoche'] = 9,
    ['Plata de hierro fundido'] = 10,
    ['Rojo'] = 27,
    ['Rojo torino'] = 28,
    ['Rojo formula'] = 29,
    ['Rojo lava'] = 150,
    ['Rojo brillante'] = 30,
    ['Rojo Grace'] = 31,
    ['Rojo granate'] = 32,
    ['Rojo atardecer'] = 33,
    ['Rojo cabernet'] = 34,
    ['Rojo vino'] = 143,
    ['Rojo caramelo'] = 35,
    ['Rosa fuerte'] = 135,
    ['Rosa pfister'] = 137,
    ['Rosa salmon'] = 136,
    ['Naranja amanecer'] = 36,
    ['naranja'] = 38,
    ['Naranja brillante'] = 138,
    ['Oro'] = 99,
    ['Bronce'] = 90,
    ['Amarillo'] = 88,
    ['Amarillo carreras'] = 89,
    ['Amarillo rocio'] = 91,
    ['Verde oscuro'] = 49,
    ['Verde carreras'] = 50,
    ['Verde Mar'] = 51,
    ['Verde oliva'] = 52,
    ['Verde brillante'] = 53,
    ['Verde Gasolina'] = 54,
    ['Verde lima'] = 92,
    ['Azul medianoche'] = 141,
    ['Azul Galaxia'] = 61,
    ['Azul oscuro'] = 62,
    ['Azul sajon'] = 63,
    ['Azul'] = 64,
    ['Azul marinero'] = 65,
    ['Azul puerto'] = 66,
    ['Azul diamante'] = 67,
    ['Azul surf'] = 68,
    ['Azul nautico'] = 69,
    ['Azul carreras'] = 73,
    ['Azul ultra'] = 70,
    ['Azul claro'] = 74,
    ['Chocolate Cafe'] = 96,
    ['Marron bisonte'] = 101,
    ['Marron claro'] = 95,
    ['Marron feltzer'] = 94,
    ['Marron arce'] = 97,
    ['Marron haya'] = 103,
    ['Marron siena'] = 104,
    ['Marron saddle'] = 98,
    ['Marron musgo'] = 100,
    ['Marron woodbeech'] = 102,
    ['Marron paja'] = 99,
    ['Marron arena'] = 105,
    ['Marron blanqueado'] = 106,
    ['Morado'] = 71,
    ['Morado spinnaker'] = 72,
    ['Morado medianoche'] = 142,
    ['Morado brillante'] = 145,
    ['Crema'] = 107,
    ['Blanco hielo'] = 111,
    ['Blanco escarcha'] = 112,
}

Config.Matte = {
    ['Negro'] = 12,
    ['Gris'] = 13,
    ['Gris claro'] = 14,
    ['Blanco hielo'] = 131,
    ['Azul'] = 83,
    ['Azul oscuro'] = 82,
    ['Azul medianoche'] = 84,
    ['Morado medianoche'] = 149,
    ['Morado Schafter'] = 148,
    ['Rojo'] = 39,
    ['Rojo oscuro'] = 40,
    ['Naranja'] = 41,
    ['Amarillo'] = 42,
    ['Verde lima'] = 55,
    ['Verde'] = 128,
    ['Verde bosque'] = 151,
    ['Verde follaje'] = 155,
    ['Verde oliva'] = 152,
    ['Tierra oscura'] = 153,
    ['Bronce desierto'] = 154,
}

Config.Metals = {
    ['Acero pulido'] = 117,
    ['Acero negro pulido'] = 118,
    ['Aluminio pulido'] = 119,
    ['Oro puro'] = 158,
    ['Oro pulido'] = 159,
}

allcolors = {}
for k,v in pairs(Config.Metallic) do
	allcolors[k] = v
end

for k,v in pairs(Config.Matte) do
	allcolors[k] = v
end

for k,v in pairs(Config.Metals) do
	allcolors[k] = v
end

Config.Crome = {['Cromado'] = 120}

-- VEHICLE MODS , you can change parts value / cost here
-- FAQ
-- multicost  = if true cost will multiple the level from the original cost
-- camera angles (you can customize this as i dont have a proper test to perfect the angles yet)
-- type = Menu Main title
-- bone = bone target for camera (obsolete)
-- index = MOD index name
-- cost = the cost of vehicle mod in all lvls (unless multicost)
-- job_grade = MINIMUM job_grade lvl permmision to access the upgrade type (if no indicated, Config.DefaultJobGradePermmission will be used as default) (THIS WILL ONLY WORK if Config.JobPermissionAll = true)
-- discount = This is Persistent config!, it means Config.JobDiscounts will be ignored as long as this job ex. mechanic is here and job ex. mechanic is in Config.JobDiscounts too. , any unlisted jobs here will be using the default listed here Config.JobDiscounts (if its registered)
Config.VehicleMod = {
    ----------Liveries--------
	[48] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Vinilo',
		name = 'liveries',
        index = 48,
		cost = 100,
		percent_cost = 7,
		bone = 'chassis',
        type = 'Exterior',
		camera = {val = 'front', x = -2.1, y = 0.6,z = 1.1},
	},
	
----------Windows--------
	[46] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Ventanas',
		name = 'windows',
        index = 46,
		cost = 0,
		percent_cost = 2,
		bone = 'window_lf1',
		camera = {val = 'right', x = 0.8, y = 0.8,z = 0.8},
        type = 'Exterior',
	},
	
----------Tank--------
	[45] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Radiador',
		name = 'tank',
        index = 45,
		cost = 0,
		percent_cost = 4,
		bone = 'chassis',
        type = 'Exterior',
		camera = {val = 'front', x = 0.2, y = 0.3,z = 0.1},
	},
	
----------Trim--------
	[44] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Trim',
		name = 'trim',
        index = 44,
		cost = 0,
		percent_cost = 2,
		bone = 'boot',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        type = 'Cosmetica',
	},
	
----------Aerials--------
	[43] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Antenas',
		name = 'aerials',
        index = 42,
		cost = 0,
		percent_cost = 2,
		camera = {val = 'front', x = 0.5, y = 0.6,z = 0.4},
        type = 'Cosmetica',
	},

----------Arch cover--------
	[42] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Cubierta de arco',
		name = 'archcover',
        index = 42,
		cost = 0,
		percent_cost = 2.5,
		bone = 'engine',
		action = 'openhood',
		action = 'openhood',
        type = 'Cosmetica',
	},

----------Struts--------
	[41] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Puntales',
		name = 'struts',
        index = 41,
		cost = 0,
		percent_cost = 2.5,
		bone = 'engine',
		action = 'openhood',
        type = 'Piezas Rendimiento',
	},
	
----------Air filter--------
	[40] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Filtro de Aire',
		name = 'airfilter',
        index = 40,
		cost = 0,
		percent_cost = 3.5,
		bone = 'engine',
		action = 'openhood',
        type = 'Piezas Rendimiento',
	},
	
----------Engine block--------
	[39] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Bloque de motor',
		name = 'engineblock',
        index = 39,
		cost = 0,
		percent_cost = 3.5,
		bone = 'engine',
		action = 'openhood',
        type = 'Piezas Rendimiento',
	},

----------Hydraulics--------
	[38] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Hidráulica',
		name = 'hydraulics',
        index = 38,
		cost = 0,
		percent_cost = 7,
		bone = 'wheel_rf',
        type = 'Cosmetica',
	},
	
----------Trunk--------
	[37] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Maletero',
		name = 'trunk',
        index = 37,
		cost = 0,
		percent_cost = 4,
        type = 'Exterior',
		bone = 'boot',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
        prop = 'imp_prop_impexp_trunk_01a',
	},

----------Speakers--------
	[36] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Altavoces',
		name = 'speakers',
        index = 36,
		cost = 0,
		percent_cost = 3,
		bone = 'door_dside_f',
        type = 'Interior',
	},

----------Plaques--------
	[35] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Placas',
		name = 'plaques',
        index = 35,
		cost = 0,
		percent_cost = 3,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
		bone = 'steeseat_dside_fring',
        type = 'Interior',
	},
	
----------Shift leavers--------
	[34] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Palancas de cambio',
		name = 'shiftleavers',
        index = 34,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
		bone = 'steeseat_dside_fring',
		cost = 0,
		percent_cost = 3,
        type = 'Interior',
	},
	
----------Steeringwheel--------
	[33] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Volante',
		name = 'steeringwheel',
        index = 33,
		bone = 'seat_dside_f',
		cost = 0,
		percent_cost = 3,
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
        type = 'Interior',
	},
	
----------Seats--------
	[32] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Asiento',
		name = 'seats',
        index = 32,
		cost = 0,
		percent_cost = 5,
        type = 'Interior',
		bone = 'seat_dside_f',
        prop = 'prop_car_seat',
	},
	
----------Door speaker--------
	[31] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Altavoz de la puerta',
		name = 'doorspeaker',
        index = 31,
		percent_cost = 3,
		bone = 'door_dside_f',
		cost = 0,
        type = 'Interior',
	},

----------Dial--------
	[30] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Marcador',
		name = 'dial',
        index = 30,
		cost = 0,
		percent_cost = 3,
		bone = 'seat_dside_f',
		camera = {val = 'left', x = -0.2, y = -0.5,z = 0.9},
        type = 'Interior',
	},
----------Dashboard--------
	[29] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Tablero',
		name = 'dashboard',
        index = 29,
		cost = 0,
		percent_cost = 5,
		bone = 'seat_dside_f',
        type = 'Interior',
	},
	
----------Ornaments--------
	[28] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Adornos',
		name = 'ornaments',
        index = 28,
		cost = 0,
		percent_cost = 4,
		bone = 'seat_dside_f',
        type = 'Cosmetica',
	},
	
----------Trim--------
	[27] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Trim',
		name = 'trim',
        index = 27,
		cost = 0,
		percent_cost = 3,
		bone = 'bumper_f',
        type = 'Cosmetica',
	},
	
----------Vanity plates--------
	[26] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Platos de tocador',
		name = 'vanityplates',
        index = 26,
		cost = 0,
		percent_cost = 2,
		bone = 'exhaust',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'Cosmetica',
        prop = 'p_num_plate_01',
	},
	
----------Plate holder--------
	[25] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Portaplacas',
		name = 'plateholder',
        index = 25,
		cost = 0,
		percent_cost = 3,
		bone = 'exhaust',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'Cosmetica',
	},
---------Back Wheels---------
	[24] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Ruedas traseras',
		name = 'backwheels',
        index = 24,
		cost = 0,
		percent_cost = 4,
        type = 'Piezas de rueda',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
		bone = 'wheel_lr',
        prop = 'imp_prop_impexp_wheel_03a',
	},
---------Front Wheels---------
	[23] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Ruedas delanteras',
		name = 'frontwheels',
        index = 23,
		cost = 0,
		percent_cost = 5,
		bone = 'wheel_rf',
        type = 'Piezas de rueda',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        prop = 'imp_prop_impexp_wheel_03a',
		list = {WheelType = {Sport = 0, Muscle = 1, Lowrider = 2, SUV = 3, Offroad = 4,Tuner = 5, BikeWheel = 6, HighEnd = 7 , BennysWheel = 8, BespokeWheel = 9, Dragster = 10, Street = 11 } , WheelColor = allcolors, Accessories = { CustomTire = 1, SmokeColor = 1, DriftTires = 1} } -- BennysWheel = 8, BespokeWheel = 9
	},
---------Headlights---------
	[22] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Faros',
		name = 'headlights',
        index = 22,
		cost = 0,
		percent_cost = 3,
		bone = 'headlight_r',
        type = 'Cosmetica',
        prop = 'v_ind_tor_bulkheadlight',
	},
	
----------Turbo---------
	[18] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Turbo',
		name = 'turbo',
        index = 18,
		cost = 0,
		percent_cost = 20,
		bone = 'engine',
        type = 'Piezas Rendimiento',
		list = {Default = 0, Turbo = 1}
	},
	
-----------Armor-------------
	[16] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Armadura',
		name = 'armor',
        index = 16,
		cost = 0,
		percent_cost = 25,
		bone = 'bodyshell',
		multicostperlvl = true,
        type = 'Armadura',
	},

---------Suspension-----------
	[15] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Suspension',
		name = 'suspension',
        index = 15,
		cost = 0,
		percent_cost = 6,
		bone = 'wheel_rf',
		multicostperlvl = true,
        type = 'Piezas Rendimiento',
	},
-----------Horn----------
    [14] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
        label = 'Claxon',
		name = 'horn',
        index = 14,
		cost = 0,
		percent_cost = 3,
		bone = 'bumper_f',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        type = 'Cosmetica',
    },
-----------Transmission-------------
    [13] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
        label = 'Transmision',
		name = 'transmission',
        index = 13,
		cost = 0,
		percent_cost = 8,
		bone = 'engine',
		multicostperlvl = true,
        type = 'Piezas Rendimiento',
        prop = 'imp_prop_impexp_gearbox_01',
	},
	
-----------Brakes-------------
	[12] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
        label = 'Frenos',
		name = 'brakes',
        index = 12,
		cost = 0,
		percent_cost = 5,
		bone = 'wheel_rf',
		multicostperlvl = true,
        type = 'Piezas Rendimiento',
        prop = 'imp_prop_impexp_brake_caliper_01a',
	},
	
------------Engine----------
	[11] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
        label = 'Motor',
		name = 'engine',
        index = 11,
		cost = 0,
		percent_cost = 10,
		bone = 'engine',
		action = 'openhood',
		multicostperlvl = true,
        type = 'Piezas Rendimiento',
        prop = 'prop_car_engine_01',
	},
    ---------Roof----------
	[10] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Tejado',
		name = 'roof',
        index = 10,
		cost = 0,
		percent_cost = 5,
		bone = 'roof',
		camera = {val = 'front-top', x = 0.5, y = -2.6,z = 1.5},
        type = 'exterior',
	},
	
------------Fenders---------
	[8] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Guardabarros',
		name = 'fenders',
        index = 8,
		cost = 0,
		percent_cost = 5,
        type = 'Cosmetica',
		bone = 'wheel_rf',
        prop = 'imp_prop_impexp_car_panel_01a'
	},
	
------------Hood----------
	[7] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Capo',
		name = 'Hood',
        index = 7,
		cost = 0,
		percent_cost = 8,
        type = 'Cosmetica',
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.8,z = 0.8},
        prop = 'imp_prop_impexp_bonnet_02a',
	},
	
----------Grille----------
	[6] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Reja',
		name = 'grille',
        index = 6,
		percent_cost = 3,
		cost = 0,
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'Cosmetica',
	},
	
----------Roll cage----------
	[5] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Jaula antivuelco',
		name = 'rollcage',
        index = 5,
		cost = 0,
		percent_cost = 7,
        type = 'Interior',
		bone = 'seat_dside_f',
		camera = {val = 'front-top', x = 0.1, y = -1.5,z = 0.5},
        prop = 'imp_prop_impexp_rear_bars_01b'
	},
	
----------Exhaust----------
	[4] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Escape',
		name = 'exhaust',
        index = 4,
		cost = 0,
		percent_cost = 6,
        type = 'Escape',
		bone = 'exhaust',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 0.4},
        prop = 'imp_prop_impexp_exhaust_01',
	},
	
----------Skirts----------
	[3] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Faldas',
		name = 'skirts',
        index = 3,
		cost = 0,
		percent_cost = 3,
		bone = 'neon_r',
        type = 'Cosmetica',
        prop = 'imp_prop_impexp_rear_bumper_01a',
	},
	
-----------Rear bumpers----------
	[2] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Parachoques traseros',
		name = 'rearbumpers',
        index = 2,
		cost = 0,
		percent_cost = 3,
		bone = 'bumper_r',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 0.4},
        type = 'Cosmetica',
        prop = 'imp_prop_impexp_rear_bumper_03a',
	},
	
----------Front bumpers----------
	[1] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'parachoques delantero',
		name = 'frontbumpers',
        index = 1,
		cost = 0,
		percent_cost = 4,
		bone = 'bumper_f',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        type = 'Cosmetica',
        prop = 'imp_prop_impexp_front_bumper_01a',
	},
	
----------Spoiler----------
	[0] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Aleron',
		name = 'spoiler',
        index = 0,
		cost = 0,
		percent_cost = 5,
		bone = 'boot',
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
        type = 'Cosmetica',
        prop = 'imp_prop_impexp_spoiler_04a',
	},

	['paint1'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Color Primario',
		name = 'paint1',
        index = 99,
		cost = 0,
		percent_cost = 0,
		bone = 'boot',
        type = 'Color Primario',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Metalico = Config.Metallic, Mate = Config.Matte, Metal = Config.Metals, Cromado = Config.Crome, Nacarado = Config.Metallic}
	},
	['paint2'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Color Secundario',
		name = 'paint2',
        index = 100,
		cost = 0,
		percent_cost = 5,
		bone = 'boot',
        type = 'Color Secundario',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Metalico = Config.Metallic, Mate = Config.Matte, Metal = Config.Metals, Cromado = Config.Crome}
	},
	['headlight'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Faros',
		name = 'headlight',
        index = 101,
		cost = 0,
		percent_cost = 3,
		bone = 'boot',
        type = 'Faros',
		camera = {val = 'front', x = 0.1, y = 0.6,z = 0.4},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Default = false, XenonLights = true, 
		XenonColor = {
				Default = -1,
				Blanco = 0,
				Azul = 1,
				AzulElectrico = 2,
				MentaVerde = 3,
				VerdeLima = 4,
				Amarillo = 5,
				Oro = 6,
				Naranja = 7,
				Rojo = 8,
				PonyRosa = 9,
				RosaCaliente = 10,
				Morado = 11,
			},
		}
	},
	['plate'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Placa',
		name = 'plate',
        index = 102,
		cost = 0,
		percent_cost = 2,
		camera = {val = 'back', x = 0.5, y = -1.6,z = 1.3},
		bone = 'boot',
        type = 'Placa',
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {BlueWhite = 0, YellowBlack = 1, YellowBlue = 2,BlueWhite1 = 3,BlueWhite2 = 4,Yankton = 5}
	},
	['neon'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Luces de neón',
		name = 'neon',
        index = 103,
		cost = 0,
		percent_cost = 3,
		bone = 'boot',
        type = 'Luces de neón',
		camera = {val = 'middle', x = 2.1, y = 2.1,z = -0.1},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {Default = 0, NeonKit = 1, NeonColor = 2}
	},
	['window'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Tintado de ventana',
		name = 'window',
        index = 104,
		cost = 0,
		percent_cost = 5,
        type = 'Tintado de ventana',
		bone = 'boot',
		camera = {val = 'left', x = -0.3, y = -0.3,z = 0.9},
        prop = 'imp_prop_impexp_spoiler_04a',
		list = {  
			None = 0,  
			PURE_BLACK = 1,  
			DARKSMOKE = 2,  
			LIGHTSMOKE = 3,  
			STOCK = 4,  
			LIMO = 5,  
			GREEN = 6  
		}
	},
	['extra'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Extras',
		name = 'extra',
        index = 105,
		percent_cost = 5,
		cost = 0,
        type = 'Extras',
		bone = 'boot',
		camera = {val = 'left', x = -0.3, y = -0.3,z = 0.9},
        prop = 'imp_prop_impexp_spoiler_04a',
		--['list'] = {exports = (function() e = exports["cd_keymaster"]:StartKeyMaster() end)},
		['extra'] = function() GetExtras() end
	},

}

-- CUSTOM UPGRADE START
-- Turbo Stats Modification
-- Power = Level of Boost Pressure
-- Torque = Level of Torque to add
-- value = Cost
if Config.UseCustomTurboUpgrade then
	Config.VehicleMod['custom_turbo'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Custom Turbo',
		name = 'custom_turbo',
		index = 107,
		cost = 0,
		percent_cost = 25,
		bone = 'bumper_f',
		type = 'Custom Turbo',
		prop = 'imp_prop_impexp_spoiler_04a',
		list = {
			Default = {}, -- needed for uninstall
			Street = {Power = 1.2, Torque = 1.3, value = 25000},
			Sports = {Power = 1.4, Torque = 1.5, value = 55000},
			Racing = {Power = 2.2, Torque = 2.3, value = 125000},
		}
	}
end

-- Engine Stat Modification
-- Adding New Engine is easy
-- ex Elegy = {model = 'elegy', value = 25000},
-- just insert this line from the inside of list = {} (table)
-- Engien upgrades Copy Both Sound and Original Handling (Fmass is excluded and tractions handling) (only related to Vehicle Engine power)
if Config.UseCustomEngineUpgrade then
	Config.VehicleMod['custom_engine'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Custom Engine',
		name = 'custom_engine',
		index = 106,
		cost = 0,
		percent_cost = 30,
		bone = 'bumper_f',
		type = 'Custom Engine',
		prop = 'imp_prop_impexp_spoiler_04a',
		list = { -- table
			Default = {}, -- needed for uninstall
			Adder = {model = 'adder', value = 25000},
			FMJ = {model = 'fmj', value = 25000},
			Ruston = {model = 'ruston', value = 25000},
			RT3000 = {model = 'rt3000', value = 25000},
			Stinger = {model = 'stingergt', value = 25000},
		} -- table end
	}
end

-- Custom Tire Modification
-- Preconfigured Variations
-- You can tuned the Spec of the each handling
-- the value for each handling name is Not perfect, but can be used in more use cases and realistic.
if Config.UseCustomTireUpgrade then
	Config.VehicleMod['custom_tires'] = {
		job_grade = { -- default job grade to access this Upgrade Feature (this option will work only if Config.JobPermissionAll is true
			['mechanic'] = 0,
			['mechanic01'] = 0,
			['mechanic02'] = 0,
			--['police'] = 0,-- police is sample only change this!
		},
		discount = {
			['mechanic'] = 1.0, -- 20%
			['mechanic01'] = 1.0, -- 20%
			['mechanic02'] = 1.0, -- 20%
			--['ambulance'] = 0.1, -- 10%
			--['police'] = 0.15, -- 15%
		},
		label = 'Custom Tires',
		name = 'custom_tires',
		index = 108,
		cost = 0,
		percent_cost = 15,
		bone = 'bumper_f',
		type = 'Custom Tires',
		prop = 'imp_prop_impexp_spoiler_04a',
		list = {
			Default = {}, -- needed for uninstall
			Street = {fLowSpeedTractionLossMult = 1.1,fTractionLossMult = 1.1,fTractionCurveMin = 1.2, fTractionCurveMax = 1.0, fTractionCurveLateral = 0.8, value = 25000},
			Sports = {fLowSpeedTractionLossMult = 0.9,fTractionLossMult = 0.9,fTractionCurveMin = 1.1, fTractionCurveMax = 1.1, fTractionCurveLateral = 1.1, value = 35000},
			Racing = {fLowSpeedTractionLossMult = 0.65,fTractionLossMult = 0.7,fTractionCurveMin = 1.25, fTractionCurveMax = 1.35, fTractionCurveLateral = 1.25, value = 45000},
			Drag = {fLowSpeedTractionLossMult = 0.1,fTractionLossMult = 0.1,fTractionCurveMin = 2.2, fTractionCurveMax = 0.1, fTractionCurveLateral = 1.1, value = 55000},
		}
	}
end

-- RGB color for Spray Cans
-- do not rename and edit custom
Config.Pilox = {
    ['Blanco'] = {255, 255, 255},
    ['Rojo'] =  {246, 75, 60},
    ['Rosa'] = {253, 226, 226},
    ['Azul'] = {0, 168, 204},
    ['Amarillo'] = {245, 252, 193},
    ['Verde'] = {99, 154, 103},
    ['Naranja'] = {255, 164, 27},
    ['Marron'] = {156, 85, 24},
    ['Morado'] =  {190, 121, 223},
    ['Gris'] = {50, 50, 50},
    ['Negro'] = {0, 0, 0},
	['Custom'] = {0, 0, 0}, -- do not change this is a custom for RGB
}
id = 'A'
cam = nil
gameplaycam = nil
inGarage = false
ingarage = false
garage_coords = {}
shell = nil
ESX = nil
QBCore = nil
fetchdone = false
PlayerData = {}
playerLoaded = false
canpark = false
spawned_cars = {}
local type = 'car'
newprop = nil
multimenu = {}
openmenu = false
object = nil
saved = {}
control = nil
vehiclesdb = {}
insidegarage = true
private_garages = {}
activeshare = nil
currentprivate = nil
carrymode = false
carrymod = false
tostore = {}
vehiclehandling = {}
vehicleinarea = {}
spraying = false
customturbo = {}
customengine = {}
netids = {}
customtire = {}
extras = nil
spraycan = nil
custompaint = nil
tospray = false
oldprop = {}
inmark = false
markers = {}
currentshop = nil
TriggerServerCallback_ = nil
vehicletable = 'owned_vehicles'
vehiclemod = 'vehicle'
vehiclesname = {}
-- disable drift tires if build is not tuner
if GetGameBuildNumber() < 2372 then
	Config.VehicleMod[23]['list'] = {WheelType = {Sport = 0, Muscle = 1, Lowrider = 2, SUV = 3, Offroad = 4,Tuner = 5, BikeWheel = 6, HighEnd = 7 } , WheelColor = allcolors, Accessories = { CustomTire = 1, SmokeColor = 1, DriftTires = 1} } -- BennysWheel = 8, BespokeWheel = 9
	Config.VehicleMod[23]['list'].Accessories.DriftTires = nil
end
