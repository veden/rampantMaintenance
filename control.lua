-- imports

local buildRecord = require("libs/BuildRecord")
local processRecord = require("libs/ProcessRecord")
local constants = require("libs/Constants")

-- imported functions

local mRandom = math.random

local generate = buildRecord.generate
local process = processRecord.process
local activateEntity = processRecord.activateEntity
local recordSelection = processRecord.recordSelection

-- local references

local world

-- constants

local TICKS_PER_FIVE_HOURS = constants.TICKS_PER_FIVE_HOURS
local TICKS_PER_MINUTE = constants.TICKS_PER_MINUTE
local TICKS_PER_HOUR = constants.TICKS_PER_HOUR

local ALL_ENTITY_TYPES = constants.ALL_ENTITY_TYPES
local ENTITES_WITHOUT_DOWNTIME = constants.ENTITES_WITHOUT_DOWNTIME

local POPUP_TTL = constants.POPUP_TTL

local RESEARCH_LOOKUP = constants.RESEARCH_LOOKUP

-- module code

local function roundToNearest(number, multiple)
    local num = number + (multiple * 0.5)
    return num - (num % multiple)
end


local function convertToTimeScale(v)
    local ts
    local suffix
    if v < TICKS_PER_FIVE_HOURS then
        ts = roundToNearest(v / TICKS_PER_MINUTE, 0.01)
        suffix = "(m)"
    else
        ts = roundToNearest(v / TICKS_PER_HOUR, 0.001)
        suffix = "(h)"
    end
    return tostring(ts) .. suffix
end

local function onModSettingsChange(event)

    if event and (string.sub(event.setting, 1, #"rampant-maintenance") ~= "rampant-maintenance") then
        return false
    end

    world.rollFailure = mRandom()
    world.rollDamageFailure = mRandom()
    world.rollChanceFailure = mRandom()
    world.rollCooldown = mRandom()
    world.rollDamage = mRandom()

    world.buildLookup = {}
    world.buildDamage = {}
    world.buildCooldown = {}
    world.buildFailure = {}
    world.buildDamageFailure = {}
    world.buildDowntime = {}
    world.checksPerTick = settings.global["rampant-maintenance-checks-per-tick"].value

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
        if not ENTITES_WITHOUT_DOWNTIME[name] then
            world.buildDowntime[name] = {
                ["low"] = (settings.global["rampant-maintenance-" .. name .."-min-downtime"].value * 60),
                ["range"] = (settings.global["rampant-maintenance-" .. name .. "-max-downtime"].value * 60) - (settings.global["rampant-maintenance-" .. name .. "-min-downtime"].value * 60)
            }
        end
    end

    world.showBreakdownSprite = settings.global["rampant-maintenance-show-breakdown-sprite"].value

    world.entityCursor = 1
    world.entityFill = 1
    world.entities = {}
    world.entityLookup = {}
    world.entitySelected = {}
    world.entities.len = 0
    world.playerPopup = {}
    world.playerEntity = {}
    world.playerIterator = nil

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

local function clearMetrics(popups, playerId)
    if popups and rendering.is_valid(popups[1]) then
        for i=1,6 do
            rendering.destroy(popups[i])
        end
    end
    world.playerPopup[playerId] = nil
    world.playerEntity[playerId] = nil
end

local function renderMetrics(entityRecord, player, popups)
    local entity = entityRecord.e
    local mttr = 0
    local mtbf = entityRecord["u"]
    if entityRecord["fC"] ~= 0 then
        mttr = (entityRecord["d"] / entityRecord["fC"])
        mtbf = (mtbf / entityRecord["fC"])
    end
    local uptimeDenominator = (mttr + mtbf)
    local uptime
    if uptimeDenominator ~= 0 then
        uptime = roundToNearest((mtbf / uptimeDenominator) * 100, 0.1)
    else
        uptime = 100
    end
    local uptimeDuration = convertToTimeScale(entityRecord["u"])
    local downtimeDuration = convertToTimeScale(entityRecord["d"])
    local mtbfDuration = convertToTimeScale(mtbf)
    local mttrDuration = convertToTimeScale(mttr)
    if not popups then
        return {
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup0",
                        uptimeDuration
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 0, g = 1, b = 0 },
                    target_offset = { 0, 0.5 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            }),
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup1",
                        downtimeDuration
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 1, g = 0, b = 0 },
                    target_offset = { 0, 1.0 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            }),
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup2",
                        entityRecord["fC"]
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 1, g = 0, b = 0 },
                    target_offset = { 0, 1.5 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            }),
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup3",
                        mtbfDuration
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 0, g = 1, b = 0 },
                    target_offset = { 0, 2.0 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            }),
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup4",
                        mttrDuration
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 1, g = 0, b = 0 },
                    target_offset = { 0, 2.5 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            }),
            rendering.draw_text({
                    text={
                        "description.rampant-maintenance--metric-popup5",
                        uptime
                    },
                    time_to_live=POPUP_TTL,
                    surface = entity.surface,
                    target = entity,
                    color = { r = 0, g = 1, b = 1 },
                    target_offset = { 0, 3.0 },
                    scale = 1.2,
                    players={player},
                    only_in_alt_mode = true
            })
        }
    else
        if (rendering.is_valid(popups[1]) and (rendering.get_time_to_live(popups[1]) < 30)) then
            rendering.set_text(
                popups[1],
                {
                    "description.rampant-maintenance--metric-popup0",
                    uptimeDuration
                }
            )
            rendering.set_text(
                popups[2],
                {
                    "description.rampant-maintenance--metric-popup1",
                    downtimeDuration
                }
            )
            rendering.set_text(
                popups[3],
                {
                    "description.rampant-maintenance--metric-popup2",
                    entityRecord["fC"]
                }
            )
            rendering.set_text(
                popups[4],
                {
                    "description.rampant-maintenance--metric-popup3",
                    mtbfDuration
                }
            )
            rendering.set_text(
                popups[5],
                {
                    "description.rampant-maintenance--metric-popup4",
                    mttrDuration
                }
            )
            rendering.set_text(
                popups[6],
                {
                    "description.rampant-maintenance--metric-popup5",
                    uptime
                }
            )
            for i=1,6 do
                rendering.set_time_to_live(
                    popups[i],
                    POPUP_TTL
                )
            end
        end
        return popups
    end
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

        onModSettingsChange()

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
        world.rollFailure = mRandom()
        world.rollDamageFailure = mRandom()
        world.rollChanceFailure = mRandom()
        world.rollCooldown = mRandom()
        world.rollDamage = mRandom()

        processEntity(tick)
    end

    local playerId = world.playerIterator
    if not playerId then
        world.playerIterator = next(game.connected_players, world.playerIterator)
    else
        local player = game.connected_players[playerId]
        local selectedEntity = player.selected
        local popups = world.playerPopup[playerId]
        if selectedEntity then
            local entityRecord = world.entityLookup[selectedEntity.unit_number]
            if not entityRecord then
                clearMetrics(popups, playerId)
            else
                recordSelection(entityRecord, tick)
                if (world.playerEntity[playerId] ~= entityRecord.eU) then
                    clearMetrics(popups, playerId)
                    world.playerPopup[playerId] = renderMetrics(entityRecord, player)
                else
                    world.playerPopup[playerId] = renderMetrics(entityRecord, player, popups)
                end
                world.playerEntity[playerId] = entityRecord.eU
            end
        else
            clearMetrics(popups, playerId)
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
        researches[researchType] = 1 - (research.level * 0.08)
    end
end

local function onResearchReset(event)
    world.forceResearched[event.force.name] = nil
end

-- hooks

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
