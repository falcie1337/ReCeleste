local Player = Class({})

function Player.init(self, x, y, world)
	self.x = x
	self.y = y
	self.world = world
	self.width = 16
	self.height = 16

	self.dx = 0
	self.dy = 0
	self.gravity = 50
	self.jumpForce = -30
	self.maxFallSpeed = 40
	self.dashTimer = 0
	self.maxDashTime = 10

	self.onGround = false
	self.canJump = false
	self.dashing = false

	self.world:add(self, self.x, self.y, self.width, self.height)
end
