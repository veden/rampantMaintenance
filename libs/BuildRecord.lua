if buildRecordG then
    return buildRecordG
end

local mRandom = math.random

local buildRecord = {}

function buildRecord.generate(tick, entity, world)
    local entityType = entity.type
    local cooldowns = world.buildCooldown[entityType]
    local cooldown = (mRandom() * cooldowns[2]) + cooldowns[1]
    return {
        ["c"] = ((entity.health / entity.prototype.max_health) * cooldown) + tick,
        ["e"] = entity
    }
end

buildRecordG = buildRecord
return buildRecord
