--[[=====================
    Session Manager
    - Manages things that need to persist across states
    - Simple registry of objects
    =====================]]--

sessionManager = {
    entities = {}
}

function sessionManager:addEntity(name, obj)
    self.entities[name] = obj
end

function sessionManager:getEntity(name)
    if not self.entities[name] then
        return false
    end
    
    return self.entities[name]
end

-- Game Initialization
function sessionManager:init()
    self:addEntity("player", Player.new(57,30))
end
