
RegisterNetEvent('detectadaarmaeneljugador')
AddEventHandler('detectadaarmaeneljugador', function(wh)
	local _source = source
    local texto = "Se ha detectado un "..wh.." en tu inventario que no corresponde con la base de datos, abre ticket"
    TriggerEvent("8882738273-GYSYAG7IH9APNSA-SPAINCITYDRAIK",_source,texto)
end)
