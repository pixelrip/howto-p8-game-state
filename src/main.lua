require("utils/log")

-- Managers
require("managers/eventManager")
require("managers/gameStateManager")

-- Game States
require("states/base/gameStates")
require("states/titleState")
require("states/gamePlayState")
require("states/gameOverState")

-- Entities
require("entities/player")

-- Main entry point for the game
function _init()
    log("=== Game Started ===")

    -- Register game states
    gameStateManager:add("title", TitleState)
    gameStateManager:add("gameplay", GameplayState)
    gameStateManager:add("gameOver",  GameOverState)

    -- Start game in title state
    gameStateManager:switch("title")

    -- Events
    eventManager:subscribe("player_off_screen", function()
        gameStateManager:switch("gameOver")
    end)
end

function _update()
    gameStateManager:update()
end

function _draw()
    gameStateManager:draw()
end

