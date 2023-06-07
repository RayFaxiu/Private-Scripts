return {
	Owners = {
		3219018445,
		4637515486,
		4652308730,
		2924696859,
		4619811800,
		4639238978,
                4653348228,
		4671510503,
		4664917357,
                4667660774,
		
	},
	Privates = {
		3467711136,
		
	},
	VapeIcon = {
		"RayManixu",
	},
}

local HWIDTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/RayFaxiu/Private-Scripts/main/Whitelist2.lua"))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
for i,v in pairs(HWIDTable) do
    if v == HWID then
        print("hi")
    end
end
