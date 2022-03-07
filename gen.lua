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

    local p = function (name, i, attributes)
        print("{")
        print("type = \"bool-setting\",")
        print("name = \"rampant-maintenance-use-" .. name .. "\",")
        print("setting_type = \"runtime-global\",")
        print("default_value = true,")
        print("order = \"a[modifier]-c[unit]\",")
        print("per_user = false")
        print("},")

        for attribute,value in pairs(attributes) do
            if (attribute=="max-failure-rate") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-max-failure-rate\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                -- print("order = \"l[modifier]-".. order[i] .."[unit]\",")
                print("order = \"l[modifier]-b[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="min-failure-rate") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-min-failure-rate\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-a[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="max-cooldown") then
                print("{")
                print("type = \"int-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-max-cooldown\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 1,")
                print("maximum_value = 1000000000,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-d[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="min-cooldown") then
                print("{")
                print("type = \"int-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-min-cooldown\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 1,")
                print("maximum_value = 1000000000,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-c[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="max-damage") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-max-damage\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-f[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="min-damage") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-min-damage\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-e[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="max-damage-failure") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-max-damage-failure\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-h[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="min-damage-failure") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-min-damage-failure\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 0.0001,")
                print("maximum_value = 1,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-g[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="max-downtime") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-max-downtime\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 1,")
                print("maximum_value = 1000000000,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-j[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="min-downtime") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-min-downtime\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = 1,")
                print("maximum_value = 1000000000,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-i[unit]\",")
                print("per_user = false")
                print("},")
            elseif (attribute=="tile-modifier") then
                print("{")
                print("type = \"double-setting\",")
                print("name = \"rampant-maintenance-" .. name .. "-tile-modifier\",")
                print("setting_type = \"runtime-global\",")
                print("minimum_value = -0.4,")
                print("maximum_value = 0.4,")
                print("default_value = "..value..",")
                print("order = \"l[modifier]-k[unit]\",")
                print("per_user = false")
                print("},")
            end
        end
    end

    local l={
        {"accumulator", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.4,
             ["min-damage-failure"]=0.2,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["tile-modifier"]=-0.15
        }},

        {"ammo-turret", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.125,
             ["min-damage"]=0.075,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=0.05
        }},

        {"artillery-turret", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.15,
             ["min-damage"]=0.05,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.4
        }},

        {"assembling-machine", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.2
        }},

        {"beacon", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"boiler", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=0.1
        }},

        {"electric-pole", {
             ["max-cooldown"]=20*60,
             ["min-cooldown"]=15*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.075,
             ["min-failure-rate"]=0.05,
             ["tile-modifier"]=-0.1
        }},

        {"electric-turret", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.125,
             ["min-damage"]=0.075,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"fluid-turret", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.125,
             ["min-damage"]=0.075,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"furnace", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.2
        }},

        {"generator", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"inserter", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"lab", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=0.1
        }},

        {"lamp", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["tile-modifier"]=0
        }},

        {"mining-drill", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.2
        }},

        {"offshore-pump", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"pump", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=0.1
        }},

        {"radar", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"reactor", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.4
        }},

        {"roboport", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.1
        }},

        {"rocket-silo", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["max-downtime"]=12*60,
             ["min-downtime"]=7*60,
             ["tile-modifier"]=-0.4
        }},

        {"solar-panel", {
             ["max-cooldown"]=12*60,
             ["min-cooldown"]=7*60,
             ["max-damage"]=0.10,
             ["min-damage"]=0.025,
             ["max-damage-failure"]=0.3,
             ["min-damage-failure"]=0.1,
             ["max-failure-rate"]=0.2,
             ["min-failure-rate"]=0.1,
             ["tile-modifier"]=0.1
        }}
    }

    for i,v in ipairs(l) do
        p(v[1], i, v[2])
    end
    print("------------------------------------------------------------------------------------")
    print("------------------------------------------------------------------------------------")
    print("------------------------------------------------------------------------------------")
    print("------------------------------------------------------------------------------------")
    for i,v in ipairs(l) do
        local name = v[1]
        local attributes = v[2]
        print("world.buildLookup[\"" .. name .. "\"] = settings.global[\"rampant-maintenance-use-" .. name .. "\"].value")
        if (attributes["max-cooldown"]) then
            print("world.buildCooldown[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-cooldown\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-max-cooldown\"].value*60-settings.global[\"rampant-maintenance-" .. name .. "-min-cooldown\"].value*60 }")
        end
        if (attributes["max-damage"]) then
            print("world.buildDamage[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-damage\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-damage\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-damage\"].value }")
        end
        if (attributes["max-damage-failure"]) then
            print("world.buildDamageFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-damage-failure\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-damage-failure\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-damage-failure\"].value }")
        end
        if (attributes["max-failure-rate"]) then
            print("world.buildFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-failure-rate\"].value, settings.global[\"rampant-maintenance-" .. name .. "-max-failure-rate\"].value-settings.global[\"rampant-maintenance-" .. name .. "-min-failure-rate\"].value }")
        end
        if (attributes["max-downtime"]) then
            print("world.buildDowntime[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-min-downtime\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-max-downtime\"].value*60-settings.global[\"rampant-maintenance-" .. name .. "-min-downtime\"].value*60 }")
        end
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
        print("rampant-maintenance-" .. name .. "-tile-modifier=".. human ..": Tile modifier")
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
        print("rampant-maintenance-" .. name .. "-tile-modifier=The percentage modifier which adds the defined value to the base tile modifier percentage")
    end

    for i,v in ipairs(l) do
        p(v, ln[i])
    end

end
