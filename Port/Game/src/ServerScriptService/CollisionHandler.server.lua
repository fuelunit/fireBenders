local PhysicsService = game:getService("PhysicsService")
local players = game:GetService("Players")

local defaultGroup = PhysicsService:GetCollisionGroupName(0)
local playerGroup = "PlayerGroup"
local modelGroup = "ModelGroup"

PhysicsService:CreateCollisionGroup(playerGroup)
PhysicsService:CreateCollisionGroup(modelGroup)

function NoCollide(model)
	for k,v in pairs(model:GetChildren()) do
		if v:IsA "BasePart" or v:IsA "MeshPart" then
			PhysicsService:SetPartCollisionGroup(v,"ModelGroup")
		end
	end
end

PhysicsService:CollisionGroupSetCollidable(playerGroup, modelGroup, false);
PhysicsService:CollisionGroupSetCollidable(playerGroup, playerGroup, false);
PhysicsService:CollisionGroupSetCollidable(modelGroup, modelGroup, false);
PhysicsService:CollisionGroupSetCollidable(playerGroup, defaultGroup, true);
PhysicsService:CollisionGroupSetCollidable(modelGroup, defaultGroup, true);

game:GetService("Workspace").Forest.ChildAdded:Connect(function(child)
	NoCollide(child)
end)