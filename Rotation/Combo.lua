local SRH = SoulRotationHelper

SRH.Rotation = SRH.Rotation or {}
SRH.Rotation.Combo = SRH.Rotation.Combo or {}

local Combo = SRH.Rotation.Combo

function Combo:BuildQueue(primary)
    local queue = {}
    queue[1] = primary or "Soul Strike"
    queue[2] = "Soulrend"
    queue[3] = "Withering Touch"
    return queue
end
