import('/lua/SimSync.lua')

-- Message printing service. Object orientated replacement for PrintText featuring named parameters.
newInstance = function()
    local function print(str, options)
        options = options or {}
        options.size = options.size or 20
        options.color = options.color or "ffffffff"
        options.duration = options.duration or 5

        -- lefttop, leftcenter, leftbottom,  righttop, rightcenter, rightbottom, centertop, center, centerbottom
        options.location = options.location or "center"

        PrintText(str, options.size, options.color, options.duration, options.location)
    end

    return {
        print = print,
        printBlankLine = function(options)
            print(" ", options)
        end
    }
end