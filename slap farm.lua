if not game:IsLoaded() then
    game.Loaded:Wait()
end
repeat task.wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
	if v.Glove:FindFirstChild("TouchInterest") then
		if not game.Players.LocalPlayer.Character:FindFirstChild("entered") then
    			repeat task.wait()
        		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport2, 0)
			firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport2, 1)
   			until game.Players.LocalPlayer.Character:FindFirstChild("entered")
		end
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
	end
end
local serverList = {}
for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
	if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
		serverList[#serverList + 1] = v.id
	end
end
if #serverList > 0 then
  task.wait(3.5)
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1, #serverList)])
else
    error("No servers found")
end
