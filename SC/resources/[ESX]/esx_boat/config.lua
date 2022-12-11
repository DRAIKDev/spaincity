Config               = {}

Config.Locale        = 'en'

Config.LicenseEnable = true -- enable boat license? Requires esx_license
Config.LicensePrice  = 300000

Config.MarkerType    = 1
Config.DrawDistance  = 100.0

Config.Marker = {
	r = 100, g = 204, b = 100, -- blue-ish color
	x = 1.5, y = 1.5, z = 1.0  -- standard size circle
}

Config.StoreMarker = {
	r = 255, g = 0, b = 0,     -- red color
	x = 5.0, y = 5.0, z = 1.0  -- big circle for storing boat
}

Config.Zones = {

	Garages = {
	},

	BoatShops = {
		{ -- Shank St, nearby campaign boat garage
			Outside = vector3(-737.7, -1341.2, 0.6),
			Inside = vector4(-798.5, -1503.1, -0.4, 120.0)
		}
	}

}

Config.Vehicles = {
	{model = 'seashark', label = 'Seashark (Random Color)', price = 45000},
	{model = 'seashark3', label = 'Seashark (Dark Blue)', price = 45000},
	{model = 'jetmax', label = 'Jetmax', price = 255000},
	--{model = 'sr510', label = 'SR 510', price = 7000000},
	{model = 'dinghy2', label = 'Dinghy (Black)', price = 81000},
	{model = 'speeder', label = 'Speeder', price = 150000},
	{model = 'squalo', label = 'Squalo', price = 120000},
	{model = 'toro', label = 'Toro', price = 225000},
	{model = 'submersible', label = 'Submarino', price = 6000000}
}