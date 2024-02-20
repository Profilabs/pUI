-- class icon portraits
hooksecurefunc("UnitFramePortrait_Update",function(self)
    if self.portrait then
        if UnitIsPlayer(self.unit) then                
            local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
            if t then
                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                self.portrait:SetTexCoord(unpack(t))
            end
        else
            self.portrait:SetTexCoord(0,1,0,1)
        end
    end
end)

-- blue shaman
RAID_CLASS_COLORS = {
    ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
    ["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
    ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
    ["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
    ["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
    ["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
};

-- remove pvp, faction & group indication
PlayerPVPIcon:SetAlpha(0)
TargetFrameTextureFramePVPIcon:SetAlpha(0)
PlayerFrameGroupIndicator.Show = function() return end

-- hide glow
hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if IsResting("player") then
       PlayerStatusTexture:Hide()
       PlayerRestGlow:Hide()
       PlayerStatusGlow:Hide()
       elseif PlayerFrame.inCombat then
       PlayerStatusTexture:Hide()
       PlayerAttackGlow:Hide()
       PlayerStatusGlow:Hide()
    end
end)



--Move Target Frame Debuffs
--hooksecurefunc("TargetFrame_UpdateBuffAnchor", function()
--  if TargetFrameBuff1 then
--    TargetFrameBuff1:ClearAllPoints()
--    TargetFrameBuff1:SetPoint("TOP", UIParent, "CENTER", -48, -30)
--  end
--end)

--hooksecurefunc("TargetFrame_UpdateDebuffAnchor", function()
--  if TargetFrameDebuff1 then
--    TargetFrameDebuff1:ClearAllPoints()
--    TargetFrameDebuff1:SetPoint("TOP", UIParent, "CENTER", 125, 0)
--  end
--end)
--
--local noop = function() return end

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

--[[ PvP Icon ]]
--PlayerPVPIcon:SetAlpha(0)
--TargetFrameTextureFramePVPIcon:SetAlpha(0)
--FocusFrameTextureFramePVPIcon:SetAlpha(0)
--for i = 1, MAX_PARTY_MEMBERS do
--_G["PartyMemberFrame"..i.."PVPIcon"]:Hide()
--_G["PartyMemberFrame"..i.."HealthBarText"]:Hide()
--_G["PartyMemberFrame"..i.."ManaBarText"]:Hide()
--end

--[[ Hide ]]
--hooksecurefunc(	"PlayerFrame_UpdateStatus",	function()
--		PlayerStatusTexture:Hide()
--		PlayerRestGlow:Hide()
--		PlayerStatusGlow:Hide()
--		PlayerPrestigeBadge:SetAlpha(0)
--		PlayerPrestigePortrait:SetAlpha(0)
--		TargetFrameTextureFramePrestigeBadge:SetAlpha(0)
--		TargetFrameTextureFramePrestigePortrait:SetAlpha(0)
--		FocusFrameTextureFramePrestigeBadge:SetAlpha(0)
--		FocusFrameTextureFramePrestigePortrait:SetAlpha(0)
--	end
--)

--[[ Disable healing spam floating combat text ]]
--LoadAddOn("Blizzard_CombatText")
--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {var = nil, show = nil}

--[[Frame placement]]--
--PlayerFrame:ClearAllPoints()
--PlayerFrame:SetPoint("CENTER",UIParent,-250,-60)
--PlayerFrame.SetPoint=function()end

--TargetFrame:ClearAllPoints()
--TargetFrame:SetPoint("CENTER",UIParent,250,-60)
--TargetFrame.SetPoint=function()end

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