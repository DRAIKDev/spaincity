shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Discord Bot' 			-- Resource Description

server_script {						-- Server Scripts
	'Config.lua',
	'SERVER/Server.lua',
}

client_script {						-- Client Scripts

	'CLIENT/Weapons.lua',
	'CLIENT/Client.lua',
}


















