-- imports

local buildRecord = require("libs/BuildRecord")
local processRecord = require("libs/ProcessRecord")

-- imported functions

local mLog10 = math.log10
local mRandom = math.random
local mSqrt = math.sqrt
local sFind = string.find

local generate = buildRecord.generate
local process = processRecord.process

-- local references

local world

-- module code

local function onModSettingsChange(event)

    if event and (string.sub(event.setting, 1, 19) ~= "rampant-maintenance") then
        return false
    end

    world.buildLookup = {}
    world.buildDamage = {}
    world.buildCooldown = {}
    world.buildFailure = {}
    world.buildDamageFailure = {}
    
    world.buildLookup["inserter"] = settings.global["rampant-maintenance-useinserter"].value
    world.buildCooldown["inserter"] = { settings.global["rampant-maintenance-inserter-min-cooldown"].value*60, settings.global["rampant-maintenance-inserter-max-cooldown"].value*60-settings.global["rampant-maintenance-inserter-min-cooldown"].value*60 }
    world.buildFailure["inserter"] = { settings.global["rampant-maintenance-inserter-min-failure-rate"].value, settings.global["rampant-maintenance-inserter-max-failure-rate"].value-settings.global["rampant-maintenance-inserter-min-failure-rate"].value }
    world.buildDamage["inserter"] = { settings.global["rampant-maintenance-inserter-min-damage"].value, settings.global["rampant-maintenance-inserter-max-damage"].value-settings.global["rampant-maintenance-inserter-min-damage"].value }
    world.buildDamageFailure["inserter"] = { settings.global["rampant-maintenance-inserter-min-damage-failure"].value, settings.global["rampant-maintenance-inserter-max-damage-failure"].value-settings.global["rampant-maintenance-inserter-min-damage-failure"].value }
    world.buildLookup["lab"] = settings.global["rampant-maintenance-uselab"].value
    world.buildCooldown["lab"] = { settings.global["rampant-maintenance-lab-min-cooldown"].value*60, settings.global["rampant-maintenance-lab-max-cooldown"].value*60-settings.global["rampant-maintenance-lab-min-cooldown"].value*60 }
    world.buildFailure["lab"] = { settings.global["rampant-maintenance-lab-min-failure-rate"].value, settings.global["rampant-maintenance-lab-max-failure-rate"].value-settings.global["rampant-maintenance-lab-min-failure-rate"].value }
    world.buildDamage["lab"] = { settings.global["rampant-maintenance-lab-min-damage"].value, settings.global["rampant-maintenance-lab-max-damage"].value-settings.global["rampant-maintenance-lab-min-damage"].value }
    world.buildDamageFailure["lab"] = { settings.global["rampant-maintenance-lab-min-damage-failure"].value, settings.global["rampant-maintenance-lab-max-damage-failure"].value-settings.global["rampant-maintenance-lab-min-damage-failure"].value }
    world.buildLookup["lamp"] = settings.global["rampant-maintenance-uselamp"].value
    world.buildCooldown["lamp"] = { settings.global["rampant-maintenance-lamp-min-cooldown"].value*60, settings.global["rampant-maintenance-lamp-max-cooldown"].value*60-settings.global["rampant-maintenance-lamp-min-cooldown"].value*60 }
    world.buildFailure["lamp"] = { settings.global["rampant-maintenance-lamp-min-failure-rate"].value, settings.global["rampant-maintenance-lamp-max-failure-rate"].value-settings.global["rampant-maintenance-lamp-min-failure-rate"].value }
    world.buildDamage["lamp"] = { settings.global["rampant-maintenance-lamp-min-damage"].value, settings.global["rampant-maintenance-lamp-max-damage"].value-settings.global["rampant-maintenance-lamp-min-damage"].value }
    world.buildDamageFailure["lamp"] = { settings.global["rampant-maintenance-lamp-min-damage-failure"].value, settings.global["rampant-maintenance-lamp-max-damage-failure"].value-settings.global["rampant-maintenance-lamp-min-damage-failure"].value }
    world.buildLookup["generator"] = settings.global["rampant-maintenance-usegenerator"].value
    world.buildCooldown["generator"] = { settings.global["rampant-maintenance-generator-min-cooldown"].value*60, settings.global["rampant-maintenance-generator-max-cooldown"].value*60-settings.global["rampant-maintenance-generator-min-cooldown"].value*60 }
    world.buildFailure["generator"] = { settings.global["rampant-maintenance-generator-min-failure-rate"].value, settings.global["rampant-maintenance-generator-max-failure-rate"].value-settings.global["rampant-maintenance-generator-min-failure-rate"].value }
    world.buildDamage["generator"] = { settings.global["rampant-maintenance-generator-min-damage"].value, settings.global["rampant-maintenance-generator-max-damage"].value-settings.global["rampant-maintenance-generator-min-damage"].value }
    world.buildDamageFailure["generator"] = { settings.global["rampant-maintenance-generator-min-damage-failure"].value, settings.global["rampant-maintenance-generator-max-damage-failure"].value-settings.global["rampant-maintenance-generator-min-damage-failure"].value }
    world.buildLookup["mining-drill"] = settings.global["rampant-maintenance-usemining-drill"].value
    world.buildCooldown["mining-drill"] = { settings.global["rampant-maintenance-mining-drill-min-cooldown"].value*60, settings.global["rampant-maintenance-mining-drill-max-cooldown"].value*60-settings.global["rampant-maintenance-mining-drill-min-cooldown"].value*60 }
    world.buildFailure["mining-drill"] = { settings.global["rampant-maintenance-mining-drill-min-failure-rate"].value, settings.global["rampant-maintenance-mining-drill-max-failure-rate"].value-settings.global["rampant-maintenance-mining-drill-min-failure-rate"].value }
    world.buildDamage["mining-drill"] = { settings.global["rampant-maintenance-mining-drill-min-damage"].value, settings.global["rampant-maintenance-mining-drill-max-damage"].value-settings.global["rampant-maintenance-mining-drill-min-damage"].value }
    world.buildDamageFailure["mining-drill"] = { settings.global["rampant-maintenance-mining-drill-min-damage-failure"].value, settings.global["rampant-maintenance-mining-drill-max-damage-failure"].value-settings.global["rampant-maintenance-mining-drill-min-damage-failure"].value }
    world.buildLookup["offshore-pump"] = settings.global["rampant-maintenance-useoffshore-pump"].value
    world.buildCooldown["offshore-pump"] = { settings.global["rampant-maintenance-offshore-pump-min-cooldown"].value*60, settings.global["rampant-maintenance-offshore-pump-max-cooldown"].value*60-settings.global["rampant-maintenance-offshore-pump-min-cooldown"].value*60 }
    world.buildFailure["offshore-pump"] = { settings.global["rampant-maintenance-offshore-pump-min-failure-rate"].value, settings.global["rampant-maintenance-offshore-pump-max-failure-rate"].value-settings.global["rampant-maintenance-offshore-pump-min-failure-rate"].value }
    world.buildDamage["offshore-pump"] = { settings.global["rampant-maintenance-offshore-pump-min-damage"].value, settings.global["rampant-maintenance-offshore-pump-max-damage"].value-settings.global["rampant-maintenance-offshore-pump-min-damage"].value }
    world.buildDamageFailure["offshore-pump"] = { settings.global["rampant-maintenance-offshore-pump-min-damage-failure"].value, settings.global["rampant-maintenance-offshore-pump-max-damage-failure"].value-settings.global["rampant-maintenance-offshore-pump-min-damage-failure"].value }
    world.buildLookup["boiler"] = settings.global["rampant-maintenance-useboiler"].value
    world.buildCooldown["boiler"] = { settings.global["rampant-maintenance-boiler-min-cooldown"].value*60, settings.global["rampant-maintenance-boiler-max-cooldown"].value*60-settings.global["rampant-maintenance-boiler-min-cooldown"].value*60 }
    world.buildFailure["boiler"] = { settings.global["rampant-maintenance-boiler-min-failure-rate"].value, settings.global["rampant-maintenance-boiler-max-failure-rate"].value-settings.global["rampant-maintenance-boiler-min-failure-rate"].value }
    world.buildDamage["boiler"] = { settings.global["rampant-maintenance-boiler-min-damage"].value, settings.global["rampant-maintenance-boiler-max-damage"].value-settings.global["rampant-maintenance-boiler-min-damage"].value }
    world.buildDamageFailure["boiler"] = { settings.global["rampant-maintenance-boiler-min-damage-failure"].value, settings.global["rampant-maintenance-boiler-max-damage-failure"].value-settings.global["rampant-maintenance-boiler-min-damage-failure"].value }
    world.buildLookup["beacon"] = settings.global["rampant-maintenance-usebeacon"].value
    world.buildCooldown["beacon"] = { settings.global["rampant-maintenance-beacon-min-cooldown"].value*60, settings.global["rampant-maintenance-beacon-max-cooldown"].value*60-settings.global["rampant-maintenance-beacon-min-cooldown"].value*60 }
    world.buildFailure["beacon"] = { settings.global["rampant-maintenance-beacon-min-failure-rate"].value, settings.global["rampant-maintenance-beacon-max-failure-rate"].value-settings.global["rampant-maintenance-beacon-min-failure-rate"].value }
    world.buildDamage["beacon"] = { settings.global["rampant-maintenance-beacon-min-damage"].value, settings.global["rampant-maintenance-beacon-max-damage"].value-settings.global["rampant-maintenance-beacon-min-damage"].value }
    world.buildDamageFailure["beacon"] = { settings.global["rampant-maintenance-beacon-min-damage-failure"].value, settings.global["rampant-maintenance-beacon-max-damage-failure"].value-settings.global["rampant-maintenance-beacon-min-damage-failure"].value }
    world.buildLookup["assembling-machine"] = settings.global["rampant-maintenance-useassembling-machine"].value
    world.buildCooldown["assembling-machine"] = { settings.global["rampant-maintenance-assembling-machine-min-cooldown"].value*60, settings.global["rampant-maintenance-assembling-machine-max-cooldown"].value*60-settings.global["rampant-maintenance-assembling-machine-min-cooldown"].value*60 }
    world.buildFailure["assembling-machine"] = { settings.global["rampant-maintenance-assembling-machine-min-failure-rate"].value, settings.global["rampant-maintenance-assembling-machine-max-failure-rate"].value-settings.global["rampant-maintenance-assembling-machine-min-failure-rate"].value }
    world.buildDamage["assembling-machine"] = { settings.global["rampant-maintenance-assembling-machine-min-damage"].value, settings.global["rampant-maintenance-assembling-machine-max-damage"].value-settings.global["rampant-maintenance-assembling-machine-min-damage"].value }
    world.buildDamageFailure["assembling-machine"] = { settings.global["rampant-maintenance-assembling-machine-min-damage-failure"].value, settings.global["rampant-maintenance-assembling-machine-max-damage-failure"].value-settings.global["rampant-maintenance-assembling-machine-min-damage-failure"].value }
    world.buildLookup["furnace"] = settings.global["rampant-maintenance-usefurnace"].value
    world.buildCooldown["furnace"] = { settings.global["rampant-maintenance-furnace-min-cooldown"].value*60, settings.global["rampant-maintenance-furnace-max-cooldown"].value*60-settings.global["rampant-maintenance-furnace-min-cooldown"].value*60 }
    world.buildFailure["furnace"] = { settings.global["rampant-maintenance-furnace-min-failure-rate"].value, settings.global["rampant-maintenance-furnace-max-failure-rate"].value-settings.global["rampant-maintenance-furnace-min-failure-rate"].value }
    world.buildDamage["furnace"] = { settings.global["rampant-maintenance-furnace-min-damage"].value, settings.global["rampant-maintenance-furnace-max-damage"].value-settings.global["rampant-maintenance-furnace-min-damage"].value }
    world.buildDamageFailure["furnace"] = { settings.global["rampant-maintenance-furnace-min-damage-failure"].value, settings.global["rampant-maintenance-furnace-max-damage-failure"].value-settings.global["rampant-maintenance-furnace-min-damage-failure"].value }
    world.buildLookup["radar"] = settings.global["rampant-maintenance-useradar"].value
    world.buildCooldown["radar"] = { settings.global["rampant-maintenance-radar-min-cooldown"].value*60, settings.global["rampant-maintenance-radar-max-cooldown"].value*60-settings.global["rampant-maintenance-radar-min-cooldown"].value*60 }
    world.buildFailure["radar"] = { settings.global["rampant-maintenance-radar-min-failure-rate"].value, settings.global["rampant-maintenance-radar-max-failure-rate"].value-settings.global["rampant-maintenance-radar-min-failure-rate"].value }
    world.buildDamage["radar"] = { settings.global["rampant-maintenance-radar-min-damage"].value, settings.global["rampant-maintenance-radar-max-damage"].value-settings.global["rampant-maintenance-radar-min-damage"].value }
    world.buildDamageFailure["radar"] = { settings.global["rampant-maintenance-radar-min-damage-failure"].value, settings.global["rampant-maintenance-radar-max-damage-failure"].value-settings.global["rampant-maintenance-radar-min-damage-failure"].value }
    world.buildLookup["roboport"] = settings.global["rampant-maintenance-useroboport"].value
    world.buildCooldown["roboport"] = { settings.global["rampant-maintenance-roboport-min-cooldown"].value*60, settings.global["rampant-maintenance-roboport-max-cooldown"].value*60-settings.global["rampant-maintenance-roboport-min-cooldown"].value*60 }
    world.buildFailure["roboport"] = { settings.global["rampant-maintenance-roboport-min-failure-rate"].value, settings.global["rampant-maintenance-roboport-max-failure-rate"].value-settings.global["rampant-maintenance-roboport-min-failure-rate"].value }
    world.buildDamage["roboport"] = { settings.global["rampant-maintenance-roboport-min-damage"].value, settings.global["rampant-maintenance-roboport-max-damage"].value-settings.global["rampant-maintenance-roboport-min-damage"].value }
    world.buildDamageFailure["roboport"] = { settings.global["rampant-maintenance-roboport-min-damage-failure"].value, settings.global["rampant-maintenance-roboport-max-damage-failure"].value-settings.global["rampant-maintenance-roboport-min-damage-failure"].value }
    world.buildLookup["solar-panel"] = settings.global["rampant-maintenance-usesolar-panel"].value
    world.buildCooldown["solar-panel"] = { settings.global["rampant-maintenance-solar-panel-min-cooldown"].value*60, settings.global["rampant-maintenance-solar-panel-max-cooldown"].value*60-settings.global["rampant-maintenance-solar-panel-min-cooldown"].value*60 }
    world.buildFailure["solar-panel"] = { settings.global["rampant-maintenance-solar-panel-min-failure-rate"].value, settings.global["rampant-maintenance-solar-panel-max-failure-rate"].value-settings.global["rampant-maintenance-solar-panel-min-failure-rate"].value }
    world.buildDamage["solar-panel"] = { settings.global["rampant-maintenance-solar-panel-min-damage"].value, settings.global["rampant-maintenance-solar-panel-max-damage"].value-settings.global["rampant-maintenance-solar-panel-min-damage"].value }
    world.buildDamageFailure["solar-panel"] = { settings.global["rampant-maintenance-solar-panel-min-damage-failure"].value, settings.global["rampant-maintenance-solar-panel-max-damage-failure"].value-settings.global["rampant-maintenance-solar-panel-min-damage-failure"].value }
    world.buildLookup["fluid-turret"] = settings.global["rampant-maintenance-usefluid-turret"].value
    world.buildCooldown["fluid-turret"] = { settings.global["rampant-maintenance-fluid-turret-min-cooldown"].value*60, settings.global["rampant-maintenance-fluid-turret-max-cooldown"].value*60-settings.global["rampant-maintenance-fluid-turret-min-cooldown"].value*60 }
    world.buildFailure["fluid-turret"] = { settings.global["rampant-maintenance-fluid-turret-min-failure-rate"].value, settings.global["rampant-maintenance-fluid-turret-max-failure-rate"].value-settings.global["rampant-maintenance-fluid-turret-min-failure-rate"].value }
    world.buildDamage["fluid-turret"] = { settings.global["rampant-maintenance-fluid-turret-min-damage"].value, settings.global["rampant-maintenance-fluid-turret-max-damage"].value-settings.global["rampant-maintenance-fluid-turret-min-damage"].value }
    world.buildDamageFailure["fluid-turret"] = { settings.global["rampant-maintenance-fluid-turret-min-damage-failure"].value, settings.global["rampant-maintenance-fluid-turret-max-damage-failure"].value-settings.global["rampant-maintenance-fluid-turret-min-damage-failure"].value }
    world.buildLookup["ammo-turret"] = settings.global["rampant-maintenance-useammo-turret"].value
    world.buildCooldown["ammo-turret"] = { settings.global["rampant-maintenance-ammo-turret-min-cooldown"].value*60, settings.global["rampant-maintenance-ammo-turret-max-cooldown"].value*60-settings.global["rampant-maintenance-ammo-turret-min-cooldown"].value*60 }
    world.buildFailure["ammo-turret"] = { settings.global["rampant-maintenance-ammo-turret-min-failure-rate"].value, settings.global["rampant-maintenance-ammo-turret-max-failure-rate"].value-settings.global["rampant-maintenance-ammo-turret-min-failure-rate"].value }
    world.buildDamage["ammo-turret"] = { settings.global["rampant-maintenance-ammo-turret-min-damage"].value, settings.global["rampant-maintenance-ammo-turret-max-damage"].value-settings.global["rampant-maintenance-ammo-turret-min-damage"].value }
    world.buildDamageFailure["ammo-turret"] = { settings.global["rampant-maintenance-ammo-turret-min-damage-failure"].value, settings.global["rampant-maintenance-ammo-turret-max-damage-failure"].value-settings.global["rampant-maintenance-ammo-turret-min-damage-failure"].value }
    world.buildLookup["electric-turret"] = settings.global["rampant-maintenance-useelectric-turret"].value
    world.buildCooldown["electric-turret"] = { settings.global["rampant-maintenance-electric-turret-min-cooldown"].value*60, settings.global["rampant-maintenance-electric-turret-max-cooldown"].value*60-settings.global["rampant-maintenance-electric-turret-min-cooldown"].value*60 }
    world.buildFailure["electric-turret"] = { settings.global["rampant-maintenance-electric-turret-min-failure-rate"].value, settings.global["rampant-maintenance-electric-turret-max-failure-rate"].value-settings.global["rampant-maintenance-electric-turret-min-failure-rate"].value }
    world.buildDamage["electric-turret"] = { settings.global["rampant-maintenance-electric-turret-min-damage"].value, settings.global["rampant-maintenance-electric-turret-max-damage"].value-settings.global["rampant-maintenance-electric-turret-min-damage"].value }
    world.buildDamageFailure["electric-turret"] = { settings.global["rampant-maintenance-electric-turret-min-damage-failure"].value, settings.global["rampant-maintenance-electric-turret-max-damage-failure"].value-settings.global["rampant-maintenance-electric-turret-min-damage-failure"].value }
    world.buildLookup["accumulator"] = settings.global["rampant-maintenance-useaccumulator"].value
    world.buildCooldown["accumulator"] = { settings.global["rampant-maintenance-accumulator-min-cooldown"].value*60, settings.global["rampant-maintenance-accumulator-max-cooldown"].value*60-settings.global["rampant-maintenance-accumulator-min-cooldown"].value*60 }
    world.buildFailure["accumulator"] = { settings.global["rampant-maintenance-accumulator-min-failure-rate"].value, settings.global["rampant-maintenance-accumulator-max-failure-rate"].value-settings.global["rampant-maintenance-accumulator-min-failure-rate"].value }
    world.buildDamage["accumulator"] = { settings.global["rampant-maintenance-accumulator-min-damage"].value, settings.global["rampant-maintenance-accumulator-max-damage"].value-settings.global["rampant-maintenance-accumulator-min-damage"].value }
    world.buildDamageFailure["accumulator"] = { settings.global["rampant-maintenance-accumulator-min-damage-failure"].value, settings.global["rampant-maintenance-accumulator-max-damage-failure"].value-settings.global["rampant-maintenance-accumulator-min-damage-failure"].value }
    world.buildLookup["reactor"] = settings.global["rampant-maintenance-usereactor"].value
    world.buildCooldown["reactor"] = { settings.global["rampant-maintenance-reactor-min-cooldown"].value*60, settings.global["rampant-maintenance-reactor-max-cooldown"].value*60-settings.global["rampant-maintenance-reactor-min-cooldown"].value*60 }
    world.buildFailure["reactor"] = { settings.global["rampant-maintenance-reactor-min-failure-rate"].value, settings.global["rampant-maintenance-reactor-max-failure-rate"].value-settings.global["rampant-maintenance-reactor-min-failure-rate"].value }
    world.buildDamage["reactor"] = { settings.global["rampant-maintenance-reactor-min-damage"].value, settings.global["rampant-maintenance-reactor-max-damage"].value-settings.global["rampant-maintenance-reactor-min-damage"].value }
    world.buildDamageFailure["reactor"] = { settings.global["rampant-maintenance-reactor-min-damage-failure"].value, settings.global["rampant-maintenance-reactor-max-damage-failure"].value-settings.global["rampant-maintenance-reactor-min-damage-failure"].value }
    world.buildLookup["pump"] = settings.global["rampant-maintenance-usepump"].value
    world.buildCooldown["pump"] = { settings.global["rampant-maintenance-pump-min-cooldown"].value*60, settings.global["rampant-maintenance-pump-max-cooldown"].value*60-settings.global["rampant-maintenance-pump-min-cooldown"].value*60 }
    world.buildFailure["pump"] = { settings.global["rampant-maintenance-pump-min-failure-rate"].value, settings.global["rampant-maintenance-pump-max-failure-rate"].value-settings.global["rampant-maintenance-pump-min-failure-rate"].value }
    world.buildDamage["pump"] = { settings.global["rampant-maintenance-pump-min-damage"].value, settings.global["rampant-maintenance-pump-max-damage"].value-settings.global["rampant-maintenance-pump-min-damage"].value }
    world.buildDamageFailure["pump"] = { settings.global["rampant-maintenance-pump-min-damage-failure"].value, settings.global["rampant-maintenance-pump-max-damage-failure"].value-settings.global["rampant-maintenance-pump-min-damage-failure"].value }
    world.buildLookup["artillery-turret"] = settings.global["rampant-maintenance-useartillery-turret"].value
    world.buildCooldown["artillery-turret"] = { settings.global["rampant-maintenance-artillery-turret-min-cooldown"].value*60, settings.global["rampant-maintenance-artillery-turret-max-cooldown"].value*60-settings.global["rampant-maintenance-artillery-turret-min-cooldown"].value*60 }
    world.buildFailure["artillery-turret"] = { settings.global["rampant-maintenance-artillery-turret-min-failure-rate"].value, settings.global["rampant-maintenance-artillery-turret-max-failure-rate"].value-settings.global["rampant-maintenance-artillery-turret-min-failure-rate"].value }
    world.buildDamage["artillery-turret"] = { settings.global["rampant-maintenance-artillery-turret-min-damage"].value, settings.global["rampant-maintenance-artillery-turret-max-damage"].value-settings.global["rampant-maintenance-artillery-turret-min-damage"].value }
    world.buildDamageFailure["artillery-turret"] = { settings.global["rampant-maintenance-artillery-turret-min-damage-failure"].value, settings.global["rampant-maintenance-artillery-turret-max-damage-failure"].value-settings.global["rampant-maintenance-artillery-turret-min-damage-failure"].value }
    world.buildLookup["rocket-silo"] = settings.global["rampant-maintenance-userocket-silo"].value
    world.buildCooldown["rocket-silo"] = { settings.global["rampant-maintenance-rocket-silo-min-cooldown"].value*60, settings.global["rampant-maintenance-rocket-silo-max-cooldown"].value*60-settings.global["rampant-maintenance-rocket-silo-min-cooldown"].value*60 }
    world.buildFailure["rocket-silo"] = { settings.global["rampant-maintenance-rocket-silo-min-failure-rate"].value, settings.global["rampant-maintenance-rocket-silo-max-failure-rate"].value-settings.global["rampant-maintenance-rocket-silo-min-failure-rate"].value }
    world.buildDamage["rocket-silo"] = { settings.global["rampant-maintenance-rocket-silo-min-damage"].value, settings.global["rampant-maintenance-rocket-silo-max-damage"].value-settings.global["rampant-maintenance-rocket-silo-min-damage"].value }
    world.buildDamageFailure["rocket-silo"] = { settings.global["rampant-maintenance-rocket-silo-min-damage-failure"].value, settings.global["rampant-maintenance-rocket-silo-max-damage-failure"].value-settings.global["rampant-maintenance-rocket-silo-min-damage-failure"].value }
    world.buildLookup["electric-pole"] = settings.global["rampant-maintenance-useelectric-pole"].value
    world.buildCooldown["electric-pole"] = { settings.global["rampant-maintenance-electric-pole-min-cooldown"].value*60, settings.global["rampant-maintenance-electric-pole-max-cooldown"].value*60-settings.global["rampant-maintenance-electric-pole-min-cooldown"].value*60 }
    world.buildFailure["electric-pole"] = { settings.global["rampant-maintenance-electric-pole-min-failure-rate"].value, settings.global["rampant-maintenance-electric-pole-max-failure-rate"].value-settings.global["rampant-maintenance-electric-pole-min-failure-rate"].value }
    world.buildDamage["electric-pole"] = { settings.global["rampant-maintenance-electric-pole-min-damage"].value, settings.global["rampant-maintenance-electric-pole-max-damage"].value-settings.global["rampant-maintenance-electric-pole-min-damage"].value }
    world.buildDamageFailure["electric-pole"] = { settings.global["rampant-maintenance-electric-pole-min-damage-failure"].value, settings.global["rampant-maintenance-electric-pole-max-damage-failure"].value-settings.global["rampant-maintenance-electric-pole-min-damage-failure"].value }

    world.entityCursor = nil
    world.entityMap = {}

    rendering.clear("RampantMaintenance")

    for name,valid in pairs(world.buildLookup) do
        if (valid) then
            for _,surface in pairs(game.surfaces) do
                local entities = surface.find_entities_filtered({
                        type = name,
                        force = "player",
                        collision_mask = {"player-layer","object-layer"}
                })
                for _,entity in pairs(entities) do
                    local cMask = entity.prototype.collision_mask
                    local entityType = entity.type
                    local build = world.buildLookup[entityType]
                    world.entityMap[entity.unit_number] = generate(game.tick, entity, world)
                end
            end
        end
    end

    for i,p in ipairs(game.connected_players) do
        p.print("Rampant Maintenance - Changing building toggles")
    end

    return true
end

local function onConfigChanged()
    if not world.version or world.version < 2 then

        world.entityCursor = nil
        world.entityMap = {}
        world.queries = {}
        world.queries.disableQuery = {
            sprite="utility.warning_icon",
            target=nil,
            surface=nil,
            x_scale=0.5,
            y_scale=0.5,
            time_to_live=0
        }

        for i,p in ipairs(game.connected_players) do
            p.print("Rampant Maintenance - Version 1.0.0")
        end
        world.version = 2
    end
    onModSettingsChange()
end

local function processEntity(tick)
    local entityData
    world.entityCursor, entityData = next(world.entityMap, world.entityCursor)
    if world.entityCursor then
        if entityData.e.valid then
            local entityType = entityData.e.type
            local predicate = processRecord[entityType];
            if predicate then
                process(predicate, entityData, tick, world)
            end
        else
            local oldEntityCursor = world.entityCursor
            world.entityCursor = next(world.entityMap, world.entityCursor)
            world.entityMap[oldEntityCursor] = nil
        end
    end
end

local function onTick(event)
    local tick = event.tick
    processEntity(tick)
    processEntity(tick)
    processEntity(tick)
    processEntity(tick)
    processEntity(tick)
end

local function onRemoval(event)
    local entity = event.entity
    if entity.valid then
        local entityId = entity.unit_number
        if entityId then
            if (world.entityCursor == entityId) then
                world.entityCursor = next(world.entityMap, world.entityCursor)
            end
            world.entityMap[entityId] = nil
        end
    end
end

local function onCreate(event)
    local entity = event.created_entity or event.entity or event.destination
    if entity.valid then
        local cMask = entity.prototype.collision_mask
        local entityType = entity.type
        local build = world.buildLookup[entityType]
        print("h", entityType, entity.active)
        if (build and (cMask["player-layer"] or cMask["object-layer"])) then
            world.entityMap[entity.unit_number] = generate(event.tick, entity, world)
        end
    end
end

local function onInit()
    global.world = {}

    world = global.world

    onConfigChanged()
end

local function onLoad()
    world = global.world
end

-- hooks

script.on_event(defines.events.on_tick, onTick)
script.on_init(onInit)
script.on_load(onLoad)
script.on_event(defines.events.on_runtime_mod_setting_changed, onModSettingsChange)
script.on_event(
    {
        defines.events.on_robot_built_entity,
        defines.events.on_built_entity,
        defines.events.script_raised_built,
        defines.events.script_raised_revive,
        defines.events.on_entity_cloned
    },
    onCreate)

script.on_event(
    {
        defines.events.on_entity_died,
        defines.events.on_player_mined_entity,
        defines.events.on_robot_mined_entity,
        defines.events.script_raised_destroy
    },
    onRemoval)

script.on_configuration_changed(onConfigChanged)
