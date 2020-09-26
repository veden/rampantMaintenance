if processRecordG then
    return processRecordG
end

local DEFINES_ENTITY_STATUS_LOW_POWER = defines.entity_status.low_power
local DEFINES_ENTITY_STATUS_WORKING = defines.entity_status.working

local mRandom = math.random
local mMax = math.max

local processRecord = {}

local function getResearch(force, world, type)
    local researches = world.forceResearched[force]
    return (researches and researches[type]) or 1
end

local function disable(disableQuery, tick, entityRecord, world, sprite)
    local entity = entityRecord.e
    local maxHealth = entity.prototype.max_health
    local entityForce = entity.force.name
    local healthPercent = 1 - (entity.health / maxHealth)
    local entityType = entity.type
    local failures = world.buildFailure[entityType]
    local damageFailures = world.buildDamageFailure[entityType]
    local cooldowns = world.buildCooldown[entityType]
    local chanceOfFailure = ((mRandom() * failures[2]) + failures[1]) * getResearch(entityForce, world, "failure")
    local damageFailure = (healthPercent * ((mRandom() * damageFailures[2]) + damageFailures[1])) * getResearch(entityForce, world, "damage-failure")
    local brokedown = false
    local cooldown

    if (mRandom() < (chanceOfFailure + damageFailure)) then
        if sprite then
            entity.active = false
            disableQuery.target = entity
            disableQuery.surface = entity.surface
            local downtimes = world.buildDowntime[entityType]
            cooldown = ((mRandom() * downtimes[2] + downtimes[1]) * mMax(0.2, healthPercent)) * getResearch(entityForce, world, "downtime")            
            disableQuery.time_to_live = cooldown
            rendering.draw_sprite(disableQuery)
        else
            cooldown = ((mRandom() * cooldowns[2] + cooldowns[1]) * mMax(0.2, healthPercent)) * (1 + (1 - getResearch(entityForce, world, "cooldown")))
        end
        local damages = world.buildDamage[entityType]
        local damage = (((mRandom() * damages[2]) + damages[1]) * maxHealth) * getResearch(entityForce, world, "damage")
        damage = damage + (damage * healthPercent)
        entity.damage(damage, entity.force)
        brokedown = true
    else
        cooldown = ((mRandom() * cooldowns[2] + cooldowns[1]) * mMax(0.2, healthPercent)) * (1 + (1 - getResearch(entityForce, world, "cooldown")))
    end
    entityRecord.c = tick + cooldown
    return brokedown
end

local function defaultCooldown(world, entityRecord, entity, tick)
    local entityType = entity.type
    local maxHealth = entity.prototype.max_health
    local healthPercent = 1 - (entity.health / maxHealth)
    local cooldowns = world.buildCooldown[entityType]
    local cooldown = (mRandom() * cooldowns[2]) + cooldowns[1]
    entityRecord.c = tick + ((mMax(0.2, healthPercent) * cooldown) * (1 + (1 - getResearch(entity.force.name, world, "cooldown"))))
end

function processRecord.process(predicate, entityRecord, tick, world)
    if (tick > entityRecord.c) then
        local entity = entityRecord.e
        local entityType = entity.type
        if (entity.active) then
            if (predicate(entity)) then
                disable(world.queries.disableQuery, tick, entityRecord, world, true)
            else
                defaultCooldown(world, entityRecord, entity, tick)
            end
        elseif (entityType == "solar-panel") or (entityType == "electric-pole") then
            if (predicate(entity)) then
                disable(world.queries.disableQuery, tick, entityRecord, world, false)
            else
                defaultCooldown(world, entityRecord, entity, tick)
            end
        elseif (entityType == "accumulator") or (entityType == "lamp") then
            if (predicate(entity)) then
                if (disable(world.queries.disableQuery, tick, entityRecord, world, false)) and entity.valid then
                    entity.energy = 0
                end
            else
                defaultCooldown(world, entityRecord, entity, tick)
            end
        else
            entity.active = true
            defaultCooldown(world, entityRecord, entity, tick)
        end
    end
end

processRecord["inserter"] = function (entity)
    return entity.held_stack ~= nil
end

processRecord["lab"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_WORKING or status == DEFINES_ENTITY_STATUS_LOW_POWER
end

processRecord["lamp"] = function (entity)
    return (entity.energy > 0) and (entity.surface.darkness > 0.4)
end

processRecord["generator"] = function (entity)
    return entity.energy_generated_last_tick > 0
end

processRecord["mining-drill"] = function (entity)
    return entity.mining_progress > 0
end

processRecord["offshore-pump"] = function (entity)
    return entity.fluidbox.get_flow(1) > 0
end

processRecord["solar-panel"] = function (entity)
    return entity.surface.darkness < 0.5
end

processRecord["accumulator"] = function (entity)
    return entity.energy > 0
end

processRecord["boiler"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_WORKING or status == DEFINES_ENTITY_STATUS_LOW_POWER
end

processRecord["beacon"] = function (entity)
    return entity.energy > 0
end

processRecord["assembling-machine"] = function (entity)
    return entity.is_crafting()
end

processRecord["furnace"] = function (entity)
    return entity.is_crafting()
end

processRecord["rocket-silo"] = function (entity)
    return entity.is_crafting()
end

processRecord["radar"] = function (entity)
    return entity.energy > 0
end

processRecord["roboport"] = function (entity)
    return entity.energy > 0
end

processRecord["fluid-turret"] = function (entity)
    return entity.shooting_target ~= nil
end

processRecord["ammo-turret"] = function (entity)
    return entity.shooting_target ~= nil
end

processRecord["electric-turret"] = function (entity)
    return entity.shooting_target ~= nil
end

processRecord["reactor"] = function (entity)
    return entity.temperature > 0
end

processRecord["pump"] = function (entity)
    return entity.fluidbox.get_flow(1) > 0
end

processRecord["artillery-turret"] = function (entity)
    return entity.shooting_target ~= nil
end

processRecord["electric-pole"] = function (entity)
    return true
end

processRecordG = processRecord
return processRecord
