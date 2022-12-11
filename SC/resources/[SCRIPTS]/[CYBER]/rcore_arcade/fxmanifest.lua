shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'adamant'
games { 'gta5' }

client_scripts {
	"locale.lua",
	"locales/*.lua",
	"config.lua",

	"client/main.lua",
	"client/class/*.lua",
	"client/events.lua",
	"client/threads.lua",
}

server_script {
	"locale.lua",
	"locales/*.lua",
	"config.lua",

	"server/server.lua",
}

files {
	"html/css/style.css",
	"html/css/reset.css",
	
	"html/css/img/monitor.png",
	"html/css/img/table.png",
	
	"html/*.html",
	
	"html/scripts/listener.js",
}

ui_page "html/index.html"