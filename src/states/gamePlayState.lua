-- Gameplay State
-- Main active playing state

GameplayState = GameState.new()

function GameplayState:init()
    log("-> Entering Gameplay State")

    -- State Properties
    self.bgcolor = 2
    self.timer = 150

end

function GameplayState:update()
    self.timer -= 1

    -- Show the gameplay screen for 5 seconds (4*30fps) then switch to gameplay
    if (self.timer <= 0) then
        gameStateManager:switch("gameOver")
    end
end

function GameplayState:draw()
    cls(self.bgcolor)
    print("gameplay state", 2, 2, 7)

    print(flr(self.timer/30+1).." seconds until game over", 2, 12, 7)

end

function GameplayState:exit()
    log("<- Exiting Gameplay State")
end


