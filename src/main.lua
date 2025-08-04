require("utils/log")
require("managers/gameStateManager")

-- REVIEW: This creates game states; should it live somewhere else?
require("states/gameStates")

-- Actual game states
require("states/titleState")
require("states/gamePlayState")
require("states/gameOverState")

-- Entities
require("entities/player")

-- Main entry point for the game
function _init()
    log("=== Game Started ===")

    -- Play music pattern from assets/music.p8
    music(0)

    -- REVIEW: Should we consider keeping this somewhere else? gameStateManager:init() perhaps?
    gameStateManager:add("title", TitleState)
    gameStateManager:add("gameplay", GameplayState)
    gameStateManager:add("gameOver",  GameOverState)

    gameStateManager:switch("gameOver")
end

function _update()
    gameStateManager:update()
end

function _draw()
    cls()
    gameStateManager:draw()
end
