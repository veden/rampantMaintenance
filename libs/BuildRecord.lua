if buildRecordG then
    return buildRecordG
end

-- imports

local constants = require("Constants")

-- constants

local ENTITES_WITHOUT_DOWNTIME = constants.ENTITES_WITHOUT_DOWNTIME

-- imported fuctions

local mRandom = math.random

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
    return {
        ["c"] = ((entity.health / entity.prototype.max_health) * cooldown) + tick, -- cooldown
        ["fC"] = failureCount, -- failed count
        ["u"] = 0, -- uptime
        ["lE"] = tick, -- last event
        ["d"] = 0, -- downtime
        ["e"] = entity, -- entity,
        ["eU"] = entity.unit_number
    }
end

buildRecordG = buildRecord
return buildRecord
