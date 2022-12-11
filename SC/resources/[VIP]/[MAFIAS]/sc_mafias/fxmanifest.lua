shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'

game 'gta5'
author 'Juansane'

version '1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'client/*.lua'
}







server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'
