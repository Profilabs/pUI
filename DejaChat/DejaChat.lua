local addonName, addonTab = ... -- Using addonName, addonTab here in the Init file for ubiquity 
addonTab.version = GetAddOnMetadata(addonName, "Version")

if not (addonTab.defaults) then
	addonTab.defaults = {}
end

addonTab.defaults.DejaChat = {
	buttonSide = "right",
}

local DejaChat

-- ##################### --
-- SavedVariables Loader --
-- ##################### --
if not addonTab.loader then
	addonTab.loader = CreateFrame("Frame")
end
addonTab.loader:RegisterEvent("ADDON_LOADED")

addonTab.loader:SetScript("OnEvent", function(self, event, ...)
	if (event == "ADDON_LOADED") then
		self[event](self, ...)
	end
end)

function addonTab.loader:ADDON_LOADED(addonName)
	if not (_G[addonName.."DB"]) then -- first time the addon is used
		print(addonName..": First time use, creating saved variables")
		_G[addonName.."DB"] = {} -- allocate a table to store your saved variables (the table will be saved to disk on logout)
		_G[addonName.."DB"] = addonTab.defaults -- initialize the saved variables table with default values
	end
	addonTab.db = _G[addonName.."DB"] -- make a reference to the saved variables table
	DejaChat = addonTab.db.DejaChat -- As opposed to addonTab.db.DejaMinimap; let's them share a combined DB in a compilation addon like DejaView
	self:UnregisterEvent("ADDON_LOADED")
end

-- ##################### --
-- ##### Deja Chat ##### --
-- ##################### --
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
	"TextToSpeechButton",
	"QuickJoinToastButton",
}

local ignoreDCBAlpha
local DCBAlphaTimer

local function SetAlpha(frame)
	if ignoreDCBAlpha then return end
	ignoreDCBAlpha = true
	if frame:IsMouseOver() then
		frame:SetAlpha(1)
	else
		frame:SetAlpha(0)
	end
	ignoreDCBAlpha = nil
end

local function showDCB(self)
	if DCBAlphaTimer then DCBAlphaTimer:Cancel() end
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDCBAlpha = true
		_G[v]:SetAlpha(1)
		ignoreDCBAlpha = nil
	end
end

local function hideDCB(self)
	for _, v in ipairs(CHAT_BUTTONS) do
		ignoreDCBAlpha = true
		_G[v]:SetAlpha(0)
		ignoreDCBAlpha = nil
	end
end

local function delayHideDCB(self)
	DCBAlphaTimer = C_Timer.NewTimer(0.75, hideDCB)
end

for _, v in ipairs(CHAT_BUTTONS) do
    v = _G[v]
    hooksecurefunc(v, "SetAlpha", SetAlpha)
    v:HookScript("OnEnter", showDCB)
    v:HookScript("OnLeave", delayHideDCB)
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
	_G[name .. "EditBoxLeft"]:Hide()
	_G[name .. "EditBoxMid"]:Hide()
	_G[name .. "EditBoxRight"]:Hide()	
	
	_G[name .. "LeftTexture"]:Hide()
	_G[name .. "TopLeftTexture"]:Hide()
	_G[name .. "TopTexture"]:Hide()
	_G[name .. "TopRightTexture"]:Hide()
	_G[name .. "RightTexture"]:Hide()
	_G[name .. "BottomRightTexture"]:Hide()
	_G[name .. "BottomTexture"]:Hide()
	_G[name .. "BottomLeftTexture"]:Hide()

	_G[name .. "ButtonFrameBackground"]:Hide()
	_G[name .. "ButtonFrameLeftTexture"]:Hide()
	_G[name .. "ButtonFrameTopLeftTexture"]:Hide()
	_G[name .. "ButtonFrameTopTexture"]:Hide()
	_G[name .. "ButtonFrameTopRightTexture"]:Hide()
	_G[name .. "ButtonFrameRightTexture"]:Hide()
	_G[name .. "ButtonFrameBottomRightTexture"]:Hide()
	_G[name .. "ButtonFrameBottomTexture"]:Hide()
	_G[name .. "ButtonFrameBottomLeftTexture"]:Hide()

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

ChatFrame1:HookScript("OnEvent", function (self, event, ...)
	self.Selection:SetAllPoints(self)
	FCF_SetButtonSide(DEFAULT_CHAT_FRAME, DejaChat.buttonSide, true)
end)

local DCTimer

local function DCFrameButtonSide(continue)
	if ( continue == false ) then DCTimer:Cancel() return end
	local point, relativeTo, relativePoint, xOfs, yOfs = ChatFrame1:GetPoint()
	if ( xOfs  >  (GetScreenWidth()/2) ) then
		DejaChat.buttonSide = "left"
	else
		DejaChat.buttonSide = "right"
	end
	FCF_SetButtonSide(DEFAULT_CHAT_FRAME, DejaChat.buttonSide, true)
	DCTimer = C_Timer.NewTimer(0.1, DCFrameButtonSide)
end

ChatFrame1.Selection:HookScript("OnDragStart", function(self)
	DCFrameButtonSide()
end)

ChatFrame1.Selection:HookScript("OnDragStop", function(self)
	if DCTimer then DCFrameButtonSide(false) end
end)
