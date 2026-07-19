local SRH = SoulRotationHelper

SRH.Engine = SRH.Engine or {}
local Engine = SRH.Engine

Engine.Interval = 0.10
Engine._elapsed = 0

local driverFrame

function Engine:Tick()
    SRH.State:Refresh()
    SRH.Rotation.Engine:Compute(SRH.State)
    SRH.Events:Fire("SRH_STATE_UPDATED", SRH.State)
end

function Engine:Start()
    if not CreateFrame then
        return
    end

    if driverFrame then
        return
    end

    driverFrame = CreateFrame("Frame")
    driverFrame:SetScript("OnUpdate", function(_, elapsed)
        Engine._elapsed = Engine._elapsed + (elapsed or 0)
        if Engine._elapsed >= Engine.Interval then
            Engine._elapsed = 0
            Engine:Tick()
        end
    end)
end
