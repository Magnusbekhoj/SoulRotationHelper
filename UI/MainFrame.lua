local SRH = SoulRotationHelper

SRH.UI = SRH.UI or {}
SRH.UI.MainFrame = SRH.UI.MainFrame or {}

local MainFrame = SRH.UI.MainFrame

local function SetSpellText(fontString, prefix, value)
    fontString:SetText(prefix .. ": " .. tostring(value or 0))
end

function MainFrame:Create()
    if self.Frame then return end

    local f = CreateFrame("Frame", "SRH_MainFrame", UIParent)
    f:SetWidth(280)
    f:SetHeight(90)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    f.PrimaryIcon = SRH.UI.Icons:Create(f, 64)
    f.PrimaryIcon:SetPoint("LEFT", f, "LEFT", 12, 0)

    f.QueueIcons = SRH.UI.Queue:Create(f)

    f.RPText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.RPText:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 12, 10)

    f.TargetText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.TargetText:SetPoint("BOTTOMLEFT", f.RPText, "TOPLEFT", 0, 4)

    self.Frame = f

    SRH.Events:Register("SRH_STATE_UPDATED", "UI_MainFrame_Update", function(st)
        if not self.Frame then return end
        SetSpellText(self.Frame.RPText, "RP", st.RP)
        SetSpellText(self.Frame.TargetText, "Targets", st.TargetCount)
    end)
end
