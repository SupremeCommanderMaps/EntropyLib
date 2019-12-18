newInstance = function(textPrinter)
    local function print(message, options)
        options.location = "leftcenter"
        textPrinter.print(string.rep(" ", 12) .. message, options)
    end

    local function warning(message)
         print(message, {color = 'ffff5599'})
    end

    local function positive(message)
         print(message, {color = 'ffff5599'})
    end

    local function failure(message)
         print(message, {color = 'ffff5599'})
    end

    return {
        warning = warning, -- ie Enemy units incoming
        positive = positive, -- ie Victory or Only one minute left
        failure = failure, -- ie Mission failure
    }
end