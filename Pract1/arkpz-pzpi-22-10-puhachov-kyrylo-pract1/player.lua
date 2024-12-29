local json = require("dkjson")

local player = {
    score = 0,
    health = 0,
    max_health = 5
}

function player.init(starting_score, max_health)
    player.score = starting_score
    player.health = max_health
    player.max_health = max_health
end

function player.updateScore(points)
    player.score = player.score + points
    print("Рахунок оновлено! Новий рахунок: " .. player.score)
end

function player.updateHealth(change)
    player.health = math.max(0, math.min(player.health + change, player.max_health))
    print("Здоров'я оновлено! Здоров'я: " .. player.health)
end

function player.printStatus()
    print("=== Стан гравця ===")
    print("Рахунок: " .. player.score)
    print("Здоров'я: " .. player.health .. "/" .. player.max_health)
end

function player.saveState(filename)
    local data = {
        score = player.score,
        health = player.health
    }
    local file = io.open(filename, "w")
    file:write(json.encode(data))
    file:close()
end

function player.loadState(filename)
    local file = io.open(filename, "r")
    if file then
        local data = json.decode(file:read("*a"))
        player.score = data.score or 0
        player.health = data.health or player.max_health
        file:close()
    else
        print("Помилка: файл не знайдено.")
    end
end

return player
