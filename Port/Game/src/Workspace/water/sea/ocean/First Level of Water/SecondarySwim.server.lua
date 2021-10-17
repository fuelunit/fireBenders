local lolo=game:service("RunService");
local sealevel=0



function Jump(character)
local B=character.LowerTorso.Floater
if character.LowerTorso.Position.y<sealevel then
local v=Instance.new("BodyVelocity")
v.Parent=character.LowerTorso
v.velocity=Vector3.new(0,50,0)
v.maxForce=Vector3.new(0,100000000,0)
wait(.4)
v:remove()
end
end




while true do
sealevel=script.Parent.Position.y
for i,v in pairs(game.Players:GetChildren()) do
if v.Character~=nil and v.Character:FindFirstChild("LowerTorso")~=nil then
local LowerTorso=v.Character.LowerTorso
if LowerTorso:FindFirstChild("Smoke")==nil then
local s=Instance.new("Smoke")
s.Parent=LowerTorso
s.Color=Color3.new(0,0.4,0.6)
s.Opacity=0
s.RiseVelocity=0
s.Size=0.5
end
if LowerTorso:FindFirstChild("Floater")==nil then
local B=Instance.new("BodyPosition")
B.Parent=LowerTorso
B.position=Vector3.new(0,0,0)
B.maxForce=Vector3.new(0,0,0)
B.P=400
B.D=200
B.Name="Floater"
v.Character.Humanoid.Changed:connect(function(val) if val=="Jump" and v.Character.Humanoid.Jump==true then Jump(v.Character) v.Character.Humanoid.Jump=false  end  end)
end
local ypos=LowerTorso.Position.y
local B=LowerTorso.Floater
if ypos<sealevel then
LowerTorso.Smoke.Opacity=0.2
B.position=Vector3.new(0,sealevel-1,0)
B.maxForce=Vector3.new(0,100000,0)
v.Character.Humanoid.WalkSpeed=8
v.Character.Humanoid.Health=v.Character.Humanoid.Health-0
else
LowerTorso.Smoke.Opacity=0
local B=LowerTorso.Floater
B.maxForce=Vector3.new(0,0,0)
v.Character.Humanoid.WalkSpeed=14
end
end
end
wait(.2)
end


