if processRecordG then
    return processRecordG
end

-- imports

local constants = require("Constants")

-- constants

local DEFINES_ENTITY_STATUS_LOW_POWER = defines.entity_status.low_power
local DEFINES_ENTITY_STATUS_WORKING = defines.entity_status.working
local DEFINES_ENTITY_STATUS_LOW_INPUT_FLUID = defines.entity_status.low_input_fluid
local DEFINES_ENTITY_STATUS_NO_AMMO = defines.entity_status.no_ammo

local ENTITES_WITHOUT_DOWNTIME = constants.ENTITES_WITHOUT_DOWNTIME

-- imported functions

local mMax = math.max

-- modules

local processRecord = {}

local function getResearch(forceName, world, typeName)
    local researches = world.forceResearched[forceName]
    return (researches and researches[typeName]) or 1
end

local function calculateFailureChance(world, entity, invertedHealthPercent)
    local entityType = entity.type
    local entityForceName = entity.force.name
    local failures = world.buildFailure[entityType]
    local damageFailures = world.buildDamageFailure[entityType]
    local chanceOfFailure = ((world.rollChanceFailure * failures.range) + failures.low)
    local chanceOfFailureDamaged = (invertedHealthPercent *
                                    ((world.rollDamageFailure * damageFailures.range) + damageFailures.low))

    return (chanceOfFailureDamaged * getResearch(entityForceName, world, "damage-failure")) +
        (chanceOfFailure * getResearch(entityForceName, world, "failure"))
end

local function calculateCooldown(world, entity, healthPercent)
    local cooldowns = world.buildCooldown[entity.type]
    local cooldown = mMax(0.2, healthPercent) * ((world.rollCooldown * cooldowns.range) + cooldowns.low)
    return (cooldown * (1 + (1 - getResearch(entity.force.name, world, "cooldown"))))
end

local function calculateDowntime(world, entity, invertedHealthPercent)
    local downtimes = world.buildDowntime[entity.type]
    local downtime = (((world.rollCooldown * downtimes.range) + downtimes.low) * mMax(1, 1+invertedHealthPercent))
    return downtime * getResearch(entity.force.name, world, "downtime")
end

local function calculateDamage(world, entity, invertedHealthPercent)
    local maxHealth = entity.prototype.max_health
    local damages = world.buildDamage[entity.type]
    local damage = (((world.rollDamage * damages.range) + damages.low) * maxHealth)
    local totalDamage = damage * getResearch(entity.force.name, world, "damage")
    return totalDamage + (totalDamage * invertedHealthPercent)
end

local function disable(disableQuery, tick, entityRecord, world)
    local entity = entityRecord.e
    local healthPercent = (entity.health / entity.prototype.max_health)
    local invertedHealthPercent = 1 - healthPercent
    local entityType = entity.type

    local chanceOfFailure = calculateFailureChance(world, entity, invertedHealthPercent)
    local useCooldown = false
    local cooldown

    if (world.rollFailure < chanceOfFailure) then
        local downtimes = world.buildDowntime[entityType]
        if downtimes then
            cooldown = calculateDowntime(world, entity, invertedHealthPercent)
            entity.active = false
            if world.showBreakdownSprite then
                disableQuery.target = entity
                disableQuery.surface = entity.surface
                disableQuery.time_to_live = cooldown
                rendering.draw_sprite(disableQuery)
            end
        else
            useCooldown = true
        end
        local energy = entity.energy
        if (energy and (energy > 0)) then
            entity.energy = 0
        end
        entity.damage(
            calculateDamage(world, entity, invertedHealthPercent),
            entity.force
        )
        entityRecord.fC = entityRecord.fC + 1
    else
        useCooldown = true
    end

    if useCooldown then
        cooldown = calculateCooldown(world, entity, healthPercent)
    end
    entityRecord.c = tick + cooldown
    return cooldown
end

function processRecord.process(predicate, entityRecord, tick, world)
    if (tick > entityRecord.c) then
        local entity = entityRecord.e
        local entityType = entity.type

        if (not ENTITES_WITHOUT_DOWNTIME[entityType]) and (not entity.active) then
            entity.active = true
            entityRecord.d = entityRecord.d + (tick - entityRecord.lE)
        else
            entityRecord.u = entityRecord.u + (tick - entityRecord.lE)
        end

        local cooldown
        if predicate(entity) then
            cooldown = disable(world.queries.disableQuery,
                               tick,
                               entityRecord,
                               world)
        else
            cooldown = calculateCooldown(world,
                                         entity,
                                         entity.health / entity.prototype.max_health)
        end

        entityRecord.c = tick + cooldown
        entityRecord.lE = tick
    end
end

function processRecord.recordSelection(entityRecord, tick)
    local entity = entityRecord.e
    local entityType = entityRecord.e.type
    if (not ENTITES_WITHOUT_DOWNTIME[entityType]) and (not entity.active) then
        entityRecord.d = entityRecord.d + (tick - entityRecord.lE)
    else
        entityRecord.u = entityRecord.u + (tick - entityRecord.lE)
    end
    entityRecord.lE = tick
end

function processRecord.activateEntity(entityRecord, tick)
    local entity = entityRecord.e
    local entityType = entityRecord.e.type
    if (not ENTITES_WITHOUT_DOWNTIME[entityType]) and (not entity.active) then
        entity.active = true
        entityRecord.d = entityRecord.d + (tick - entityRecord.lE)
        entityRecord.lE = tick
    end
end

processRecord["inserter"] = function (entity)
    return entity.held_stack.valid_for_read
end

processRecord["lab"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_WORKING or
        status == DEFINES_ENTITY_STATUS_LOW_POWER
end

processRecord["lamp"] = function (entity)
    return (entity.energy > 0.01) and
        (entity.surface.darkness > 0.4)
end

processRecord["generator"] = function (entity)
    return entity.energy_generated_last_tick > 0.01
end

processRecord["mining-drill"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or
        status == DEFINES_ENTITY_STATUS_WORKING
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
    return status == DEFINES_ENTITY_STATUS_WORKING or
        status == DEFINES_ENTITY_STATUS_LOW_POWER or
        status == DEFINES_ENTITY_STATUS_LOW_INPUT_FLUID
end

processRecord["beacon"] = function (entity)
    return entity.energy > 0.01
end

processRecord["assembling-machine"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or
        status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["furnace"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or
        status == DEFINES_ENTITY_STATUS_WORKING
end

processRecord["rocket-silo"] = function (entity)
    local status = entity.status
    return status == DEFINES_ENTITY_STATUS_LOW_POWER or
        status == DEFINES_ENTITY_STATUS_WORKING
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
