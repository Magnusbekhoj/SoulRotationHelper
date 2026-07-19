local SRH = SoulRotationHelper

SRH.State = SRH.State or {}
local State = SRH.State

function State:Create()
    self.Combat = false
    self.RP = 0
    self.HP = 0
    self.SoulFragments = 0
    self.ReapedSouls = 0
    self.SoulInfusion = 0
    self.ComboStage = 0
    self.TargetCount = 1
    self.Cooldowns = {}
    self.Buffs = {}
    self.Debuffs = {}
    self.Recommendation = nil
    self.Queue = {}
end

function State:Refresh()
    self.Combat = (UnitAffectingCombat and UnitAffectingCombat("player")) or false
    self.RP = SRH.Utils.SafeUnitPower("player")
    self.HP = SRH.Utils.SafeUnitHealth("player")

    if self.TargetCount < 1 then
        self.TargetCount = 1
    end
end

State:Create()
