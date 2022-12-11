Config = {}
Config.Locale = 'es'

Config.EnablePlayerManagement = true

Config.Zones = {


		AbogadoActions = {
			Opciones = {
				Pos   = { x = -124.43619537354, y = -639.51440429688, z = 167.82034301758 },
				Size  = { x = 0.5, y = 0.5, z = 0.5 },
				Color = { r = 0, g = 0, b = 0 },
				Type  = 27,

				SpawnPos = { x = -144.62446594238, y = -577.68505859375, z = 31.424465179443 },
				Heading = 161.19995117188
			}
		},



		VehicleDeleter = {
			Opciones = {
				Pos   = { x = -139.08354187012, y = -586.43536376953, z = 31.424457550049 },
				Size  = { x = 2.0, y = 2.0, z = 0.25 },
				Color = { r = 255, g = 0, b = 0 },
				Type  = 1
			}
		}

	


	
	
}

------------------
	--BLIPS--
------------------

Config.Blips = {
    
    Blip = {
      Pos     = { x = -118.33, y = -607.06, z = 35.28 },
      Sprite  = 408,
      Display = 4,
      Scale   = 0.6,
      Colour  = 21,
    },

}

-----------------------
----- TELEPORTERS -----



Config.FastTravels = {
	{
		From = vector3(-142.50, -614.25, 167.82),
		To = { coords = vector3(-144.05, -576.18, 31.42), heading = 0.0 },
		Marker = { type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
	},

}