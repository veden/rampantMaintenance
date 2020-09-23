

data:extend({
        {
            type = "technology",
            name = "rampant-maintenance-reduce-failure-1",
            localised_name = {"technology-name.rampant-maintenance-reduce-failure"},
            localised_description = {"technology-description.rampant-maintenance-reduce-failure"},
            icon_size = 128,
            icon = "__base__/graphics/technology/chemical-science-pack.png",
            effects =
                {
                    {
                        type = "nothing",
                        effect_description = "description.rampant-maintenance-reduce-failure"
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
            name = "rampant-maintenance-reduce-failure-2",
            localised_name = {"technology-name.rampant-maintenance-reduce-failure"},
            localised_description = {"technology-description.rampant-maintenance-reduce-failure"},
            icon_size = 128,
            icon = "__base__/graphics/technology/chemical-science-pack.png",
            effects =
                {
                    {
                        type = "nothing",
                        effect_description = "description.rampant-maintenance-reduce-failure"
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
            name = "rampant-maintenance-reduce-damage-1",
            localised_name = {"technology-name.rampant-maintenance-reduce-damage"},
            localised_description = {"technology-description.rampant-maintenance-reduce-damage"},
            icon_size = 128,
            icon = "__base__/graphics/technology/chemical-science-pack.png",
            effects =
                {
                    {
                        type = "nothing",
                        effect_description = "description.rampant-maintenance-reduce-damage"
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
            name = "rampant-maintenance-reduce-damage-failure-1",
            localised_name = {"technology-name.rampant-maintenance-reduce-damage-failure"},
            localised_description = {"technology-description.rampant-maintenance-reduce-damage-failure"},
            icon_size = 128,
            icon = "__base__/graphics/technology/chemical-science-pack.png",
            effects =
                {
                    {
                        type = "nothing",
                        effect_description = "description.rampant-maintenance-reduce-damage-failure"
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
            name = "rampant-maintenance-reduce-downtime-1",
            localised_name = {"technology-name.rampant-maintenance-reduce-downtime"},
            localised_description = {"technology-description.rampant-maintenance-reduce-downtime"},
            icon_size = 128,
            icon = "__base__/graphics/technology/chemical-science-pack.png",
            effects =
                {
                    {
                        type = "nothing",
                        effect_description = "description.rampant-maintenance-reduce-downtime"
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
        }
})
