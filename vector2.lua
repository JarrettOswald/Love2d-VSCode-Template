local Object = require "lib/classic"

local Vector2 = Object:extend()

local function checkNumber(i)
    if type(i) ~= "number" then
        error("Can only multiply vector by scalar.")
    end
end

function Vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Vector2:newPolar(length, angle)
    local x = math.cos(angle) * length
    local y = math.sin(angle) * length

    return Vector2(x, y)
end

function Vector2:normalize()
    local length = math.sqrt(self.x ^ 2 + self.y ^ 2)
    if length == 0 then
        return Vector2(0, 0)
    end
    return Vector2(self.x / length, self.y / length)
end

function Vector2:add(vector2)
    return Vector2(self.x + vector2.x, self.y + vector2.y)
end

function Vector2:sub(vector2)
    return Vector2(self.x - vector2.x, self.y - vector2.y)
end

function Vector2:mull(i)
    checkNumber(i)
    return Vector2(self.x * i, self.y * i)
end

function Vector2:div(i)
    checkNumber(i)
    return Vector2(self.x / i, self.y / i)
end

function Vector2:eq(vector2)
    return self.x == vector2.x and self.y == vector2.y
end

function Vector2:unm()
    return Vector2(-self.x, -self.y)
end

return Vector2
