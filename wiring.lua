
-- this wires the audio inputs named "Input x" to the meter named "MultiChannelMeter"

local InputCount = props["Number Of Gains"].Value

-- if mono
if InputCount == 1 then
  table.insert(
    wiring,
    {
      "Meter 1",
      "MultiChannelMeter Input"
    }
  )
else  -- if multichannel 
  for x = 1, InputCount do
    table.insert(
      wiring,
      {
        "Meter " .. x,
        "MultiChannelMeter Input " .. x
      }
    )
  end
end