if processRecordG then
    return processRecordG
end

local mRandom = math.random

local processRecord = {}

local function disable(disableQuery, entity, chanceOfFailure, cooldown, damage)
    if (mRandom() < chanceOfFailure) then
        entity.active = false
        disableQuery.target = entity
        disableQuery.surface = entity.surface
        disableQuery.time_to_live = cooldown
        rendering.draw_sprite(disableQuery)
        entity.damage(damage, entity.force)
    end
    entityRecord.c = tick + cooldown
end


processRecord["inserter"] = function (entityRecord, tick, queries)

end

processRecord["lab"] = function (entityRecord, tick, queries)

end

processRecord["lamp"] = function (entityRecord, tick, queries)

end

processRecord["generator"] = function (entityRecord, tick, queries)

end

processRecord["mining-drill"] = function (entityRecord, tick, queries)

end

processRecord["offshore-pump"] = function (entityRecord, tick, queries)

end

processRecord["rail-signal"] = function (entityRecord, tick, queries)

end

processRecord["chain-signal"] = function (entityRecord, tick, queries)

end

processRecord["boiler"] = function (entityRecord, tick, queries)

end

processRecord["beacon"] = function (entityRecord, tick, queries)

end

processRecord["assembling-machine"] = function (entityRecord, tick, queries)
    if (entityRecord.e.active) then
        entityRecord.e.active = false
    else
        entityRecord.e.active = true
    end
end

processRecord["furnace"] = function (entityRecord, tick, queries)
    if (tick > entityRecord.c) then
        local entity = entityRecord.e
        local productsFinished = entity.products_finished
        local cooldown = 0
        if (entity.active) then
            local chanceOfFailure = 0
            local damage = 0
            disable(queries.disableQuery, entity, chanceOfFailure, cooldown, damage)
        else
            entity.active = true
            entityRecord.c = tick + cooldown
        end
    end
end

processRecord["radar"] = function (entityRecord, tick, queries)

end

processRecord["roboport"] = function (entityRecord, tick, queries)

end

processRecord["solar-panel"] = function (entityRecord, tick, queries)

end

processRecord["fluid-turret"] = function (entityRecord, tick, queries)

end

processRecord["ammo-turret"] = function (entityRecord, tick, queries)

end

processRecord["electric-turret"] = function (entityRecord, tick, queries)

end

processRecord["accumulator"] = function (entityRecord, tick, queries)

end

processRecord["reactor"] = function (entityRecord, tick, queries)

end

processRecord["pump"] = function (entityRecord, tick, queries)

end

processRecord["artillery-turret"] = function (entityRecord, tick, queries)

end

processRecord["pumpjack"] = function (entityRecord, tick, queries)

end

processRecord["turbine"] = function (entityRecord, tick, queries)

end

processRecord["heat-exchanger"] = function (entityRecord, tick, queries)

end

processRecordG = processRecord
return processRecord
