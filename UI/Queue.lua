local SRH = SoulRotationHelper

SRH.UI = SRH.UI or {}
SRH.UI.Queue = SRH.UI.Queue or {}

local Queue = SRH.UI.Queue

function Queue:Create(parent)
    if not CreateFrame then
        return nil
    end

    local holder = CreateFrame("Frame", nil, parent)
    holder:SetSize(180, 48)
    holder:SetPoint("LEFT", parent, "LEFT", 90, 0)

    holder.Icons = {}

    for i = 1, 3 do
        local icon = SRH.UI.Icons:Create(holder, 40)
        icon:SetPoint("LEFT", holder, "LEFT", (i - 1) * 48, 0)
        holder.Icons[i] = icon
    end

    return holder
end

function Queue:Update(holder, queue)
    if not holder or not holder.Icons then
        return
    end

    for i = 1, 3 do
        local icon = holder.Icons[i]
        if icon then
            icon:SetSpellName(queue and queue[i] or "-")
        end
    end
end
