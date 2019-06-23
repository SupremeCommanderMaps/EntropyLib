-- Unit creation service that can be used to create a seam for behavior modification of all constructed units.
function newUnitCreator()
    local this = {}
    local onUnitCreated = {}

    local function runOnUnitCreated(unit, unitInfo)
        for _, callback in onUnitCreated do
            callback(unit, unitInfo)
        end
    end

    -- Creates a new unit and then invokes the set onUnitCreated callbacks/"event handlers".
    -- unitCreator.create({
    --     armyName = "ARMY_1",
    --     blueprintName = "uaa0107",
    --     x = 42,
    --     y = 42
    -- })
    -- Optional parameters: z, yawInRadians
    this.create = function(unitInfo)
        unitInfo.blueprintName = unitInfo.blueprintName or unitInfo[1]
        unitInfo.armyName = unitInfo.armyName or unitInfo[2]
        unitInfo.z = unitInfo.z or 25.9844
        unitInfo.yawInRadians = unitInfo.yawInRadians or 0

        local unit = CreateUnitHPR(
            unitInfo.blueprintName,
            unitInfo.armyName,
            unitInfo.x,
            unitInfo.z,
            unitInfo.y,
            0,
            unitInfo.yawInRadians,
            0
        )

        runOnUnitCreated(unit, unitInfo)

        return unit
    end

    -- Callbacks are invoked with the unitInfo map. Invocation happens before the create method returns.
    -- Additional values in unitInfo provided in the create method are preserved.
    this.onUnitCreated = function(callback)
        table.insert(onUnitCreated, callback)
    end

    return this
end

