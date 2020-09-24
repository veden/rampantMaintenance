
local function buildResearches(name)
    local moduleName = "effectivity"
    if (name=="damage") then
        moduleName = "productivity"
    elseif (name=="downtime") then
        moduleName = "speed"
    end
    data:extend({
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-1",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-1.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 200,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1}
                            },
                        time = 10
                    },
                upgrade = true,
                prerequisites = {"advanced-electronics", "sulfur-processing"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-2",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-1.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 800,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1}
                            },
                        time = 30
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-1"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-3",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-1.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 1600,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1}
                            },
                        time = 30
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-2"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-4",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-2.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 2400,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1}
                            },
                        time = 45
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-3"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-5",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-2.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 4000,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1},
                                {"production-science-pack", 1}
                            },
                        time = 60
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-4"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-6",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-2.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 6000,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1},
                                {"production-science-pack", 1}
                            },
                        time = 75
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-5"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-7",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-3.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 10000,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1},
                                {"production-science-pack", 1},
                                {"utility-science-pack", 1}
                            },
                        time = 85
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-6"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-8",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-3.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 20000,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1},
                                {"production-science-pack", 1},
                                {"utility-science-pack", 1}
                            },
                        time = 100
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-7"},
                order = "c-a"
            },
            {
                type = "technology",
                name = "rampant-maintenance-reduce-" .. name .. "-9",
                localised_name = {"technology-name.rampant-maintenance-reduce-" .. name},
                localised_description = {"technology-description.rampant-maintenance-reduce-" .. name},
                icons = {
                    {icon="__base__/graphics/technology/advanced-electronics.png",icon_size=128,icon_mipmaps=4,shift={0,10},scale=0.75},
                    {icon="__base__/graphics/technology/" .. moduleName .. "-module-3.png",icon_size=128,icon_mipmaps=4,shift={-28,-28},scale=0.25}
                },
                effects =
                    {
                        {
                            type = "nothing",
                            effect_description = "description.rampant-maintenance-reduce-" .. name
                        }
                    },
                unit =
                    {
                        count = 40000,
                        ingredients =
                            {
                                {"automation-science-pack", 1},
                                {"logistic-science-pack", 1},
                                {"chemical-science-pack", 1},
                                {"production-science-pack", 1},
                                {"utility-science-pack", 1},
                                {"space-science-pack", 1}
                            },
                        time = 120
                    },
                upgrade = true,
                prerequisites = {"rampant-maintenance-reduce-" .. name .. "-8"},
                order = "c-a"
            }
    })
end

buildResearches("failure")
buildResearches("damage")
buildResearches("damage-failure")
buildResearches("downtime")
