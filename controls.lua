--------- NOTES

local GainMaxTbl = {
  props["Max Gain 1 (dB)"].Value,
  props["Max Gain 2 (dB)"].Value,
  props["Max Gain 3 (dB)"].Value,
  props["Max Gain 4 (dB)"].Value,
  props["Max Gain 5 (dB)"].Value,
  props["Max Gain 6 (dB)"].Value,
  props["Max Gain 7 (dB)"].Value,
  props["Max Gain 8 (dB)"].Value,
  props["Max Gain 9 (dB)"].Value,
  props["Max Gain 10 (dB)"].Value,
}
local GainMinTbl = {
  props["Min Gain 1 (dB)"].Value,
  props["Min Gain 2 (dB)"].Value,
  props["Min Gain 3 (dB)"].Value,
  props["Min Gain 4 (dB)"].Value,
  props["Min Gain 5 (dB)"].Value,
  props["Min Gain 6 (dB)"].Value,
  props["Min Gain 7 (dB)"].Value,
  props["Min Gain 8 (dB)"].Value,
  props["Min Gain 9 (dB)"].Value,
  props["Min Gain 10 (dB)"].Value,
}


----- faders (qty 10), separated so that they can have discreet min, max values
table.insert(ctrls,{
  Name = "Fader 1",
  ControlType = "Knob",
  Max = GainMaxTbl[1], 
  Min = GainMinTbl[1],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 2",
  ControlType = "Knob",
  Max = GainMaxTbl[2], 
  Min = GainMinTbl[2],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 3",
  ControlType = "Knob",
  Max = GainMaxTbl[3], 
  Min = GainMinTbl[3],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 4",
  ControlType = "Knob",
  Max = GainMaxTbl[4], 
  Min = GainMinTbl[4],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 5",
  ControlType = "Knob",
  Max = GainMaxTbl[5], 
  Min = GainMinTbl[5],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 6",
  ControlType = "Knob",
  Max = GainMaxTbl[6], 
  Min = GainMinTbl[6],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 7",
  ControlType = "Knob",
  Max = GainMaxTbl[7], 
  Min = GainMinTbl[7],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 8",
  ControlType = "Knob",
  Max = GainMaxTbl[8], 
  Min = GainMinTbl[8],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 9",
  ControlType = "Knob",
  Max = GainMaxTbl[9], 
  Min = GainMinTbl[9],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
table.insert(ctrls,{
  Name = "Fader 10",
  ControlType = "Knob",
  Max = GainMaxTbl[10], 
  Min = GainMinTbl[10],
  ControlUnit = "dB",
  Count = 1,
  DefaultValue = 0,
  UserPin = true,
  PinStyle = "Both",
})
----- mutes 
table.insert(ctrls, {
  Name = "Mute",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 10,
  UserPin = true,
  PinStyle = "Both",
  IconType = "Icon",
  Icon = "Volume Strike"
})
----- gain + 
table.insert(ctrls, {
  Name = "Gain Up",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 10,
  UserPin = true,
  PinStyle = "Both",
  IconType = "Icon",
  Icon = "Plus"
})
----- gain -
table.insert(ctrls, {
  Name = "Gain Down",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 10,
  UserPin = true,
  PinStyle = "Both",
  IconType = "Icon",
  Icon = "Minus"
})
----- Component Name text box
table.insert(ctrls, {
  Name = "Component Name",
  ControlType = "Text",
  Count = 10,
  UserPin = false,
})
----- friendly name text box
table.insert(ctrls, {
  Name = "Friendly Name",
  ControlType = "Text",
  Count = 10,
  UserPin = true,
  PinStyle = "Both",
})
----- Display : Name
table.insert(ctrls, {
  Name = "Display Name",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 10,
  UserPin = true,
  PinStyle = "Output",
})
----- Display : dB
table.insert(ctrls, {
  Name = "Display dB",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 10,
  UserPin = true,
  PinStyle = "Output",
})
----- Display : %
table.insert(ctrls, {
  Name = "Display Percent",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 10,
  UserPin = true,
  PinStyle = "Output",
})
----- Display max gain at fader
table.insert(ctrls, {
  Name = "Display Max",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 10,
  UserPin = false
})
----- Display min gain at fader
table.insert(ctrls, {
  Name = "Display Min",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 10,
  UserPin = false
})
----- Display Override Button
table.insert(ctrls, {
  Name = "Display Override",
  ControlType = "Button",
  ButtonType = "Toggle",
  DefaultValue = true,
  Count = 1,
  UserPin = true,
  PinStyle = "Both",
})
----- reset time
table.insert(ctrls,{
  Name = "Reset Time",
  ControlType = "Knob",
  Min = 1, 
  Max = 6,
  ControlUnit = "Integer",
  Count = 1,
  DefaultValue = 3,
  UserPin = true,
  PinStyle = "Input",
})
----- Meters 
table.insert(ctrls, {
  Name = "Meter",
  ControlType = "Indicator",
  IndicatorType = "Meter",
  Count = 10,
  UserPin = false,
})
----- Meter Resposne Time knob
table.insert(ctrls, {
  Name = "Meter Response Time",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Min = 10, 
  Max = 1000,
  --DefaultValue = 300,
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
})
----- Meter Resposne Time display
table.insert(ctrls, {
  Name = "Meter Response Time Display",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 1,
  UserPin = false
})
----- version
table.insert(ctrls, {
  Name = "Ver",
  ControlType = "Indicator",
  IndicatorType = "Text",
  Count = 1,
  UserPin = false
})
