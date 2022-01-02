SRollingDiceSystem = {}

SRollingDiceSystem.OnRolledDiceAction = function (player, square)
    local dice = player:getPrimaryHandItem()

    if dice and dice:getType() == 'Dice' then
        local rolledNumber = ZombRand(1, 6)

        square:AddWorldInventoryItem(dice, 0.5, 0.5, 0)
        player:removeFromHands(dice);
        player:getInventory():Remove(dice);

        triggerEvent("OnRolledDiceDone", player, rolledNumber)
    end
end

Events.OnRolledDiceRequested.Add(SRollingDiceSystem.OnRolledDiceAction)
