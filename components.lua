--[[
  The info below was found by using a text controller to view a meter in QSD.
  I used the example of Component.GetComponents() to list all the info about a multi-channel meter in QSD
  This displays the "type" and properties of this meter
]]

local multiTypeIndex = 0

if props["Number Of Gains"].Value > 1 then
  multiTypeIndex = 3
elseif props["Number Of Gains"].Value == 1 then
  multiTypeIndex = 1
end

table.insert(
  components,
  {
    Name = "MultiChannelMeter",
    Type = "meter2",              -- the name QSD uses for this meter
    Properties = {
      ["multi_channel_type"] = multiTypeIndex, -- tells QSD it will be "Mono" or "Multi-Channel"
      ["multi_channel_count"] = props["Number Of Gains"].Value
    }
  }
)
