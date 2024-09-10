local Player = Class:extend()

function Player:new(x, y, w, h)
   self.x = x
   self.y = y
   self.w = w
   self.h = h

   self.xSpd = 0
   self.ySpd = 0
   self.accel = 0.5
   self.friction = 0.8
   self.gravity = 0.5
   self.jumpForce = 10
   self.onGround = true
end

function Player:update(dt)
   self.xSpd = self.xSpd + self.accel * dt
   self.ySpd = self.ySpd + self.gravity * dt

   -- basic movement (will be rewritten soon, just placeholder code)
   if love.keyboard('w') and self.onGround then
      self.ySpd = -self.jumpForce
      self.onGround = false
   end

   if love.keyboard('a') then
      self.xSpd = self.xSpd - self.accel
   elseif
      love.keyboard('d') then
      self.xSpd = self.xSpd + self.accel
   end
end

function Player:draw()
   love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end