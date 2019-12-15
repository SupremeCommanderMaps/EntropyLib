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

local function formatMinutes(minutes)
	return minutes .. " minute" .. (minutes == 1 and "" or "s")
end

local function formatSeconds(seconds)
	return seconds .. " second" .. (seconds == 1 and "" or "s")
end

function formatTime(seconds)
	if seconds ~= 0 and isDivisibleBy(seconds, 60) then
		return formatMinutes(seconds / 60)
	end

	if seconds > 120 then
		return formatMinutes(math.floor(seconds / 60))
			.. " and "
			.. formatSeconds(remainder(seconds, 60))
	end

    return formatSeconds(seconds)
end

function inTimeString(seconds)
    if seconds == 0 then
        return "immediately"
    end

    return "in " .. formatTime(seconds)
end

return {
	formatMultiplier = formatMultiplier,
	formatTime = formatTime,
	inTimeString = inTimeString,
}