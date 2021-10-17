--Function
local DifNPC = true
local StationaryNPC = game.workspace.ScriptAttachedObjects.NPCS.NPC_2.Button.Red.Position
local debounce = true
local debounce2 = true
local Players = game:GetService("Players")
local PlayerModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")) --v*2 are variables for playercontrol
local Control = PlayerModule:GetControls()
local list = {"I told you to stay out of the basement"} 
local NPCname = ("Jack")
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(key)
if key.KeyCode == Enum.KeyCode.E then
	if debounce == true then
		debounce = false

		for i, player in pairs(Players:GetPlayers()) do
		--print (player.Name)
				
				local playerlocation = workspace[player.Name].HumanoidRootPart.Position 
				local NPC = (StationaryNPC - playerlocation).magnitude
				local speechgui = game.Players[player.Name].PlayerGui.SpeechUI
					--print("E key was pressed")
					if NPC < 5 and debounce2 == true then
						game.Players[player.Name].PlayerScripts["Background Ambiance"].BackGroundSound_2.Playing = false
						debounce2 = false
						Control:Disable()
						speechgui.Enabled = true
						speechgui.message.letter.Text = NPCname
						script.AmbianceTalking.Playing = true
							for i = 1, #list do
								local x = list[i]
								script.SoundButton:Play()
								for y = 1, #x do
									speechgui.message.center.title.Text = (string.sub(x,0,y))	
									wait(.05)
								end
							wait(2)
								if x ~= speechgui.message.center.title.Text then
									speechgui.message.center.title.Text = ("Talking To Multiple people, [Error]")
									wait(4)
									break
								end
								--print(x)
							end
						game.Players[player.Name].PlayerScripts["Background Ambiance"].BackGroundSound_2.Playing = true
						Control:Enable()
						speechgui.Enabled = false
						script.AmbianceTalking.Playing = false
						script.AmbianceTalking.TimePosition = 0
						wait(10)
						debounce2 = true
					
					else
						--print("To far away")
					end
					wait(1)
				debounce = true
				end
	end
end
end)
	
	--Do something for random keybinds


--game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = true