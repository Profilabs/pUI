--[Bossframe scale]
for i = 1, 5 do
    local f = _G["Boss"..i.."TargetFrame"]
    f:SetParent(UIParent)
    f:SetScale(1.1)
end

--[lower the gaps]
for i = 2, 5 do
    _G["Boss"..i.."TargetFrame"]:SetPoint("TOPLEFT", _G["Boss"..(i-1).."TargetFrame"], "BOTTOMLEFT", 0, 0)
end

--[moveable]
Boss1TargetFrame:ClearAllPoints() 
Boss1TargetFrame:SetPoint("TOPRIGHT",UIParent,"TOPRIGHT",-250,-300) 
Boss1TargetFrame.SetPoint=function()end
