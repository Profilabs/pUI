local t={
	ContainerFrame5BackgroundTop,
  ContainerFrame5BackgroundMiddle1,
  ContainerFrame5BackgroundBottom,
	ContainerFrame4BackgroundTop,
  ContainerFrame4BackgroundMiddle1,
  ContainerFrame4BackgroundBottom,
	ContainerFrame3BackgroundTop,
  ContainerFrame3BackgroundMiddle1,
  ContainerFrame3BackgroundBottom,
	ContainerFrame2BackgroundTop,
  ContainerFrame2BackgroundMiddle1,
  ContainerFrame2BackgroundBottom,
	ContainerFrame1BackgroundTop,
	MinimapBorderTop,
  MinimapBorder,
  MiniMapTrackingBorder,
  MiniMapTrackingButtonBorder,
  PlayerFrameTexture,
  TargetFrameTextureFrameTexture,
	TargetFrameToTTextureFrameTexture,
  PetFrameTexture,
  CharacterFrameBg,
	CharacterFrameTitleBg,
	CompactRaidFrameManagerBg,
  CastingBarFrame.Border
 }
-- change these rgb values to change the color of the
-- default action bar background artwork

local red = 0.4
local green = 0.4
local blue = 0.4

for i=1,#t do
  t[i]:SetDesaturated(true)
  t[i]:SetVertexColor(red,green,blue)
end

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

hooksecurefunc("TargetFrame_UpdateDebuffAnchor", function()
  if TargetFrameDebuff1 then
    TargetFrameDebuff1:ClearAllPoints()
    TargetFrameDebuff1:SetPoint("TOP", UIParent, "CENTER", 125, 0)
  end
end)

local noop = function() return end

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
LoadAddOn("Blizzard_CombatText")
COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {var = nil, show = nil}

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