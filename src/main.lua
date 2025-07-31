require("utils/log")
require("entities/player")

-- Main entry point for the game
function _init()
    log("=== Game Started ===")

    -- Play music pattern from assets/music.p8
    music(0)

    -- Create player instance
    player = Player:new(57, 60)
end

function _update()
    player:update()
end

function _draw()
    cls()
    player:draw()
end
