-- Gameplay State
-- Main active playing state

GameplayState = GameState.new()

function GameplayState:init()
    log("-> Entering Gameplay State")

    self.bgcolor = 2
end

function GameplayState:update()
    -- TBD
end

function GameplayState:draw()
    cls(self.bgcolor)
    print("gameplay state", 2, 2)
end

function GameplayState:exit()
    log("<- Exiting Gameplay State")
end


