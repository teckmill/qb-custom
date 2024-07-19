QBCore = {}
QBCore.Functions = {}

QBCore.Functions.GetPlayer = function(player)
    local char = exports.oxmysql:fetchSync("SELECT * FROM characters WHERE citizenid = ?", player.citizenid)
    return char
end

QBCore.Functions.HasItem = function(char, item)
    local items = exports.oxmysql:fetchSync("SELECT * FROM character_items WHERE character_id = ? AND item = ?", char.id, item)
    return items and #items > 0
end

QBCore.Functions.UpdatePlayer = function(char)
    exports.oxmysql:executeSync("UPDATE characters SET job = ?, last_job_switch = ? WHERE id = ?", char.job, char.last_job_switch, char.id)
end

QBCore.Functions.SetPlayerLastJobSwitch = function(player)
    local char = QBCore.Functions.GetPlayer(player)
    char.last_job_switch = os.time()
    QBCore.Functions.UpdatePlayer(char)
end