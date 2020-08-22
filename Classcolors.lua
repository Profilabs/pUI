-- CLASS COLORING
hooksecurefunc("HealthBar_OnValueChanged", function (self)
	if UnitIsPlayer(self.unit) then
		local c = RAID_CLASS_COLORS[select(2,UnitClass(self.unit))];
		if c then
			self:SetStatusBarColor(c.r, c.g, c.b)
		end
	end
end);

hooksecurefunc("UnitFrameHealthBar_Update", function (self)
	if UnitIsPlayer(self.unit) then
		local c = RAID_CLASS_COLORS[select(2,UnitClass(self.unit))];
		if c then
			self:SetStatusBarColor(c.r, c.g, c.b)
		end
	end
end);