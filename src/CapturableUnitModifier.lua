function newInstance()
    return {
        -- Calls modificationFunction with the provided unit once instantly and once after each capture.
        -- This is needed when changing max HP and similar stats, so they do not get lost on capture.
        modify = function(unit, modificationFunction)
            modificationFunction(unit)

            local onCapturedFunction

            onCapturedFunction = function(self, captor)
                local newUnit = ChangeUnitArmy(self, captor:GetArmy())
                modificationFunction(newUnit)
                newUnit.OnCaptured = onCapturedFunction
            end

            unit.OnCaptured = onCapturedFunction
        end
    }
end