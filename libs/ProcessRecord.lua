if processRecordG then
    return processRecordG
end

local DEFINES_ENTITY_STATUS_LOW_POWER = defines.entity_status.low_power
local DEFINES_ENTITY_STATUS_WORKING = defines.entity_status.working
local DEFINES_ENTITY_STATUS_LOW_INPUT_FLUID = defines.entity_status.low_input_fluid
local DEFINES_ENTITY_STATUS_NO_AMMO = defines.entity_status.no_ammo

local mMax = math.max

local processRecord = {}

local function getResearch(force, world, type)
    local researches = world.forceResearched[force]
    return (researches and researches[type]) or 1
end

local function disable(disableQuery, tick, entityRecord, world)
    local entity = entityRecord.e
    local entityForce = entity.force.name
    local maxHealth = entity.prototype.max_health
    local healthPercent = (entity.health / maxHealth)
    local invertedHealthPercent = 1 - healthPercent
    local entityType = entity.type
    local failures = world.buildFailure[entityType]
    local damageFailures = world.buildDamageFailure[entityType]
    local cooldowns = world.buildCooldown[entityType]
    local chanceOfFailure = ((world.rollChanceFailure * failures[2]) + failures[1]) * getResearch(entityForce, world, "failure")
    local damageFailure = (invertedHealthPercent * ((world.rollDamageFailure * damageFailures[2]) + damageFailures[1])) * getResearch(entityForce, world, "damage-failure")
    local brokedown = false
    local useDefaultCooldown = false
    local cooldown

    if (world.rollFailure < (chanceOfFailure + damageFailure)) then
        local downtimes = world.buildDowntime[entityType]
        -- print("type", entityType)
        if downtimes then
            -- print("down", downtimes[2], downtimes[1], mMax(1, 1+invertedHealthPercent), getResearch(entityForce, world, "downtime"))
            cooldown = (((world.rollCooldown * downtimes[2]) + downtimes[1]) * mMax(1, 1+invertedHealthPercent)) * getResearch(entityForce, world, "downtime")
            entity.active = false
            disableQuery.target = entity
            disableQuery.surface = entity.surface
            disableQuery.time_to_live = cooldown
            if world.showBreakdownSprite then
                rendering.draw_sprite(disableQuery)
            end
        else
            -- print("skipping", entityType)
            useDefaultCooldown = true
        end
        local energy = entity.energy
        if (energy and (energy > 0)) then
            entity.energy = 0
        end
        local damages = world.buildDamage[entityType]
        local damage = (((world.rollDamage * damages[2]) + damages[1]) * maxHealth) * getResearch(entityForce, world, "damage")
        damage = damage + (damage * invertedHealthPercent)
        entity.damage(damage, entity.force)
        brokedown = true
    else
        useDefaultCooldown = true
    end

    if useDefaultCooldown then
        -- print("default", cooldowns[2], cooldowns[1], mMax(0.2, healthPercent), (1 + (1 - getResearch(entityForce, world, "cooldown"))))
        cooldown = (((world.rollCooldown * cooldowns[2]) + cooldowns[1]) * mMax(0.2, healthPercent)) * (1 + (1 - getResearch(entityForce, world, "cooldown")))
    end
    entityRecord.c = tick + cooldown
    return brokedown
end

local function defaultCooldown(world, entityRecord, entity, tick)
    local healthPercent = mMax(0.2, (entity.health / entity.prototype.max_health))
    local cooldowns = world.buildCooldown[entity.type]
    local cooldown = healthPercent * ((world.rollCooldown * cooldowns[2]) + cooldowns[1])
    entityRecord.c = tick + (cooldown * (1 + (1 - getResearch(entity.force.name, world, "cooldown"))))
end

local inNonActiveSet = {
    ["solar-panel"] = true,
    ["electric-pole"] = true,
    ["accumulator"] = true,
    ["lamp"] = true
}

function processRecord.process(predicate, entityRecord, tick, world)
    if (tick > entityRecord.c) then
        local entity = entityRecord.e
        local entityType = entity.type

        if (not inNonActiveSet[entityType]) and (not entity.active) then
            entity.active = true
        end

        if (predicate(entity)) then
            disable(world.queries.disableQuery, tick, entityRecord, world)
        else
            defaultCooldown(world, entityRecord, entity, tick)
        end
    end
end

processRecord["inserter"] = function (entity)
    return entity.held_stack.valid_for_read
end

processRecord["lab"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_WORKING or status == DEFINES_ENTITY_STATUS_LOW_POWER
end

processRecord["lamp"] = function (entity)
    return (entity.energy > 0.01) and (entity.surface.darkness > 0.4)
end

processRecord["generator"] = function (entity)
    return entity.energy_generated_last_tick > 0.01
end

processRecord["mining-drill"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["offshore-pump"] = function (entity)
    return entity.fluidbox.get_flow(1) > 0.01
end

processRecord["solar-panel"] = function (entity)
    return entity.surface.darkness < 0.5
end

processRecord["accumulator"] = function (entity)
    return entity.energy > 0.01
end

processRecord["boiler"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_WORKING or status == DEFINES_ENTITY_STATUS_LOW_POWER or status == DEFINES_ENTITY_STATUS_LOW_INPUT_FLUID
end

processRecord["beacon"] = function (entity)
    return entity.energy > 0.01
end

processRecord["assembling-machine"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["furnace"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["rocket-silo"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["radar"] = function (entity)
    return entity.energy > 0.01
end

processRecord["roboport"] = function (entity)
    return entity.energy > 0.01
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
    return entity.temperature > 0.01
end

processRecord["pump"] = function (entity)
    return entity.fluidbox.get_flow(1) > 0.01
end

processRecord["artillery-turret"] = function (entity)
    return entity.status ~= DEFINES_ENTITY_STATUS_NO_AMMO
end

processRecord["electric-pole"] = function (entity)
    return true
end

processRecordG = processRecord
return processRecord
