shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
games {'gta5'}


version '1.0.0'

autor 'Chino Sousa'

description 'Abogados'




client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',

	'config.lua',
	'client/*.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',

	'config.lua',
	'server/*.lua'
}
