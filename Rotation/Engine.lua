local SRH = SoulRotationHelper

SRH.Rotation = SRH.Rotation or {}
SRH.Rotation.Engine = SRH.Rotation.Engine or {}

local RotationEngine = SRH.Rotation.Engine

function RotationEngine:Compute(state)
    local primary = SRH.Rotation.Rules:GetPrimary(state)
    state.Recommendation = primary
    state.Queue = SRH.Rotation.Combo:BuildQueue(primary)
end
