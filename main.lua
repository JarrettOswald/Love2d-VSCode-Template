local tiny = require("lib.tiny")
local DrawSystem = require("src.ecs.system.draw_system")
local tinyWorld = tiny.world()

function love.load()
	local ballEntity = {
		position = { x = 100, y = 100 },
		ball = true
	}
	tinyWorld:addEntity(ballEntity)

	tinyWorld:addSystem(DrawSystem())
end

function love.update(dt)
	tinyWorld:update(dt)
end

function love.draw()
	for i = 1, #tinyWorld.systems do
		local system = tinyWorld.systems[i]
		if system.draw then
			system:draw()
		end
	end
end