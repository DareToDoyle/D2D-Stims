--MADE BY DareToDoyle#3835--
--Modified by SweetsMarie--

QBCore = exports['qb-core']:GetCoreObject()

local ketEffects = false
local meldoninEffects = false

local function loadAnimDict(dict) -- interactions, job,
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

RegisterNetEvent('D2D-Stims:adrenaline')
AddEventHandler('D2D-Stims:adrenaline', function()
    local player = PlayerPedId()
		
	RequestAnimDict("mp_arresting")
    	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)    
	SendNUIMessage({sound = "stimshot", volume = 0.2})     
    
	Citizen.Wait(5000)
	
	QBCore.Functions.Notify('Adrenaline Stimulant has been taken!')
	AnimpostfxPlay("SuccessFranklin", 0, false)
    	ShakeGameplayCam("DRUNK_SHAKE", 0.3)
	AnimpostfxStopAll()
	SetEntityHealth(player, GetEntityMaxHealth(player))
	
	Citizen.Wait(25000) -- HOW LONG THE EFFECT LASTS (25 seconds)
	
	SendNUIMessage({sound = "heartbeat", volume = 0.6}) 
	QBCore.Functions.Notify('The effects of the Adrenaline Stimulant have now gone.')
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
end)

RegisterNetEvent('D2D-Stims:meldonin')
AddEventHandler('D2D-Stims:meldonin', function()
    local player = PlayerPedId()
	
	RequestAnimDict("mp_arresting")
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)    
	SendNUIMessage({sound = "stimshot", volume = 0.2})     
    
	Citizen.Wait(5000)
	
	QBCore.Functions.Notify('Meldonin Stimulant has been taken!')
	AnimpostfxPlay("SuccessFranklin", 0, false)
	meldoninEffects = true
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
	AnimpostfxStopAll()
	
	Citizen.Wait(25000) -- HOW LONG THE EFFECT LASTS (25 seconds)
	
	SendNUIMessage({sound = "heartbeat", volume = 0.6}) 
	meldoninEffects = false
	QBCore.Functions.Notify('The effects of the Meldonin Stimulant have now gone.')
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
end)

RegisterNetEvent('D2D-Stims:anesthetic')
AddEventHandler('D2D-Stims:anesthetic', function()
    local player = PlayerPedId()
	
	RequestAnimDict("mp_arresting")
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)    
	SendNUIMessage({sound = "stimshot", volume = 0.2})     
    
	Citizen.Wait(5000)
	
	QBCore.Functions.Notify('Anesthetic Stimulant has been taken!')
	
	AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
	AnimpostfxStopAll()
	SetPedArmour(player, 100)
	
	Citizen.Wait(25000) -- HOW LONG THE EFFECT LASTS (25 seconds)
	
	SendNUIMessage({sound = "heartbeat", volume = 0.6}) 
	QBCore.Functions.Notify('The effects of the Anesthetic Stimulant have now gone.')
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
end)

RegisterNetEvent('D2D-Stims:ketamine')
AddEventHandler('D2D-Stims:ketamine', function()
    local player = PlayerPedId()
	
	RequestAnimDict("mp_arresting")
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)    
	SendNUIMessage({sound = "stimshot", volume = 0.2})     
	
	Citizen.Wait(5000)
	
	SendNUIMessage({sound = "ketamine", volume = 0.5}) 
	
	Citizen.Wait(500)
	
	QBCore.Functions.Notify('Ketamine has been taken!')
	AnimpostfxPlay("SuccessFranklin", 0, false)
	ShakeGameplayCam("DRUNK_SHAKE", 0.3)
	ketEffects = true
	disco = true
	
	Citizen.Wait(25000) -- HOW LONG THE EFFECT LASTS (25 seconds)
	
	SendNUIMessage({sound = "heartbeat", volume = 0.6}) 
	disco = false
	AnimpostfxStopAll()
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	ketEffects = false
	QBCore.Functions.Notify('The effects of the Ketamine have now gone.')
end)

-- Effect Functions (You can play around with this if you know what you're doing)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        if meldoninEffects == true then
        	SetPedMoveRateOverride(PlayerId(),10.0)
            SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
			RestorePlayerStamina(PlayerId(), 1.0)
        elseif meldoninEffects == false then
        	SetPedMoveRateOverride(PlayerId(),1.0)
            SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        if ketEffects == true then
        	RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
	        SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0)
        elseif ketEffects == false then
        	ResetPedMovementClipset(GetPlayerPed(-1))
	        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
	        ResetPedStrafeClipset(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if disco == true then
        	AnimpostfxPlay("PPOrange", 0, false)
			Citizen.Wait(600)
			AnimpostfxStopAll()
            AnimpostfxPlay("PPGreen", 0, false)
			Citizen.Wait(600)
			AnimpostfxStopAll()
			AnimpostfxPlay("PPPink", 0, false)
			Citizen.Wait(600)
			AnimpostfxStopAll()
			AnimpostfxPlay("PPPurple", 0, false)
			Citizen.Wait(600)
			AnimpostfxStopAll()
	    elseif disco == false then
		
        end
    end
end)

--MADE BY DareToDoyle#3835--
