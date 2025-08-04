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

    gameStateManager:switch("title")

    -- DEMO FUNCTIONALITY
    -- Code only exists in the core game loop to demonstrate how states are handled
    demo = {
        timer = 0,
        states = {"title", "gameplay", "gameOver"},
        currentState = 1
    }

    log("demo created:")
    log("   -> demo.timer = "..demo.timer)
    log("   -> #demo.states = "..#demo.states)
    log("   -> demo.currentState = "..demo.currentState)
end

function _update()
    gameStateManager:update()


    -- DEMO FUNCTIONALITY
    if (demo.timer >= 120) then
        demo.timer = 0
        demo.currentState += 1
    
        if (demo.currentState > #demo.states) then
            demo.currentState = 1
        end

        -- Change state
        gameStateManager:switch(demo.states[demo.currentState])
    else
        demo.timer += 1
    end

end

function _draw()
    cls()
    gameStateManager:draw()

    -- DEMO FUNCTIONALITY
    print(flr(demo.timer/30+1).." of 4 seconds", 2, 22, 7)
end

