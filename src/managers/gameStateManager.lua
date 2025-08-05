-- Game State Manager
gameStateManager = {
    current = nil,
    States = {},
    transition_time = 0,
    transition_duration = 32, --frames
    next_state = nil,
    next_args = nil
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
        if not self:updateTransition() then
            self.current:update()  -- Only update current state if not transitioning
        end
    end
end

-- Draw the current state
function gameStateManager:draw()
    if self.current then
        self.current:draw()
        self:drawTransition()
    end
end

-- === TRANSITIONS ===
function gameStateManager:startTransition(to_state, ...)
    self.next_state = to_state
    self.next_args = {...}
    self.transition_time = self.transition_duration
end

function gameStateManager:updateTransition()
    if self.transition_time > 0 then
        self.transition_time -= 1
        if self.transition_time == 0 then
            self:switch(self.next_state, unpack(self.next_args))
        end
        return true
    end
    return false
end

function gameStateManager:drawTransition()
    if self.transition_time > 0 then
        local x = self.transition_time * 4
        palt(0,false)
        rectfill(x, 0, x+127, 127, 0)
        palt()
    end
end

