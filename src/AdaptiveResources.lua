function spawnResources(resourceCreator, mapEditorTables, playerArmyNamesToIndexMap)
    local scenarioMarkers = import('/lua/sim/ScenarioUtilities.lua').GetMarkers()

    local function mexNumberToMarkerName(mexNumber)
        return "Mass " .. (mexNumber < 10 and "0" .. mexNumber or mexNumber)
    end

    local function hydroNumberToMarkerName(hydroNumber)
        return "Hydrocarbon " .. (hydroNumber < 10 and "0" .. hydroNumber or hydroNumber)
    end

    local function spawnMex(mexNumber)
        resourceCreator.createMex(scenarioMarkers[mexNumberToMarkerName(mexNumber)].position)
    end

    local function spawnHydro(hydroNumber)
        resourceCreator.createHydro(scenarioMarkers[hydroNumberToMarkerName(hydroNumber)].position)
    end

    local function spawnForArmyIndex(armyIndex)
        for _, mexNumber in mapEditorTables.spwnMexArmy[armyIndex] do
            spawnMex(mexNumber)
        end

        for _, hydroNumber in mapEditorTables.spwnHydroArmy[armyIndex] do
            spawnHydro(hydroNumber)
        end
    end

    playerArmyNamesToIndexMap = playerArmyNamesToIndexMap or {
        ARMY_1 = 1,
        ARMY_2 = 2,
        ARMY_3 = 3,
        ARMY_4 = 4,
        ARMY_5 = 5,
        ARMY_6 = 6,
        ARMY_7 = 7,
        ARMY_8 = 8,
    }

    for _, armyName in ListArmies() do
        LOG("Spawning resources for army " .. armyName)

        if playerArmyNamesToIndexMap[armyName] then
            spawnForArmyIndex(playerArmyNamesToIndexMap[armyName])
        end
    end
end
