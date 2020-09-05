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
    if not world.version or world.version < 1 then

        world.entityCursor = nil
        world.surfaceCursor = nil
        world.entityMap = nil
        world.surfaceEntityMaps = {}

        for i,p in ipairs(game.connected_players) do
            p.print("Rampant Maintenance - Version 1.0.0")
        end
        world.version = 1
    end
    onModSettingsChange()
end

local function recordEntity(tick, surface, entity)
    local surfaceIndex = surface.index
    local eMap = world.surfaceEntityMaps[surfaceIndex]
    if not eMap then
        eMap = {}
        world.surfaceEntityMaps[surfaceIndex] = eMap
    end
    local cMask = entity.prototype.collision_mask
    local build = buildRecord[entity.type]
    if (entity.active and build and (cMask["player-layer"] or cMask["object-layer"])) then
        eMap[entity.unit_number] = build(tick, entity)
    end
end

local function removeEntityRecord(tick, surface, entity)
    local entityId = entity.unit_number
    local eMap = world.surfaceEntityMaps[surface.index]
    if (eMap) then
        if (world.entityCursor == entityId) then
            world.entityCursor = next(eMap, entityId)
        end
        eMap[entityId] = nil
    end
end

local function processEntity()
    if not world.entityMap then
        return
    end
    local entityData
    world.entityCursor, entityData = next(world.entityMap, world.entityCursor)
    if world.entityCursor then
        if entityData.e.valid then
            local process = processRecord[entityData.e.type];
            if process then
                process(entityData)
            end
        else
            local oldEntityCursor = world.entityCursor
            world.entityCursor, _ = next(world.entityMap, world.entityCursor)
            world.entityMap[oldEntityCursor] = nil
        end
    end

    if not world.entityCursor then
        world.entityMap = nil
    end
end

local function onTick(event)
    if not world.entityMap then
        world.surfaceCursor, world.entityMap = next(world.surfaceEntityMaps, world.surfaceCursor)
        world.entityCursor = nil
    end
    if not world.surfaceCursor then
        return
    end
    if world.entityMap and (game.get_surface(world.surfaceCursor).valid) then
        processEntity()
        processEntity()
        processEntity()
    else
        world.surfaceEntityMaps[surfaceIndex] = nil
    end
end

local function onRemoval(event)
    local entity = event.entity
    if entity.valid then
        removeEntityRecord(event.tick, entity.surface, entity)
    end
end

local function onCreate(event)
    local entity = event.created_entity or event.entity or event.destination
    if entity.valid then
        recordEntity(event.tick, entity.surface, entity)
    end
end

local function onSectorScanned(event)

end

local function removeEntityMapSurface(event)
    local surfaceIndex = event.surface_index
    if (world.surfaceCursor == surfaceIndex) then
        world.surfaceCursor = nil
        world.entityMap = nil
        world.entityCursor = nil
    end
    world.surfaceEntityMaps[surfaceIndex] = nil
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

-- script.on_nth_tick(60*60, onTick)
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
        defines.events.on_surface_cleared,
        defines.events.on_surface_deleted
    },
    removeEntityMapSurface)

script.on_event(
    {
        defines.events.on_sector_scanned
    },
    onSectorScanned)

script.on_configuration_changed(onConfigChanged)
