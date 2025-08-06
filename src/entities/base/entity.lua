-- Base Entity Class

Entity = {}
Entity.__index = Entity

function Entity.new(x, y, w, h)
    local self = setmetatable({}, Entity)
    
    self.x = x or 0
    self.y = y or 0
    self.w = w or 8
    self.h = h or 8

    return self
end
