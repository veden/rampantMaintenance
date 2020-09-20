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

    local p = function (name)
        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-failure-rate\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.1,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-failure-rate\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.05,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"int-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-cooldown\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 360,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"int-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-cooldown\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 1,")
        print("maximum_value = 1000000000,")
        print("default_value = 60,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-max-damage\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.25,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")

        print("{")
        print("type = \"double-setting\",")
        print("name = \"rampant-maintenance-" .. name .. "-min-damage\",")
        print("setting_type = \"runtime-global\",")
        print("minimum_value = 0.0001,")
        print("maximum_value = 1,")
        print("default_value = 0.1,")
        print("order = \"l[modifier]-o[unit]\",")
        print("per_user = false")
        print("},")
    end

    local l={"inserter", "lab","lamp","generator","mining-drill","offshore-pump","rail-signal","chain-signal","boiler","beacon","assembling-machine","furnace","radar","roboport","solar-panel","fluid-turret","ammo-turret","electric-turret","accumulator","reactor","pump","artillery-turret","pumpjack","turbine","heat-exchanger"}

    for _,v in ipairs(l) do
        p(v)
    end
end


function buildModChanges()

    local l={"inserter", "lab","lamp","generator","mining-drill","offshore-pump","rail-signal","chain-signal","boiler","beacon","assembling-machine","furnace","radar","roboport","solar-panel","fluid-turret","ammo-turret","electric-turret","accumulator","reactor","pump","artillery-turret","pumpjack","turbine","heat-exchanger"}

    local p = function(name)
        print("world.buildCooldown[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-max-cooldown\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-min-cooldown\"].value*60 }")
        print("world.buildFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-max-failure-rate\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-min-failure-rate\"].value*60 }")
        print("world.buildDamage[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-max-damage\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-min-damage\"].value*60 }")
        print("world.buildDamageFailure[\"" .. name .. "\"] = { settings.global[\"rampant-maintenance-" .. name .."-max-damage-failure\"].value*60, settings.global[\"rampant-maintenance-" .. name .. "-min-damage-failure\"].value*60 }")
    end

    for _,v in ipairs(l) do
        p(v)
    end
end
