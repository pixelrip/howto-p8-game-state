-- Player Class
Player = {}

-- Extend the entity class
setmetatable(Player,{__index = Entity})

Player.__index = Player

-- Player Constants
Player.START_X = 55
Player.START_Y = 30
Player.BASE_W = 17
Player.BASE_H = 13

-- Constructor for Player
function Player.new(x,y)
    -- Create the base entity:
    local self = Entity.new(Player.START_X, Player.START_Y, Player.BASE_W, Player.BASE_H)

    -- Turn the entity into a Player
    setmetatable(self, Player)
    
    -- Set Player Properties
    self.is_locked = false
    
    -- Components
    self.image = Image.new(self,8,0,11) -- Magic numbers :(
    self.moveable = Moveable.new(self)
   
    return self
end

function Player:update()
    -- Handle input for immediate movement
    if not self.is_locked then
        if (btn(0)) then self.x -= 1 end
        if (btn(1)) then self.x += 1 end
        if (btn(2)) then self.y -= 1 end
        if (btn(3)) then self.y += 1 end
    end
    
    -- Components
    self.moveable:update()

    -- Events
    if self:isOffScreen() then
        eventManager:publish("player_off_screen")
    end
end

function Player:draw()
    self.image:draw()
end

function Player:reset()
    self.moveable:moveTo(Player.START_X, Player.START_Y)
end

function Player:isOffScreen()
    if self.x + self.w <= 0 then return true end
    if self.x >= 128 then return true end
    if self.y + self.h <= 0 then return true end
    if self.y >= 128 then return true end
    return false
end

function Player:lock()
    self.is_locked = true
end

function Player:unlock()
    self.is_locked = false
end

