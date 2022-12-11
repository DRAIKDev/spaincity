# esx_animations
An edit of [esx_animations](https://github.com/ESX-Org/esx_animations), you can choose a favourite animation that you can bind on the [Z] button. There is also some synced animations like hugs, kisses etc.

## Setup

 - Download [pnotify](https://forum.fivem.net/t/release-pnotify-in-game-js-notifications-using-noty/20659)

 - Download this esx_animations script
 
 - Run the SQL file
 
 - Put the script inside the /resources/[esx]/ folder
 
 - Add ```start esx_animations``` in your servers server.cfg
 
 - To open up the menu, if you use [esx_personmeny](https://github.com/xBlueSI/esx_personmeny/) put the code ```{label = ('Animationer'), value = 'animations'},``` in the 161th line in ../client/client.lua then add this code to the line 166
 ```
 if data.current.value == 'animations' then
      	TriggerEvent("esx_animations")
end
