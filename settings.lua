data:extend({
        {
            type = "int-setting",
            name = "rampant-maintenance-checks-per-tick",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 100,
            default_value = 10,
            order = "l[modifier]-a[unit]",
            per_user = false
        },


        {
            type = "bool-setting",
            name = "rampant-maintenance-use-accumulator",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-accumulator-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-accumulator-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-accumulator-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-c[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-ammo-turret",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-ammo-turret-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-ammo-turret-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-ammo-turret-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-d[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-artillery-turret",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-artillery-turret-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-artillery-turret-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-artillery-turret-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-e[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-assembling-machine",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-assembling-machine-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-assembling-machine-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-assembling-machine-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-f[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-beacon",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-beacon-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-beacon-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-beacon-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-g[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-boiler",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-boiler-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-boiler-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-boiler-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-h[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-electric-pole",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-electric-pole-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-pole-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-electric-pole-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-i[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-electric-turret",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-electric-turret-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-electric-turret-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-electric-turret-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-j[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-fluid-turret",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-fluid-turret-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-fluid-turret-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-fluid-turret-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-k[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-furnace",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-furnace-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-furnace-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-furnace-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-l[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-generator",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-generator-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-generator-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-generator-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-m[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-inserter",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-inserter-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-inserter-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-inserter-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-n[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-lab",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-lab-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lab-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-lab-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-o[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-lamp",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-lamp-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-lamp-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-lamp-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-p[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-mining-drill",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-mining-drill-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-mining-drill-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-mining-drill-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-q[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-offshore-pump",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-offshore-pump-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-offshore-pump-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-offshore-pump-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-r[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-pump",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-pump-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-pump-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-pump-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-s[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-radar",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-radar-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-radar-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-radar-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-t[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-reactor",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-reactor-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-reactor-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-reactor-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-u[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-roboport",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-roboport-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-roboport-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-roboport-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-v[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-rocket-silo",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-rocket-silo-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-min-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 300,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-max-downtime",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-rocket-silo-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-rocket-silo-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-w[unit]",
            per_user = false
        },
        {
            type = "bool-setting",
            name = "rampant-maintenance-use-solar-panel",
            setting_type = "runtime-global",
            default_value = true,
            order = "l[modifier]-b[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-solar-panel-max-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 1200,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-max-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-min-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-min-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.1,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-max-damage-failure",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.3,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-max-damage",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.25,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "double-setting",
            name = "rampant-maintenance-solar-panel-min-failure-rate",
            setting_type = "runtime-global",
            minimum_value = 0.0001,
            maximum_value = 1,
            default_value = 0.05,
            order = "l[modifier]-x[unit]",
            per_user = false
        },
        {
            type = "int-setting",
            name = "rampant-maintenance-solar-panel-min-cooldown",
            setting_type = "runtime-global",
            minimum_value = 1,
            maximum_value = 1000000000,
            default_value = 600,
            order = "l[modifier]-x[unit]",
            per_user = false
        }
})
