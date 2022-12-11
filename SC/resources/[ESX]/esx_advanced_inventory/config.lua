Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 5000

-- WIP Holding more and more stuff make you slower and slower (Do not work at this time.. Try some native, look at client/main.lua)
Config.userSpeed = true

-- TODO, see server/main.lua
--Config.Config.BagIsSkin = true

-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:
Config.localWeight = {
--------------------------------------
	gym_membership = 50,
--------------------------------------
	aditives = 170,
	towel = 170,
	fishbait = 170,
	diamond = 170,
	jewels = 170,
	opium = 200,
	weed = 200,
	opium = 200,
	opium_pooch = 200,
	optium = 200,
	optium_pooch = 200,
	weed_pooch = 400,
	weed = 200,
	cocaseed = 100,
	coca = 200,
	lockpick = 400,
	shovel = 1000,
	weapon_shit = 500,
	scope = 500,
	culett = 500,
--------------------------------------
	bread = 250,
	absinthe = 250,
--------------------------------------
	alive_chicken = 250,
	packaged_chicken = 250,
	turtlebait = 250,
	bandage = 170,
	wood = 200,
	cutted_wood = 200,
	packaged_plank = 200,
	fishbait = 170,
	diamond = 170,
	shirt = 300,
	fish = 200,
	slaughtered_chicken = 500,
--------------------------------------
	beer = 500,
	jager = 500,
	martini = 500,
	soda = 500,
	jagerbomb = 500,
	meth_pooch = 500,
	vodka = 500,
	vodkaenergy = 500,
	vodkafruit = 500,
	rhum = 500,
	rhumcoca = 500,
	rhumfruit = 500,
	teqpaf = 500,
	tequila = 500,
	limonade = 500,
	jagercerbere = 500,
	jusfruit = 500,
	golem = 500,
	grapperaisin = 500,
	drpepper = 500,
	mojito = 500,
	energy = 500,
	whisky = 500,
	icetea = 500,
	whiskycoca = 500,
	binoculars = 5000,
--------------------------------------
	blowpipe = 5000,
	drill = 5000,
	repairkit = 5000,
	fixtool = 5000,
	gazbottle = 5000,
	carokit = 5000,
	carotool = 5000,
	shark = 15000,
	turtle = 7500,
	bolcacahuetes = 250,
	bolnoixcajou = 250,
	bolchips = 250,
	bolpistache = 250,
	bolsa = 100,
	caja = 500,
	fishingrod = 1000,
	mixapero = 1000,
	bulletproof = 2500,
	oxygen_mask = 2500,
	speaker = 2500,
	firstaidkit = 2500,
	medikit = 1000,
	clip = 2500,
	water = 500,
	protein_shake = 500,
	powerade = 500
	
}