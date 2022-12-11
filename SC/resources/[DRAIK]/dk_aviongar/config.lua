Config = {
    IndependentGarage = false, -- if you store vehicle at garage A, you can't take it out at garage B if this is set to true.
    ImpoundPrice = 450, -- price to retrieve impounded car
    Garage = {
        -------------------------------------[GARAGE]-------------------------------------
        ['square'] = {coords = vector3(-1633.93, -3150.37, 13.19), heading = 157.84, spawnpoint = vector3(-1651.59, -3155.73, 12.792), heading2 = 328.91, savepoint = vector3(-1639.94, -3128.08, 13.01192), heading3 = 328.91},
        ['square1'] = {coords =vector3(4488.408, -4514.10, 4.0920), heading = 157.84, spawnpoint = vector3(4491.657, -4498.79, 4.1649), heading2 = 328.91, savepoint =vector3(4483.528, -4477.12, 3.4339), heading3 = 328.91},

     

    },
    Garage2 = {
        -------------------------------------[SIN BLIP]-------------------------------------
    },
    View = {
        vehicle = {coords = vector3(228.8, -986.97, -99.96), heading = 179.12},
    },
    Impounds = {
       --[[ {  --Ciudad
            vehicleSpawn = {coords = vector3(403.68, -1643.24, 28.82), heading = 230.15},
            menu = vector3(409.41, -1623.15, 28.31),
        },]]
        {  --Sandy
            vehicleSpawn = {coords = vector3(4491.657, -4498.79, 4.1649), heading = 102.88},
            menu = vector3(4448.784, -4479.72, 4.2850),
        },
        {  --Mini hangar lago Sandy
            vehicleSpawn = {coords = vector3(2125.132, 4801.779, 40.01612), heading = 112.88},
            menu = vector3(2139.621, 4788.078, 39.97028),
        },
        { --Paleto Bay
            vehicleSpawn = {coords = vector3(-1266.10, -3369.38, 13.940), heading = 330.73},
            menu = vector3(-1272.62, -3377.54, 13.940),

        }
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

