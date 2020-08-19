--[[ Unitframes ]]
--TotemFrame:ClearAllPoints() 
--TotemFrame:SetPoint("TOP",PlayerFrame,"TOP" ,5,35) 
--TotemFrame.SetPoint=function()end 

--[[ hiding stancebar ]]
--hooksecurefunc(StanceBarFrame,"Show",function(self)
--        self:Hide()
--    end)

--[[ Setpoints ]]
--PetName:Hide()
--PetFrame:ClearAllPoints() 
--PetFrame:SetPoint("BOTTOMLEFT",PlayerFrame,"BOTTOMLEFT" ,-20,-22) 
--PetFrame.SetPoint=function()end

--PartyMemberFrame1:ClearAllPoints()
--PartyMemberFrame1:SetPoint("TOPLEFT", 175, -375) 
--PartyMemberFrame1.SetPoint=function()end

--[[ Move Partydebuffs]]
for i=1,4 do
        local f = _G["PartyMemberFrame"..i]
        f:UnregisterEvent("UNIT_AURA")
        local g = CreateFrame("Frame")
        g:RegisterEvent("UNIT_AURA")
        g:SetScript("OnEvent",function(self,event,a1)
                if a1 == f.unit then
                        RefreshDebuffs(f,a1,20,nil,1)
                else
                        if a1 == f.unit.."pet" then
                                PartyMemberFrame_RefreshPetDebuffs(f)
                        end
                end
        end)
        local b = _G[f:GetName().."Debuff1"]
        b:ClearAllPoints()
        b:SetPoint("LEFT",f,"RIGHT",-7,5)
        for j=5,20 do
                local l = f:GetName().."Debuff"
                local n = l..j
                local c = CreateFrame("Frame",n,f,"PartyDebuffFrameTemplate")
                c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT")
        end
end


--[[ PvP Icon ]]
PlayerPVPIcon:SetAlpha(0)
TargetFrameTextureFramePVPIcon:SetAlpha(0)
--FocusFrameTextureFramePVPIcon:SetAlpha(0)
--for i = 1, MAX_PARTY_MEMBERS do
--_G["PartyMemberFrame"..i.."PVPIcon"]:Hide()
--_G["PartyMemberFrame"..i.."HealthBarText"]:Hide()
--_G["PartyMemberFrame"..i.."ManaBarText"]:Hide()
--end

--[[ Hide ]]
hooksecurefunc(	"PlayerFrame_UpdateStatus",	function()
		PlayerStatusTexture:Hide()
		PlayerRestGlow:Hide()
		PlayerStatusGlow:Hide()
		PlayerPrestigeBadge:SetAlpha(0)
		PlayerPrestigePortrait:SetAlpha(0)
		TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
		TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
--		FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
--		FocusFrameTextureFramePrestigePortrait:SetAlpha(0)
	end
)

--[[ Disable healing spam floating combat text ]]
LoadAddOn("Blizzard_CombatText")
COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {var = nil, show = nil}

--[[ Make the Quest-tracker moveable ]]

--local otf = ObjectiveTrackerFrame
--local otfheight = 450
--local otfwidth = 188
   
--otf:SetClampedToScreen(true)
--otf:ClearAllPoints()
--otf.ClearAllPoints = function() end
--otf:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", 45, -5) 
--otf.SetPoint = function() end
--otf:SetMovable(true)
--otf:SetUserPlaced(true)
--otf:SetHeight(otfheight)
--otf:SetWidth(otfwidth)
    
--local otfmove = CreateFrame("FRAME", nil, otf)  
--otfmove:SetHeight(16)
--otfmove:SetPoint("TOPLEFT", otf, 110, 0)
--otfmove:SetPoint("TOPRIGHT", otf)
--otfmove:EnableMouse(true)
--otfmove:RegisterForDrag("LeftButton")
--otfmove:SetHitRectInsets(-5, -5, -5, -5)
    
--local function OTFM_Tooltip(self)
--    GameTooltip:SetOwner(self, "ANCHOR_TOP")
--    GameTooltip:AddLine("� Shift + drag to move", 0, 1, .5)
--    GameTooltip:Show()
--end
    
--otfmove:SetScript("OnDragStart", function(self, button)
-- 	if IsModifiedClick() and button=="LeftButton" then
--    	local f = self:GetParent()
--    	f:StartMoving()
--       end
--  end)
    
--otfmove:SetScript("OnDragStop", function(self, button)
--    local f = self:GetParent()
--    f:StopMovingOrSizing()
--end)
    
--otfmove:SetScript("OnEnter", function(s)
--    OTFM_Tooltip(s)
--end)
    
--otfmove:SetScript("OnLeave", function(s)
--    GameTooltip:Hide()
--end)

--[[ Some slash commands ]]
SlashCmdList["FRAME"] = function() print(GetMouseFocus():GetName()) end
SLASH_FRAME1 = "/frame"

SlashCmdList["GETPARENT"] = function() print(GetMouseFocus():GetParent():GetName()) end
SLASH_GETPARENT1 = "/gp"
SLASH_GETPARENT2 = "/parent"

SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = "/rl"

SlashCmdList["RCSLASH"] = function() DoReadyCheck() end
SLASH_RCSLASH1 = "/rc"

SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
SLASH_TICKET1 = "/gm"