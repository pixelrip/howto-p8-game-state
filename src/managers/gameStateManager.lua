-- Game State Manager
gameStateManager = {
    current = nil,
    States = {}
    }
    

function gameStateManager:add(name, State_obj)
    self.States[name] = State_obj
end

-- Switch to a new state
function gameStateManager:switch(name, ...)
    -- Exit the current state
    if self.current then
        self.current:exit()
    end

    -- Set the new state
    self.current = self.States[name]

    if self.current then
        self.current:init(...)
    end
end

-- Update the current state
function gameStateManager:update()
    if self.current then
        self.current:update()
    end
end

-- Draw the current state
function gameStateManager:draw()
    if self.current then
        self.current:draw()
    end
end
