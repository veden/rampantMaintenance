if buildRecordG then
    return buildRecordG
end

-- imports

local constants = require("Constants")

-- constants

local ENTITES_WITHOUT_DOWNTIME = constants.ENTITES_WITHOUT_DOWNTIME

-- imported fuctions

local mRandom = math.random
local roundToNearest = constants.roundToNearest

-- module codes

local buildRecord = {}

function buildRecord.generate(tick, entity, world)
    local entityType = entity.type
    local cooldowns = world.buildCooldown[entityType]
    local cooldown = (mRandom() * cooldowns.range) + cooldowns.low
    local failureCount = 0
    if not ENTITES_WITHOUT_DOWNTIME[entityType] and not entity.active then
        failureCount = 1
    end
    local tileModifier = 1
    local totalTileModifier = 0
    local tileCount = 0
    if world.useTileModifier then
        local surface = entity.surface
        local boundingBox = entity.bounding_box
        if boundingBox then
            local tiles = surface.find_tiles_filtered({
                    area = boundingBox
            })
            if #tiles > 0 then
                for i = 1,#tiles do
                    tileCount = tileCount + 1
                    totalTileModifier = totalTileModifier + (world.terrainModifierLookup[tiles[i].name] or 0)
                end
                tileModifier = totalTileModifier / tileCount
            end
        end
    end
    return {
        ["c"] = (entity.get_health_ratio() * cooldown) + tick, -- cooldown
        ["fC"] = failureCount, -- failed count
        ["u"] = 0, -- uptime
        ["lE"] = tick, -- last event
        ["d"] = 0, -- downtime
        ["e"] = entity, -- entity,
        ["eU"] = entity.unit_number,
        ["t"] = tileModifier,
        ["tM"] = (world.buildTileModifier[entityType] or 0),
        ["tT"] = totalTileModifier,
        ["tC"] = tileCount,
        ["p"] = (world.buildPollutionModifier[entityType] or 0)
    }
end

buildRecordG = buildRecord
return buildRecord
