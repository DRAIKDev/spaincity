shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield


ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/cursor.png',
	'html/styles.css',
	'html/questions.js',
	'html/scripts.js',
	'html/debounce.min.js'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
        'server.lua'
}
client_script {
        'client.lua'
}














