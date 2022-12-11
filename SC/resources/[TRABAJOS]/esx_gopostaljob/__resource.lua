shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Go Postal Job script |'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/sv.lua'
}

client_scripts {
	'client/base.lua',
	'client/cl.lua'
}


server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'























