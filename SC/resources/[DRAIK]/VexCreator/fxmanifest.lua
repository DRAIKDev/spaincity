shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'
game 'gta5'
name 'SkinCreator'
ui_page "interface/ui.html"

files {
    "interface/ui.html",
	"interface/assets/*.png",
	"interface/assets/faces/*.jpg",
	"interface/fonts/Circular-Bold.ttf",
	"interface/fonts/Circular-Book.ttf",
	"interface/js/app.js",
	"interface/js/vuescript.js",
	"interface/style.css",
}

-- Client Scripts
client_scripts {
    'client.lua',
}

dependencies {
	'es_extended',
	'skinchanger',
	'esx_skin'
}