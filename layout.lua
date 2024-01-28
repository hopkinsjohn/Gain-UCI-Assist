
--------- Variables
local TotalGainCount = props["Number Of Gains"].Value
local ButtonPrimaryOffColor = {235,245,252}
local ButtonPrimaryOnColor = {5, 97, 165}
local ButtonStrokeColor = {5, 97, 165}
local TextPrimaryColor = {51,51,51}
local TextSecondaryColor = {102,102,102}
local GroupBoxFillColor =  {235,245,252}
local GroupBoxStrokeColor = {5, 97, 165}
local TextFont = "Montserrat"
local TextFontStyle = "Light"
local FaderSize = {70,190}
local FaderYCoord = 150
local FaderXCoord = {174, 312, 450, 588, 726, 864, 1002, 1140, 1278, 1416}
local GroupboxSize = {138,420}
local TextBoxXCoord = {147, 285, 423, 561, 699, 837, 975, 1113, 1251, 1389}


--------- page graphics
-- left hand groupbox
table.insert(graphics,{
  Type = "GroupBox",
  Fill = GroupBoxFillColor,
  StrokeColor = GroupBoxStrokeColor,
  StrokeWidth = 1,
  CornerRadius = 5,
  ZOrder = -1,
  Position = {2,2},
  Size = GroupboxSize
})
-- Component Name label
table.insert(graphics,{
  Type = "Label",
  Text = "Component Name:",
  Position = {13,16},
  Size = {120,25},
  FontSize = 12,
  Margin = 1,
  HTextAlign = "Right",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})
-- Friend Name label
table.insert(graphics,{
  Type = "Label",
  Text = "Friendly Name:",
  Position = {13,41},
  Size = {120,25},
  FontSize = 12,
  Margin = 1,
  HTextAlign = "Right",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})
-- Display - Name label
table.insert(graphics,{
  Type = "Label",
  Text = "Display Name:",
  Position = {13,76},
  Size = {120,25},
  FontSize = 12,
  Margin = 1,
  HTextAlign = "Right",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})
-- Display - dB label
table.insert(graphics,{
  Type = "Label",
  Text = "Display dB:",
  Position = {13,101},
  Size = {120,25},
  FontSize = 12,
  Margin = 1,
  HTextAlign = "Right",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})
-- Display - % label
table.insert(graphics,{
  Type = "Label",
  Text = "Display %:",
  Position = {13,126},
  Size = {120,25},
  FontSize = 12,
  Margin = 1,
  HTextAlign = "Right",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})
-- Text Override header
table.insert(graphics,{
  Type = "Header",
  Text = "Text Override",
  Position = {15,260},
  Size = {112,25},
  FontSize = 11,
  HTextAlign = "Left",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextSecondaryColor,
}) 
-- Display Override Toggle
layout["Display Override"] = { 
  PrettyName = "Text Override~Enable",
  ButtonStyle = "Toggle",
  ButtonVisualStyle = "Gloss",
  WordWrap = false,
  Legend = "Off",
  Position = {17, 281}, 
  Size = {53,25},
  Color = {157,208,91},
  UnlinkOffColor = true ,
  OffColor = {204,204,204},
  StrokeColor = ButtonStrokeColor,
  Margin = 2,
  Radius = 6,
  IsReadOnly = false,
  FontSize = 12,
  Font = TextFont,
  FontStyle = TextFontStyle,
  TextColor = {0,0,0},
}
-- Reset Time Integer
layout["Reset Time"] = {           
  Style = "Text",
  TextBoxStyle = "Meter",
  PrettyName = "Text Override~Reset Time",
  Position = {72,281},
  Size = {53,25},
  Color = {73,189,239},
  Margin = 2,
  IsReadOnly = false,
}
-- Meter Times Header
table.insert(graphics,{
  Type = "Header",
  Text = "Meter Response",
  Position = {15,308},
  Size = {112,25},
  FontSize = 11,
  HTextAlign = "Left",
  Font = TextFont,
  FontStyle = TextFontStyle,
  Color = TextSecondaryColor,
}) 
-- Meter Response Time Knob
layout["Meter Response Time"] = {           
  Style = "Knob",
  ShowTextbox = false,
  PrettyName = "Meter~Response Time",
  Position = {53,334},
  Size = {36,36},
  Color = {254,248,134},
  IsReadOnly = false,
}
-- Meter Response Time Display
layout["Meter Response Time Display"] = { 
  PrettyName = "Meter~Response Time Display",
  Style = "Text",
  TextBoxStyle = "Normal",
  Color = {255,255,255},
  StrokeWidth = 1,
  CornerRadius = 0,
  --Font = TextFont,
  --FontStyle = TextFontStyle,
  HTextAlign = "Center",
  WordWrap = false,
  Position = {53,351},
  Size = {36,16},
  FontSize = 9,
  IsReadOnly = true,
  Margin = 1,
  TextColor = TextPrimaryColor,
}
-- Logo
Logo = "--[[ #encode "logo.svg" ]]"
table.insert(graphics,{
  Type = "Svg",
  Image = Logo,
  Position = {11,381},
  Size = {120,23},
  ZOrder = 1000
})
-- Display - version
table.insert(graphics,{
  Type = "Label",
  Text = string.format("v%s", PluginInfo.Version),
  Position = {71,404},
  Size = {60,18},
  FontSize = 9,
  Margin = 1,
  HTextAlign = "Right",
  --Font = TextFont,
  --FontStyle = TextFontStyle,
  Color = TextPrimaryColor,
})

-- Controls
TotalGainCount = math.floor(tonumber(TotalGainCount))
for i = 1, TotalGainCount do
  -- groupboxes
  table.insert(graphics,{
    Type = "GroupBox",
    Fill = GroupBoxFillColor,
    StrokeColor = GroupBoxStrokeColor,
    StrokeWidth = 1,
    CornerRadius = 5,
    Position = {2+i*GroupboxSize[1],2},
    Size = GroupboxSize
  })
  -- Named Component text box
  layout["Component Name "..i] = { 
    PrettyName = string.format("Gain %i~Component Name",i),
    Style = "Text",
    Position = {TextBoxXCoord[i],16},
    Size = {125,25},
    Color = {255,255,255},
    FontSize = 12,
    Font = TextFont,
    FontStyle = TextFontStyle,
    TextColor = TextPrimaryColor,
    Margin = 1,
    HTextAlign = "Center",
    IsReadOnly = false,
  }
  -- Friendly Name text box
  layout["Friendly Name "..i] = { 
    PrettyName = string.format("Gain %i~Friendly Name",i),
    Style = "Text",
    Position = {TextBoxXCoord[i],41},
    Size = {125,25},
    Color = {255,255,255},
    FontSize = 12,
    Font = TextFont,
    FontStyle = TextFontStyle,
    TextColor = TextPrimaryColor,
    Margin = 1,
    HTextAlign = "Center",
    IsReadOnly = false,
  }
  -- text output name only
  layout["Display Name "..i] = { 
    PrettyName = string.format("Gain %i~Display Name",i),
    Style = "Text",
    TextBoxStyle = "NoBackground",
    Font = TextFont,
    FontStyle = TextFontStyle,
    HTextAlign = "Center",
    WordWrap = false,
    Position = {TextBoxXCoord[i],76},
    Size = {125,25},
    FontSize = 12,
    IsReadOnly = true,
    Margin = 1,
    TextColor = TextPrimaryColor,
  }
  -- text output dB
  layout["Display dB "..i] = { 
    PrettyName = string.format("Gain %i~Display dB",i),
    Style = "Text",
    TextBoxStyle = "NoBackground",
    Font = TextFont,
    FontStyle = TextFontStyle,
    HTextAlign = "Center",
    WordWrap = false,
    Position = {TextBoxXCoord[i],101},
    Size = {125,25},
    FontSize = 12,
    IsReadOnly = true,
    Margin = 1,
    TextColor = TextPrimaryColor,
  }
  -- text output %
  layout["Display Percent "..i] = { 
    PrettyName = string.format("Gain %i~Display Percent",i),
    Style = "Text",
    TextBoxStyle = "NoBackground",
    Font = TextFont,
    FontStyle = TextFontStyle,
    HTextAlign = "Center",
    WordWrap = false,
    Position = {TextBoxXCoord[i],126},
    Size = {125,25},
    FontSize = 12,
    IsReadOnly = true,
    Margin = 1,
    TextColor = TextPrimaryColor,
  }
  -- gain max display at fader
  layout["Display Max "..i] = { 
    PrettyName = string.format("Gain %i~Max dB",i),
    Style = "Text",
    TextBoxStyle = "NoBackground",
    Font = TextFont,
    FontStyle = TextFontStyle,
    HTextAlign = "Right",
    WordWrap = false,
    Position = {2+i*GroupboxSize[1],FaderYCoord},
    Size = {33,18},
    FontSize = 10,
    IsReadOnly = true,
    Margin = 1,
    TextColor = TextSecondaryColor,
  }
  -- gain max display at fader
  layout["Display Min "..i] = { 
    PrettyName = string.format("Gain %i~Min dB",i),
    Style = "Text",
    TextBoxStyle = "NoBackground",
    Font = TextFont,
    FontStyle = TextFontStyle,
    HTextAlign = "Right",
    WordWrap = false,
    Position = {2+i*GroupboxSize[1],FaderYCoord + FaderSize[2] - 18},
    Size = {33,18},
    FontSize = 10,
    IsReadOnly = true,
    Margin = 1,
    TextColor = TextSecondaryColor,
  }
  -- Meters
  layout["Meter "..i] = {           
    Style = "Meter",
    PrettyName = string.format("Gain %i~Meter",i),
    MeterStyle = "Standard",
    ShowTextbox = false,
    Position = {FaderXCoord[i]+FaderSize[1],FaderYCoord},
    Size = {12,FaderSize[2]},
    BackgroundColor  = GroupBoxFillColor,
    StrokeColor = ButtonStrokeColor,
    Margin = 1,
    Radius = 6,
    IsReadOnly = true,
  }
  -- Gain Up Buttons
  layout["Gain Up "..i] = {           
    Style = "Button",
    PrettyName = string.format("Gain %i~+",i),
    ButtonStyle = "Momentary",
    ButtonVisualStyle = "Flat",
    WordWrap = true,
    Position = {FaderXCoord[i],344},
    Size = {35,25},
    Color = {152,209,234},
    UnlinkOffColor = true ,
    OffColor = ButtonPrimaryOffColor,
    StrokeColor = ButtonStrokeColor,
    StrokeWidth = 0,
    Margin = 1,
    Radius = 6,
    Padding = 1,
    IsReadOnly = false,
    IconColor = ButtonPrimaryOnColor,
  }
  -- Gain Down Buttons
  layout["Gain Down "..i] = {           
    Style = "Button",
    PrettyName = string.format("Gain %i~-",i),
    ButtonStyle = "Momentary",
    ButtonVisualStyle = "Flat",
    WordWrap = true,
    Position = {FaderXCoord[i]+35,344},
    Size = {35,25},
    Color = {152,209,234},
    UnlinkOffColor = true ,
    OffColor = ButtonPrimaryOffColor,
    StrokeColor = ButtonStrokeColor,
    StrokeWidth = 0,
    Margin = 1,
    Radius = 6,
    Padding = 1,
    IsReadOnly = false,
    IconColor = ButtonPrimaryOnColor,
  }
  -- Mute Buttons
  layout["Mute "..i] = {           
    Style = "Button",
    PrettyName = string.format("Gain %i~Mute",i),
    ButtonStyle = "Toggle",
    ButtonVisualStyle = "Flat",
    WordWrap = true,
    Position = {FaderXCoord[i],369},
    Size = {70,35},
    Color = {231,87,59},
    UnlinkOffColor = true ,
    OffColor = ButtonPrimaryOffColor,
    StrokeColor = ButtonStrokeColor,
    Margin = 1,
    Radius = 6,
    Padding = 5,
    IsReadOnly = false,
    IconColor = ButtonPrimaryOnColor,
  }

end

if TotalGainCount > 0 then
  -- Fader
  layout["Fader 1"] = {           
    Style = "Fader",
    PrettyName = "Gain 1~Fader",
    Position = {FaderXCoord[1],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 1 then
  -- Fader
  layout["Fader 2"] = {           
    Style = "Fader",
    PrettyName = "Gain 2~Fader",
    Position = {FaderXCoord[2],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 2 then
  -- Fader
  layout["Fader 3"] = {           
    Style = "Fader",
    PrettyName = "Gain 3~Fader",
    Position = {FaderXCoord[3],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 3 then
  -- Fader
  layout["Fader 4"] = {           
    Style = "Fader",
    PrettyName = "Gain 4~Fader",
    Position = {FaderXCoord[4],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 4 then
  -- Fader
  layout["Fader 5"] = {           
    Style = "Fader",
    PrettyName = "Gain 5~Fader",
    Position = {FaderXCoord[5],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 5 then
  -- Fader
  layout["Fader 6"] = {           
    Style = "Fader",
    PrettyName = "Gain 6~Fader",
    Position = {FaderXCoord[6],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 6 then
  -- Fader
  layout["Fader 7"] = {           
    Style = "Fader",
    PrettyName = "Gain 7~Fader",
    Position = {FaderXCoord[7],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 7 then
  -- Fader
  layout["Fader 8"] = {           
    Style = "Fader",
    PrettyName = "Gain 8~Fader",
    Position = {FaderXCoord[8],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 8 then
  -- Fader
  layout["Fader 9"] = {           
    Style = "Fader",
    PrettyName = "Gain 9~Fader",
    Position = {FaderXCoord[9],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end
if TotalGainCount > 9 then
  -- Fader
  layout["Fader 10"] = {           
    Style = "Fader",
    PrettyName = "Gain 10~Fader",
    Position = {FaderXCoord[10],FaderYCoord},
    Size = FaderSize,
    Color = ButtonPrimaryOnColor,
    Margin = 1,
    IsReadOnly = false,
  }
end

