local args = {...}
local meN = args[1]
local targetN = args[2]

local playerDetec = peripheral.find("playerDetector")
if not playerDetec then
    print("Connect a player detector")
    return
end

while true do
    term.clear()
    term.setCursorPos(1,1)

    local me = playerDetec.getPlayerPos(meN)
    local ta = playerDetec.getPlayerPos(targetN)
    if not me or not ta then
        print("Usage: track <me> <target>")
        return
    end

    print("Tracking "..targetN)
    local dx,dy,dz = me.x - ta.x, me.y - ta.y, me.z - ta.z
    local d = math.sqrt(dx^2+dy^2+dz^2)
    print(string.format("Distance: %.2f",d))
    sleep(1)
end
