local playersService = game:GetService("Players")
local lplr = playersService.LocalPlayer
function Cape(char, texture)
		for i,v in pairs(char:GetDescendants()) do
			if v.Name == "Cape" then
				v:Remove()
			end
		end
		local hum = char:WaitForChild("Humanoid")
		if char:FindFirstChild("Torso") then
			torso = char.Torso
		else
			torso = char.UpperTorso
		end
		local p = Instance.new("Part", torso.Parent)
		p.Name = "Cape"
		p.Anchored = false
		p.CanCollide = false
		p.TopSurface = 0
		p.BottomSurface = 0
		p.FormFactor = "Custom"
		p.Size = Vector3.new(0.2,0.2,0.2)
		p.Transparency = 1
		local decal = Instance.new("Decal", p)
		decal.Texture = texture
		decal.Face = "Back"
		local msh = Instance.new("BlockMesh", p)
		msh.Scale = Vector3.new(9,17.5,0.5)
		local motor = Instance.new("Motor", p)
		motor.Part0 = p
		motor.Part1 = torso
		motor.MaxVelocity = 0.01
		motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
		motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
		local wave = false
		repeat wait(1/44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
	until not p or p.Parent ~= torso.Parent
end

lplr.CharacterAdded:Connect(function(char)
		spawn(function()
			pcall(function() 
				Cape(char, ("rbxthumb://type=Asset&id=" .. 13834440662 .. "&w=420&h=420"))
			end)
		end)
	end)
	if lplr.Character then
		spawn(function()
			pcall(function() 
				Cape(lplr.Character, ("rbxthumb://type=Asset&id=" .. 13834440662 .. "&w=420&h=420"))
			end)
		end)
	end
