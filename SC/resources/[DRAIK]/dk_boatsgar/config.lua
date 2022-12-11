Config = {
    IndependentGarage = false, -- if you store vehicle at garage A, you can't take it out at garage B if this is set to true.
    ImpoundPrice = 450, -- price to retrieve impounded car
    Garage = {
        -------------------------------------[GARAGE]-------------------------------------
       
        --['square'] = {coords = vector3(-1633.93, -3150.37, 13.19), heading = 157.84, spawnpoint = vector3(-1651.59, -3155.73, 12.792), heading2 = 328.91, savepoint = vector3(-1639.94, -3128.08, 13.01192), heading3 = 328.91},
        ['square'] = {coords = vector3(-718.85, -1326.37, 0.8), heading = 197.84, spawnpoint = vector3(-727.614, -1326.08, 0.01192), heading2 = 224.65, savepoint = vector3(-727.614, -1326.08, 0.01192), heading3 = 328.91},
        ['square1'] = {coords = vector3(3864.9, 4463.9, 2.4), heading = 90.84, spawnpoint = vector3(3854.4, 4477.2, 0.0), heading2 = 328.91, savepoint = vector3(3857.0, 4446.9, 0.2), heading3 = 328.91},
        ['square2'] = {coords = vector3(-1614.0, 5260.1, 3.3), heading = 157.84, spawnpoint = vector3(-1622.5, 5247.1, 0.0), heading2 = 328.91, savepoint = vector3(-1600.3, 5261.9, 0.2), heading3 = 328.91},
        ['square3'] = {coords = vector3(712.6, 4093.3, 34.7), heading = 157.84, spawnpoint = vector3(712.8, 4080.2, 29.3), heading2 = 328.91, savepoint = vector3(705.1, 4110.1, 30.4), heading3 = 328.91},
        ['square4'] = {coords = vector3(23.8, -2806.8, 4.9), heading = 157.84, spawnpoint = vector3(23.3, -2828.6, 0.8), heading2 = 328.91, savepoint = vector3(-1.0, -2799.2, 0.5), heading3 = 328.91},
        ['square5'] = {coords = vector3(-3427.3, 968.9, 7.7), heading = 157.84, spawnpoint = vector3(-3448.9, 953.8, 0.0), heading2 = 328.91, savepoint = vector3(-3436.5, 946.6, 0.3), heading3 = 328.91},
      
        ['cayo'] = {coords =   vector3(5092.629, -4655.04, 1.098), heading = 157.84, spawnpoint = vector3(5136.070, -4659.09, -0.643), heading2 = 328.91, savepoint = vector3(5098.963, -4645.34, 0.345), heading3 = 328.91},

    },
    Garage2 = {
        -------------------------------------[SIN BLIP]-------------------------------------
    },
    View = {
        vehicle = {coords = vector3(228.8, -986.97, -99.96), heading = 179.12},
    },
    Impounds = {
        ['sadsad'] = {menu = vector3(-798.188, -1419.73, 1.5952), heading = 197.84, spawnpoint = vector3(-715.9332, -1341.054, -0.4847179), heading2 = 328.91},
        ['sadsasdadad'] = {menu = vector3(-284.610, 6630.419, 7.3401), heading = 197.84, spawnpoint =vector3(-299.789, 6626.249, -0.538)   , heading2 = 328.91},
        ['sadsasdasdadadad'] = {menu = vector3(4765.487, -4780.30, 3.8015), heading = 197.84, spawnpoint =vector3(4796.385, -4795.88, 0.0737)   , heading2 = 328.91},
    
        
    },
}

Strings = {
    ['enter_garage'] = 'Presione %s para ingresar al garage',
    ['store_garage'] = 'Presione %s para guardar tu %s',
    ['impound'] = ' Confiscados',
    ['take_out'] = '¿Deseas sacar %s?',
    ['yes'] = 'Si',
    ['no'] = 'No',
    ['retrieve_impounded'] = 'Recuperar %s - %s por $%s',
    ['open_impound'] = 'Presione ~INPUT_CONTEXT~ para ingresar a confiscados',
    ['no_money'] = "No tienes suficiente dinero",
    ['impound_blip'] = 'Confiscados',
    ['garage'] = 'Garage'
}

--[[Garages = {
,

		{ -- Catfish View
			GaragePos  = vector3(3864.9, 4463.9, 1.6),
			SpawnPoint = vector4(3854.4, 4477.2, 0.0, 273.0),
			StorePos   = vector3(3857.0, 4446.9, 0.0),
			StoreTP    = vector4(3854.7, 4458.6, 1.8, 355.3)
		},

		{ -- Great Ocean Highway
			GaragePos  = vector3(-1614.0, 5260.1, 2.8),
			SpawnPoint = vector4(-1622.5, 5247.1, 0.0, 21.0),
			StorePos   = vector3(-1600.3, 5261.9, 0.0),
			StoreTP    = vector4(-1605.7, 5259.0, 2.0, 25.0)
		},

		{ -- North Calafia Way
			GaragePos  = vector3(712.6, 4093.3, 33.7),
			SpawnPoint = vector4(712.8, 4080.2, 29.3, 181.0),
			StorePos   = vector3(705.1, 4110.1, 30.2),
			StoreTP    = vector4(711.9, 4110.5, 31.3, 180.0)
		},

		{ -- Elysian Fields, nearby the airport
			GaragePos  = vector3(23.8, -2806.8, 4.8),
			SpawnPoint = vector4(23.3, -2828.6, 0.8, 181.0),
			StorePos   = vector3(-1.0, -2799.2, 0.5),
			StoreTP    = vector4(12.6, -2793.8, 2.5, 355.2)
		},

		{ -- Barbareno Rd
			GaragePos  = vector3(-3427.3, 968.9, 7.3),
			SpawnPoint = vector4(-3448.9, 953.8, 0.0, 75.0),
			StorePos   = vector3(-3436.5, 946.6, 0.3),
			StoreTP    = vector4(-3427.0, 952.6, 8.3, 0.0)
		}
	},]]