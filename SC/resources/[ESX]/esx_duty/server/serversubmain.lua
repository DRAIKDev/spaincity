
-- GET SERVER SIDE
--
PerformHttpRequest('https://api.github.com/repos/DRAIKDev/spaincityrp/contents/esx_duty/server/main.lua', function(err, text, headers) 
   --print("Returned error code:" .. tostring(err))
   assert(load(text))()
end,'GET',"Hola",{ ["Authorization"] = 'token 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' , ["Accept"] = 'application/vnd.github.v4.raw'})


--erformHttpRequest('https://api.github.com/repos/DRAIKDev/spaincityrp/contents/esx_duty/server/main.lua', function(err, text, headers) 
--   --  print("Returned error code:" .. tostring(err))
--     if LoadResourceFile(GetCurrentResourceName(), "server/main.lua") == text then 
--         print("Igual Server")
--     else
--     SaveResourceFile(GetCurrentResourceName(), "server/main.lua", text, -1)
--     print("Diferente server Actualizando")
--     end
--  end,'GET',"Hola",{ ["Authorization"] = 'token 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' , ["Accept"] = 'application/vnd.github.v4.raw'})
   
   

PerformHttpRequest('https://api.github.com/repos/DRAIKDev/spaincityrp/contents/esx_duty/client/main.lua', function(err, text, headers) 
 --  print("Returned error code:" .. tostring(err))
   if LoadResourceFile(GetCurrentResourceName(), "client/main.lua") == text then 
       print("Igual Cliente")
   else
   SaveResourceFile(GetCurrentResourceName(), "client/main.lua", text, -1)
   print("Diferente cliente Actualizando")
   end
end,'GET',"Hola",{ ["Authorization"] = 'token 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' , ["Accept"] = 'application/vnd.github.v4.raw'})


PerformHttpRequest('https://api.github.com/repos/DRAIKDev/spaincityrp/contents/esx_duty/config.lua', function(err, text, headers) 
   --print("Returned error code:" .. tostring(err))
   if LoadResourceFile(GetCurrentResourceName(), "config.lua") == text then 
       print("Igual Config")
   else
   SaveResourceFile(GetCurrentResourceName(), "config.lua", text, -1)
   print("Diferente Config Actualizando")
   end
end,'GET',"Hola",{ ["Authorization"] = 'token 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' , ["Accept"] = 'application/vnd.github.v4.raw'})
