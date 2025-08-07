-- UIImage Class ... Extends UIElement

UIImage = UIElement.new()
UIImage.__index = UIImage

function UIImage.new(options)
    local self = setmetatable(UIElement.new(options), UIImage)

    self.sx = options.sx or 0 -- spritesheet x
    self.sy = options.sy or 0 -- spritesheet y
    self.width = options.width or 8
    self.height = options.height or 8
    self.flip_x = options.flip_x or false
    self.flip_y = options.flip_y or false
    self.alpha = options.alpha or 0 -- transparent color id


    return self
end

function UIImage:draw()
    if not self.is_visible then return end

    palt(0,false)
    palt(self.alpha,true)
    sspr(self.sx, self.sy, self.width, self.height, self.x, self.y, self.width, self.height, self.flip_x, self.flip_y)
    palt()
end

