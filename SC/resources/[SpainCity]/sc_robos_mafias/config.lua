Config = {}
Config.Locale = 'es'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 1 --- Número de militares minimo para robar.
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a robo after roboxd was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

robos = {
	["portaaviones"] = {
		position = { x = 3067.475, y = -4756.83, z = 6.0772 },
		reward = math.random(900000, 1050000),
		nameOfrobo = "Porta aviones",
		armas = true,
		drogas = false,
		numerodepolis = 1,
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
	["humane"] = {
		position = { x = 3538.304, y = 3666.988, z = 28.121 },
		reward = math.random(1200000, 1350000),
		nameOfrobo = "Laboratorios Humane",
		numerodepolis = 1,
		armas = false,
		drogas = true,
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
	["liveinvaders"] = {
		position = { x = -1055.292, y = -230.81, z = 44.0021 },
		reward = 0,
		nameOfrobo = "Life Invaders",
		numerodepolis = 1,
		armas = false,
		drogas = false,
		usb = true,
		secondsRemaining = 500, -- seconds
		lastRobbed = 0
	},
}