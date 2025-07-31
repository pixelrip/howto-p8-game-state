-- Player Class

Player = {}
Player.__index = Player

-- Constructor for Player
function Player:new(x,y)
    local self = setmetatable({}, Player)
    
    -- Magic Numbers
    self.x = x or 0
    self.y = y or 0
    self.width = 15
    self.height = 11
    self.sprite_x = 8
    self.sprite_y = 0 


    function self:update()
        -- Player update logic
    end

    function self:draw()
        -- Player drawing logic
        sspr(self.sprite_x, self.sprite_y, self.width, self.height, self.x, self.y)
    end


    return self
end


