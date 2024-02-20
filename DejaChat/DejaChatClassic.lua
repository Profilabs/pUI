-- ######### --
-- Deja Chat --
-- ######### --
CHAT_FRAME_FADE_OUT_TIME = 0
CHAT_TAB_HIDE_DELAY = 0
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0

BNToastFrame:SetClampedToScreen(true)

CHAT_BUTTONS = {
	"ChatFrameMenuButton",
	"ChatFrameChannelButton",
	}

local ignoreDVBBAlpha
local DVBBAlphaTimer

local function SetAlpha(frame)
	if ignoreDVBBAlpha then return end
	ignoreDVBBAlpha = true
	if frame:IsMouseOver() then
		frame:SetAlpha(1)
	else
		frame:SetAlpha(0)
	end
	ignoreDVBBAlpha = nil
end

local function showDVBB(self)
	if DVBBAlphaTimer then DVBBAlphaTimer:Cancel() end
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDVBBAlpha = true
		_G[v]:SetAlpha(1)
		ignoreDVBBAlpha = nil
	end
end

local function hideDVBB(self)
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDVBBAlpha = true
		_G[v]:SetAlpha(0)
		ignoreDVBBAlpha = nil
	end
end

local function delayHideDVBB(self)
	DVBBAlphaTimer = C_Timer.NewTimer(0.75, hideDVBB)
end

for _, v in ipairs(CHAT_BUTTONS) do
    v = _G[v]
    hooksecurefunc(v, "SetAlpha", SetAlpha)
    v:HookScript("OnEnter", showDVBB)
    v:HookScript("OnLeave", delayHideDVBB)
    v:SetAlpha(0)
end

-- Table to keep track of frames already seen:
local frames = {}

-- Function to handle customzing a chat frame:
local function ProcessFrame(frame)
	if frames[frame] then return end

	frame:SetClampRectInsets(0, 0, 0, 0)
	frame:SetResizeBounds(250, 100 , UIParent:GetWidth(), UIParent:GetHeight())

	local name = frame:GetName()
	_G[name .. "ButtonFrame"]:Hide()
	_G[name .. "EditBoxLeft"]:Hide()
	_G[name .. "EditBoxMid"]:Hide()
	_G[name .. "EditBoxRight"]:Hide()

	local editbox = _G[name .. "EditBox"]
	editbox:ClearAllPoints()
	editbox:SetPoint('BOTTOMLEFT', ChatFrame1, 'TOPLEFT', -7, 25)
	editbox:SetPoint('BOTTOMRIGHT', ChatFrame1, 'TOPRIGHT', 10, 25) 
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

function FloatingChatFrame_OnMouseScroll(self, delta)
	if delta > 0 then
		if IsShiftKeyDown() then
			self:ScrollToTop()
		else	
			self:ScrollUp()
		end
	elseif delta < 0 then
		if IsShiftKeyDown() then
			self:ScrollToBottom()
		else
			self:ScrollDown()
		end
	end	
end
