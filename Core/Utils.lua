local SRH = SoulRotationHelper

SRH.Utils = SRH.Utils or {}

function SRH.Utils.SafeUnitPower(unit)
    if UnitPower then
        return UnitPower(unit or "player") or 0
    end

    return 0
end

function SRH.Utils.SafeUnitHealth(unit)
    if UnitHealth then
        return UnitHealth(unit or "player") or 0
    end

    return 0
end

function SRH.Utils.SafeGetNumGroupMembers()
    if GetNumGroupMembers then
        return GetNumGroupMembers() or 0
    end

    if GetNumPartyMembers then
        return GetNumPartyMembers() or 0
    end

    return 0
end
