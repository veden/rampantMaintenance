if processRecordG then
    return processRecordG
end

local mRandom = math.random

local processRecord = {}

local function disable(disableQuery, tick, entityRecord, failure, cooldown, damage)
    print("doing it", tick, failure, cooldown, damage)
    local entity = entityRecord.e
    if (mRandom() < failure) then
        entity.active = false
        disableQuery.target = entity
        disableQuery.surface = entity.surface
        disableQuery.time_to_live = cooldown
        rendering.draw_sprite(disableQuery)
        entity.damage(damage, entity.force)
    end
    entityRecord.c = tick + cooldown
end

processRecord["inserter"] = function (entityRecord, tick, world)

end

processRecord["lab"] = function (entityRecord, tick, world)

end

processRecord["lamp"] = function (entityRecord, tick, world)

end

processRecord["generator"] = function (entityRecord, tick, world)

end

processRecord["mining-drill"] = function (entityRecord, tick, world)

end

processRecord["offshore-pump"] = function (entityRecord, tick, world)

end

processRecord["rail-signal"] = function (entityRecord, tick, world)

end

processRecord["chain-signal"] = function (entityRecord, tick, world)

end

processRecord["boiler"] = function (entityRecord, tick, world)

end

processRecord["beacon"] = function (entityRecord, tick, world)

end

processRecord["assembling-machine"] = function (entityRecord, tick, world)
    if (entityRecord.e.active) then
        entityRecord.e.active = false
    else
        entityRecord.e.active = true
    end
end

processRecord["furnace"] = function (entityRecord, tick, world)
    if (tick > entityRecord.c) then
        local entity = entityRecord.e
        if (entity.active) then
            if (entity.is_crafting()) then
                local maxHealth = entity.prototype.max_health
                local healthPercent = entity.health / maxHealth
                local entityType = entity.type
                local chanceOfFailure = mRandom(world.buildFailure[entityType][2], world.buildFailure[entityType][1]) + (0.3 * (1 - healthPercent))
                local damage = mRandom(world.buildDamage[entityType][2], world.buildDamage[entityType][1]) * maxHealth
                local cooldown = mRandom(world.buildCooldown[entityType][2], world.buildCooldown[entityType][1])
                disable(world.queries.disableQuery, tick, entityRecord, chanceOfFailure, cooldown, damage)
            end
        else
            entity.active = true
            entityRecord.c = tick + cooldown
        end
    end
end

processRecord["radar"] = function (entityRecord, tick, world)

end

processRecord["roboport"] = function (entityRecord, tick, world)

end

processRecord["solar-panel"] = function (entityRecord, tick, world)

end

processRecord["fluid-turret"] = function (entityRecord, tick, world)

end

processRecord["ammo-turret"] = function (entityRecord, tick, world)

end

processRecord["electric-turret"] = function (entityRecord, tick, world)

end

processRecord["accumulator"] = function (entityRecord, tick, world)

end

processRecord["reactor"] = function (entityRecord, tick, world)

end

processRecord["pump"] = function (entityRecord, tick, world)

end

processRecord["artillery-turret"] = function (entityRecord, tick, world)

end

processRecord["pumpjack"] = function (entityRecord, tick, world)

end

processRecord["turbine"] = function (entityRecord, tick, world)

end

processRecord["heat-exchanger"] = function (entityRecord, tick, world)

end

processRecordG = processRecord
return processRecord
