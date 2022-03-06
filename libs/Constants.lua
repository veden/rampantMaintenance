if constantsG then
    return constantsG
end

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

constantsG = constants
return constantsG
