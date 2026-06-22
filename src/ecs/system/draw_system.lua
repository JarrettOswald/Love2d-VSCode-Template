local tiny = require("lib.tiny")

function DrawSystem()
    local system = tiny.processingSystem()
    system.filter = tiny.requireAll("position", "ball")

    function system:process()
        print("DrawSystem:process() called")
    end

    function system:draw()
        for i = 1, #self.entities do
            local e = self.entities[i]
            love.graphics.circle("fill", e.position.x, e.position.y, 10)
        end
    end

    return system
end

return DrawSystem