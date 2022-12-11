Config = {}
Config.Locale = 'en'

Config.DrawDistance = 100.0
Config.MarkerColor  = { r = 120, g = 120, b = 240 }

Config.EnableOwnedVehicles = true -- If true then it will set the Vehicle Owner to the Player who bought it.
Config.ResellPercentage    = 50 -- Sets the Resell Percentage | Example: $100 Car will resell for $75
Config.LicenseEnable       = true -- Require people to own a Commercial License when buying vehicles? Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {
	ShopEntering = { -- Marker for Accessing Shop
		Pos   = { x = -785.9695, y = -228.9472, z = 37.2363 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},
	ShopInside = { -- Marker for Viewing Vehicles
		Pos     = { x = -783.3313, y = -223.0275, z = 37.32155 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 161.80699157715,
		Type    = -1
	},
	ShopOutside = { -- Marker for Purchasing Vehicles
		Pos     = { x = -767.9989, y = -245.4019, z = 36.98738},
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 203.11933898926,
		Type    = -1
	},
	ResellVehicle = { -- Marker for Selling Vehicles
		Pos   = { x = -7.63, y = -1080.86, z = 26.67 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}
}

Config.Coords = {
	Ped = {
		Pos     = vector3(-785.5457, -229.6883, 36.07964),
		Heading = 126.4451,
		Text 	= vector3(-785.9695, -228.9472, 37.23633)
	}
}