-- imports

local buildRecord = require("libs/BuildRecord")
local processRecord = require("libs/ProcessRecord")

-- imported functions

local mLog10 = math.log10
local mRandom = math.random
local mSqrt = math.sqrt
local sFind = string.find

-- local references

local world

-- module code

local function onModSettingsChange(event)

    if event and (string.sub(event.setting, 1, 19) ~= "rampant-maintenance") then
        return false
    end

    -- world.evolutionPerHiveKilled = settings.global["rampant-evolution-evolutionPerHiveKilled"].value * settingToPercent

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
            local process = processRecord[entityData.e.type];
            if process then
                process(entityData, tick, world.queries)
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
        local build = buildRecord[entity.type]
        if (entity.active and build and (cMask["player-layer"] or cMask["object-layer"])) then
            world.entityMap[entity.unit_number] = build(tick, entity)
        end
    end
end

local function onSectorScanned(event)

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

script.on_event(
    {
        defines.events.on_sector_scanned
    },
    onSectorScanned)

script.on_configuration_changed(onConfigChanged)
