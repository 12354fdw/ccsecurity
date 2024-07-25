local playerDetec = peripheral.find("playerDetector")

if not playerDetec then
    print("Please connect a player Dectector")
    return
end

local pos = {
    x=0,
    y=0,
    z=0
} -- self position

local mon = peripheral.find("monitor")
if mon then
    term.redirect(mon)
end

local tracking = {}
local data = {}

local w,h = term.getSize()

function render()
    local bg = window.create(term.current(),1,2,w,h)
    bg.setBackgroundColor(colors.white)
    bg.setTextColor(colors.lightGray)
    local title = window.create(term.current(),1,1,w,1)
    title.setBackgroundColor(colors.gray)
    title.setTextColor(colors.white)
    bg.clear()
    title.clear()
    title.write("trackPlayer [V.1.0]")
    local pos = 2
    for i,v in pairs(data) do
        bg.setCursorPos(1,pos)
        bg.write(i..": "..v.x..", "..v.y..", "..v.z..", dimen: "..v.dimension..", dist: "..string.format("%.2f",v.distance))
        pos = pos + 1
    end
end

while true do
    for i,v in pairs(tracking) do
        local td = playerDetec.getPlayerPos(v)
        if td then
            if not data[v] then data[v] = {} end
            data[v] = td
            local dx,dy,dz = pos.x-td.x,pos.y-td.y,pos.z-td.z
            local d = math.sqrt(dx^2+dy^2+dz^2)
            data[v].distance = d
        end
    end
    render()
    sleep(0.1)
end
