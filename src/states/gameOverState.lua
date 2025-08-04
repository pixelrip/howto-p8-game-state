-- Game Over State
-- End of game/inactive state

GameOverState = GameState.new()

function GameOverState:init()
    log("-> Entering Game Over State")
    self.bgcolor = 3
end

function GameOverState:update()
    -- TBD
end

function GameOverState:draw()
    cls(self.bgcolor)
    print("game over state", 2, 2)
end

function GameOverState:exit()
    log("<- Exiting Game Over State")
end


