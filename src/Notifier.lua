newInstance = function(textPrinter, defaultSize)
    local colors = {
        warning = 'ffff5599',
        positive = 'ff55ff99',
        failure = 'ffff5555',
        neutral = 'ffffffff',
    }

    local function printMultiLine(lines)
        textPrinter.printBlankLine({location = "lefttop"})
        textPrinter.printBlankLine({location = "lefttop"})
        textPrinter.printBlankLine({location = "lefttop"})
        textPrinter.printBlankLine({location = "lefttop"})

        for _, line in lines do
            line.options.location = "lefttop"
            textPrinter.print(string.rep(" ", line.indent) .. line.message, line.options)
        end
    end

    local function print(message, color, duration)
        printMultiLine(
            {
                {
                    message = message,
                    indent = 100,
                    options = {
                        color = color,
                        duration = duration or 4,
                        size = defaultSize or 30,
                        location = "lefttop"
                    }
                }
            }
        )
    end

    local function warning(message, durationInSeconds)
        print(message, colors.warning, durationInSeconds)
    end

    local function positive(message, durationInSeconds)
        print(message, colors.positive, durationInSeconds)
    end

    local function failure(message, durationInSeconds)
        print(message, colors.failure, durationInSeconds)
    end

    local function neutral(message, durationInSeconds)
        print(message, colors.neutral, durationInSeconds)
    end

    return {
        warning = warning, -- ie Enemy units incoming
        positive = positive, -- ie Victory or Only one minute left
        failure = failure, -- ie Mission failure
        message = neutral,
        printMultiLine = printMultiLine,
        setWarningColor = function(color)
            colors.warning = color
        end
    }
end