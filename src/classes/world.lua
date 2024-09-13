local world = {}

function world:init()
	self.world = Bump.newWorld(8)
end

function world:add(item, x, y, w, h)
	self.world:add(item, x, y, w, h)
end

function world:move(item, goalX, goalY)
	local actualX, actualY, collisions, len = self.world:move(item, goalX, goalY)
	return actualX, actualY, collisions, len
end

function world:remove(item)
	self.world:remove(item)
end

function world:update(item, x, y)
	self.world:update(item, x, y)
end

function world:checkCollision(item, goalX, goalY)
	local cols, len = self.world:checkCollision(item, goalX, goalY)
	return cols, len
end

return world
