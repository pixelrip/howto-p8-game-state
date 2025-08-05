-- Gameplay State
-- Main active playing state

GameplayState = GameState.new()

function GameplayState:init()
    log("-> Entering Gameplay State")

    -- State Properties
    self.bgcolor = 0
    self.player = sessionManager:getEntity("player")
end

function GameplayState:update()
    self.player:update()
end

function GameplayState:draw()
    cls(self.bgcolor)

    print("gameplay state", 2, 2, 7)
    self.player:draw()
end

function GameplayState:exit()
    log("<- Exiting Gameplay State")
end


