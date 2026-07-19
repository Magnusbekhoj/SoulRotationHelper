SoulRotationHelper = SoulRotationHelper or {}
local SRH = SoulRotationHelper

SRH.State = SRH.State or {}
SRH.Engine = SRH.Engine or {}
SRH.Events = SRH.Events or {}
SRH.UI = SRH.UI or {}
SRH.Rotation = SRH.Rotation or {}

local loader = CreateFrame and CreateFrame("Frame") or nil
if loader and loader.RegisterEvent then
    loader:RegisterEvent("PLAYER_LOGIN")
    loader:SetScript("OnEvent", function()
        if SRH.UI and SRH.UI.MainFrame and SRH.UI.MainFrame.Create then
            SRH.UI.MainFrame:Create()
        end
        if SRH.Engine and SRH.Engine.Start then
            SRH.Engine:Start()
        end
    end)
end
