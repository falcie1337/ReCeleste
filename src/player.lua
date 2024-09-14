local class = require("libs.hump.class")
local bump = require("libs.bump")
local Player = class({})

function Player:init(world, x, y)
	self.x = x
	self.y = y
	self.w = 8
	self.h = 8

	self.vx = 0
	self.vy = 0
	self.maxRunSpeed = 100
	self.accel = 200
	self.deccel = 200
	self.jumpForce = -30
	self.maxFallSpeed = 40
	self.dashTimer = 0
	self.maxDashTime = 10

	self.onGround = false
	self.canJump = false
	self.dashing = false

	self.world = world
	world:add(self, self.x, self.y, self.w, self.h)
end

function Player:playerFilter(other)
	if other.isSolid then
		return "slide"
	else
		return nil
	end
end

function Player:movePlayer()
	local goalX, goalY = self.x + self.vx, self.y + self.vy
	local actualX, actualY, cols, len = self.world:move(self, goalX, goalY)
	self.x, self.y = actualX, actualY

	for i = 1, len do
		local other = cols[i].other
		if other.isSolid then
			return "slide"
		end
	end
end

function Player:update(dt)
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt

	self:movePlayer()

	if not self.onGround then
		self.vy = self.vy + (self.maxFallSpeed - self.vy) * 0.5
	end

	if self.onGround then
		self.canJump = true
	end

	if self.canJump and love.keyboard.isDown("space") then
		self.vy = self.jumpForce
		self.onGround = false
	end

	if self.vy > self.maxFallSpeed then
		self.vy = self.maxFallSpeed
	end

	local targetVx = 0

	if love.keyboard.isDown("left") then
		targetVx = -self.maxRunSpeed
	elseif love.keyboard.isDown("right") then
		targetVx = self.maxRunSpeed
	end

	if targetVx ~= 0 then
		self.vx = self.vx + (targetVx - self.vx) * 0.3
	else
		self.vx = self.vx - self.vx * 0.5
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return Player
