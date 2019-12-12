local function remainder(x, divisor)
    return x - math.floor(x / divisor) * divisor
end

local function isDivisibleBy(x, divisor)
    return remainder(x, divisor) == 0
end

-- Does not format fractional percents
function formatMultiplier(x)
    if x > 3 and isDivisibleBy(x, 1) then
        return x .. "x"
    end

    return math.floor(x * 100) .. "%"
end

function formatTime(seconds)
    if isDivisibleBy(seconds, 60) then
        return (seconds / 60) .. " minutes"
    end

    return seconds .. " seconds"
end

function inTimeString(seconds)
    if seconds == 0 then
        return "immediately"
    end

    return "in " .. formatTime(seconds)
end