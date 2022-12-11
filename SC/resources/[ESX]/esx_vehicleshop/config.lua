Config                            = {}
Config.DrawDistance               = 120.0
Config.MarkerColor                = { r = 220, g = 0, b = 0 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 0

Config.Locale = 'en'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -794.8765, y = -218.1165, z = 36.07963 },
		Size  = { x = 2.0, y = 2.0, z = 2.0 },
		Type  = -1
	},

	ShopInside = {
		Pos     = { x = -771.853, y = -233.1431, z = 36.83142 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 208.75663757324,
		Type    = -1
	},

	ShopOutside = {
		Pos     = { x = -767.9989, y = -245.4019, z = 36.98738 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 203.11933898926,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -50.027, y = -1075.558, z = 25.675 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = { x = 0.0, y = 0.0, z = 0.0 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}

}

Config.Coords = {
	Ped = {
		Pos     = vector3(-794.8765, -218.1165, 36.07963),
		Heading = 126.4451,
		Text = vector3(-794.8765, -218.1165, 37.87963)
	}
}

Config.modelosbanned = {
	'lamboavj',
	'nitroboost', 
	'bugatti',
	'g65amg',
	'ktklp7704', 
	'RS62',
	'18Velar',
	'urus'
}


