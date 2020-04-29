newInstance = function(libPath)
    local function libImport(fileName)
        return import(libPath .. 'src/' .. fileName)
    end

    local this = {}

    this.newTextPrinter = function()
        return libImport('TextPrinter.lua').newInstance()
    end

    this.newUnitCreator = function()
        return libImport('UnitCreator.lua').newUnitCreator()
    end

    this.newNotifier = function()
        return libImport('Notifier.lua').newInstance(
            this.newTextPrinter()
        )
    end

    this.newUnitRevealer = function(armyNames)
        return libImport('UnitRevealer.lua').newInstance(armyNames)
    end

    -- To prevent default spawning you need: ScenarioUtils.CreateResources = function() end
    -- mapEditorTables is an import of the _tables.lua file created by the FAF map editor
    -- playerArmyNamesToIndexMap is optional. Format: {ARMY_1 = 1, ARMY_2 = 2}
    this.spawnAdaptiveResources = function(mapEditorTables, playerArmyNamesToIndexMap)
        libImport('AdaptiveResources.lua').spawnResources(
            libImport('ResourceCreator.lua').newInstance(),
            mapEditorTables,
            playerArmyNamesToIndexMap
        )
    end

    this.autoReclaimThreadFunction = function()
        return libImport('AutoReclaim.lua').AutoResourceThread
    end

    this.newUnitBuffer = function()
        return libImport('UnitBuff.lua')
    end

    this.newFormatter = function()
        return libImport('Formatter.lua')
    end

    this.newAllFactions = function()
        return libImport('AllFactions.lua')
    end

    return this
end

