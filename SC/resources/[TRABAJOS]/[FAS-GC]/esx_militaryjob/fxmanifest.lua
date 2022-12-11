shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'

game 'gta5'

description 'Trabajo de Fuerzas Armadas para SpainCity.ES'

author 'Bufas'

version '0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua',
	'client/vehicle.lua',
	'client/tps.lua'
}

dependencies {
	'es_extended',
	'esx_billing',
	'esx_vehicleshop'
}















