
function GetMinimapAnchor()
    -- Safezone goes from 1.0 (no gap) to 0.9 (5% gap (1/20))
    -- 0.05 * ((safezone - 0.9) * 10)
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
	local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.is_widescreen = GetIsWidescreen()
    Minimap.is_window = not isCommonAspectRation(res_x,res_y)
    Minimap.aspect_ratio = aspect_ratio
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    if (Minimap.is_widescreen and aspect_ratio > 2) then
        if(Minimap.is_window) then
            Minimap.left_x = Minimap.left_x + Minimap.width * 1.17
            Minimap.width = Minimap.width * 1.025
        else
            Minimap.left_x = Minimap.left_x + Minimap.width * 1.17
            Minimap.width = Minimap.width * 1.025
        end
	elseif aspect_ratio > 2 then
		Minimap.left_x = Minimap.left_x + Minimap.width * 0.845
		Minimap.width = Minimap.width * 0.76
    elseif aspect_ratio > 1.7 then
        if(Minimap.is_window) then
            if(Minimap.is_widescreen) then
		        Minimap.left_x = Minimap.left_x + Minimap.width * 0.11
                Minimap.width = Minimap.width * 1.025
            else
		        Minimap.left_x = Minimap.left_x + Minimap.width * 0.2225
                Minimap.width = Minimap.width * 0.995
            end
        end
    end
    
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    Minimap.res_x = res_x
    Minimap.res_y = res_y
    
    return Minimap
end
function isCommonAspectRation(w,h)
    if h == (w/16)*9 then 
        return true 
    elseif h == (w/4)*3 then 
        return true
    elseif h == (w/16)*10 then 
        return true
    elseif h == (w/21)*9 then 
        return true
    elseif h == (w/64)*27 then 
        return true
    elseif h == (w/5)*4 then 
        return true
    elseif h == (w/3)*2 then 
        return true
    elseif h == (w/32)*9 then 
        return true
    else
        return false 
    end
  end
local lastNotification = ""
local lastNotificationTime = 0
local lastNotificationCount = 0
function ShowNotification(msg, job)
    draikSendNotification({text = msg},job)
end
function draikConvertLuaTextIntoHtml(text, job)
    text = text:gsub("~r~", "<span class='red'>") 
    text = text:gsub("~b~", "<span class='blue'>")
    text = text:gsub("~g~", "<span class='green'>")
    text = text:gsub("~y~", "<span class='yellow'>")
    text = text:gsub("~p~", "<span class='purple'>")
    text = text:gsub("~c~", "<span class='grey'>")
    text = text:gsub("~m~", "<span class='darkgrey'>")
    text = text:gsub("~u~", "<span class='black'>")
    text = text:gsub("~o~", "<span class='gold'>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~b~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span>" .. text .. "</span>"    
    return text
end


function draikSetQueueMax(queue, max)
    local tmp = {
        queue = tostring(queue),
        max = tonumber(max)
    }
    SendNUIMessage({maxNotifications = tmp})
end

function ShowProgressBar(time, text) 
	SendNUIMessage({
		type = "ui",
		display = true,
		time = time,
		text = text
	})
end

function DrawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
    local radarShowing = IsMinimapRendering()
    SendNUIMessage({
        setMinimap = true,
        minimap  = GetMinimapAnchor()
    })
    SendNUIMessage({
        radarChanged = true,
        isShowing    = radarShowing
    })
    while true do
		Citizen.Wait(1000)
        if(IsMinimapRendering())then
            if(not radarShowing)then
                SendNUIMessage({
                    setMinimap = true,
                    minimap  = GetMinimapAnchor()
                })
                SendNUIMessage({
                    radarChanged = true,
                    isShowing    = true
                })
                radarShowing = true
            end
        else
            if(radarShowing)then
                SendNUIMessage({
                    radarChanged = true,
                    isShowing    = false
                })
                radarShowing = false
            end
        end
    end
end)
awaitResponse = {}
awaitInProgress = false
function IsMinValueInTable(tbl, value)
    local isMin = true
    for _,val in pairs(tbl) do
        if(val < value)then
            isMin = false
        end
    end
    return isMin
end
function RemoveValueInTable(tbl, value)
    for ix,val in ipairs(tbl) do
        if(val == value)then
            table.remove(tbl,ix)
        end
    end
end
function CurrentNotification()
    local minKey = math.huge
    for k,v in pairs(awaitResponse) do
        minKey = math.min(tonumber(k), minKey)
    end
    if(minKey == math.huge)then
        return nil
    end
    return minKey
end
RegisterNUICallback(
    "notification_afterClose",
    function(data, cb)
        if(data['id'] ~= nil) then
            if(awaitResponse[tostring(data['id'])] ~= nil)then
                awaitResponse[tostring(data['id'])] = nil
            end
        end
    end
)
Citizen.CreateThread(function()
    local answered = false
    while true do
        local currentNotificationId = CurrentNotification()
        if(currentNotificationId ~= nil and awaitResponse[tostring(currentNotificationId)] ~= nil)then
            local accepted = false
            if IsControlJustReleased (1, 10) then --N+
                accepted = true
                answered = true
            elseif IsControlJustReleased (1, 11) then --N-
                answered = true
            end
            if(answered)then
                answered = false
                if(accepted) then
                    awaitResponse[tostring(currentNotificationId)].cb(true)
                end
                awaitResponse[tostring(currentNotificationId)] = nil
                SendNUIMessage({
                    promptClose = true,
                    notificationId = currentNotificationId
                })
            end
        end
        Citizen.Wait(1)
    end
end)

function draikSendPrompt(options, jobs, cb) 
    options.text = options.text .. ' <div style="margin-top:5px;text-align:end"><font color="lime">[RePag]</font> <font color="red">[AvPag]</font></div>'
    options.timeout = 30000
    local notificationId = draikSendNotification(options, jobs)
    awaitResponse[tostring(notificationId)] = {cb = cb}
end 

function draikSendNotification(options, job)
    options.animation = options.animation or {}
    options.sounds = options.sounds or {}
    options.docTitle = options.docTitle or {}
    timeout = options.timeout or 10000
    if(options.timeout ~= nil and options.timeout == -1)then
        timeout = false
    end
    local options = {
        type = options.type or "alert",
        layout = options.layout or "forasteros",
        theme = options.theme or "forasteros",
        text = draikConvertLuaTextIntoHtml(options.text, job) or "Empty Notification",
        timeout = timeout,
        progressBar = true,
        closeWith = options.closeWith or {},
        animation = {
            open = options.animation.open or "animated fadeInUp",
            close = options.animation.close or "animated fadeOut"
        },
        sounds = {
            volume = options.sounds.volume or 1,
            conditions = options.sounds.conditions or {},
            sources = options.sounds.sources or {}
        },
        docTitle = {
            conditions = options.docTitle.conditions or {}
        },
        modal = options.modal or false,
        id = options.id or false,
        force = options.force or false,
        queue = options.queue or "global",
        killer = options.killer or false,
        container = options.container or false,
        buttons = options.button or false
    }
    if(job ~= nil) then
        options.type = job .. "_" .. options.type
        options.layout = "centerRight"
    end
    if(lastNotification ~=nil and lastNotification.text == options.text and lastNotificationTime > GetGameTimer() - 1000)then
        lastNotificationCount = lastNotificationCount + 1
    end
    if(lastNotification == nil or lastNotification.text ~= options.text or lastNotificationTime <= GetGameTimer() - 1000)then --avoid duplicate notifications
        if(lastNotificationCount > 0) then
            if(lastNotification.text == options.text)then
                options.text = options.text .. " (x" ..lastNotificationCount.. ")"
            end
            lastNotificationCount = 0
        end
        lastNotification = options
        lastNotificationTime = GetGameTimer()
        options.id = lastNotificationTime
        SendNUIMessage({options = options})
        if(job ~= nil and job ~= '') then
            PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        end
    end
    Citizen.Wait(500)
    return lastNotificationTime
end

RegisterNetEvent("esx_notifications:SendNotification")
AddEventHandler("esx_notifications:SendNotification", function(options, job)
    draikSendNotification(options, job)
end)
RegisterNetEvent("esx_notifications:SendPrompt")
AddEventHandler("esx_notifications:SendPrompt", function(options, job, cb)
    draikSendPrompt(options, job, cb)
end)

RegisterNetEvent("esx_notifications:SetQueueMax")
AddEventHandler("esx_notifications:SetQueueMax", function(queue, max)
    draikSetQueueMax(queue, max)
end)

RegisterNetEvent("esx_notifications:DrawTxt")
AddEventHandler("esx_notifications:DrawTxt", function(x, y, width, height, scale, text, r, g, b, a, outline)
    DrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
end)
RegisterNetEvent("esx_notifications:ShowNotification")
AddEventHandler("esx_notifications:ShowNotification", function(msg, job)
    ShowNotification(msg, job)
end)
RegisterNetEvent("esx_notifications:ShowProgressBar")
AddEventHandler("esx_notifications:ShowProgressBar", function(time, text)
    ShowProgressBar(time, text)
end)
RegisterNetEvent("esx_notifications:ShowAdvancedNotification")
AddEventHandler("esx_notifications:ShowAdvancedNotification", function(title, subject, msg, icon, iconType, job)
    ShowAdvancedNotification(title, subject, msg, icon, iconType, job)
end)



-- --------------------------------------------
-- Settings
-- --------------------------------------------

local body = {
	-- Text
	scale = 0.3,
	offsetLine = 0.02,
	-- Warp
	offsetX = 0.005,
	offsetY = 0.004,
	-- Sprite
	dict = 'WS_commonmenu',
	sprite = 'gradient_bgd',
	width = 0.14,
	height = 0.012,
	heading = -90.0,
	-- Betwenn != notifications
	gap = 0.002,
}

local defaultText = '~r~~h~ERROR : ~h~~s~The text of the notification is nil.'
local defaultType = 'topRight'
local defaultTimeout = 6000

-- --------------------------------------------
-- Calculus functions
-- --------------------------------------------

local function goDown(v, id) -- Notifications will go under the previous notifications
	for i = 1, #v do
		if v[i].draw and i ~= id then
			v[i].y = v[i].y + (body.height + (v[id].lines*2 + 1)*body.offsetLine)/2 + body.gap
		end
	end
end

local function goUp(v, id) -- Notifications will go above the previous notifications
	for i = 1, #v do
		if v[i].draw and i ~= id then
			v[i].y = v[i].y - (body.height + (v[id].lines*2 + 1)*body.offsetLine)/2 - body.gap
		end
	end
end

local function centeredDown(v, id) -- Notification will stay centered from the default position and new notification will go at the bottom
	for i = 1, #v do
		if v[i].draw and i ~= id then
			v[i].y = v[i].y - (body.height + (v[id].lines*2 + 1)*body.offsetLine)/4 - body.gap/2
			v[id].y = v[i].y + (body.height + (v[id].lines*2 + 1)*body.offsetLine)/2 + body.gap
		end
	end
end

local function centeredUp(v, id) -- Notification will stay centered from the default position and new notification will go at the top
	for i = 1, #v do
		if v[i].draw and i ~= id then
			v[i].y = v[i].y + (body.height + (v[id].lines*2 + 1)*body.offsetLine)/4 + body.gap/2
			v[id].y = v[i].y - (body.height + (v[id].lines*2 + 1)*body.offsetLine)/2 - body.gap
		end
	end
end

local function CountLines(v, text)
	BeginTextCommandLineCount("STRING")
    SetTextScale(body.scale, body.scale)
    SetTextWrap(v.x, v.x + body.width - body.offsetX)
	AddTextComponentSubstringPlayerName(text)
	local nbrLines = GetTextScreenLineCount(v.x + body.offsetX, v.y + body.offsetY)
	return nbrLines
end

local function DrawText(v, text)
	SetTextScale(body.scale, body.scale)
    SetTextWrap(v.x, v.x + body.width - body.offsetX)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(v.x + body.offsetX, v.y + body.offsetY)
end

local function DrawBackground(v)
    DrawSprite(body.dict, body.sprite, v.x + body.width/2, v.y + (body.height + v.lines*body.offsetLine)/2, body.width, body.height + v.lines*body.offsetLine, body.heading, 255, 255, 255, 255)
end

-- --------------------------------------------
-- Different options
-- --------------------------------------------

local positions = {
	['centerRight'] = { x = 0.85, y = 0.5, notif = {}, offset = centeredUp },
	['centerLeft'] = { x = 0.01, y = 0.5, notif = {}, offset = centeredUp },
	['topRight'] = { x = 0.85, y = 0.015, notif = {}, offset = goDown },
	['topLeft'] = { x = 0.01, y = 0.015, notif = {}, offset = goDown },
	['bottomRight'] = { x = 0.85, y = 0.955, notif = {}, offset = goUp },
	['bottomLeft'] = { x = 0.015, y = 0.75, notif = {}, offset = goUp },
	-- ['position name'] = { starting x, starting y, notif = {} (nothing toput here it's juste the handle), offset = the way multiple notifications will stack up}
}

-- --------------------------------------------
-- Main
-- --------------------------------------------

function SendNotification(options)
  
	local text = options.text or defaultText
	local type = options.type or defaultType
	local timeout = options.timeout or defaultTimeout

	local p = positions[type]
	local id = #p.notif + 1
	local nbrLines = CountLines(p, text)

	p.notif[id] = {
		x = p.x,
		y = p.y,
		lines = nbrLines, 
		draw = true,
	}

	if id > 1 then
		p.offset(p.notif, id)
	end

	Citizen.CreateThread(function()
		Wait(timeout)
		p.notif[id].draw = false
	end)

	Citizen.CreateThread(function()
		while p.notif[id].draw do
			Wait(0)
			DrawBackground(p.notif[id])
			DrawText(p.notif[id], text)
		end
	end)
end

function ShowNativeNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function ShowAdvancedNotification(title, subject, msg, icon, iconType, job)
    local advanceMsg = "<div style='color:lime;font-size:16px'>" .. title .. " - " .. subject .. "</div><div>" .. msg .. "</div>"
    if(icon ~= nil)then
    --    advanceMsg = "<div ><table style='color:white;font-size:14px''><tr><td><img height=50 src='./img/sc.png'></td><td style='vertical-align:top'><div style='color:lime;font-size:16px'>" .. title .. "</div>" .. subject .. "</td></tr><tr><td colspan=2>" .. msg .. "</td></tr></table></div>"
    advanceMsg = "<div ><table style='color:white;font-size:14px''><tr><td><img height=50 src='./img/logo.png'></td><td style='vertical-align:top'><div style='color:lime;font-size:16px'>" .. title .. "</div>" .. subject .. "</td></tr><tr><td colspan=2>" .. msg .. "</td></tr></table></div>"
    
end
    draikSendNotification({text = advanceMsg},job)
end