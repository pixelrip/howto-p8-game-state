-- UI Element Base Class
UIElement = {}
UIElement.__index = UIElement

function UIElement.new(options)
    local self = setmetatable({}, UIElement)
    options = options or {}

    self.x = options.x or 0
    self.y = options.y or 0
    self.is_visible = true
    return self
end

function UIElement:update() end
function UIElement:draw() end
function UIElement:show() self.is_visible = true end
function UIElement:hide() self.is_visible = false end

