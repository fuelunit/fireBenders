game.Players.PlayerAdded:Connect(function(plr)
	local ls = Instance.new("Folder")
	ls.Name = "leaderstats"
	ls.Parent = plr

	local w = Instance.new("IntValue")
	w.Name = "Water"
	w.Value = 10
	w.Parent = ls
	
	local ts = Instance.new("IntValue")
	ts.Name = "TreesSaved"
	ts.Value = 0
	ts.Parent = ls
end)