newInstance = function(libPath)

    local function libImport(fileName)
        return import(libPath .. 'src/' .. fileName)
    end

    return {
        newTextPrinter = function()
            return libImport('TextPrinter.lua').newInstance()
        end,

        newUnitCreator = function()
            return libImport('UnitCreator.lua').newUnitCreator()
        end,

        -- To prevent default spawning you need: ScenarioUtils.CreateResources = function() end
        -- mapEditorTables is an import of the _tables.lua file created by the FAF map editor
        -- playerArmyNamesToIndexMap is optional. Format: {ARMY_1 = 1, ARMY_2 = 2}
        spawnAdaptiveResources = function(mapEditorTables, playerArmyNamesToIndexMap)
            libImport('AdaptiveResources.lua').spawnResources(
                libImport('ResourceCreator.lua').newInstance(),
                mapEditorTables,
                playerArmyNamesToIndexMap
            )
        end
    }
end

