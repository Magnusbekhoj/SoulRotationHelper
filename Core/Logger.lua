local SRH = SoulRotationHelper

SRH.Logger = SRH.Logger or {}

function SRH.Logger:Info(message)
    if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
        DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffSRH|r " .. tostring(message))
    end
end

function SRH.Logger:Debug(message)
    -- Reserved for future debug toggles.
end
