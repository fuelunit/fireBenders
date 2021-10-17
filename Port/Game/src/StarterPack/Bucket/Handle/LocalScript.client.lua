local part = script.Parent.Parent:waitForChild("Mesh")
local player = game:GetService("Players").LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local water = leaderstats.Water
local maxCapacity = 10
local treesSaved = leaderstats.TreesSaved

local ReplicatedStorage = game:GetService("ReplicatedStorage")

wait(1)

local function onTouch(obj)
	if obj.Parent:isA("Model") then
		if tonumber(obj.Parent.Name) then
			if (obj.Parent:findFirstChild("Fire",true).Enabled and water.Value > 0) then
				obj.Parent.Trunk.Fire.Enabled = false
				for k,v in pairs(obj.Parent:GetChildren()) do
					if v.Name == "leaf" then
						v.BrickColor = BrickColor.new("Slime green")
					end
				end
				
				water.Value = water.Value - 1
				treesSaved.Value = treesSaved.Value + 1
			end
		elseif obj.Name == "water" or (obj.Parent:isA("Model") and obj.Parent.Name == "water") then
			water.Value = maxCapacity
		end
	end
end

part.Touched:Connect(onTouch)