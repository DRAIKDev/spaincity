shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


fx_version 'adamant'

game 'gta5'

description 'ESX Robo a Ammunation para SpainCity.ES'

author 'Bufas'

version '0.0.1'

client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',

	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}














