Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob = 0
Config.RequiredCopsSell = 0
Config.SecBetwNextRob = 1800 --1 hour

Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(60000,75000),
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}
