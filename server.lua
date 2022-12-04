local QBCore = exports['qb-core']:GetCoreObject()

-- Criar item usavel para spawn da mesa
QBCore.Functions.CreateUseableItem('coke_table', function(source, item)
    TriggerClientEvent('mt-coke:client:ColocarMesa', source)
end)

-- Evento de processo
RegisterNetEvent('mt-coke:server:ProcessarCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke_leaf = Player.Functions.GetItemByName('coke_leaf')
    local coke_empty_bags = Player.Functions.GetItemByName('empty_weed_bag')
    if coke_leaf ~= nil and coke_empty_bags ~= nil and coke_empty_bags.amount >= 30 and coke_leaf.amount >= 20 then

        Player.Functions.RemoveItem('coke_leaf', 20)
        Player.Functions.RemoveItem('empty_weed_bag', 30)
        Player.Functions.AddItem('coke_bags', 30)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke_bags'], "add", 1)
    else
        TriggerClientEvent("QBCore:Notify", src, "MISSING ITEMS", "error")
        end
end)

-- Apanhar coke
RegisterNetEvent('mt-coke:server:ApanharCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randomizer = math.random(1,6)
    Player.Functions.AddItem('coke_leaf', randomizer)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke_leaf'], "add", randomizer)
end)

