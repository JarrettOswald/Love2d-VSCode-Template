local Entities = {}
Entities.__index = Entities

function Entities:new()
    return setmetatable({
        list = {},
        pool = {},
        toRemove = {},
    }, self)
end

function Entities:add(ent)
    table.insert(self.list, ent)
    return ent
end

function Entities:remove(ent)
    ent._removed = true
end

function Entities:update(dt)
    local l = self.list
    for i = #l, 1, -1 do
        local e = l[i]
        if e._removed then
            table.remove(l, i)
            if e.reset then e:reset() end
            table.insert(self.pool, e)
        else
            if e.update then e:update(dt) end
        end
    end
end

function Entities:draw()
    for i = 1, #self.list do
        local e = self.list[i]
        if e.draw then e:draw() end
    end
end

function Entities:getFromPool(factory)
    if #self.pool > 0 then
        return table.remove(self.pool)
    end
    return factory()
end

return Entities
