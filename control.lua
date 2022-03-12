-- imports

local buildRecord = require("libs/BuildRecord")
local processRecord = require("libs/ProcessRecord")
local constants = require("libs/Constants")
local gui = require("libs/Gui")

-- imported functions

local generate = buildRecord.generate
local process = processRecord.process
local activateEntity = processRecord.activateEntity

-- local references

local world

-- constants

local ALL_ENTITY_TYPES = constants.ALL_ENTITY_TYPES
local ENTITES_WITHOUT_DOWNTIME = constants.ENTITES_WITHOUT_DOWNTIME

local RESEARCH_LOOKUP = constants.RESEARCH_LOOKUP

local TERRAIN_MODIFIERS = constants.TERRAIN_MODIFIERS

-- module code

local function onModSettingsChange(event)

    if event and (string.sub(event.setting, 1, #"rampant-maintenance") ~= "rampant-maintenance") then
        return false
    end

    world.buildLookup = {}
    world.buildDamage = {}
    world.buildCooldown = {}
    world.buildFailure = {}
    world.buildDamageFailure = {}
    world.buildDowntime = {}
    world.buildTileModifier = {}
    world.buildPollutionModifier = {}
    world.checksPerTick = settings.global["rampant-maintenance-checks-per-tick"].value
    world.useTileModifier = settings.startup["rampant-maintenance--tile-modifier"].value
    world.usePollutionModifier = settings.startup["rampant-maintenance--pollution-modifier"].value

    for _,name in pairs(ALL_ENTITY_TYPES) do
        world.buildLookup[name] = settings.global["rampant-maintenance-use-" .. name].value
        world.buildCooldown[name] = {
            ["low"] = (settings.global["rampant-maintenance-" .. name .."-min-cooldown"].value * 60),
            ["range"] = (settings.global["rampant-maintenance-" .. name .. "-max-cooldown"].value * 60) - (settings.global["rampant-maintenance-" .. name .. "-min-cooldown"].value * 60)
        }
        world.buildDamage[name] = {
            ["low"] = settings.global["rampant-maintenance-" .. name .."-min-damage"].value,
            ["range"] = settings.global["rampant-maintenance-" .. name .. "-max-damage"].value - settings.global["rampant-maintenance-" .. name .. "-min-damage"].value
        }
        world.buildDamageFailure[name] = {
            ["low"] = settings.global["rampant-maintenance-" .. name .."-min-damage-failure"].value,
            ["range"] = settings.global["rampant-maintenance-" .. name .. "-max-damage-failure"].value - settings.global["rampant-maintenance-" .. name .. "-min-damage-failure"].value
        }
        world.buildFailure[name] = {
            ["low"] = settings.global["rampant-maintenance-" .. name .."-min-failure-rate"].value,
            ["range"] = settings.global["rampant-maintenance-" .. name .. "-max-failure-rate"].value - settings.global["rampant-maintenance-" .. name .. "-min-failure-rate"].value
        }
        if world.useTileModifier then
            world.buildTileModifier[name] = settings.global["rampant-maintenance-"..name.."-tile-modifier"].value
        end
        if world.usePollutionModifier then
            world.buildPollutionModifier[name] = settings.global["rampant-maintenance-"..name.."-pollution-modifier"].value
        end
        if not ENTITES_WITHOUT_DOWNTIME[name] then
            world.buildDowntime[name] = {
                ["low"] = (settings.global["rampant-maintenance-" .. name .."-min-downtime"].value * 60),
                ["range"] = (settings.global["rampant-maintenance-" .. name .. "-max-downtime"].value * 60) - (settings.global["rampant-maintenance-" .. name .. "-min-downtime"].value * 60)
            }
        end
    end

    world.showBreakdownSprite = settings.global["rampant-maintenance-show-breakdown-sprite"].value

    world.terrainModifierLookup = {}

    if world.useTileModifier then
        for k in pairs(game.get_filtered_tile_prototypes({})) do
            for _,tm in pairs(TERRAIN_MODIFIERS) do
                if string.find(k, tm[1]) then
                    world.terrainModifierLookup[k] = tm[2]
                    break
                end
            end
            if not world.terrainModifierLookup[k] then
                world.terrainModifierLookup[k] = 1
            end
        end
    end

    rendering.clear("RampantMaintenance")

    world.entityCursor = 1
    world.entityFill = 1
    world.entities = {}
    world.entityLookup = {}
    world.entities.len = 0

    for name,valid in pairs(world.buildLookup) do
        if (valid) then
            for _,surface in pairs(game.surfaces) do
                local entities = surface.find_entities_filtered({
                        type = name,
                        force = "player",
                        collision_mask = {"player-layer","object-layer"}
                })
                for _,entity in pairs(entities) do
                    local len = world.entities.len+1
                    local entityRecord = generate(game.tick, entity, world)
                    world.entities[len] = entityRecord
                    world.entities.len = len
                    world.entityLookup[entityRecord.eU] = entityRecord
                end
            end
        end
    end

    game.print("Rampant Maintenance - Changing building toggles")

    return true
end

local function onConfigChanged()
    if not world.version or world.version < 7 then
        world.version = 7

        world.entityCursor = 1
        world.entityFill = 1
        world.entities = {}
        world.entityLookup = {}
        world.entities.len = 0
        world.playerPopup = {}
        world.playerEntity = {}
        world.playerIterator = nil
        world.terrainModifierLookup = {}
        world.playerGuiOpen = {}
        world.playerGuiTick = {}

        world.queries = {}
        world.forceResearched = {}
        world.queries.disableQuery = {
            sprite="utility.warning_icon",
            target=nil,
            surface=nil,
            x_scale=0.25,
            y_scale=0.25,
            target_offset = {-0.5, -0.5},
            time_to_live=0
        }

        world.rollFailure = nil
        world.rollDamageFailure = nil
        world.rollChanceFailure = nil
        world.rollCooldown = nil
        world.rollDamage = nil

        onModSettingsChange()

        for _, force in pairs(game.forces) do
            force.reset_technology_effects()
        end

        for _,p in ipairs(game.connected_players) do
            p.print("Rampant Maintenance - Version 1.2.0")
        end
    end
end

local function processEntity(tick)
    if (world.entityCursor <= world.entities.len) then
        local cursor = world.entityCursor
        local entityData = world.entities[cursor]
        if entityData.e.valid then
            local entityType = entityData.e.type
            local predicate = processRecord[entityType]
            if predicate then
                process(predicate, entityData, tick, world)
                local fillCursor = world.entityFill
                world.entities[fillCursor] = entityData
                world.entityFill = fillCursor + 1
            else
                world.entityLookup[entityData.eU] = nil
            end
        else
            world.entityLookup[entityData.eU] = nil
        end
        world.entityCursor = cursor + 1
    else
        world.entities.len = world.entityFill - 1
        world.entityCursor = 1
        world.entityFill = 1
    end
end

local function onPlayerRepaired(event)
    local entity = event.entity
    if entity.valid and (entity.get_health_ratio() == 1) then
        local entityRecord = world.entityLookup[entity.unit_number]
        if entityRecord then
            activateEntity(entityRecord, event.tick)
        end
    end
end

local function onTick(event)
    local tick = event.tick

    for _=1,world.checksPerTick do
        processEntity(tick)
    end

    local playerId = world.playerIterator
    if not playerId then
        world.playerIterator = next(game.connected_players, world.playerIterator)
    else
        local player = game.connected_players[playerId]
        local selectedEntity = player.selected
        if selectedEntity then
            local entityRecord = world.entityLookup[selectedEntity.unit_number]
            gui.update(world, playerId, entityRecord, tick)
        else
            gui.update(world, playerId, nil, tick)
        end
    end
end

local function onCreate(event)
    local entity = event.created_entity or event.entity or event.destination
    if entity.valid then
        local cMask = entity.prototype.collision_mask
        local build = world.buildLookup[entity.type]
        if (build and (cMask["player-layer"] or cMask["object-layer"])) then
            local len = world.entities.len+1
            local entityRecord = generate(event.tick, entity, world)
            world.entities[len] = entityRecord
            world.entities.len = len
            world.entityLookup[entityRecord.eU] = entityRecord
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

local function onResearchFinished(event)
    local research = event.research
    local researchName = research.name
    local researchType = RESEARCH_LOOKUP[researchName]
    if (researchType) then
        local researchForce = research.force.name
        local researches = world.forceResearched[researchForce]
        if not researches then
            researches = {}
            world.forceResearched[researchForce] = researches
        end
        if researchType == "tile" then
            researches[researchType] = (research.level * 0.03)
        elseif researchType == "cooldown" then
            researches[researchType] = (research.level * 0.08)
        else
            researches[researchType] = 1 - (research.level * 0.08)
        end
    end
end

local function onResearchReset(event)
    world.forceResearched[event.force.name] = nil
end

local function onLuaShortcut(event)
    if event.prototype_name == "rampant-maintenance--info" then
        local playerIndex = event.player_index
        local guiPanel = world.playerGuiOpen[playerIndex]
        if not guiPanel then
            world.playerGuiOpen[playerIndex] = gui.create(game.players[playerIndex])
        else
            gui.close(world, event.player_index)
            world.playerGuiOpen[playerIndex] = nil
        end
    end
end

-- hooks

script.on_event(defines.events.on_lua_shortcut, onLuaShortcut)
script.on_event(defines.events.on_player_repaired_entity, onPlayerRepaired)
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

script.on_event(defines.events.on_research_finished, onResearchFinished)
script.on_event(defines.events.on_technology_effects_reset, onResearchReset)

script.on_configuration_changed(onConfigChanged)
