require("setup")

-- Utils
require("utils/log")

-- Managers
require("managers/sessionManager")
require("managers/eventManager")
require("managers/gameStateManager")

-- Game States
require("states/base/gameStates")
require("states/titleState")
require("states/gamePlayState")
require("states/gameOverState")

-- Components
require("components/moveable")
require("components/image")

-- Entities
require("entities/base/entity")
require("entities/player")

-- Main entry point for the game
function _init()
    log("=== Game Started ===")

    setup.register_game_states()
    setup.register_event_listeners()

    -- Initialize persistant objects
    sessionManager:init()

    -- Start game in title state
    gameStateManager:switch("title")
end

-- Core loop for game updates
function _update()
    gameStateManager:update()
end

-- Core loop for drawing game
function _draw()
    gameStateManager:draw()
end

