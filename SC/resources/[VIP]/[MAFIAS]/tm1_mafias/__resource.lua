shared_script '@SpainCityAC/waveshield.lua' --this line was automatically written by WaveShield

description 'Mafia System'
version '1'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'server/draikarmarios.lua'
}

client_scripts {
	'client/main.lua',
	'client/bankgroup.lua',
	'client/administrator.lua',
	'client/register.lua',
	'client/enclosures.lua',
	'modules/weed.lua',
	'modules/weapon_license.lua',
	'modules/weapontraffic.lua',
	'modules/coke.lua',
	'modules/cargojob.lua',
	'modules/consumo.lua',
	'modules/nevaditos.lua',
	'client/draikarmarios.lua',

}
server_script '@salty_tokenizer/init.lua'
client_script '@salty_tokenizer/init.lua'
ui_page('html/index.html')

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/cursor.png',
})

server_exports {
	'getPlayerFromId',
}








