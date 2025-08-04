-- Game Over State
-- End of game/inactive state

GameOverState = GameState.new()

function GameOverState:init()
    log("-> Entering Game Over State")

    -- State Properties
    self.bgcolor = 3
    self.timer = 120
end

function GameOverState:update()
    -- Timer countdown
    self.timer -= 1

    -- Show the title screen for 3 seconds then switch to title
    if (self.timer <= 0) then
        gameStateManager:switch("gameplay")
    end
end

function GameOverState:draw()
    cls(self.bgcolor)
    print("game over state", 2, 2, 7)

    print(flr(self.timer/30+1).." seconds until restart", 2, 12, 7)
end

function GameOverState:exit()
    log("<- Exiting Game Over State")
end


