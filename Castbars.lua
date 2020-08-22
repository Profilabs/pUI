--[[ Player castbar ]]
CastingBarFrame:SetSize(180,10)
CastingBarFrame:SetScale("1.2")
CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint("TOP", WorldFrame, "BOTTOM", 0, 180) --0, 100
CastingBarFrame.SetPoint = function() end 
     
CastingBarFrame.Border:SetSize(240,40)
CastingBarFrame.Border:SetPoint("TOP", CastingBarFrame, 0, 15)
CastingBarFrame.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
     
CastingBarFrame.Flash:SetSize(240,40)
CastingBarFrame.Flash:SetPoint("TOP", CastingBarFrame, 0, 15)
CastingBarFrame.Flash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")
     
CastingBarFrame.Text:SetPoint("TOP", CastingBarFrame, 0, 4)
     
CastingBarFrame.Icon:Show()
CastingBarFrame.Icon:SetHeight(22)
CastingBarFrame.Icon:SetWidth(22)
     
--[[ Castbar timer from thek ]]
CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.timer:SetFont("Fonts\\ARIALN.ttf", 13, "THINOUTLINE")
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "TOP", 0, 25)
CastingBarFrame.update = 0.1
     
--TargetFrameSpellBar.timer = TargetFrameSpellBar:CreateFontString(nil)
--TargetFrameSpellBar.timer:SetFont("Fonts\\ARIALN.ttf", 13, "THINOUTLINE")
--TargetFrameSpellBar.timer:SetPoint("RIGHT", TargetFrameSpellBar, "RIGHT", 24, 0)
--TargetFrameSpellBar.update = 0.1
     
--FocusFrameSpellBar.timer = FocusFrameSpellBar:CreateFontString(nil)
--FocusFrameSpellBar.timer:SetFont("Fonts\\ARIALN.ttf", 13, "THINOUTLINE")
--FocusFrameSpellBar.timer:SetPoint("RIGHT", FocusFrameSpellBar, "RIGHT", 24, 0)
--FocusFrameSpellBar.update = 0.1
     
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
--TargetFrameSpellBar:HookScript('OnUpdate', CastingBarFrame_OnUpdate_Hook)
--FocusFrameSpellBar:HookScript('OnUpdate', CastingBarFrame_OnUpdate_Hook)
     
--[[ Focus Castbar ]]
--hooksecurefunc(FocusFrameSpellBar, "Show", function()
--   FocusFrameSpellBar:SetScale("1.4")
--   --FocusFrameSpellBar:ClearAllPoints()
--   --FocusFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
   --FocusFrameSpellBar.SetPoint = function() end 
--end)
     
--FocusFrameSpellBar:SetStatusBarColor(0,0.45,0.9)
--FocusFrameSpellBar.SetStatusBarColor = function() end

--[[ Target Castbar ]]
--hooksecurefunc(TargetFrameSpellBar, "Show", function()
--   TargetFrameSpellBar:SetScale("1.6")
--	--TargetFrameSpellBar:ClearAllPoints()
--	--TargetFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, -30)
--	--TargetFrameSpellBar.SetPoint = function() end
--end)