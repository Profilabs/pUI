-- ############## --
-- Deja Chat Tabs --
-- ############## --
local currentTab = 1

local NextChatFrameTab = CreateFrame("BUTTON", "NextChatFrameTab")
local PreviousChatFrameTab = CreateFrame("BUTTON", "PreviousChatFrameTab")

local DejaChatTabsFrame = CreateFrame("Frame", "DejaChatTabsFrame", UIParent)
    DejaChatTabsFrame:RegisterEvent("PLAYER_LOGIN")
    DejaChatTabsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

    DejaChatTabsFrame:SetScript("OnEvent", function (self)
        BINDING_HEADER_DEJACHATTABS = "DejaChatTabs" --IOP Header name.
        for i = 1,NUM_CHAT_WINDOWS do
            local name, _, _, _, _, _, shown, _, docked = GetChatWindowInfo(i);
            if name == "" then
                _G["BINDING_NAME_CLICK ChatFrame"..i.."Tab:LeftButton"] = "Chat Tab "..i
            else
                _G["BINDING_NAME_CLICK ChatFrame"..i.."Tab:LeftButton"] = "["..i..". "..name.."]"
            end
            _G["ChatFrame"..i.."Tab"]:SetScript("PreClick", function(self, button, down)
                currentTab = i
                if (not docked) then 
                    print("DejaChatTabs - Chat Tab", currentTab, ":", name, "is not docked. Double tap your keybinding to attempt to show its location.")
                    return 
                end
                self:Click()
            end)
        end
        _G["BINDING_NAME_CLICK NextChatFrameTab:LeftButton"] = "Next Chat Frame Tab"
        _G["BINDING_NAME_CLICK PreviousChatFrameTab:LeftButton"] = "Previous Chat Frame Tab"
    end)

    local function DCTClick(currentTab, incdec)
        if (currentTab + incdec > NUM_CHAT_WINDOWS) or (currentTab + incdec < 1) then
            currentTab = currentTab
            return currentTab
        else
            currentTab = currentTab + incdec
        end
        local name, _, _, _, _, _, shown, _, docked = GetChatWindowInfo(currentTab)
        if (docked == nil) then
            -- Error message if I decide to add options.
            -- print("DejaChatTabs - Chat Tab"..currentTab..": "..name.." is not docked, skipping to tab "..(currentTab + incdec)..".")
            DCTClick(currentTab, incdec)
            return
        end
        _G["ChatFrame"..currentTab.."Tab"]:Click()
        return currentTab
    end
    
    NextChatFrameTab:SetScript("OnClick", function(self, button, down)
        DCTClick(currentTab, 1)
    end)

    PreviousChatFrameTab:SetScript("OnClick", function(self, button, down)
        DCTClick(currentTab, -1)
    end)