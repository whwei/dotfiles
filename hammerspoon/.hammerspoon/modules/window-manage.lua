local hotkey = require("hs.hotkey")
local eventtap = require("hs.eventtap")

local mod = { "cmd", "shift" }
local hyper = { "cmd", "ctrl", "alt" }
-- set up your hotkeys in this table:
local myKeys = {
	-- app quick switch
	hotkey.new(mod, "1", function()
		hs.application.launchOrFocus("WezTerm")
	end),
	hotkey.new(mod, "2", function()
		hs.application.launchOrFocus("Google Chrome")
	end),
	-- hotkey.new(mod, "s", function()
	-- 	hs.application.launchOrFocus("Spotify")
	-- end),

	-- window size management
	hotkey.new(mod, "j", function()
		hs.window.focusedWindow():moveToUnit({ 0, 0, 0.5, 1 })
	end),
	hotkey.new(mod, "l", function()
		hs.window.focusedWindow():moveToUnit({ 0.5, 0, 0.5, 1 })
	end),
	hotkey.new(mod, "i", function()
		hs.window.focusedWindow():moveToUnit({ 0, 0, 1, 1 })
	end),
	hotkey.new(mod, "k", function()
		hs.window.focusedWindow():moveToUnit({ 0.15, 0.15, 0.7, 0.7 })
	end),
	hotkey.new(mod, ",", function()
		-- get the focused window
		local win = hs.window.focusedWindow()
		-- get the screen where the focused window is displayed, a.k.a. current screen
		local screen = win:screen()
		-- compute the unitRect of the focused window relative to the current screen
		-- and move the window to the next screen setting the same unitRect
		win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
	end),
}

for _, v in ipairs(myKeys) do
	v:enable()
end

-- local myKeysActive = false
-- this determines whether or not to enable/disable the keys
-- local et = eventtap
-- 	.new({ eventtap.event.types.flagsChanged }, function(e)
-- 		local flags = e:rawFlags()
-- 		if flags & eventtap.event.rawFlagMasks.deviceRightCommand > 0 then
-- 			if not myKeysActive then
-- 				for _, v in ipairs(myKeys) do
-- 					v:enable()
-- 				end
-- 				myKeysActive = true
-- 			end
-- 		else
-- 			if myKeysActive then
-- 				for _, v in ipairs(myKeys) do
-- 					v:disable()
-- 				end
-- 				myKeysActive = false
-- 			end
-- 		end
-- 	end)
-- 	:start()
