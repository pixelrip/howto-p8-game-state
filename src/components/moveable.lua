-- Movement component

Moveable = {}
Moveable.__index = Moveable

function Moveable.new(owner)
    local self = setmetatable({}, Moveable)

    self.owner = owner
    self.move_speed = 0
    self.is_moving = false

    -- Get target position from owner
    self.target_x = self.owner.x
    self.target_y = self.owner.y

    return self
end

function Moveable:moveTo(x,y,speed)
    self.target_x = x
    self.target_y = y
    self.move_speed = speed or 0.1
    self.is_moving = true
end


function Moveable:update()
    if self.is_moving then
        local dx = self.target_x - self.owner.x
        local dy = self.target_y - self.owner.y

        if abs(dx) < 0.5 and abs(dy) < 0.5 then
            self.owner.x = self.target_x
            self.owner.y = self.target_y
            self.is_moving = false
        else
            self.owner.x = self.owner.x + dx * self.move_speed
            self.owner.y = self.owner.y + dy * self.move_speed
        end
    end
end

