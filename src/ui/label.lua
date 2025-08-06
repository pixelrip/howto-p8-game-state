-- UI Label Class ... Extends UIElement

Label = UIElement.new()
Label.__index = Label

function Label.new(options)
    local self = setmetatable(UIElement.new(options), Label)

    self.text = options.text or ""
    self.color = options.color or 7
    self.align = options.align or "left"
    self.width = options.width or #self.text*4
    self.padding = options.padding or 0
    self.height = options.height or 5
    self.bgcolor = options.bgcolor or false
    
    -- Maybe/Someday
    -- self.valign = options.valign or "top"
    return self
end

function Label:draw()
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

    if self.align == "left" then
        -- TODO
    end

    print(self.text, _x0, _y0, self.color)
    
end

