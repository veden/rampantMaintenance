if buildRecordG then
   return buildRecordG
end

local buildRecord = {}

local function generate(tick, entity)
    return {
        ["c"] = tick,
        ["e"] = entity
    }
end

buildRecord["inserter"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["lab"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["lamp"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["generator"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["mining-drill"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["offshore-pump"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["rail-signal"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["chain-signal"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["boiler"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["beacon"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["assembling-machine"] = function (tick, entity)
    local o = generate(tick, entity)
    o["i"] = entity.products_finished
    return o
end

buildRecord["furnace"] = function (tick, entity)
    local o = generate(tick, entity)
    o["i"] = entity.products_finished
    return o
end

buildRecord["radar"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["roboport"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["solar-panel"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["fluid-turret"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["ammo-turret"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["electric-turret"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["accumulator"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["reactor"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["pump"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["artillery-turret"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["pumpjack"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["turbine"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecord["heat-exchanger"] = function (tick, entity)
    local o = generate(tick, entity)
    return o
end

buildRecordG = buildRecord
return buildRecord
