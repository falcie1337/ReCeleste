local Player = Class({})

function Player.init(self, x, y, world)
	self.x = x
	self.y = y
	self.world = world
	self.width = 16
	self.height = 16
	self.dx = 0
	self.dy = 0
	self.speed = 100
end
