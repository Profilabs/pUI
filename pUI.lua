--fix action bar
MainMenuBar:EnableMouse(false)
MainMenuBarArtFrame:EnableMouse(false)
MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide()
MainMenuBarTexture0:Hide()
MainMenuBarTexture1:Hide()
MainMenuBarTexture2:Hide()
MainMenuBarTexture3:Hide()
MainMenuMaxLevelBar0:Hide()
MainMenuMaxLevelBar1:Hide()
MainMenuMaxLevelBar2:Hide()
MainMenuMaxLevelBar3:Hide()
StanceBarLeft:SetAlpha(0)
StanceBarMiddle:SetAlpha(0)
StanceBarRight:SetAlpha(0)
SlidingActionBarTexture0:SetAlpha(0)
SlidingActionBarTexture1:SetAlpha(0)
ExhaustionLevelFillBar:Hide()
MainMenuXPBarTexture0:Hide()
MainMenuXPBarTexture1:Hide()
MainMenuXPBarTexture2:Hide()
MainMenuXPBarTexture3:Hide()
MainMenuBarMaxLevelBar:Hide()
MainMenuMaxLevelBar0:Hide()
MainMenuMaxLevelBar1:Hide()
MainMenuMaxLevelBar2:Hide()
MainMenuMaxLevelBar3:Hide()
ReputationWatchBar.StatusBar.XPBarTexture0:Hide()
ReputationWatchBar.StatusBar.XPBarTexture1:Hide()
ReputationWatchBar.StatusBar.XPBarTexture2:Hide()
ReputationWatchBar.StatusBar.XPBarTexture3:Hide()
ReputationWatchBar.StatusBar.WatchBarTexture0:Hide()
ReputationWatchBar.StatusBar.WatchBarTexture1:Hide()
ReputationWatchBar.StatusBar.WatchBarTexture2:Hide()
ReputationWatchBar.StatusBar.WatchBarTexture3:Hide()
-- hide backpack
MainMenuBarBackpackButton:Hide()
CharacterBag0Slot:Hide()
CharacterBag1Slot:Hide()
CharacterBag2Slot:Hide()
CharacterBag3Slot:Hide()
-- hide micro menu
CharacterMicroButton:Hide()
SpellbookMicroButton:Hide()
TalentMicroButton:SetScale(0.0001)
TalentMicroButton:EnableMouse(false)
QuestLogMicroButton:Hide()
WorldMapMicroButton:Hide()
SocialsMicroButton:Hide()
HelpMicroButton:Hide()
MainMenuMicroButton:Hide()
MainMenuBarPageNumber:Hide()
KeyRingButton:SetAlpha(0)
MainMenuBarPerformanceBar:SetAlpha(0)
MainMenuBarPerformanceBar:Hide()
ActionBarDownButton:Hide()
ActionBarUpButton:Hide()
-- Hide minimap zoom icons
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
GameTimeFrame:Hide()
MinimapNorthTag:SetTexture(nil)
MiniMapWorldMapButton:Hide()
MinimapBorderTop:Hide()
-- action bar location
MainMenuBar:SetScale(0.8)
MainMenuBar:ClearAllPoints()
MainMenuBar:SetPoint('BOTTOM', UIParent, 256, -125)
--pet bar
--PetActionBarFrame:SetScale(0.8)
--PetActionBarFrame:ClearAllPoints()
--PetActionBarFrame:SetPoint('BOTTOM', UIParent, -250, 25)

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
  PlayerFrameTexture,
  TargetFrameTextureFrameTexture,
	TargetFrameToTTextureFrameTexture,
  PetFrameTexture,
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

 -- Castbar timer
CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.timer:SetFont("Fonts\\ARIALN.ttf", 16, "THINOUTLINE")
CastingBarFrame.timer:SetPoint("RIGHT", CastingBarFrame, "CENTER", 0, -25)
CastingBarFrame.update = 0.1
     
local function CastingBarFrame_OnUpdate_Hook(self, elapsed)
	if not self.timer then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.timer:SetText(format("%.1f", max(self.maxValue - self.value, 0)))
		elseif self.channeling then
			self.timer:SetText(format("%.1f", max(self.value, 0)))
		else
			self.timer:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end

CastingBarFrame:HookScript('OnUpdate', CastingBarFrame_OnUpdate_Hook)

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

--[[Frame placement]]--
PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("CENTER",UIParent,-250,-60)
PlayerFrame.SetPoint=function()end

TargetFrame:ClearAllPoints()
TargetFrame:SetPoint("CENTER",UIParent,250,-60)
TargetFrame.SetPoint=function()end

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