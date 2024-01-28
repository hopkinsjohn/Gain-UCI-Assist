

props["Max Gain 2 (dB)"].IsHidden = true 
props["Max Gain 3 (dB)"].IsHidden = true 
props["Max Gain 4 (dB)"].IsHidden = true 
props["Max Gain 5 (dB)"].IsHidden = true 
props["Max Gain 6 (dB)"].IsHidden = true 
props["Max Gain 7 (dB)"].IsHidden = true 
props["Max Gain 8 (dB)"].IsHidden = true 
props["Max Gain 9 (dB)"].IsHidden = true 
props["Max Gain 10 (dB)"].IsHidden = true 

props["Min Gain 2 (dB)"].IsHidden = true 
props["Min Gain 3 (dB)"].IsHidden = true 
props["Min Gain 4 (dB)"].IsHidden = true 
props["Min Gain 5 (dB)"].IsHidden = true 
props["Min Gain 6 (dB)"].IsHidden = true 
props["Min Gain 7 (dB)"].IsHidden = true 
props["Min Gain 8 (dB)"].IsHidden = true 
props["Min Gain 9 (dB)"].IsHidden = true 
props["Min Gain 10 (dB)"].IsHidden = true 

if props["Number Of Gains"].Value > 1 then 
  props["Max Gain 2 (dB)"].IsHidden = false 
  props["Min Gain 2 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 2 then 
  props["Max Gain 3 (dB)"].IsHidden = false 
  props["Min Gain 3 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 3 then 
  props["Max Gain 4 (dB)"].IsHidden = false 
  props["Min Gain 4 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 4 then 
  props["Max Gain 5 (dB)"].IsHidden = false 
  props["Min Gain 5 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 5 then 
  props["Max Gain 6 (dB)"].IsHidden = false 
  props["Min Gain 6 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 6 then 
  props["Max Gain 7 (dB)"].IsHidden = false 
  props["Min Gain 7 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 7 then 
  props["Max Gain 8 (dB)"].IsHidden = false 
  props["Min Gain 8 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 8 then 
  props["Max Gain 9 (dB)"].IsHidden = false 
  props["Min Gain 9 (dB)"].IsHidden = false 
end
if props["Number Of Gains"].Value > 9 then 
  props["Max Gain 10 (dB)"].IsHidden = false 
  props["Min Gain 10 (dB)"].IsHidden = false 
end
