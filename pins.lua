


for x = 1, props["Number Of Gains"].Value do
  table.insert(
    pins,
    {
      Name = "Meter " .. x,
      Direction = "input"
    }
  )
end

