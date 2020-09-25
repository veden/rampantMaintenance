function buildSettings()
    local templateFailureMax = {
        type = "double-setting",
        name = "rampant-maintenance-lab-failure-rate",
        setting_type = "runtime-global",
        minimum_value = 0.0001,
        maximum_value = 1,
        default_value = 0.1,
        order = "l[modifier]-m[unit]",
        per_user = false
    }

    local templateFailureMin = {
        type = "double-setting",
        name = "rampant-maintenance-lab-failure-rate",
        setting_type = "runtime-global",
        minimum_value = 0.0001,
        maximum_value = 1,
        default_value = 0.05,
        order = "l[modifier]-m[unit]",
        per_user = false
    }

    local order = {"c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
    
    local p = function (name, i)
        print("{")
        print("type = \"bool-setting\",")
        print("name = \"rampant-maintenance-use-" .. name .. "\",")
        print("setting_type = \"runtime-global\",")
        print("default_value = true,")
        print("order = \"l[modifier]-b[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-failure-rate\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.1,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-failure-rate\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.05,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"int-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-cooldown\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 360,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"int-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-cooldown\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 60,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-damage\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.25,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-damage\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.1,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-damage-failure\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.3,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-damage-failure\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.1,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-downtime\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 360,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-downtime\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 60,")
        print("order = \"l[modifier]-".. order[i] .."[unit]\",")
        print("per_user = false")
        print("},")
    end

    

    local l={"accumulator",
             "ammo-turret",
             "artillery-turret",
             "assembling-machine",
             "beacon",
             "boiler",
             "electric-pole",
             "electric-turret",
             "fluid-turret",
             "furnace",
             "generator",
             "inserter",
             "lab",
             "lamp",
             "mining-drill",
             "offshore-pump",
             "pump",
             "radar",
             "reactor",
             "roboport",
             "rocket-silo",
             "solar-panel"}

    for i,v in ipairs(l) do
        p(v, i)
    end
end


function buildModChanges()

    local l={"inserter", "lab","lamp","generator","mining-drill","offshore-pump","boiler","beacon","assembling-machine","furnace","radar","roboport","solar-panel","fluid-turret","ammo-turret","electric-turret","accumulator","reactor","pump","artillery-turret", "rocket-silo", "electric-pole"}

    local p = function(name)
        print("world.buildLookup[\"" .. name .. "\"] = settings.global[\"rampant-maintenance-use-" .. name .. "\"].value")
        print("world.buildDowntime[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-downtime\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-max-downtime\"].value*60-settings.global[\"rampant-maintenance-" .. name .. "-min-downtime\"].value*60 }")
        print("world.buildFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-failure-rate\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-failure-rate\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-failure-rate\"].value }")
        print("world.buildDamage[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-damage\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-damage\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-damage\"].value }")
        print("world.buildDamageFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-damage-failure\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-damage-failure\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-damage-failure\"].value }")
        print("world.buildCooldown[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-cooldown\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-max-cooldown\"].value*60-settings.global[\"rampant-maintenance-" .. name .. "-min-cooldown\"].value*60 }")
    end

    for _,v in ipairs(l) do
        p(v)
    end
end


function buildLocaleSettingsName()
    local l={"inserter", "lab","lamp","generator","mining-drill","offshore-pump","boiler","beacon","assembling-machine","furnace","radar","roboport","solar-panel","fluid-turret","ammo-turret","electric-turret","accumulator","reactor","pump","artillery-turret", "rocket-silo", "electric-pole"}
    local ln={"Inserter", "Lab", "Lamp","Generator","Mining Drill","Offshore Pump","Boiler","Beacon","Assembling Machine","Furnace","Radar","Roboport","Solar Panel","Fluid Turret","Ammo Turret","Electric Turret","Accumulator","Reactor","Pump","Artillery Turret", "Rocket Silo", "Electric Pole"}

    local p = function(name, human)
        print("rampant-maintenance-use-" .. name .. "=Enable: " .. human)
        print("rampant-maintenance-" .. name .. "-min-cooldown=".. human ..": Minimum cooldown")
        print("rampant-maintenance-" .. name .. "-max-cooldown=".. human ..": Maximum cooldown")
        print("rampant-maintenance-" .. name .. "-min-damage=".. human ..": Minimum damage taken")
        print("rampant-maintenance-" .. name .. "-max-damage=".. human ..": Maximum damage taken")
        print("rampant-maintenance-" .. name .. "-min-damage-failure=".. human ..": Minimum failure by damage")
        print("rampant-maintenance-" .. name .. "-max-damage-failure=".. human ..": Maximum failure by damage")
        print("rampant-maintenance-" .. name .. "-min-failure-rate=".. human ..": Minimum failure rate")
        print("rampant-maintenance-" .. name .. "-max-failure-rate=".. human ..": Maximum failure rate")
        print("rampant-maintenance-" .. name .. "-min-downtime=".. human ..": Minimum downtime")
        print("rampant-maintenance-" .. name .. "-max-downtime=".. human ..": Maximum downtime")
    end

    for i,v in ipairs(l) do
        p(v, ln[i])
    end

end

function buildLocaleSettingsDescription()
    local l={"inserter", "lab","lamp","generator","mining-drill","offshore-pump","boiler","beacon","assembling-machine","furnace","radar","roboport","solar-panel","fluid-turret","ammo-turret","electric-turret","accumulator","reactor","pump","artillery-turret", "rocket-silo", "electric-pole"}
    local ln={"Inserter", "Lab", "Lamp","Generator","Mining Drill","Offshore Pump","Boiler","Beacon","Assembling Machine","Furnace","Radar","Roboport","Solar Panel","Fluid Turret","Ammo Turret","Electric Turret","Accumulator","Reactor","Pump","Artillery Turret", "Rocket Silo", "Electric Pole"}

    local p = function(name, human)
        print("rampant-maintenance-use-" .. name .. "=Enable breakdown on this entity type")
        print("rampant-maintenance-" .. name .. "-min-cooldown=The minimum number of seconds that will pass before a machine can breakdown")
        print("rampant-maintenance-" .. name .. "-max-cooldown=The maximum number of seconds that will pass before a machine can breakdown")
        print("rampant-maintenance-" .. name .. "-min-damage=The minimum damage percent that will happen for a breakdown")
        print("rampant-maintenance-" .. name .. "-max-damage=The maximum damage percent that will happen for a breakdown")
        print("rampant-maintenance-" .. name .. "-min-damage-failure=The minimum failure rate added due to damage for calculating a breakdown")
        print("rampant-maintenance-" .. name .. "-max-damage-failure=The maximum failure rate added due to damage for calculating a breakdown")
        print("rampant-maintenance-" .. name .. "-min-failure-rate=The minimum failure rate for calculating a breakdown")
        print("rampant-maintenance-" .. name .. "-max-failure-rate=The maximum failure rate for calculating a breakdown")
        print("rampant-maintenance-" .. name .. "-min-downtime=The minimum number of seconds that a machine will breakdown for")
        print("rampant-maintenance-" .. name .. "-max-downtime=The maximum number of seconds that a machine will breakdown for")
    end

    for i,v in ipairs(l) do
        p(v, ln[i])
    end

end
