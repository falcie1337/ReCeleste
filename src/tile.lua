local class = require("libs.hump.class")
Tile = class({})

function Tile:init(world, x, y)
	self.x = x
	self.y = y
	self.w = 8
	self.h = 8
	self.world = world
	world:add(self, self.x, self.y, self.w, self.h)
end

function Tile:draw()
	love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end
