local ISPlaceDiceActionMenu = {};

function ISPlaceDiceActionMenu.perform(_, player, square)
    triggerEvent("OnRolledDiceRequested", player, square)
end

function ISPlaceDiceActionMenu.doMenu(playerId, context, worldobjects)
    local square;
    for i, v in ipairs(worldobjects) do
        square = v:getSquare();
        break;
    end

    local player = getSpecificPlayer(playerId)

    local dice = player:getPrimaryHandItem()
    if dice and dice:getType() == 'Dice' then
        context:addOption(getText("ContextMenu_DiceRolling_RollDiceAction"), worldobjects, ISPlaceDiceActionMenu.perform, player, square)
    end
end

function ISPlaceDiceActionMenu.onRolledDiceDone(player, rolledNumber)
    player:Say(getText("ContextMenu_DiceRolling_RollDiceResult") .. ' ' .. rolledNumber)
end

Events.OnRolledDiceDone.Add(ISPlaceDiceActionMenu.onRolledDiceDone)
Events.OnFillWorldObjectContextMenu.Add(ISPlaceDiceActionMenu.doMenu);
