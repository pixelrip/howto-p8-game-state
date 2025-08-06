-- UI UILabel Class ... Extends UIElement

UILabel = UIElement.new()
UILabel.__index = UILabel

function UILabel.new(options)
    local self = setmetatable(UIElement.new(options), UILabel)

    self.text = options.text or ""
    self.color = options.color or 7
    self.align = options.align or "left"
    self.width = options.width or #self.text*4
    self.padding = options.padding or 0
    self.height = options.height or 5
    self.bgcolor = options.bgcolor or false
    
    -- Maybe/Someday
    -- self.valign = options.valign or "top"
    -- self.wrap = options.wrap or false
    return self
end

function UILabel:draw()
    if not self.is_visible then return end
    local _x0 = self.x
    local _y0 = self.y
    local _x1 = _x0 + self.width
    local _y1 = _y0 + self.height - 1

    if self.bgcolor then
        rectfill(_x0, _y0, _x1, _y1, self.bgcolor)
        _x0 += self.padding
        _y0 += self.padding
    end

    if self.align == "center" then
        _x0 += (self.width - #self.text * 4) / 2
    end

    -- Maybe/Someday
    -- if self.align == "left" then
    -- end

    print(self.text, _x0, _y0, self.color)
    
end

