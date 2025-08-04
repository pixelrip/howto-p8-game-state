-- Title State
-- Main menu/title of screen

TitleState = GameState.new()

function TitleState:init()
    log("-> Entering Title State")

    -- State Properties
    self.bgcolor = 1
end

function TitleState:update()
    -- TBD
end

function TitleState:draw()
    cls(self.bgcolor)
    print("title state", 2, 2, 7)
end

function TitleState:exit()
    log("<- Exiting Title State")
end


