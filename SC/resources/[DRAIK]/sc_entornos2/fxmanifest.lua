shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'
games { 'gta5' }
author 'Draik'
description 'Draik	Entornos for ESX Legacy'
version '0.1 Beta'
ui_page 'html/ui.html'


files {
	'html/ui.html',
	'html/main.css',
	'html/app.js',
}

client_scripts {
	'@es_extended/locale.lua',

	'locales/en.lua',
	'config.lua',
	'client/client.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/server.lua',
}

dependencies {
	'es_extended'
}







