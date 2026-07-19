local SRH = SoulRotationHelper

SRH.UI = SRH.UI or {}
SRH.UI.Icons = SRH.UI.Icons or {}

local Icons = SRH.UI.Icons

function Icons:Create(parent, size)
    if not CreateFrame then
        return nil
    end

    local button = CreateFrame("Frame", nil, parent)
    button:SetSize(size, size)

    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(button)
    bg:SetTexture("Interface\\Buttons\\WHITE8X8")
    bg:SetVertexColor(0.1, 0.1, 0.1, 0.9)

    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetPoint("TOPLEFT", -1, 1)
    border:SetPoint("BOTTOMRIGHT", 1, -1)
    border:SetTexture("Interface\\Buttons\\WHITE8X8")
    border:SetVertexColor(0.5, 0.5, 0.5, 1)

    local text = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("CENTER", button, "CENTER", 0, 0)
    text:SetJustifyH("CENTER")
    text:SetText("-")

    button.Label = text

    function button:SetSpellName(name)
        self.Label:SetText(name or "-")
    end

    return button
end
