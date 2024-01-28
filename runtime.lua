-- jhopkins
-- Onyx AudioVisual
---------------------------------------------------------------
------------------------  Constants  --------------------------
---------------------------------------------------------------
e = System.IsEmulating
iMaxGains = Properties["Number Of Gains"].Value
ColorRed = "OrangeRed"
ColorGreen = "LightGreen"
ColorYellow = "Yellow"
ColorWhite = "White"
EmptyComponentMessage = "Enter Valid Gain"

-- timers for Display Text
DisplayTextTimerTbl = {}
for i = 1, iMaxGains do 
    DisplayTextTimerTbl[i] = Timer.New()
end 


-- timers for Gain Up/Down buttons
ButtonUpDownTimerTbl = {}
for i = 1, iMaxGains do 
    ButtonUpDownTimerTbl[i] = Timer.New()
end 
ButtonUpDownTimeout = 0.1
ButtonUpDownHoldTime = 0.5


---------------------------------------------------------------
--------------------  Named Components ------------------------
---------------------------------------------------------------
GainTbl = {}
MuteTbl = {}

---------------------------------------------------------------
------------------------  Functions ---------------------------
---------------------------------------------------------------

-- a function that cycles through the named component inputs and checks that they exist
function EvaluateNamedComponents(idx)
    
    if(DebugFunction)then print("EvaluateNamedComponents entered with "..idx)end

    local Allow = false

    -- check the component exists
    if #Component.GetControls(Controls['Component Name'][idx].String) ~= 0 then
      if(DebugFunction)then print("Component Does Exist")end
      -- check that this Named Component is a Gain by counting "bypass", "gain", "invert", and "mute"
      b_ctrls = Component.GetControls(Controls['Component Name'][idx].String)
      local VerifyCount = 0
      for k,v in pairs (b_ctrls) do 
        if v.Name == "bypass" then VerifyCount = VerifyCount + 1 end
        if v.Name == "gain" then VerifyCount = VerifyCount + 1 end
        if v.Name == "invert" then VerifyCount = VerifyCount + 1 end
        if v.Name == "mute" then VerifyCount = VerifyCount + 1 end
      end
      if VerifyCount == 4 then -- has all of the names of a gain
        if(DebugFunction)then print("Component Is A Gain")end
        Allow = true
      else -- does not have all 4 names of a gain
        if(DebugFunction)then print("Component Is NOT A Gain")end
        Allow = false
      end 
    else -- component does not exist
      if(DebugFunction)then print("Component Does NOT Exist")end
      Allow = false
    end  

     
    if Allow == true then
      -- some GUI stuff
      Controls['Component Name'][idx].Color = ColorGreen
      Controls['Fader '..tostring(idx)].IsDisabled = false
      Controls['Mute'][idx].IsDisabled = false
      Controls['Gain Up'][idx].IsDisabled = false
      Controls['Gain Down'][idx].IsDisabled = false
      Controls['Meter'][idx].IsDisabled = false
      -- show a plus sign for max gain if its greater than 0
      local max = tonumber(tostring(Properties[string.format("Max Gain %i (dB)", idx)].Value))
      Controls['Display Max'][idx].String = max > 0 and string.format("+%i", max) or (tostring(max))
      -- show min gain
      Controls['Display Min'][idx].String = tostring(Properties[string.format("Min Gain %i (dB)", idx)].Value)

      -- if existing, set EventHandler to nil
      if GainTbl[idx] then GainTbl[idx].EventHandler = nil end
      if MuteTbl[idx] then MuteTbl[idx].EventHandler = nil end
      -- establish new Named Components for gain and mute
      local g = Component.New(Controls['Component Name'][idx].String)['gain']
      local m = Component.New(Controls['Component Name'][idx].String)['mute']
      -- store these Named Components into a table
      GainTbl[idx] = g
      MuteTbl[idx] = m
      -- match the plugin faders and mute states
      Controls['Fader '..tostring(idx)].Value = GainTbl[idx].Value
      Controls['Mute'][idx].Boolean = MuteTbl[idx].Boolean   
      -- check that the Friendly Name is populated, if not then assign gain name to Friendly Name
      if Controls['Friendly Name'][idx].String == "" then 
        Controls['Friendly Name'][idx].String = Controls['Component Name'][idx].String
      end 
      SetLegends(idx)
      -- set new EventHandlers for the named components
      -- I could not find a way to make this happen in a table, since they need to be discreet functions. 
      -- revisit in future
      local GainEVTTbl = {GainEVT1, GainEVT2, GainEVT3, GainEVT4, GainEVT5, GainEVT6, GainEVT7, GainEVT8, GainEVT9, GainEVT10}
      local MuteEVTTbl = {MuteEVT1, MuteEVT2, MuteEVT3, MuteEVT4, MuteEVT5, MuteEVT6, MuteEVT7, MuteEVT8, MuteEVT9, MuteEVT10}
      GainTbl[idx].EventHandler = GainEVTTbl[idx]
      MuteTbl[idx].EventHandler = MuteEVTTbl[idx]
    else 
      -- some GUI stuff
      Controls['Component Name'][idx].Color = ColorRed
      Controls['Component Name'][idx].String = EmptyComponentMessage
      Controls['Fader '..tostring(idx)].IsDisabled = true
      Controls['Mute'][idx].IsDisabled = true
      Controls['Gain Up'][idx].IsDisabled = true
      Controls['Gain Down'][idx].IsDisabled = true
      Controls['Display Max'][idx].String = ""
      Controls['Display Min'][idx].String = ""
      Controls['Fader '..tostring(idx)].Position = 0
      Controls['Mute'][idx].Boolean = false
      Controls['Display Name'][idx].String = ""
      Controls['Display Percent'][idx].String = ""
      Controls['Display dB'][idx].String = ""
      Controls['Meter'][idx].Value = -100
      Controls['Meter'][idx].IsDisabled = true
      -- kill the EventHandlers if they existed
      if GainTbl[idx] then GainTbl[idx].EventHandler = nil end
      if MuteTbl[idx] then MuteTbl[idx].EventHandler = nil end
      -- set the table entries to "" 
      GainTbl[idx] = nil
      MuteTbl[idx] = nil
    end

    if(DebugFunction) then
      print("GainTbl has "..#GainTbl)
      print("MuteTbl has "..#GainTbl)
    end
end


---- gain components change
function GainEVT1(ctl)
  Controls['Fader 1'].Value = ctl.Value
  SetGainValues(1)
end
function GainEVT2(ctl)
  Controls['Fader 2'].Value = ctl.Value
  SetGainValues(2)
end
function GainEVT3(ctl)
  Controls['Fader 3'].Value = ctl.Value
  SetGainValues(3)
end
function GainEVT4(ctl)
  Controls['Fader 4'].Value = ctl.Value
  SetGainValues(4)
end
function GainEVT5(ctl)
  Controls['Fader 5'].Value = ctl.Value
  SetGainValues(5)
end
function GainEVT6(ctl)
  Controls['Fader 6'].Value = ctl.Value
  SetGainValues(6)
end
function GainEVT7(ctl)
  Controls['Fader 7'].Value = ctl.Value
  SetGainValues(7)
end
function GainEVT8(ctl)
  Controls['Fader 8'].Value = ctl.Value
  SetGainValues(8)
end
function GainEVT9(ctl)
  Controls['Fader 9'].Value = ctl.Value
  SetGainValues(9)
end
function GainEVT10(ctl)
  Controls['Fader 10'].Value = ctl.Value
  SetGainValues(10)
end

---- mute components change
function MuteEVT1(ctl)
  Controls['Mute'][1].Boolean = ctl.Boolean
end
function MuteEVT2(ctl)
  Controls['Mute'][2].Boolean = ctl.Boolean
end
function MuteEVT3(ctl)
  Controls['Mute'][3].Boolean = ctl.Boolean
end
function MuteEVT4(ctl)
  Controls['Mute'][4].Boolean = ctl.Boolean
end
function MuteEVT5(ctl)
  Controls['Mute'][5].Boolean = ctl.Boolean
end
function MuteEVT6(ctl)
  Controls['Mute'][6].Boolean = ctl.Boolean
end
function MuteEVT7(ctl)
  Controls['Mute'][7].Boolean = ctl.Boolean
end
function MuteEVT8(ctl)
  Controls['Mute'][8].Boolean = ctl.Boolean
end
function MuteEVT9(ctl)
  Controls['Mute'][9].Boolean = ctl.Boolean
end
function MuteEVT10(ctl)
  Controls['Mute'][10].Boolean = ctl.Boolean
end

-- this function resets the legends on the Display Name, Display Percent, and Display dB controls
function SetLegends(idx)
    if(DebugFunction)then print("SetLegends entered with "..idx)end
    if GainTbl[idx] ~= nil then
      Controls['Display Name'][idx].String = Controls['Friendly Name'][idx].String
      if Controls['Display Override'].Boolean then 
          Controls['Display Percent'][idx].String = Controls['Friendly Name'][idx].String
          Controls['Display dB'][idx].String = Controls['Friendly Name'][idx].String
      else 
        SetGainValues(idx)
      end
    end
    Controls['Display Override'].Legend = Controls['Display Override'].Boolean and "On" or "Off"
end 

-- function to assign % value to volume slider
function SetGainValues(idx)
    -- start timer if Display Override is on
    if Controls['Display Override'].Boolean then 
      DisplayTextTimerTbl[idx]:Start(Controls['Reset Time'].Value)
    end 
    
    -- percentage readout
    local p = Controls['Fader '..tostring(idx)].Position
    local percent = math.floor(tonumber(string.format("%.4s", p)) * 100)
    Controls['Display Percent'][idx].String = tostring(percent).."%"

    -- db readout
    Controls['Display dB'][idx].String = TextValue(Controls['Fader '..tostring(idx)].Value)
end 

-- function to return the dB value of the fader
function TextValue(val)
  if val < 1 and val > -1 then
    return "0 dB"
  elseif val >= 1 and val < 10 then
    return string.format("+%.1s dB", val)
  elseif val > 9.9 then
    return string.format("+%.2s dB", val)
  elseif val > -9.9 then
    return string.format("%.2s dB", val)
  elseif val < -9.9 and val > -99.9 then
    return string.format("%.3s dB", val)  
  else
    return string.format("%.4s dB", val) 
  end
end

function CheckForDuplicateEntries(s)
    local count = 0
    for k,v in pairs (Controls['Component Name']) do
      if v.String == s then
        count = count + 1
      end 
    end 
    if count > 1 and #s > 1 then 
      return true
    else 
      return false
    end 
end 


---------------------------------------------------------------
-------------------------  EVTs -------------------------------
---------------------------------------------------------------

-- Component Name text boxes change
for i = 1, iMaxGains do 
    Controls['Component Name'][i].EventHandler = function(ctl)
      if CheckForDuplicateEntries(ctl.String) == true then 
        Controls['Component Name'][i].String = "No Duplicates"
        Controls['Component Name'][i].Color = ColorYellow
        Timer.CallAfter(function() 
          Controls['Component Name'][i].Color = ColorRed
          Controls['Component Name'][i].String = EmptyComponentMessage
          EvaluateNamedComponents(i)
        end , 1)
      else
        EvaluateNamedComponents(i)
      end 
    end 
end 

-- faders change
for i = 1, iMaxGains do 
    Controls['Fader '..tostring(i)].EventHandler = function(ctl)
      if GainTbl[i] ~= nil then 
        GainTbl[i].Value = ctl.Value
      end 
    end 
end 

-- mute button changes
for i = 1, iMaxGains do 
  Controls['Mute'][i].EventHandler = function(ctl)
    if MuteTbl[i] ~= nil then 
        MuteTbl[i].Value = ctl.Value
    end
  end 
end 

-- friendly names change
for i = 1, iMaxGains do 
  Controls['Friendly Name'][i].EventHandler = function()
    SetLegends(i)
  end
end 

-- display override changes
Controls['Display Override'].EventHandler = function(ctl)
  for i = 1, iMaxGains do 
    SetLegends(i)
  end
end 

-- gain up buttons
for i = 1, iMaxGains do 
    Controls['Gain Up'][i].EventHandler = function(ctl)
      if ctl.Boolean then 
        GainTbl[i].Value = GainTbl[i].Value + 1
        -- if user holds button it will begin the timer which will increment faster
        Timer.CallAfter(function() 
          if ctl.Boolean then 
            ButtonUpDownTimerTbl[i]:Start(ButtonUpDownTimeout)
          end
        end, ButtonUpDownHoldTime)
      else 
        -- stop the respective timer
        ButtonUpDownTimerTbl[i]:Stop()
      end 
    end 
end 

-- gain down buttons
for i = 1, iMaxGains do 
    Controls['Gain Down'][i].EventHandler = function(ctl)
      if ctl.Boolean then 
        GainTbl[i].Value = GainTbl[i].Value - 1
        -- if user holds button it will begin the timer which will decrement faster
        Timer.CallAfter(function() 
          if ctl.Boolean then 
            ButtonUpDownTimerTbl[i]:Start(ButtonUpDownTimeout)
          end
        end, ButtonUpDownHoldTime)
      else 
        -- stop the respective timer
        ButtonUpDownTimerTbl[i]:Stop()
      end 
    end 
end 

-- user controls - meter response time changes
Controls['Meter Response Time'].EventHandler = function(ctl)
  MultiChannelMeter['response.time'].String = ctl.String
end 

-- DisplayTextTimerTbl Timers stop
for k,v in pairs (DisplayTextTimerTbl) do 
  v.EventHandler = function()
    DisplayTextTimerTbl[k]:Stop()
    if Controls['Display Override'].Boolean then 
      SetLegends(k)
    end
  end 
end 

-- ButtonUpDownTimerTbl Timers stop
for k,v in pairs (ButtonUpDownTimerTbl) do 
  v.EventHandler = function()
    if Controls['Gain Up'][k].Boolean then 
      GainTbl[k].Value = GainTbl[k].Value + 1
    elseif Controls['Gain Down'][k].Boolean then 
      GainTbl[k].Value = GainTbl[k].Value - 1
    end
  end 
end 

----------------------- internal meter of the plugin changes
--- meters
for i = 1, iMaxGains do 
    MultiChannelMeter['meter.'..i].EventHandler = function(ctl)
      if GainTbl[i] ~= nil then
        Controls['Meter'][i].Value = ctl.Value
      end
    end 
end 

--- meter response time changes
MultiChannelMeter['response.time'].EventHandler = function(ctl)
  Controls['Meter Response Time Display'].String = ctl.String
end

---------------------------------------------------------------
------------------------  On Start ----------------------------
---------------------------------------------------------------
if Controls then
  -- print general info
  print("=== Starting "..PluginInfo.Name.." V"..PluginInfo.Version.." ===")

  -- print if system is live or emulating
  if e then
    print("System Is Emulating")
  else
    print("System Is Live With Core")
  end

  -- setup debug
  if Properties["plugin_show_debug"].Value == false then 
    DebugFunction=false
  else 
    DebugFunction=true
  end

  -- set up the Named Components
  for i = 1, iMaxGains do 
    EvaluateNamedComponents(i) 
  end

  -- clear all text entries over iMaxGains
  for i = iMaxGains + 1, 10 do 
      Controls['Component Name'][i].String = ""
  end 

  -- set legends, strings
  Controls['Display Override'].Legend = Controls['Display Override'].Boolean and "On" or "Off"
  Controls['Meter Response Time Display'].String = MultiChannelMeter['response.time'].String


  -- set values for meter times if plugin first start
  if MultiChannelMeter['response.time'].String == "1.00s" then
    Controls['Meter Response Time'].Value = 1000
  else
    Controls['Meter Response Time'].Value = math.floor((string.match(MultiChannelMeter['response.time'].String, "(%d.+)ms")))
  end
end
