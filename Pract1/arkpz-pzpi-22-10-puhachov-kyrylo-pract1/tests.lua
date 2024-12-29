local luaunit = require("luaunit")
local player = require("player")

function testScoreUpdate()
    player.init(100, 5)
    player.updateScore(10)
    luaunit.assertEquals(player.score, 110)
end

function testHealthUpdate()
    player.init(100, 5)
    player.updateHealth(-2)
    luaunit.assertEquals(player.health, 3)
end

os.exit(luaunit.LuaUnit.run())
