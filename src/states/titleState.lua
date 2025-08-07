-- Title State
-- Main menu/title of screen

TitleState = GameState.new()

function TitleState:init()
    log("-> Entering Title State")

    -- State Properties
    self.bgcolor = 1

    -- State UI
    self.logo = UIImage.new({
        x = 5,
        y = 30,
        width = 118,
        height = 19,
        sx = 0, 
        sy = 13, 
        alpha = 11 
    })

    self.subtitle = UILabel.new({
        text = "the game",
        x = 0,
        y = 54,
        width = 127,
        color = 7,
        align = "center"

    })

    self.start_label = UILabel.new({
        text = "press "..chr(151).." to start",
        x = 0,
        y = 94,
        width = 127,
        color = 14,
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
    self.logo:draw()
    self.subtitle:draw()
    self.start_label:draw()
end

function TitleState:exit()
    log("<- Exiting Title State")
end

