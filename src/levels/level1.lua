local bump = require("libs.bump")
local Player = require("src.classes.player")

local level = {}

function level:init()
	self.world = bump.newWorld(16)
	self.player = Player(self.world, 100, 100)
end

return level
