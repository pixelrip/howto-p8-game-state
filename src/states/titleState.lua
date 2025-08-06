-- Title State
-- Main menu/title of screen

TitleState = GameState.new()

function TitleState:init()
    log("-> Entering Title State")

    -- State Properties
    self.bgcolor = 1

    self.start_label = Label.new({
        text = "press "..chr(151).." to start",
        x = 0,
        y = 24,
        width = 127,
        color = 7,
        align = "center"
    })
end

function TitleState:update()

    -- Wait for button input
    if (btnp(5)) then
        eventManager:publish("start_button_pressed")
    end


end

function TitleState:draw()
    cls(self.bgcolor)
    print("title state!", 2, 2, 7)
    self.start_label:draw()
end

function TitleState:exit()
    log("<- Exiting Title State")
end

