shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield





fx_version 'adamant'

game 'gta5'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'Server/*.lua'
}
server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'
