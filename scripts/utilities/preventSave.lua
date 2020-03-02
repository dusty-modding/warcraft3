------------------------------------------------------------------------------------------------------------------------
--
--   v1.0.1 by TriggerHappy
--   Translated to Lua by Killparadise
--   ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
--   This library allows you to enable or disable game saving. It works by showing
--   a dialog instantly before a game is saved, causing the save to interrupt. There
--   are no known side effects.
--   _________________________________________________________________________
--   1. Installation
--   ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
--   Copy the script to your map and save it (requires JassHelper --or-- JNGP)
--   _________________________________________________________________________
--   2. API
--   ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
--   function saveGameEnable takes boolean flag returns nothing
--   function isSaveEnabled takes nothing returns boolean
--   function preventSave takes player p, boolean flag returns nothing
--
------------------------------------------------------------------------------------------------------------------------

-- Globals
local gameAllowSave = false

--====================================
-- Do not edit below this line
--====================================

local dialog = DialogCreate()
local timer = CreateTimer()
local localPlayer

function saveGameEnable (flag)
  gameAllowSave = flag
end

function isSaveEnabled ()
  return gameAllowSave
end

function preventSave (p, flag)
  if p == LocalPlayer then
    saveGameEnable(not flag)
  end
end

local function exit ()
  DialogDisplay(localPlayer, dialog, false)
end

local function stopSave ()
  if not isSaveEnabled() then
    DialogDisplay(localPlayer, dialog, true)
  end

  TimerStart(timer, 0.00, false, exit)

  return false
end

local function onInit ()
  local t = CreateTrigger()
  localPlayer = GetLocalPlayer()

  TriggerRegisterGameEvent(t, EVENT_GAME_SAVE)
  TriggerAddCondition(t, Filter(stopSave))
end
