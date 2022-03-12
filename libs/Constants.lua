if constantsG then
    return constantsG
end

local mMin = math.min
local mMax = math.max

local constants = {}

constants.ALL_ENTITY_TYPES = {
    "accumulator", "ammo-turret", "artillery-turret", "assembling-machine", "beacon",
    "boiler", "electric-pole", "electric-turret", "fluid-turret", "furnace", "generator",
    "inserter", "lab", "lamp", "mining-drill", "offshore-pump", "pump", "radar", "reactor",
    "roboport", "rocket-silo", "solar-panel"
}
constants.ENTITES_WITHOUT_DOWNTIME = {
    ["solar-panel"] = true,
    ["lamp"] = true,
    ["electric-pole"] = true,
    ["accumulator"] = true
}

constants.RESEARCH_LOOKUP = {}
for i=1,9 do
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-failure-"..i] = "failure"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-damage-"..i] = "damage"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-damage-failure-"..i] = "damage-failure"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-downtime-"..i] = "downtime"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-checks-"..i] = "cooldown"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-tile-"..i] = "tile"
    constants.RESEARCH_LOOKUP["rampant-maintenance-reduce-pollution-"..i] = "pollution"
end

constants.POPUP_TTL = 60 * 5
constants.TICKS_PER_MINUTE = 60 * 60
constants.TICKS_PER_HOUR = constants.TICKS_PER_MINUTE * 60
constants.TICKS_PER_FIVE_HOURS = constants.TICKS_PER_MINUTE * 60 * 5

constants.TERRAIN_MODIFIERS = {
    {"refined", 1.3},
    {"marking", 1.3},
    {"asphalt", 1.3},
    {"concrete", 1.2},
    {"stone", 1.1},
    {"grass", 1.0},
    {"landfill", 0.9},
    {"dirt", 0.9},
    {"snow", 0.8},
    {"volcanic", 0.8},
    {"desert", 0.7},
    {"sand", 0.7},
    {"nuclear", 0.7}
}

constants.POLLUTION_TO_PERCENTAGE = 1 / 2000

function constants.roundToNearest(number, multiple)
    local num = number + (multiple * 0.5)
    return num - (num % multiple)
end

function constants.getResearch(forceName, world, typeName)
    local researches = world.forceResearched[forceName]
    if typeName == "tile" then
        return (researches and researches[typeName]) or 0
    else
        return (researches and researches[typeName]) or 1
    end
end

function constants.calculateLowFailure(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityType = entity.type
    local entityForceName = entity.force.name
    local buildFailure = world.buildFailure[entityType]
    local buildDamageFailure = world.buildDamageFailure[entityType]
    local failureChance = (buildFailure.low * constants.getResearch(entityForceName, world, "failure"))
    local damageFailureChance = (buildDamageFailure.low * invertedHealthPercent) * constants.getResearch(entityForceName, world, "damage-failure")
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    return (failureChance + damageFailureChance) * pollutionModifier * tileModifier
end

function constants.calculateHighFailure(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityType = entity.type
    local entityForceName = entity.force.name
    local buildFailure = world.buildFailure[entityType]
    local buildDamageFailure = world.buildDamageFailure[entityType]
    local failureChance = ((buildFailure.low + buildFailure.range) * constants.getResearch(entityForceName, world, "failure"))
    local damageFailureChance = ((buildDamageFailure.low + buildDamageFailure.range) * invertedHealthPercent) * constants.getResearch(entityForceName, world, "damage-failure")
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    return (failureChance + damageFailureChance) * pollutionModifier * tileModifier
end

function constants.calculateLowCooldown(world, entityRecord, healthPercent)
    local entity = entityRecord.e
    local cooldowns = world.buildCooldown[entity.type]
    local cooldown = mMax(0.2, healthPercent) * cooldowns.low
    return cooldown * (1 + constants.getResearch(entity.force.name, world, "cooldown"))
end

function constants.calculateHighCooldown(world, entityRecord, healthPercent)
    local entity = entityRecord.e
    local cooldowns = world.buildCooldown[entity.type]
    local cooldown = mMax(0.2, healthPercent) * (cooldowns.low + cooldowns.range)
    return cooldown * (1 + constants.getResearch(entity.force.name, world, "cooldown"))
end

function constants.calculateLowDowntime(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityForceName = entity.force.name
    local downtimes = world.buildDowntime[entity.type]
    if not downtimes then
        return 0
    end
    local downtime = (downtimes.low * mMax(1, 1+invertedHealthPercent)) * constants.getResearch(entityForceName, world, "downtime")
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    return downtime * tileModifier * pollutionModifier
end

function constants.calculateHighDowntime(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityForceName = entity.force.name
    local downtimes = world.buildDowntime[entity.type]
    if not downtimes then
        return 0
    end
    local downtime = ((downtimes.low + downtimes.range) * mMax(1, 1+invertedHealthPercent)) *
        constants.getResearch(entityForceName, world, "downtime")
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    return downtime * tileModifier * pollutionModifier
end

function constants.calculateLowDamage(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityForceName = entity.force.name
    local damages = world.buildDamage[entity.type]
    local damage = damages.low * constants.getResearch(entityForceName, world, "damage")
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    return (damage + (damage * invertedHealthPercent)) * tileModifier * pollutionModifier
end

function constants.calculateHighDamage(world, entityRecord, invertedHealthPercent)
    local entity = entityRecord.e
    local entityForceName = entity.force.name
    local damages = world.buildDamage[entity.type]
    local damage = (damages.low + damages.range) * constants.getResearch(entityForceName, world, "damage")
    local tileModifier = (2 - (entityRecord.t + constants.getResearch(entityForceName, world, "tile")))
    local pollutionModifier = (1 + (mMin(entity.surface.get_pollution(entity.position) * constants.POLLUTION_TO_PERCENTAGE,
                                         entityRecord.p * constants.getResearch(entityForceName, world, "pollution"))))
    return (damage + (damage * invertedHealthPercent)) * tileModifier * pollutionModifier
end

constantsG = constants
return constantsG
