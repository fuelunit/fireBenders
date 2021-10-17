local TweenService = game:GetService("TweenService")
local gui = script.Parent
local CurrentCamera = game.Workspace.CurrentCamera
local Campart = game.Workspace.NPCS.Dummy6.CamPart
local chatline = script.Parent.Frame1.ChatLine
local talksound = script.Parent.TalkSound
local accept1 = script.Parent.Frame1.Accept1
local cancel1 = script.Parent.Frame1.Cancel1
local frame1 = script.Parent.Frame1
local frame2 = script.Parent.Frame2
local e = game.Workspace.NPCS.Dummy6.Torso.ProximityPrompt

e.Triggered:Connect(function()
	chatline.Text = " "
	gui.Enabled = true
	frame1.Visible = true
	accept1.Visible = false
	accept1.Active = false
CurrentCamera.CameraType = Enum.CameraType.Scriptable
local TI = TweenInfo.new(1.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut, 0)
local Goal = {CFrame = Campart.CFrame}
local Animation = TweenService:Create(CurrentCamera, TI, Goal)
e.MaxActivationDistance = 0
Animation:Play()
script.Parent.Frame1:TweenPosition(UDim2.new(0, 0,0.8, 0),"Out", "Linear", 1.5)
wait(1.6)
talksound:Play()
	local text = "Welcome to my shop dearest customer!"
	for i = 1, #text do
		chatline.Text = string.sub(text, 1, i)
		wait(0.03)
	end
talksound:Stop()
accept1.Active = true
accept1.Visible = true
	end)

accept1.MouseButton1Click:Connect(function()
	accept1.Active = false
	accept1.Visible = false
	frame2.Visible = true
	frame1:TweenPosition(UDim2.new(0, 0,1.5, 0),"Out", "Linear", 1)
	wait(.5)
	frame2:TweenPosition(UDim2.new(0.25, 0,0.25, 0), "Out", "Linear", 1)
end)

cancel1.MouseButton1Click:Connect(function()
	wait(0.1)
	talksound:Stop()
	frame1:TweenPosition(UDim2.new(0, 0,2, 0))
	wait(0.1)
	CurrentCamera.CameraType = Enum.CameraType.Follow
	accept1.Active = false
	accept1.Visible = false
	e.MaxActivationDistance = 10
	chatline.Text = " "
end)

frame2.Close.MouseButton1Click:Connect(function()
	frame2:TweenPosition(UDim2.new(0.25, 0,-1.5, 0), "Out", "Linear", 1)
	wait(0.1)
	CurrentCamera.CameraType = Enum.CameraType.Follow
	accept1.Active = false
	accept1.Visible = false
	e.MaxActivationDistance = 10
	chatline.Text = " "
end)












