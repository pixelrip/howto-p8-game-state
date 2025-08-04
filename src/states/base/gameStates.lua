
GameState = {}
GameState.__index = GameState

function GameState:new()
    local self = setmetatable({}, GameState)
    return self
end

-- GameState lifecycle methods (to be overridden by specific GameStates)
function GameState:init() end
function GameState:update() end
function GameState:draw() end
function GameState:exit() end
