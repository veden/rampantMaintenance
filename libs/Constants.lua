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
end

constants.POPUP_TTL = 60 * 5
constants.TICKS_PER_MINUTE = 60 * 60
constants.TICKS_PER_HOUR = constants.TICKS_PER_MINUTE * 60
constants.TICKS_PER_FIVE_HOURS = constants.TICKS_PER_MINUTE * 60 * 5

constantsG = constants
return constantsG
