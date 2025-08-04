-- Title State
-- Main menu/title of screen

TitleState = GameState.new()

function TitleState:init()
    log("-> Entering Title State")

    -- State Properties
    self.bgcolor = 1
    self.timer = 120
end

function TitleState:update()
    -- Timer countdown
    self.timer -= 1

    -- Show the title screen for 4 seconds (4*30fps) then switch to gameplay
    if (self.timer <= 0) then
        gameStateManager:switch("gameplay")
    end

end

function TitleState:draw()
    cls(self.bgcolor)
    print("title state", 2, 2, 7)

    print(flr(self.timer/30+1).." seconds until gameplay", 2, 12, 7)
end

function TitleState:exit()
    log("<- Exiting Title State")
end

