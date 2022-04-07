--MADE BY DareToDoyle#3835--
--Modified by SweetsMarie--

QBCore = exports['qb-core']:GetCoreObject()

 QBCore.Functions.CreateUseableItem('adrenaline', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('adrenaline', 1, itemslot)
	TriggerClientEvent('D2D-Stims:adrenaline', source)
	
end)

 QBCore.Functions.CreateUseableItem('meldonin', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('meldonin', 1, itemslot)
	TriggerClientEvent('D2D-Stims:meldonin', source)
	
end)

 QBCore.Functions.CreateUseableItem('anesthetic', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('anesthetic', 1, itemslot)
	TriggerClientEvent('D2D-Stims:anesthetic', source)
	
end)

 QBCore.Functions.CreateUseableItem('ketamine', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('ketamine', 1, itemslot)
	TriggerClientEvent('D2D-Stims:ketamine', source)
	
end)

--MADE BY DareToDoyle#3835--
