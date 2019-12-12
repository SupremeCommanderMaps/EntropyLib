local function round(x)
    return x + 0.5 - (x + 0.5) % 1
end

function buffDamage(unit, multiplier)
    for i = 1, unit:GetWeaponCount() do
        local wep = unit:GetWeapon(i)
        if wep.Label ~= 'DeathWeapon' and wep.Label ~= 'DeathImpact' then
            wep:ChangeDamage(round(wep:GetBlueprint().Damage * multiplier))
        end
    end
end

