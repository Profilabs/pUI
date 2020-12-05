-- Loot Message Shortener
--Self
CURRENCY_GAINED = "Currency: %s";
CURRENCY_GAINED_MULTIPLE = "Currency: %s x%d";
CURRENCY_GAINED_MULTIPLE_BONUS = "Currency: %s x%d (Bonus)";
LOOT_ITEM_BONUS_ROLL_SELF = "Loot: %s  (Bonus)";
LOOT_ITEM_BONUS_ROLL_SELF_MULTIPLE = "Loot: %sx%d (Bonus)";
LOOT_ITEM_CREATED_SELF = "Create: %s";
LOOT_ITEM_CREATED_SELF_MULTIPLE = "Create: %sx%d";
LOOT_ITEM_PUSHED_SELF = "Loot: %s";
LOOT_ITEM_PUSHED_SELF_MULTIPLE = "Loot: %sx%d";
LOOT_ITEM_REFUND = "Refund: %s";
LOOT_ITEM_REFUND_MULTIPLE = "Refund: %sx%d";
LOOT_ITEM_SELF = "Loot: %s";
LOOT_ITEM_SELF_MULTIPLE = "Loot: %sx%d";

--Other players
LOOT_ITEM = "%s gets: %s";
LOOT_ITEM_BONUS_ROLL = "%s gets: %s (Bonus)";
LOOT_ITEM_BONUS_ROLL_MULTIPLE = "%s gets: %sx%d";
LOOT_ITEM_MULTIPLE = "%s gets: %sx%d";
LOOT_ITEM_PUSHED = "%s gets: %s";
LOOT_ITEM_PUSHED_MULTIPLE = "%s gets: %sx%d";

-- Deja Chat
CHAT_FRAME_FADE_OUT_TIME = 0
CHAT_TAB_HIDE_DELAY = 0
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0

BNToastFrame:SetClampedToScreen(true)
BNToastFrame:SetClampRectInsets(-15,15,15,-15)

-- Hide Chat Buttons
ChatFrameMenuButton:HookScript("OnShow", ChatFrameMenuButton.Hide)
ChatFrameMenuButton:Hide()

ChatFrameChannelButton:HookScript("OnShow", ChatFrameChannelButton.Hide)
ChatFrameChannelButton:Hide()

--ChatFrameToggleVoiceDeafenButton:HookScript("OnShow", ChatFrameToggleVoiceDeafenButton.Hide) 
--ChatFrameToggleVoiceDeafenButton:Hide()

--ChatFrameToggleVoiceMuteButton:HookScript("OnShow", ChatFrameToggleVoiceMuteButton.Hide)
--ChatFrameToggleVoiceMuteButton:Hide()

--hide the friend micro button
--local button = QuickJoinToastButton or FriendsMicroButton
--button:HookScript("OnShow", button.Hide)
--button:Hide()

-- Table to keep track of frames you already saw:
local frames = {}

-- Function to handle customzing a chat frame:
local function ProcessFrame(frame)
	if frames[frame] then return end

	frame:SetClampRectInsets(0, 0, 0, 0)
	frame:SetMaxResize(UIParent:GetWidth(), UIParent:GetHeight())
	frame:SetMinResize(250, 100)

	local name = frame:GetName()
	_G[name .. "ButtonFrame"]:Hide()
	_G[name .. "EditBoxLeft"]:Hide()
	_G[name .. "EditBoxMid"]:Hide()
	_G[name .. "EditBoxRight"]:Hide()

	local editbox = _G[name .. "EditBox"]
	editbox:ClearAllPoints()
	editbox:SetPoint('LEFT', ChatFrame1, 'BOTTOMLEFT', -18, -20)
	editbox:SetPoint('RIGHT', ChatFrame1, 'BOTTOMRIGHT', 0, -25) 
	editbox:SetAltArrowKeyMode(false)

	frames[frame] = true
end

-- Get all of the permanent chat windows and customize them:
for i = 1, NUM_CHAT_WINDOWS do
	ProcessFrame(_G["ChatFrame" .. i])
end

-- Set up a dirty hook to catch temporary windows and customize them when they are created:
local old_OpenTemporaryWindow = FCF_OpenTemporaryWindow
FCF_OpenTemporaryWindow = function(...)
	local frame = old_OpenTemporaryWindow(...)
	ProcessFrame(frame)
	return frame
end

-- Chat Scroll Module
--function FloatingChatFrame_OnMouseScroll(self, delta)
--	if delta > 0 then
--		if IsShiftKeyDown() then
--			self:ScrollToTop()
--		else	
--			self:ScrollUp()
--		end
--	elseif delta < 0 then
--		if IsShiftKeyDown() then
--			self:ScrollToBottom()
--		else
--			self:ScrollDown()
--		end
--	end	
--end