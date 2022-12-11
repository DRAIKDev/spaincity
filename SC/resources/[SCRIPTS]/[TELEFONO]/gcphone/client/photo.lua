-- Author: Xinerki (https://forum.fivem.net/t/release-cellphone-camera/43599)

phone = false
phoneId = 0

RegisterNetEvent('camera:open')
AddEventHandler('camera:open', function()
    CreateMobilePhone(1)
	CellCamActivate(true, true)
	phone = true
    PhonePlayOut()
end)

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end
TakePhoto = N_0xa67c35c56eb1bd9d
WasPhotoTaken = N_0x0d6ca79eeebd8ca3
SavePhoto = N_0x3dec726c25a11bac
ClearPhoto = N_0xd801cc02177fa3f1
Citizen.CreateThread(function()
	DestroyMobilePhone()
	while true do
		Citizen.Wait(0)
				
		if IsControlJustPressed(1, 177) and phone == true then -- CLOSE PHONE
			DestroyMobilePhone()
			phone = false
			CellCamActivate(false, false)
			if firstTime == true then 
				firstTime = false 
				Citizen.Wait(2500)
				displayDoneMission = true
			end
		end	
		if IsControlJustPressed(1, 176) and phone == true then -- TAKE.. PIC LEFT MOUSE BUTTON
			TakePhoto()
			exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/956312846617161798/C3o6UopCAFVDc3JXHwE865_1uQBDs0jcNRYAY2kfFMsyMead2iN-RzEM5V9oVineJ7iy', 'files[]', function(data2)
				DestroyMobilePhone()
				CellCamActivate(false, false)
				local resp = json.decode(data2)
				test = resp.attachments[1].proxy_url
				print(resp.attachments[1].proxy_url)
	TriggerEvent("MECAGOENELPUTOMOVILDELASPELOTASOSTIAYA",test)
				deletePhone()

			end)
			if (WasPhotoTaken() and SavePhoto(-1)) then
				ClearPhoto()
			end
		end
		
		if IsControlJustPressed(1, 27) and phone == true then -- SELFIE MODE
			frontCam = not frontCam
			CellFrontCamActivate(frontCam)
		end
			
		if phone == true then
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(8)
			HideHudComponentThisFrame(9)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(19)
			HideHudAndRadarThisFrame()
		end
			
		ren = GetMobilePhoneRenderId()
		SetTextRenderId(ren)
		
		-- Everything rendered inside here will appear on your phone.
		
		SetTextRenderId(1) -- NOTE: 1 is default
	end
end)


