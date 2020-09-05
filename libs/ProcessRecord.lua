if processRecordG then
   return processRecordG
end

local processRecord = {}

processRecord["inserter"] = function (entityRecord)

end

processRecord["lab"] = function (entityRecord)

end

processRecord["lamp"] = function (entityRecord)

end

processRecord["generator"] = function (entityRecord)

end

processRecord["mining-drill"] = function (entityRecord)

end

processRecord["offshore-pump"] = function (entityRecord)

end

processRecord["rail-signal"] = function (entityRecord)

end

processRecord["chain-signal"] = function (entityRecord)

end

processRecord["boiler"] = function (entityRecord)

end

processRecord["beacon"] = function (entityRecord)

end

processRecord["assembling-machine"] = function (entityRecord)
    if (entityRecord.e.active) then
        entityRecord.e.active = false
    else
        entityRecord.e.active = true
    end
end

processRecord["furnace"] = function (entityRecord)
    local e = entityRecord.e
    if (e.active) then
        e.active = false
    else
        e.active = true
    end
    e.damage(10, e.force)
end

processRecord["radar"] = function (entityRecord)

end

processRecord["roboport"] = function (entityRecord)

end

processRecord["solar-panel"] = function (entityRecord)

end

processRecord["fluid-turret"] = function (entityRecord)

end

processRecord["ammo-turret"] = function (entityRecord)

end

processRecord["electric-turret"] = function (entityRecord)

end

processRecord["accumulator"] = function (entityRecord)

end

processRecord["reactor"] = function (entityRecord)

end

processRecord["pump"] = function (entityRecord)

end

processRecord["artillery-turret"] = function (entityRecord)

end

processRecord["pumpjack"] = function (entityRecord)

end

processRecord["turbine"] = function (entityRecord)

end

processRecord["heat-exchanger"] = function (entityRecord)

end

processRecordG = processRecord
return processRecord
