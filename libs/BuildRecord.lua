if buildRecordG then
    return buildRecordG
end

local mRandom = math.random

local buildRecord = {}

function buildRecord.generate(tick, entity, world)
    local entityType = entity.type
    local cooldownMinMax = world.buildCooldown[entityType]
    local cooldown = mRandom(world.buildCooldown[entityType][2], world.buildCooldown[entityType][1])
    return {
        ["c"] = ((entity.health / entity.prototype.max_health) * cooldown) + tick,
        ["e"] = entity
    }
end

buildRecordG = buildRecord
return buildRecord
