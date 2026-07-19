local SRH = SoulRotationHelper

SRH.Rotation = SRH.Rotation or {}
SRH.Rotation.Rules = SRH.Rotation.Rules or {}

local Rules = SRH.Rotation.Rules

function Rules:GetPrimary(state)
    if not state.Combat then
        return "Ghostly Weapon"
    end

    if state.RP >= 80 then
        return "Deathwind"
    end

    if state.TargetCount >= 3 then
        return "Murder"
    end

    return "Soul Strike"
end
