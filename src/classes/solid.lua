Solid = Class({})

function Solid:init(x, y, w, h)
	self.x = x
	self.y = y
	self.w = 8
	self.h = 8
	self.isSolid = true
end

function Solid:collide(player) end

function Solid:draw()
	love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end
