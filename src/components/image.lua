-- Sprite Component

Image = {}
Image.__index = Image

function Image.new(owner,sx,sy,t)
    local self = setmetatable({}, Image)

    self.owner = owner
    self.w = owner.w
    self.h = owner.h
    self.sx = sx
    self.sy = sy
    self.t = t or 0

    return self
end

function Image:draw(flip_x, flip_y)
    flip_x = flip_x or false
    flip_y = flip_y or false

    palt(0,false)
    palt(self.t, true)
    sspr(self.sx, self.sy, self.w, self.h, self.owner.x, self.owner.y, self.w, self.h, flip_x, flip_y)
    palt()
end
