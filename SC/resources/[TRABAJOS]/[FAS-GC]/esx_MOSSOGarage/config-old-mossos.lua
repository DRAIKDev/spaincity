--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

Config.Locale = 'en'

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.cnpDatabaseName = 'cnp'	-- set the exact name from your jobs database for cnp

--cnp Car Garage:
Config.CarZones = {
	cnpCarGarage = {
		Pos = {
			{x = 478.0007, y = -1021.80, z = 28.023}, --Parte trasera comisaria Mission Row
			{x = 444.8176, y = -1020.71, z = 28.542}, --Parte delantera comisaria Mission Ro
			{x = 1871.265, y = 279.4715, z = 164.30}, --serviciosecreto
			{x = 2555.71, y = -390.3, z = 91.99}, --BASE GEO DELANTERO
			{x = 2463.63, y = -319.94, z = 92.09}, --BASE GEO TRASERO
			{x = -1129.69, y = -839.66, z = 12.9}
		}
	}
}

--cnp Heli Garage:
Config.HeliZones = {
	cnpHeliGarage = {
		Pos = {
			{x = 448.65,  y = -981.25, z = 43.69},
			{x = 1877.440, y = 289.0675, z = 164.30}, --serviciosecreto
			{x = 2510.51, y = -342.02, z = 117.19}, --BASE GEO 1
			{x = 2511.29, y = -426.47, z = 117.33}, --BASE GEO 2
			{x = 632.216,  y = -156.131, z = 54.037}
		}
	}
}
--cnp Boat Garage:
Config.BoatZones = {
	cnpBoatGarage = {
		Pos = {
			{x = 1538.69,  y = 3901.5, z = 30.35},
			{x = -789.466, y = -1501.52, z = 0.174},
			{x = -8.40393, y = -2751.43, z = 1.00},
			{x = 3846.219, y = 4445.218, z = -0.3},
			{x = -1595.97, y = 5252.397, z = -0.300}
		}
	}
}

--cnp Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Politsei Garaaz"
Config.EnableCarGarageBlip = false

-- cnp Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Politsei helikopter"
Config.EnableHeliGarageBlip = false

-- cnp Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Politsei Paat"
Config.EnableBoatGarageBlip = false

-- cnp Extra Menu Blip Settings:
Config.ExtraGarageSprite = 566
Config.ExtraGarageDisplay = 4
Config.ExtraGarageScale = 0.65
Config.ExtraGarageColour = 38
Config.ExtraGarageName = "Auto Lisad"
Config.EnableExtraGarageBlip = false

-- cnp Car Garage Marker Settings:
Config.cnpCarMarker = 27 												-- marker type
Config.cnpCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.cnpCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "Presiona [E] para abrir el Garage"			-- set your desired text here

-- cnp Heli Garage Marker Settings:
Config.cnpHeliMarker = 27 												-- marker type
Config.cnpHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.cnpHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "Presiona [E] para abrir el Garage"		-- set your desired text here

-- cnp Boat Garage Marker Settings:
Config.cnpBoatMarker = 27 												-- marker type
Config.cnpBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.cnpBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "Presiona [E] para abrir el Garage"		-- set your desired text here

-- cnp Extra Garage Marker Settings:
Config.cnpExtraMarker = 27 												-- marker type
Config.cnpExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.cnpExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.ExtraDraw3DText = "Press ~g~[E]~s~ for ~y~cnp Extra Menu~s~"		-- set your desired text here

-- cnp Cars:
Config.cnpVehicles = {
	{ model = 'polaventa2', label = '[CNP] Lamborgini Aventador', price = 1 },
	{ model = 'dodgecnp', label = '[CNP] Dodge', price = 1 },
	{ model = 'ghispo2', label = '[CNP] Maserati', price = 1 },
	{ model = 'pbus', label = '[CNP] Bus de prisión', price = 1 },
	{ model = 'police3', label = '[CNP] Ford Explorer', price = 1 },
	{ model = 'policeb', label = '[CNP] Moto Carretera', price = 1 },
	{ model = 'lexuscnp', label = '[CNP] Lexus', price = 1 }, 
	{ model = 'gtcnp', label = '[CNP] Nissan GT', price = 1 }, 
	{ model = 'bmwcnp', label = '[CNP] Bmw Serie 1', price = 1 }, 
	{ model = 'amgcnp', label = '[CNP] Mercedes AMG', price = 1 }, 
	{ model = 'bmwcnp1', label = '[CNP] Bmw 530D', price = 1 }, 
	{ model = 'polibf400', label = '[CNP] bf400', price = 1 }, 
	{ model = 'mer03', label = '[CNP] Furgoneta', price = 1 }, 
	{ model = 'elcnpsantos', label = '[CNP] Hummer', price = 1 },
	{ model = 'pbike', label = '[CNP] Bici', price = 1 },
	{ model = 'rmodgt63police', label = '[CNP] AMG Jefatura', price = 1 },
	{ model = 'cnpg63', label = '[G.E.O] Mercedes Benz', price = 1 },
	{ model = 'brickade', label = '[G.E.O] Camión', price = 1 },
	{ model = 'cnp_vamtac', label = '[G.E.O] Vamtac', price = 1 },


	-- Secreta --
	{ model = 'jeepunmarked', label = 'UIE - Jeep', price = 1 }, 
	{ model = 'polamggtr', label = 'UIE - Mercedes AMG', price = 1 }, 
	{ model = 'sheriffsci', label = 'Sierra - Volkswagen', price = 1 }, 
	{ model = 'policer8', label = 'Sierra - Mustang', price = 1 }, 
	{ model = 'policesl', label = 'Sierra - BMW-X5', price = 1 }, 
	{ model = 'gtsecreta', label = 'Sierra - GT', price = 1 }, 
	{ model = 'roversecreta', label = 'Sierra - Rover', price = 1 }, 
	{ model = 'bufasreal', label = 'Jefatura - Cadillac (NO SACAR)', price = 1 }, 
	-- UPC --
	{ model = 'legacyf150', label = 'Ford F150 (U.P.C.)', price = 1 }, 
	{ model = 'legacyram', label = 'RAM (U.P.C.)', price = 1 }, 
	{ model = 'chargerbufas', label = 'Dodge Charger (U.P.C.)', price = 1 }, 
	--
	{ model = 'menswat', label = '[UIP] Blindado Ligero', price = 1 },
	{ model = 'riot', label = '[UIP] Furgoneta', price = 1 },
	{ model = 'riot2', label = '[UIP] Antidisturbios', price = 1 },
	--Mossos
	{ model = 'bmwmossos', label = '[MOSSOS] Bmw Serie 1', price = 1 },
	{ model = 'mosso', label = '[MOSSOS] Qashqai', price = 1 },
    { model = 'mosso5', label = '[MOSSOS] Opel', price = 1 },
	{ model = 'mosso2', label = '[MOSSOS] Furgoneta Trafico', price = 1 },
	{ model = 'anpc_l200', label = '[MOSSOS] Camioneta', price = 1 },
	{ model = 'anpc_trailer', label = '[MOSSOS] Trailer Camioneta', price = 1 }
}

-- cnp Helicopters:
Config.cnpHelicopters = {
	{ model = 'polmav', label = 'EC-135 [CNP]', livery = 0, price = 0 },
	{ model = 'as332', label = 'Puma [CNP/UIP]', livery = 0, price = 0 },
	{ model = 'firehawk', label = 'HAWK 1 [CNP]', livery = 0, price = 0 },
	{ model = 'jayhawk', label = 'HAWK 2 [CNP]', livery = 0, price = 0 },
	{ model = 'volatus', label = 'Volatus [JEFATURA]', livery = 0, price = 0 }	
}

-- cnp Boats:
Config.cnpBoats = {
	{ model = 'predator', label = 'Predator', livery = 0, price = 0 },
	{ model = 'seashark', label = 'Sprinter', livery = 0, price = 0 },
	{ model = 'dinghy3', label = 'Zodiac (Sierra)', livery = 0, price = 0 },
	{ model = 'barcacnp', label = 'Speeder', livery = 0, price = 0 },
	{ model = 'dinghy', label = 'Zodiac', livery = 0, price = 0 },
	{ model = 'fxho', label = 'Moto Acuatica', livery = 0, price = 0 }

}

-- Commands:
Config.RepairCommand = 'reparar'
Config.CleanCommand = 'limpiar'

-- Menu Labels & Titles:
Config.LabelStoreVeh = "Devolver vehiculo"
Config.LabelGetVeh = "Tomar un vehiculo"
Config.LabelPrimaryCol = "Primario"
Config.LabelSecondaryCol = "Secundario"
Config.LabelExtra = "Extra"
Config.LabelLivery = "ID"
Config.TitlecnpGarage = "Garage"
Config.TitlecnpExtra = "Extra"
Config.TitlecnpLivery = "ID"
Config.TitleColorType = "Tipo de color"
Config.TitleValues = "Valor"

-- ESX.ShowNotifications:
Config.VehicleParked = "Tu vehiculo esta afuera!"
Config.NoVehicleNearby = "No tenes un vehiuclo!"
Config.CarOutFromPolGar = "Sacaste un ~b~vehiculo~s~ del ~y~Garage~s~!"
Config.HeliOutFromPolGar = "Sacaste un ~b~Helicoptero~s~!"
Config.BoatOutFromPolGar = "Sacaste un ~b~Barco~s~!"
Config.VehRepNotify = "Tu ~b~vehiculo~s~ esta siendo ~y~reparado~s~, por favor espere!"
Config.VehRepDoneNotify = "Your ~b~vehicle~s~ has been ~y~repaired~s~!"
Config.VehCleanNotify = "Your ~b~vehicle~s~ is being ~y~cleaned~s~, please wait!"
Config.VehCleanDoneNotify = "Your ~b~vehicle~s~ has been ~y~cleaned~s~!"

-- ProgressBars text
Config.Progress1 = "AUTO PARANDAMINE"
Config.Progress2 = "AUTO PUHASTAMINE"

-- ProgressBar Timers, in seconds:
Config.RepairTime = 5					-- time to repair vehicle
Config.CleanTime = 3.5					-- time to clean vehicle

Config.VehicleLoadText = "Espere que el vehiculo aparezca"			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.Distance = 20

Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 3.0
Config.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}

-- cnp Extra Menu Positions:
Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 454.7,  y = -1024.32, z = 28.49},
			{x = 467.6,  y = 2530.54, z = 33.437}
		}
	}
}

Config.Colors = {
	{ label = _U('black'), value = 'black'},
	{ label = _U('white'), value = 'white'},
	{ label = _U('grey'), value = 'grey'},
	{ label = _U('red'), value = 'red'},
	{ label = _U('pink'), value = 'pink'},
	{ label = _U('blue'), value = 'blue'},
	{ label = _U('yellow'), value = 'yellow'},
	{ label = _U('green'), value = 'green'},
	{ label = _U('orange'), value = 'orange'},
	{ label = _U('brown'), value = 'brown'},
	{ label = _U('purple'), value = 'purple'},
	{ label = _U('chrome'), value = 'chrome'},
	{ label = _U('gold'), value = 'gold'}
}

function GetColors(color)
	local colors = {}
	if color == 'black' then
		colors = {
			{ index = 0, label = _U('black')},
			{ index = 1, label = _U('graphite')},
			{ index = 2, label = _U('black_metallic')},
			{ index = 3, label = _U('caststeel')},
			{ index = 11, label = _U('black_anth')},
			{ index = 12, label = _U('matteblack')},
			{ index = 15, label = _U('darknight')},
			{ index = 16, label = _U('deepblack')},
			{ index = 21, label = _U('oil')},
			{ index = 147, label = _U('carbon')}
		}
	elseif color == 'white' then
		colors = {
			{ index = 106, label = _U('vanilla')},
			{ index = 107, label = _U('creme')},
			{ index = 111, label = _U('white')},
			{ index = 112, label = _U('polarwhite')},
			{ index = 113, label = _U('beige')},
			{ index = 121, label = _U('mattewhite')},
			{ index = 122, label = _U('snow')},
			{ index = 131, label = _U('cotton')},
			{ index = 132, label = _U('alabaster')},
			{ index = 134, label = _U('purewhite')}
		}
	elseif color == 'grey' then
		colors = {
			{ index = 4, label = _U('silver')},
			{ index = 5, label = _U('metallicgrey')},
			{ index = 6, label = _U('laminatedsteel')},
			{ index = 7, label = _U('darkgray')},
			{ index = 8, label = _U('rockygray')},
			{ index = 9, label = _U('graynight')},
			{ index = 10, label = _U('aluminum')},
			{ index = 13, label = _U('graymat')},
			{ index = 14, label = _U('lightgrey')},
			{ index = 17, label = _U('asphaltgray')},
			{ index = 18, label = _U('grayconcrete')},
			{ index = 19, label = _U('darksilver')},
			{ index = 20, label = _U('magnesite')},
			{ index = 22, label = _U('nickel')},
			{ index = 23, label = _U('zinc')},
			{ index = 24, label = _U('dolomite')},
			{ index = 25, label = _U('bluesilver')},
			{ index = 26, label = _U('titanium')},
			{ index = 66, label = _U('steelblue')},
			{ index = 93, label = _U('champagne')},
			{ index = 144, label = _U('grayhunter')},
			{ index = 156, label = _U('grey')}
		}
	elseif color == 'red' then
		colors = {
			{ index = 27, label = _U('red')},
			{ index = 28, label = _U('torino_red')},
			{ index = 29, label = _U('poppy')},
			{ index = 30, label = _U('copper_red')},
			{ index = 31, label = _U('cardinal')},
			{ index = 32, label = _U('brick')},
			{ index = 33, label = _U('garnet')},
			{ index = 34, label = _U('cabernet')},
			{ index = 35, label = _U('candy')},
			{ index = 39, label = _U('matte_red')},
			{ index = 40, label = _U('dark_red')},
			{ index = 43, label = _U('red_pulp')},
			{ index = 44, label = _U('bril_red')},
			{ index = 46, label = _U('pale_red')},
			{ index = 143, label = _U('wine_red')},
			{ index = 150, label = _U('volcano')}
		}
	elseif color == 'pink' then
		colors = {
			{ index = 135, label = _U('electricpink')},
			{ index = 136, label = _U('salmon')},
			{ index = 137, label = _U('sugarplum')}
		}
	elseif color == 'blue' then
		colors = {
			{ index = 54, label = _U('topaz')},
			{ index = 60, label = _U('light_blue')},
			{ index = 61, label = _U('galaxy_blue')},
			{ index = 62, label = _U('dark_blue')},
			{ index = 63, label = _U('azure')},
			{ index = 64, label = _U('navy_blue')},
			{ index = 65, label = _U('lapis')},
			{ index = 67, label = _U('blue_diamond')},
			{ index = 68, label = _U('surfer')},
			{ index = 69, label = _U('pastel_blue')},
			{ index = 70, label = _U('celeste_blue')},
			{ index = 73, label = _U('rally_blue')},
			{ index = 74, label = _U('blue_paradise')},
			{ index = 75, label = _U('blue_night')},
			{ index = 77, label = _U('cyan_blue')},
			{ index = 78, label = _U('cobalt')},
			{ index = 79, label = _U('electric_blue')},
			{ index = 80, label = _U('horizon_blue')},
			{ index = 82, label = _U('metallic_blue')},
			{ index = 83, label = _U('aquamarine')},
			{ index = 84, label = _U('blue_agathe')},
			{ index = 85, label = _U('zirconium')},
			{ index = 86, label = _U('spinel')},
			{ index = 87, label = _U('tourmaline')},
			{ index = 127, label = _U('paradise')},
			{ index = 140, label = _U('bubble_gum')},
			{ index = 141, label = _U('midnight_blue')},
			{ index = 146, label = _U('forbidden_blue')},
			{ index = 157, label = _U('glacier_blue')}
		}
	elseif color == 'yellow' then
		colors = {
			{ index = 42, label = _U('yellow')},
			{ index = 88, label = _U('wheat')},
			{ index = 89, label = _U('raceyellow')},
			{ index = 91, label = _U('paleyellow')},
			{ index = 126, label = _U('lightyellow')}
		}
	elseif color == 'green' then
		colors = {
			{ index = 49, label = _U('met_dark_green')},
			{ index = 50, label = _U('rally_green')},
			{ index = 51, label = _U('pine_green')},
			{ index = 52, label = _U('olive_green')},
			{ index = 53, label = _U('light_green')},
			{ index = 55, label = _U('lime_green')},
			{ index = 56, label = _U('forest_green')},
			{ index = 57, label = _U('lawn_green')},
			{ index = 58, label = _U('imperial_green')},
			{ index = 59, label = _U('green_bottle')},
			{ index = 92, label = _U('citrus_green')},
			{ index = 125, label = _U('green_anis')},
			{ index = 128, label = _U('khaki')},
			{ index = 133, label = _U('army_green')},
			{ index = 151, label = _U('dark_green')},
			{ index = 152, label = _U('hunter_green')},
			{ index = 155, label = _U('matte_foilage_green')}
		}
	elseif color == 'orange' then
		colors = {
			{ index = 36, label = _U('tangerine')},
			{ index = 38, label = _U('orange')},
			{ index = 41, label = _U('matteorange')},
			{ index = 123, label = _U('lightorange')},
			{ index = 124, label = _U('peach')},
			{ index = 130, label = _U('pumpkin')},
			{ index = 138, label = _U('orangelambo')}
		}
	elseif color == 'brown' then
		colors = {
			{ index = 45, label = _U('copper')},
			{ index = 47, label = _U('lightbrown')},
			{ index = 48, label = _U('darkbrown')},
			{ index = 90, label = _U('bronze')},
			{ index = 94, label = _U('brownmetallic')},
			{ index = 95, label = _U('Expresso')},
			{ index = 96, label = _U('chocolate')},
			{ index = 97, label = _U('terracotta')},
			{ index = 98, label = _U('marble')},
			{ index = 99, label = _U('sand')},
			{ index = 100, label = _U('sepia')},
			{ index = 101, label = _U('bison')},
			{ index = 102, label = _U('palm')},
			{ index = 103, label = _U('caramel')},
			{ index = 104, label = _U('rust')},
			{ index = 105, label = _U('chestnut')},
			{ index = 108, label = _U('brown')},
			{ index = 109, label = _U('hazelnut')},
			{ index = 110, label = _U('shell')},
			{ index = 114, label = _U('mahogany')},
			{ index = 115, label = _U('cauldron')},
			{ index = 116, label = _U('blond')},
			{ index = 129, label = _U('gravel')},
			{ index = 153, label = _U('darkearth')},
			{ index = 154, label = _U('desert')}
		}
	elseif color == 'purple' then
		colors = {
			{ index = 71, label = _U('indigo')},
			{ index = 72, label = _U('deeppurple')},
			{ index = 76, label = _U('darkviolet')},
			{ index = 81, label = _U('amethyst')},
			{ index = 142, label = _U('mysticalviolet')},
			{ index = 145, label = _U('purplemetallic')},
			{ index = 148, label = _U('matteviolet')},
			{ index = 149, label = _U('mattedeeppurple')}
		}
	elseif color == 'chrome' then
		colors = {
			{ index = 117, label = _U('brushedchrome')},
			{ index = 118, label = _U('blackchrome')},
			{ index = 119, label = _U('brushedaluminum')},
			{ index = 120, label = _U('chrome')}
		}
	elseif color == 'gold' then
		colors = {
			{ index = 37, label = _U('gold')},
			{ index = 158, label = _U('puregold')},
			{ index = 159, label = _U('brushedgold')},
			{ index = 160, label = _U('lightgold')}
		}
	end
	return colors
end