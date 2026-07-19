local SRH = SoulRotationHelper

SRH.UI = SRH.UI or {}
SRH.UI.MainFrame = SRH.UI.MainFrame or {}

local MainFrame = SRH.UI.MainFrame

local function SetText(fontString, label, value)
    if fontString then
        fontString:SetText(label .. ": " .. tostring(value or 0))
    end
end

function MainFrame:Create()
    if self.Frame or not CreateFrame or not UIParent then
        return
    end

    local frame = CreateFrame("Frame", "SRH_MainFrame", UIParent)
    frame:SetSize(300, 110)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, -180)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })

    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    frame.PrimaryIcon = SRH.UI.Icons:Create(frame, 64)
    if frame.PrimaryIcon then
        frame.PrimaryIcon:SetPoint("LEFT", frame, "LEFT", 12, 10)
    end

    frame.QueueIcons = SRH.UI.Queue:Create(frame)

    frame.RPText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.RPText:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 12, 8)

    frame.TargetText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.TargetText:SetPoint("BOTTOMLEFT", frame.RPText, "TOPLEFT", 0, 4)

    self.Frame = frame

    SRH.Events:Register("SRH_STATE_UPDATED", "UI_MAINFRAME_UPDATE", function(state)
        if not MainFrame.Frame then return end

        SetText(MainFrame.Frame.RPText, "RP", state.RP)
        SetText(MainFrame.Frame.TargetText, "Targets", state.TargetCount)

        if MainFrame.Frame.PrimaryIcon then
            MainFrame.Frame.PrimaryIcon:SetSpellName(state.Recommendation)
        end

        SRH.UI.Queue:Update(MainFrame.Frame.QueueIcons, state.Queue)
    end)
end
