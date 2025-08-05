-- Game Boostrap / Setup 

setup = {}

function setup.register_game_states()
    gameStateManager:add("title", TitleState)
    gameStateManager:add("gameplay", GameplayState)
    gameStateManager:add("gameOver",  GameOverState)
end

function setup.register_event_listeners()
    eventManager:subscribe("player_off_screen", function()
        gameStateManager:switch("gameOver")
    end)
    
    eventManager:subscribe("start_button_pressed", function()
        gameStateManager:startTransition("gameplay")
    end)

    eventManager:subscribe("restart_game_requested", function()
        gameStateManager:switch("gameplay")
    end)
end
