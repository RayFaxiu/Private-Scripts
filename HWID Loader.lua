local HWIDTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/RayFaxiu/Private-Scripts/main/Whitelist2.lua"))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
for i,v in pairs(HWIDTable) do
    if v == HWID then
        print("Whitelisted!")
        wait "1"
        print("Loading Commands!")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RayFaxiu/Private-Scripts/main/Loader.lua"))()
    end
end
