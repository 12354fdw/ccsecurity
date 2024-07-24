local args = {...}

local type = args[1]
local desc = args[2]

local mons = {peripheral.find("montior")}

for i,mon in pairs(mons) do
    local w,h = mon.getSize()
    mon.setBackgroundColor(colors[type])
    mon.clear()
    mon.setTextScale(3)
    mon.setCursorPos(w/2,h/2)
    mon.write("CODE "..string.upper(type))
    mon.setTextScale(1)
    mon.setCursorPos((w/2)-5,h/2+1)
    mon.write(desc)
end
