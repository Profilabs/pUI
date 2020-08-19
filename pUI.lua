MainMenuBar:SetAlpha(0)
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