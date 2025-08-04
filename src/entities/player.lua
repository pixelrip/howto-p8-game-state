-- Player Class

Player = {}
Player.__index = Player

-- Constructor for Player
function Player.new(x,y)
    local self = setmetatable({}, Player)
    
    -- Magic Numbers
    self.x = x or 0
    self.y = y or 0
    self.width = 15
    self.height = 11
    self.sprite_x = 8
    self.sprite_y = 0 

    return self
end

function Player:update()
    if (btn(0)) then self.x -= 1 end
    if (btn(1)) then self.x += 1 end
    if (btn(2)) then self.y -= 1 end
    if (btn(3)) then self.y += 1 end

    if self:isOffScreen() then
        eventManager:publish("player_off_screen")
    end
end

function Player:draw()
    -- Player drawing logic
    sspr(self.sprite_x, self.sprite_y, self.width, self.height, self.x, self.y)

    print(self.x..", "..self.y, 2, 119)
end

function Player:isOffScreen()
    if self.x + self.width <= 0 then return true end
    if self.x >= 128 then return true end
    if self.y + self.height <= 0 then return true end
    if self.y >= 128 then return true end
    return false
end



