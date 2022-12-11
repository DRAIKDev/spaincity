shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'

game 'gta5'

description 'ESX Job Listing'

version '1.1.0'

shared_scripts {
	'@es_extended/locale.lua',
	'config/*.lua',
	'locales/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

dependency 'es_extended'








