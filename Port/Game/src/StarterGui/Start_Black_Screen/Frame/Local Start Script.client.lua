script.Parent.Parent.Enabled = true
wait(1)

local Players = game:GetService("Players")
local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
local Controls = PlayerModule:GetControls()
wait(2)
for i, player in pairs(Players:GetPlayers()) do
	x = string[Players.Name]
	print(x)
	y = string[Players.Name]
	print(y)
	
	local list = {"     ","Hackathon - 2021 WildFire Game"} 
	local blackscreen = game.Players[player.Name].PlayerGui.Start_Black_Screen.Frame.Text1
						Controls:Disable()
					local startsound = game.Players[player.Name].PlayerScripts["Background Ambiance"]
						for i = 1, #list do
							local x = list[i]
							for y = 1, #x do
								blackscreen.Text = (string.sub(x,0,y))	
								wait(.03)
						end
							wait(2)
						end
						--script.Sound.Playing = true
						wait(3)
						Controls:Enable()
						--startsound.BackGroundSound.Playing = true
						startsound.BackGroundSound_2.Playing = true
						script.Parent.Parent.Enabled = false
						
				end
wait(2)			
script.Parent.Parent.Enabled = false
script.Sound.Playing = false



			
	
	--Do something for random keybinds


--game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = true