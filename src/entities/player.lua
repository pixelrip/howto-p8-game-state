-- Player Class

Player = {}
Player.__index = Player

-- Constructor for Player
function Player.new(x,y)
    local self = setmetatable({}, Player)
    
    self.x = x or 0
    self.y = y or 0
    self.width = 15
    self.height = 11
    self.sprite_x = 8
    self.sprite_y = 0 
    self.is_locked = false
    
    -- Movement animation properties
    self.target_x = self.x
    self.target_y = self.y
    self.animating_speed = 0.1  -- How fast to interpolate (0-1, higher = faster)
    self.is_animating = false

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
    
    -- Handle gradual movement to target position
    if self.is_animating then
        local dx = self.target_x - self.x
        local dy = self.target_y - self.y
        
        -- Check if we're close enough to the target
        if abs(dx) < 0.5 and abs(dy) < 0.5 then
            -- Snap to target and stop moving
            self.x = self.target_x
            self.y = self.target_y
            self.is_animating = false
        else
            -- Move towards target
            self.x = self.x + dx * self.animating_speed
            self.y = self.y + dy * self.animating_speed
        end
    end

    if self:isOffScreen() then
        eventManager:publish("player_off_screen")
    end
end

function Player:draw()
    -- Player drawing logic
    sspr(self.sprite_x, self.sprite_y, self.width, self.height, self.x, self.y)

    print(self.x..", "..self.y, 2, 119)
end

function Player:animateTo(x,y)
    self.target_x = x
    self.target_y = y
    self.is_animating = true
end

-- Move to position instantly (no animation)
function Player:animateToInstant(x,y)
    self.x = x
    self.y = y
    self.target_x = x
    self.target_y = y
    self.is_animating = false
end

-- Set movement speed (0-1, higher = faster)
function Player:setAnimateSpeed(speed)
    self.animating_speed = speed
end

-- Check if player is currently moving to a target
function Player:isAnimating()
    return self.is_animating
end

function Player:isOffScreen()
    if self.x + self.width <= 0 then return true end
    if self.x >= 128 then return true end
    if self.y + self.height <= 0 then return true end
    if self.y >= 128 then return true end
    return false
end

function Player:lock()
    self.is_locked = true
end

function Player:unlock()
    self.is_locked = false
end

