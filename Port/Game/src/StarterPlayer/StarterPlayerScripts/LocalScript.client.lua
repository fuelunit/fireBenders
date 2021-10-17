--Initialize Trees
local field = game.Workspace.Field
local RS = game:GetService("ReplicatedStorage")
for i = 1,25 do
	local spawnTree = RS.tree:Clone()
	spawnTree.Name = i
	spawnTree:SetPrimaryPartCFrame(CFrame.new(field.Position.X + math.random(-field.Size.X/2,field.Size.X/2), 
		field.Position.Y + spawnTree.PrimaryPart.Size.Y/2, field.Position.Z + math.random(-field.Size.Z/2,field.Size.Z/2)))
	spawnTree.Parent = game.Workspace.forest
end
wait(1)
local forest = game.Workspace.forest:GetChildren()
while true do 
	wait(3)
	local pickTree = forest[math.random(1,#forest)]
	print(pickTree.Name)
	for k,v in pairs(pickTree:GetChildren()) do
		if v.Name == "leaf" then
			v.BrickColor = BrickColor.new("Rust")
		end
	end
	pickTree.Trunk.Fire.Enabled = true
end