local class = require("libs.hump.class")
Solid = class({})

function Solid:init(world, x, y)
	self.x = x
	self.y = y
	self.w = 8
	self.h = 8
	self.world = world
	world:add(self, self.x, self.y, self.w, self.h)
end

function Solid:draw()
	love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end
