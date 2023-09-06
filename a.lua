if not game:IsLoaded() then
	game.Loaded:Wait()
end

game:GetService("GuiService"):ClearError()

local game_name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Slap Battles Script"

if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 then

	getgenv().settings = {
		-- Main:
		AutoFarmSlapple = false,
		AutoFarmCandy = false,
		AutoSlapBaller = false, 
		AutoSlapReplica = false,
		-- Antis:
		AntiAdmin = false,
		AntiKick = false,
		AntiRagdoll = false,
		AntiDB = false,
		AntiBrazil = false,
		AntiTimestop = false,
		AntiSquid = false,
		AntiBrick = false,
		AntiZaHando = false,
		AntiReaper = false,
		AntiPusher = false,
		AntiBooster = false,
		AntiMail = false,
		AntiRock = false,
		AntiBarrier = false, 
		AntiBubble = false,
		--Combat
		SlapAura = false,
		SlapFarm = false,
		SlapFarmCooldown = 0.25,
		GloveExtend = false,
		ExtendOption = "Meat Stick",
		AutoClick = false,
		AbilitySpam = false,
		HomeRunMax = false,
		PopBalloony = false,
		RhythmExplosion = false,
		NullMinions = false,
		SlapMinions = false,
		RojoSpam = false,
		RojoPlayer = nil,
		RetroSpam = false,
		RetroOption = "Ban Hammer",
		--Misc
		SlicerSpam = false,
		ChargeSpam = false,
		ErrorSpam = false,
		ErrorDeathSpam = false,
		HitmanSpam = false,
		ThanosSpam = false,
		SpaceSpam = false,
		GhostSpam = false,
		GoldenSpam = false,
		AutoTycoon = false,
		DestroyTycoon = false
	}
	-- Bypass
	local bypass;
	bypass = hookmetamethod(game, "__namecall", function(method, ...) 
		if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
			return
		elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
			return
		elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
			return
		end
		return bypass(method, ...)
	end)

	-- Variables
	local Player = game.Players.LocalPlayer.Character.Name
	local Gloves = loadstring(game:HttpGet("https://raw.githubusercontent.com/lucasr125/sb/main/GlovesSB"))()

	local function getGlove()
		return game.Players.LocalPlayer.leaderstats.Glove.Value
	end
	local function getTool()
		local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") or game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):FindFirstChildOfClass("Tool")
		if tool ~= nil and tool:FindFirstChild("Glove") ~= nil then
			return tool
		end
	end

	-- Anti Voids
	local SafeSpot = Instance.new("Part", workspace)
	SafeSpot.Position = Vector3.new(-1500,100,-1500)
	SafeSpot.Name = "Spot"
	SafeSpot.Size = Vector3.new(100,1,100)
	SafeSpot.Anchored = true
	SafeSpot.Transparency = .7

	local AntiVoid = Instance.new("Part", workspace)
	AntiVoid.Name = "AntiVoid"
	AntiVoid.Size = Vector3.new(2047, 0.009, 2019)
	AntiVoid.Position = Vector3.new(-80.5, -10.005, -246.5)
	AntiVoid.CanCollide = false
	AntiVoid.Anchored = true
	AntiVoid.Transparency = 1

	local arenaVoid = Instance.new("Part", workspace)
	arenaVoid.Name = "arenaVoid"
	arenaVoid.Size = Vector3.new(798, 1, 1290)
	arenaVoid.Position = Vector3.new(3450, 59.009, 68)
	arenaVoid.CanCollide = false
	arenaVoid.Anchored = true
	arenaVoid.Transparency = 1

	local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/lucasr125/bracket-lib-v3.3/main/bracketv3.3.lua"))()
	Bracket:Notification({Title = "Loading",Description = game_name,Duration = 10})
	local Window = Bracket:Window({Name = game_name,Enabled = true,Color = Color3.new(1, 0.4, 0.4),Size = UDim2.new(0,296,0,296),Position = UDim2.new(0.5,-248,0.5,-248)}) do
		local HomeTab = Window:Tab({Name = "Home"}) do
			local HomeSection = HomeTab:Section({Name = "Automatics",Side = "Left"}) do
				local AutoFarmSlapple = HomeSection:Toggle({Name = "AutoFarm Slapples",Flag = "AutoFarmSlapple",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AutoFarmSlapple = Toggle_Bool
					while getgenv().settings.AutoFarmSlapple do
						spawn(function()
							for i, v in pairs(game:GetService("Workspace").Arena.island5.Slapples:GetDescendants()) do
								if v:IsA("TouchTransmitter") then
									firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 0)
									firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 1)
								end
							end
						end)
						task.wait()
					end
				end})
				local AutoFarmCandy = HomeSection:Toggle({Name = "AutoFarm Candy",Flag = "AutoFarmCandy",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AutoFarmCandy = Toggle_Bool
					while getgenv().settings.AutoFarmCandy do
						spawn(function()
							for i, v in pairs(game:GetService("Workspace").CandyCorns:GetDescendants()) do
								if v.Name == ("TouchInterest") and v.Parent then
									firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 1)
								end
							end
						end)
						task.wait()
					end
				end})
				local AutoSlapBaller = HomeSection:Toggle({Name = "AutoSlap Baller",Flag = "AutoSlapBaller",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AutoSlapBaller = Toggle_Bool
					while getgenv().settings.AutoSlapBaller do
						task.wait()
						for _, v in ipairs(workspace:GetChildren()) do
							if string.sub(v.Name, 3, 8) == "Baller" then
								game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:WaitForChild("HumanoidRootPart"))
							end
						end
					end
				end})
				local AutoSlapReplica = HomeSection:Toggle({Name = "AutoSlap Replica",Flag = "AutoSlapReplica",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AutoSlapReplica = Toggle_Bool
					while getgenv().settings.AutoSlapReplica do
						task.wait()
						for _, replica in pairs(workspace:GetChildren()) do
							if string.find(replica.Name, "Å") then
								game:GetService("ReplicatedStorage").b:FireServer(replica:WaitForChild("HumanoidRootPart"))
							end
						end
					end
				end})
			end
			local OthersSection = HomeTab:Section({Name = "Others",Side = "Right"}) do

				local Animations = OthersSection:Button({Name = "Free Emotes (Type /e emotename) ( credits: guy that exists )",Side = "Left",Callback = function() 
					Floss = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Floss, game.Players.LocalPlayer.Character.Humanoid)
					Groove = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Groove, game.Players.LocalPlayer.Character.Humanoid)
					Headless = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Headless, game.Players.LocalPlayer.Character.Humanoid)
					Helicopter = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Helicopter, game.Players.LocalPlayer.Character.Humanoid)
					Kick = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Kick, game.Players.LocalPlayer.Character.Humanoid)
					L = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.L, game.Players.LocalPlayer.Character.Humanoid)
					Laugh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Laugh, game.Players.LocalPlayer.Character.Humanoid)
					Parker = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Parker, game.Players.LocalPlayer.Character.Humanoid)
					Spasm = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Spasm, game.Players.LocalPlayer.Character.Humanoid)
					Thriller = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Thriller, game.Players.LocalPlayer.Character.Humanoid)
					game.Players.LocalPlayer.Chatted:Connect(function(msg)
						if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
							Floss = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Floss, game.Players.LocalPlayer.Character.Humanoid)
							Groove = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Groove, game.Players.LocalPlayer.Character.Humanoid)
							Headless = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Headless, game.Players.LocalPlayer.Character.Humanoid)
							Helicopter = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Helicopter, game.Players.LocalPlayer.Character.Humanoid)
							Kick = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Kick, game.Players.LocalPlayer.Character.Humanoid)
							L = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.L, game.Players.LocalPlayer.Character.Humanoid)
							Laugh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Laugh, game.Players.LocalPlayer.Character.Humanoid)
							Parker = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Parker, game.Players.LocalPlayer.Character.Humanoid)
							Spasm = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Spasm, game.Players.LocalPlayer.Character.Humanoid)
							Thriller = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Thriller, game.Players.LocalPlayer.Character.Humanoid)
							if string.lower(msg) == "/e Floss" or string.lower(msg) == "/e floss" then
								Floss:Play()
							elseif string.lower(msg) == "/e Groove" or string.lower(msg) == "/e groove" then
								Groove:Play()
							elseif string.lower(msg) == "/e Headless" or string.lower(msg) == "/e headless" then
								Headless:Play()
							elseif string.lower(msg) == "/e Helicopter" or string.lower(msg) == "/e helicopter" then
								Helicopter:Play()
							elseif string.lower(msg) == "/e Kick" or string.lower(msg) == "/e kick" then
								Kick:Play()
							elseif string.lower(msg) == "/e L" or string.lower(msg) == "/e l" then
								L:Play()
							elseif string.lower(msg) == "/e Laugh" or string.lower(msg) == "/e laugh" then
								Laugh:Play()
							elseif string.lower(msg) == "/e Parker" or string.lower(msg) == "/e parker" then
								Parker:Play()
							elseif string.lower(msg) == "/e Spasm" or string.lower(msg) == "/e spasm" then
								Spasm:Play()
							elseif string.lower(msg) == "/e Thriller" or string.lower(msg) == "/e thriller" then
								Thriller:Play()
							end
							EP = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						end
					end)
					game:GetService("RunService").Heartbeat:Connect(function()
						if EP ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Floss.IsPlaying or Groove.IsPlaying or Headless.IsPlaying or Helicopter.IsPlaying or Kick.IsPlaying or L.IsPlaying or Laugh.IsPlaying or Parker.IsPlaying or Spasm.IsPlaying or Thriller.IsPlaying then
							Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - EP).Magnitude
							if Magnitude > 1 then
								Floss:Stop(); Groove:Stop(); Headless:Stop(); Helicopter:Stop(); Kick:Stop(); L:Stop(); Laugh:Stop(); Parker:Stop(); Spasm:Stop(); Thriller:Stop()
							end
						end
					end)
				end})
				local Rejoin = OthersSection:Button({Name = "Rejoin",Side = "Left",Callback = function() 
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
				end})
				local InfYield = OthersSection:Button({Name = "Infinite Yield",Side = "Left",Callback = function() 
					loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
				end})
				local SimpleSpy = OthersSection:Button({Name = "Simple Spy",Side = "Left",Callback = function() 
					loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua", true))()
				end})
			end
		end
		local AntiTab = Window:Tab({Name = "Antis"}) do
			local AntiSection = AntiTab:Section({Name = "Anti",Side = "Left"}) do
				local AntiAdmin = AntiSection:Toggle({Name = "Anti Admin",Flag = "AntiAdmin",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiAdmin = Toggle_Bool
					if getgenv().settings.AntiAdmin == true then
						game.Players.PlayerAdded:Connect(function(Plr)
							if Plr:GetRankInGroup(9950771) and 2 <= Plr:GetRankInGroup(9950771) and getgenv().settings.AntiAdmin then
								game.Players.LocalPlayer:Kick("Admin / High Rank Player Detected")
							end
						end)
					end
				end})

				local AntiKick = AntiSection:Toggle({Name = "Anti Kick",Flag = "AntiKick",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiKick = Toggle_Bool
					while getgenv().settings.AntiKick do
						for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
							if v.Name == "ErrorPrompt" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
							end
						end
						task.wait()
					end
				end})

				local AntiRagdoll = AntiSection:Toggle({Name = "Anti Ragdoll",Flag = "AntiRagdoll",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiRagdoll = Toggle_Bool
					if getgenv().settings.AntiRagdoll then
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
						game.Players.LocalPlayer.CharacterAdded:Connect(function()
							game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
								if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
									repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
									until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
									game.Players.LocalPlayer.Character.Torso.Anchored = false
								end
							end)
						end)
					end
				end})

				local AntiVoid = AntiSection:Toggle({Name = "Anti Void",Flag = "AntiVoid",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					game.Workspace.dedBarrier.CanCollide = Toggle_Bool
					game.Workspace.arenaVoid.CanCollide = Toggle_Bool
				end})

				local AntiDB = AntiSection:Toggle({Name = "Anti Death Barrier",Flag = "AntiDB",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiDB = Toggle_Bool

					if getgenv().settings.AntiDB == true then
						for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
							if v.ClassName == "Part" and v.Name == "BLOCK" then
								v.CanTouch = false
							end
						end
						workspace.DEATHBARRIER.CanTouch = false
						workspace.DEATHBARRIER2.CanTouch = false
						workspace.dedBarrier.CanTouch = false
						workspace.ArenaBarrier.CanTouch = false
						workspace.AntiDefaultArena.CanTouch = false
					else
						for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
							if v.ClassName == "Part" and v.Name == "BLOCK" then
								v.CanTouch = true
							end
						end
						workspace.DEATHBARRIER.CanTouch = true
						workspace.DEATHBARRIER2.CanTouch = true
						workspace.dedBarrier.CanTouch = true
						workspace.ArenaBarrier.CanTouch = true
						workspace.AntiDefaultArena.CanTouch = true
					end
				end})

				local AntiBrazil = AntiSection:Toggle({Name = "Anti Brazil",Flag = "AntiBrazil",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiBrazil = Toggle_Bool

					if getgenv().settings.AntiBrazil == true then
						for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
							if v.ClassName == "Part" then
								v.CanTouch = false
							end
						end
					else
						for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
							if v.ClassName == "Part" then
								v.CanTouch = true
							end
						end
					end
				end})

				local AntiCOD = AntiSection:Toggle({Name = "Anti Cube Of Death",Flag = "AntiCOD",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					if Toggle_Bool == true then
						workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
					else
						workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
					end
				end})

				local AntiTS = AntiSection:Toggle({Name = "Anti Timestop ( credits: guy that exists )",Flag = "AntiTS",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiTimestop = Toggle_Bool
					while getgenv().settings.AntiTimestop do
						for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v.ClassName == "Part" then
								v.Anchored = false
							end
						end
						task.wait()
					end
				end})

				local AntiSquid = AntiSection:Toggle({Name = "Anti Squid",Flag = "AntiSquid",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiSquid = Toggle_Bool

					if getgenv().settings.AntiSquid == false then
						game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
					end

					while getgenv().settings.AntiSquid do
						if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
							game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
						end
						task.wait()
					end
				end})

				local AntiHallowJack = AntiSection:Toggle({Name = "Anti Hallow Jack",Flag = "AntiHallowJack",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Toggle_Bool
				end})

				local AntiConveyor = AntiSection:Toggle({Name = "Anti Conveyor",Flag = "AntiConveyor",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Toggle_Bool
				end})

				local AntiBrick = AntiSection:Toggle({Name = "Anti Brick",Flag = "AntiBrick",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiBrick = Toggle_Bool
					while getgenv().settings.AntiBrick do
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v.Name == "Union" then
								v.CanTouch = false
							end
						end
						task.wait()
					end
				end})

				local AntiREDACTED = AntiSection:Toggle({Name = "Anti [ REDACTED ]",Flag = "AntiREDACTED",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					game.Players.LocalPlayer.PlayerScripts.Well.Disabled = Toggle_Bool
				end})

				local AntiZaHando = AntiSection:Toggle({Name = "Anti Za Hando",Flag = "AntiZaHando",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiZaHando = Toggle_Bool
					while getgenv().settings.AntiZaHando do
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v.ClassName == "Part" and v.Name == "Part" then
								v:Destroy()
							end
						end
						task.wait()
					end
				end})

				local AntiReaper = AntiSection:Toggle({Name = "Anti Reaper",Flag = "AntiReaper",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiReaper = Toggle_Bool
					while getgenv().settings.AntiReaper do
						for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
							if v.Name == "DeathMark" then
								game:GetService("ReplicatedStorage").ReaperGone:FireServer(game.Players.LocalPlayer.Character.DeathMark)
								game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
							end
						end
						task.wait()
					end
				end})

				local AntiPusher = AntiSection:Toggle({Name = "Anti Pusher",Flag = "AntiPusher",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiPusher = Toggle_Bool
					while getgenv().settings.AntiPusher do
						for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
							if v.Name == "wall" then
								v.CanCollide = false
							end
						end
						task.wait()
					end
				end})

				local AntiBooster = AntiSection:Toggle({Name = "Anti Booster",Flag = "AntiBooster",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiBooster = Toggle_Bool
					while getgenv().settings.AntiBooster do
						for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
							if v.Name == "BoosterObject" then
								v:Destroy()
							end
						end
						task.wait()
					end
				end})

				local AntiMail = AntiSection:Toggle({Name = "Anti Mail",Flag = "AntiMail",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiMail = Toggle_Bool
					game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = Toggle_Bool
					while getgenv().settings.AntiMail do
						if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
							game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
						end
						task.wait()
					end
				end})

				local AntiStun = AntiSection:Toggle({Name = "Anti Stun",Flag = "AntiStun",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiStun = Toggle_Bool
					while getgenv().settings.AntiStun do
						if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Workspace:FindFirstChild("Shockwave") then
							game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
						end
						task.wait()
					end
				end})

				local AntiRock = AntiSection:Toggle({Name = "Anti Rock",Flag = "AntiRock",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiRock = Toggle_Bool
					while getgenv().settings.AntiRock do
						for i,v in pairs(game.Workspace:GetDescendants()) do
							if v.Name == "rock" then
								v.CanTouch = false
								v.CanQuery = false
							end
						end
						task.wait()
					end
				end})

				local AntiBarrier = AntiSection:Toggle({Name = "Anti Barrier",Flag = "AntiBarrier",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiBarrier = Toggle_Bool
					if getgenv().settings.AntiBarrier == false then
						for i,v in pairs(game.Workspace:GetChildren()) do
							if string.find(v.Name, "ÅBarrier") then
								v.CanCollide = true
							end
						end
					end

					while getgenv().settings.AntiBarrier do
						for i,v in pairs(game.Workspace:GetChildren()) do
							if string.find(v.Name, "ÅBarrier") then
								v.CanCollide = false
							end
						end
						task.wait()
					end
				end})

				local AntiBubble = AntiSection:Toggle({Name = "Anti Bubble",Flag = "AntiBubble",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.AntiBubble = Toggle_Bool
					if getgenv().settings.AntiBubble == true then
						while getgenv().settings.AntiBubble do
							task.wait()
							for i,v in pairs(workspace:GetChildren()) do
								if v.Name == "BubbleObject" then
									if v:FindFirstChild("Weld") then
										v:FindFirstChild("Weld"):Destroy()
									end
								end
							end
						end
					end
				end})
			end
		end
		local CombatTab = Window:Tab({Name = "Combat"}) do
			local GloveSection = CombatTab:Section({Name = "Glove",Side = "Left"}) do
				local SlapAura = GloveSection:Toggle({Name = "Slap Aura",Flag = "SlapAura",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.SlapAura = Toggle_Bool
					while getgenv().settings.SlapAura do
						for i,v in pairs(game.Players:GetChildren()) do
							if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
								if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") then
									if v.Character.Head:FindFirstChild("UnoReverseCard") == nil or game.Players.LocalPlayer.leaderstats.Glove == "Error" then
										Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
										if 25 >= Magnitude then
											shared.gloveHits[getGlove()]:FireServer(v.Character:WaitForChild("Head"),true)
										end
									end
								end
							end
						end
						task.wait()
					end
				end})

				local GodMode = GloveSection:Button({Name = "God Mode ( resets character ) ( breaks ks & reaper )",Side = "Left",Callback = function() 
					if game.Players.LocalPlayer.Character.isInArena.Value == false then
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
						wait(0.5)
						for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v.ClassName == "Tool" then
								v.Parent = game.LogService
							end
						end
						game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(game.Players.LocalPlayer.Character,false)
						wait(4)
						for i,v in pairs(game.LogService:GetChildren()) do
							if v.ClassName == "Tool" then
								v.Parent = game.Players.LocalPlayer.Character
							end
						end
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v.ClassName == "Tool" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
							end
						end 
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Origo.CFrame
					elseif game.Players.LocalPlayer.Character.isInArena.Value == true then
						for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if v.ClassName == "Tool" then
								v.Parent = game.LogService
							end
						end
						game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(game.Players.LocalPlayer.Character,false)
						wait(4)
						for i,v in pairs(game.LogService:GetChildren()) do
							if v.ClassName == "Tool" then
								v.Parent = game.Players.LocalPlayer.Character
							end
						end
						game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if v.ClassName == "Tool" then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
							end
						end 
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Origo.CFrame
					end
				end})

				local SlapFarmCooldown = GloveSection:Slider({Name = "Slap Farm Cooldown",Flag = "SlapFarmCooldown",Side = "Left",Min = 0,Max = 2,Value = 0.25,Precise = 2,Unit = "",Callback = function(Value_Number) 
					getgenv().settings.SlapFarmCooldown = Value_Number
				end})

				local SlapFarm = GloveSection:Toggle({Name = "Slap Farm",Flag = "SlapFarm",Side = "Left",Value = false,Callback = function(Toggle_Bool) 
					getgenv().settings.SlapFarm = Toggle_Bool
					if getgenv().settings.SlapFarm == true then
						workspace.DEATHBARRIER.CanTouch = false
						workspace.DEATHBARRIER2.CanTouch = false
						workspace.dedBarrier.CanTouch = false
						task.wait()
						while getgenv().settings.SlapFarm do
							task.wait()
							pcall(function()
								for Index, Human in next, game.Players:GetPlayers() do
									if Human ~= game.Players.LocalPlayer and Human.Character and not Human.Character:FindFirstChild("isParticipating") and Human.Character:FindFirstChild("Torso") and Human.Character:FindFirstChild("Head") and Human.Character:FindFirstChild("entered") and Human.Character.Head:FindFirstChild("UnoReverseCard") == nil and Human.Character:FindFirstChild("rock") == nil and Human.Character.Ragdolled.Value == false then
										if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
											task.wait(getgenv().settings.SlapFarmCooldown)
											game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = Human.Character:FindFirstChild("Right Leg").CFrame * CFrame.new(6,-2,6)
											game.Players.LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = true
											wait(getgenv().settings.SlapFarmCooldown)
											shared.gloveHits[getGlove()]:FireServer(Human.Character:FindFirstChild("Torso"))
											wait(getgenv().settings.SlapFarmCooldown)
										end
									end
								end
							end)
						end
					else
						workspace.DEATHBARRIER.CanTouch = true
						workspace.DEATHBARRIER2.CanTouch = true
						workspace.dedBarrier.CanTouch = true
						if game.Players.LocalPlayer.Character.Humanoid.PlatformStand == true then
							task.wait(3)
							game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
						end
					end
				end})
				local GloveExtender = GloveSection:Toggle({Name = "Glove Extender",Flag = "GloveExtender",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.GloveExtend = Toggle_Bool
				end})
				local ExtenderType = GloveSection:Dropdown({Name = "Extender Option",Flag = "ExtenderType",Side = "Left",List = {
					{
						Name = "Meat Stick",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.ExtendOption = "Meat Stick"
						end
					},
					{
						Name = "Pancake",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.ExtendOption = "Pancake"
						end
					},
					{
						Name = "Growth",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.ExtendOption = "Growth"
						end
					},
					{
						Name = "North Korea Wall",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.ExtendOption = "North Korea Wall"
						end
					},
					{
						Name = "Slight Extend",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.ExtendOption = "Slight Extend"
						end
					}
				}})

				local EquipGlove = GloveSection:Textbox({Name = "Equip Glove",Flag = "EquipGlove",Side = "Left",Value = "Default",Placeholder = "Enter glove name here",NumberOnly = false,Callback = function(Text_String,EnterPressed) 
					if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
						fireclickdetector(workspace.Lobby[Text_String].ClickDetector)
					end
				end})

				local MakeGloveBlock = GloveSection:Button({Name = "Turn glove into a block",Side = "Left",Callback = function() 
					for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							local glove = v.Glove

							if glove:IsA("MeshPart") then
								glove.MeshId = ""
							elseif glove:FindFirstChild("Mesh") or glove:FindFirstChild("Cuff") then
								local mesh = glove:FindFirstChild("Mesh")
								local cuff = glove:FindFirstChild("Cuff")

								if mesh then
									mesh:Destroy()
								end

								if cuff then
									local cuffMesh = cuff:FindFirstChild("Mesh")
									if cuffMesh then
										cuffMesh:Destroy()
									end
								end
							end
						end
					end

				end})

			end

			local AbilitySection = CombatTab:Section({Name = "Ability Spam",Side = "Right"}) do
				local AbilitySpam = AbilitySection:Toggle({Name = "Glove Ability Spam",Flag = "AbilitySpam",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.AbilitySpam = Toggle_Bool
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Gravity" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" do
						game:GetService("ReplicatedStorage").CloudAbility:FireServer()
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Whirlwind" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Phantom" do
						local Phantom = workspace[Player].Phantom
						game:GetService("ReplicatedStorage").PhantomDash:InvokeServer(Phantom)
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" do
						game:GetService("ReplicatedStorage").Duplicate:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" do
						game:GetService("ReplicatedStorage").Fortlol:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Home Run" do
						game:GetService("ReplicatedStorage").HomeRun:FireServer({["start"] = true})
						game:GetService("ReplicatedStorage").HomeRun:FireServer({["finished"] = true})
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "🗿" do
						game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(CFrame.new(math.random(-70, 63), -5.72293854, math.random(-90, 93), 0.151493087, -8.89114702e-08, 0.988458335, 1.45089563e-09, 1, 8.97272727e-08, -0.988458335, -1.21589121e-08, 0.151493087))
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shukuchi" do
						local LocalPlayer = game.Players.LocalPlayer
						local players = game.Players:GetChildren()
						local RandomPlayer = players[math.random(1, #players)]
						repeat RandomPlayer = players[math.random(1, #players)] until RandomPlayer ~= LocalPlayer
						repeat RandomPlayer = players[math.random(1, #players)] until RandomPlayer.Character.isInArena.Value == true
						PersonToKill = RandomPlayer
						game:GetService("ReplicatedStorage").SM:FireServer(PersonToKill)
						wait(0.01)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Slicer" do
						game:GetService("ReplicatedStorage").Slicer:FireServer("sword")
						game:GetService("ReplicatedStorage").Slicer:FireServer("slash", game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, Vector3.new())
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Quake" do
						game:GetService("ReplicatedStorage").QuakeQuake:FireServer({["start"] = true})
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "rob" do
						game:GetService("ReplicatedStorage"):WaitForChild("rob"):FireServer()
						wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Kraken" do
						game:GetService("ReplicatedStorage").KrakenArm:FireServer()
						wait(5)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Psycho" do
						game:GetService("ReplicatedStorage").Psychokinesis:InvokeServer({["grabEnabled"] = true})
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Killstreak" and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Kills") and game.Players.LocalPlayer.PlayerGui.Kills.Frame.TextLabel.Text >= "75" do
						game:GetService("ReplicatedStorage").KSABILI:FireServer()
						wait(6.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bus" do
						game:GetService("ReplicatedStorage").busmoment:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Mitten" do
						game:GetService("ReplicatedStorage").MittenA:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" do
						game:GetService("ReplicatedStorage").Fortlol:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Defense" do
						game:GetService("ReplicatedStorage").Barrier:FireServer()
						wait(0.25)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bomb" do
						game:GetService("ReplicatedStorage").BombThrow:FireServer()
						wait(2.5)
						game:GetService("ReplicatedStorage").BombThrow:FireServer()
						wait(4.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" do
						game:GetService("ReplicatedStorage").Duplicate:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Pusher" do
						game:GetService("ReplicatedStorage").PusherWall:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Jet" do
						local LocalPlayer = game.Players.LocalPlayer
						local players = game.Players:GetChildren()
						local closestPlayer = nil
						local closestDistance = math.huge
						for _, player in ipairs(players) do
							if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local playerPosition = player.Character.HumanoidRootPart.Position
								local distance = (playerPosition - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
								if distance < closestDistance then
									closestPlayer = player
									closestDistance = distance
								end
							end
						end
						if closestPlayer then
							game:GetService("ReplicatedStorage").AirStrike:FireServer(closestPlayer.Character)
							wait(5.3)
						end
					end
					while game.Players.LocalPlayer.leaderstats.Glove.Value == "Tableflip" or game.Players.LocalPlayer.leaderstats.Glove.Value == "Shield" and getgenv().settings.AbilitySpam do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Rocky" do
						game:GetService("ReplicatedStorage").RockyShoot:FireServer()
						wait(6.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "God's Hand" do
						game:GetService("ReplicatedStorage").TimestopJump:FireServer()
						game:GetService("ReplicatedStorage").Timestopchoir:FireServer()
						game:GetService("ReplicatedStorage").Timestop:FireServer()
						wait(50.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Za Hando" do
						game:GetService("ReplicatedStorage").Erase:FireServer()
						wait(5.1)
					end
					while game.Players.LocalPlayer.leaderstats.Glove.Value == "Baller" or game.Players.LocalPlayer.leaderstats.Glove.Value == "Glitch" and getgenv().settings.AbilitySpam do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						wait(4.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Stun" do
						game:GetService("ReplicatedStorage").StunR:FireServer(game:GetService("Players").LocalPlayer.Character.Stun)
						wait(10.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "STOP" do
						game:GetService("ReplicatedStorage").STOP:FireServer(true)
						wait(4.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Track" do
						local LocalPlayer = game.Players.LocalPlayer
						local players = game.Players:GetChildren()
						local closestPlayer = nil
						local closestDistance = math.huge
						for _, player in ipairs(players) do
							if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local playerPosition = player.Character.HumanoidRootPart.Position
								local distance = (playerPosition - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
								if distance < closestDistance then
									closestPlayer = player
									closestDistance = distance
								end
							end
						end
						if closestPlayer then
							game:GetService("ReplicatedStorage").GeneralAbility:FireServer(closestPlayer.Character)
							wait(10.1)
						end
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Mail" do
						game:GetService("ReplicatedStorage").MailSend:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Shard" do
						game:GetService("ReplicatedStorage").Shards:FireServer()
						wait(4.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Swapper" do
						game:GetService("ReplicatedStorage").SLOC:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Bubble" do
						game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Slapple" do
						game:GetService("ReplicatedStorage").funnyTree:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" do
						game:GetService("ReplicatedStorage").KineticExpl:FireServer(game:GetService("Players").LocalPlayer.Character.Kinetic, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						wait(9.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Dominance" do
						game:GetService("ReplicatedStorage").DominanceAc:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "[REDACTED]" do
						game:GetService("ReplicatedStorage").Well:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Duelist" do
						game:GetService("ReplicatedStorage").DuelistAbility:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Engineer" do
						game:GetService("ReplicatedStorage").Sentry:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" do
						game:GetService("ReplicatedStorage").lbrick:FireServer()
						game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text + 1
						wait(1.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Trap" do
						game:GetService("ReplicatedStorage").funnyhilariousbeartrap:FireServer()
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "woah" do
						game:GetService("ReplicatedStorage").VineThud:FireServer()
						wait(5.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Ping Pong" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" do
						game:GetService("ReplicatedStorage").Recall:InvokeServer(game:GetService("Players").LocalPlayer.Character.Recall)
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" do
						game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Charge" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game:GetService("Players").LocalPlayer.Character.Charge)
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Coil" do
						game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(game:GetService("Players").LocalPlayer.Character.Coil)
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
						wait(3.1)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Diamond" do
						game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Excavator" do
						game:GetService("ReplicatedStorage"):WaitForChild("Excavator"):InvokeServer()
						game:GetService("ReplicatedStorage"):WaitForChild("ExcavatorCancel"):FireServer()
						wait(7.3)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Thor" do
						game:GetService("ReplicatedStorage").ThorAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Counter" do
						game:GetService("ReplicatedStorage").Counter:FireServer()
						task.wait(6.2)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Voodoo" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
						task.wait(6.27)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Balloony" do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game:GetService("Players").LocalPlayer.Character.Balloony)
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Phase" do
						game:GetService("ReplicatedStorage").PhaseA:FireServer()
						task.wait(8.2)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Detonator" do
						game:GetService("ReplicatedStorage").Fart:FireServer()
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Sparky" do
						game:GetService("ReplicatedStorage").Sparky:FireServer(game:GetService("Players").LocalPlayer.Character.Sparky)
						task.wait()
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Adios" do
						game:GetService("ReplicatedStorage").AdiosActivated:FireServer()
						wait(8.3)
					end
					while getgenv().settings.AbilitySpam and game.Players.LocalPlayer.leaderstats.Glove.Value == "Beserk" do
						game:GetService("ReplicatedStorage").BerserkCharge:FireServer(game:GetService("Players").LocalPlayer.Character.Berserk)
						wait(2.1)
					end
				end})
				local HomeRunMax = AbilitySection:Toggle({Name = "Spam HomeRun Max",Flag = "HomeRunMax",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.HomeRunMax = Toggle_Bool
					while getgenv().settings.HomeRunMax do
						local args = {
							[1] = {
								["start"] = true
							}
						}
						game:GetService("ReplicatedStorage").HomeRun:FireServer(unpack(args))
						task.wait(3.05)
					end 
				end})

				local PopBalloony = AbilitySection:Toggle({Name = "Spam Pop Balloony",Flag = "PopBalloony",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.PopBalloony = Toggle_Bool
					while getgenv().settings.PopBalloony do
						game:GetService("ReplicatedStorage").Events.PopBalloon:FireServer()
						task.wait()
					end
				end})

				local RhythmExplosion = AbilitySection:Toggle({Name = "Spam Rhythm Explosion",Flag = "RhythmExplosion",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.RhythmExplosion = Toggle_Bool
					while getgenv().settings.RhythmExplosion do
						game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
						task.wait()
					end
				end})

				local NullMinions = AbilitySection:Toggle({Name = "Spawn Null Minions",Flag = "NullMinions",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.NullMinions = Toggle_Bool
					while getgenv().settings.NullMinions do
						game:GetService("ReplicatedStorage").NullAbility:FireServer()
						task.wait()
					end
				end})

				local SlapMinions = AbilitySection:Toggle({Name = "Slap Null Minions",Flag = "SlapMinions",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.SlapMinions = Toggle_Bool
					while getgenv().settings.SlapMinions do
						game:GetService("ReplicatedStorage").NullAbility:FireServer()
						for i,v in pairs(game.Workspace:GetChildren()) do
							if v.Name == "Imp" then
								if v:FindFirstChild("Body") then
									shared.gloveHits[getGlove()]:FireServer(v.Body)
								end
							end
						end
						wait()
					end
				end})

				local RojoPlayer = AbilitySection:Textbox({Name = "Rojo Player",Flag = "RojoPlayer",Side = "Left",Value = game.Players.LocalPlayer.Name,Placeholder = "Enter username here",NumberOnly = false,Callback = function(Text_String,EnterPressed) 
					if Text_String == "Me" or Text_String == "me" or Text_String == "Username" or Text_String == "" then
						getgenv().settings.RojoPlayer = game.Players.LocalPlayer.Name
					else
						getgenv().settings.RojoPlayer = Text_String
					end
				end})

				local RojoSpam = AbilitySection:Toggle({Name = "Rojo Spam",Flag = "RojoSpam",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.RojoSpam = Toggle_Bool
					if getgenv().settings.RojoPlayer == nil then
						getgenv().settings.RojoPlayer = game.Players.LocalPlayer.Name
					end
					while getgenv().settings.RojoSpam do
						game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[getgenv().settings.RojoPlayer].Character.HumanoidRootPart.CFrame})
						task.wait()
					end
				end})


				local RetroAbility = AbilitySection:Dropdown({Name = "Retro Option",Flag = "RetroAbility",Side = "Left",List = {
					{
						Name = "Ban Hammer",
						Mode = "Button",
						Value = true,
						Callback = function(Selected)
							getgenv().settings.RetroOption = "Ban Hammer"
						end
					},
					{
						Name = "Rocket Launcher",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.RetroOption = "Rocket Launcher"
						end
					},
					{
						Name = "Bomb",
						Mode = "Button",
						Value = false,
						Callback = function(Selected)
							getgenv().settings.RetroOption = "Bomb"
						end
					}
				}})

				local RetroSpam = AbilitySection:Toggle({Name = "Retro Spam",Flag = "RetroSpam",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.RetroSpam = Toggle_Bool
					while getgenv().settings.RetroSpam do
						game:GetService("ReplicatedStorage").RetroAbility:FireServer(getgenv().settings.RetroOption)
						task.wait()
					end
				end})
			end
		end
		local MiscTab = Window:Tab({Name = "Miscellaneous"}) do
			local SoundSpamSection = MiscTab:Section({Name = "Sound Spam",Side = "Left"}) do

				local SlicerSound = SoundSpamSection:Toggle({Name = "Slicer Sound Spam",Flag = "SlicerSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.SlicerSpam = Toggle_Bool
					while getgenv().settings.SlicerSpam do
						game:GetService("ReplicatedStorage").Slicer:FireServer("sword")
						task.wait()
					end
				end})

				local ErrorSound = SoundSpamSection:Toggle({Name = "Error Sound Spam",Flag = "ErrorSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.ErrorSpam = Toggle_Bool
					while getgenv().settings.ErrorSpam do
						game:GetService("ReplicatedStorage").LetMeBeClear:FireServer(true)
						task.wait(2.1)
					end
				end})

				local ChargeSound = SoundSpamSection:Toggle({Name = "Charge Sound Spam",Flag = "ChargeSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.ChargeSpam = Toggle_Bool
					while getgenv().settings.ChargeSpam do
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer(game:GetService("Players").LocalPlayer.Character.Charge)
						wait(3.05)
					end
				end})

				local ErrorDeathSound = SoundSpamSection:Toggle({Name = "Error Death Sound Spam",Flag = "ErrorDeathSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.ErrorDeathSpam = Toggle_Bool
					while ErrorSoundSpam do
						game.ReplicatedStorage.ErrorDeath:FireServer()
						task.wait()
					end
				end})

				local SpaceSound = SoundSpamSection:Toggle({Name = "Space Sound Spam",Flag = "SpaceSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.SpaceSpam = Toggle_Bool
					while getgenv().settings.SpaceSpam do
						game:GetService("ReplicatedStorage").ZeroGSound:FireServer()
						task.wait()
					end
				end})

				local ThanosSound = SoundSpamSection:Toggle({Name = "Thanos Sound Spam",Flag = "ThanosSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.ThanosSpam = Toggle_Bool
					while getgenv().settings.ThanosSpam do
						game:GetService("ReplicatedStorage").Illbeback:FireServer()
						task.wait()
					end
				end})

				local GoldenSound = SoundSpamSection:Toggle({Name = "Golden Sound Spam",Flag = "GoldenSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.GoldenSpam = Toggle_Bool
					while getgenv().settings.GoldenSpam do
						game:GetService("ReplicatedStorage").Goldify:FireServer(true)
						task.wait()
					end
				end})

				local GhostSound = SoundSpamSection:Toggle({Name = "Ghost Sound Spam",Flag = "GhostSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.GhostSpam = Toggle_Bool
					while getgenv().settings.GhostSpam do
						game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
						game.ReplicatedStorage.Ghostinvisibilitydeactivated:FireServer()
						task.wait()
					end
				end})

				local HitmanSound = SoundSpamSection:Toggle({Name = "Hitman Sound Spam",Flag = "HitmanSound",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.HitmanSpam = Toggle_Bool
					while getgenv().settings.HitmanSpam do
						game:GetService("ReplicatedStorage"):WaitForChild("HitmanAbility"):FireServer("ReplicateGoldenRevolver",{0})
						task.wait()
					end
				end})
			end
			local ExtraFuncSection = MiscTab:Section({Name = "Extra Functions",Side = "Right"}) do
				local Give20KillsReaper = ExtraFuncSection:Button({Name = "Give 20 Kills Reaper",Side = "Left",Callback = function() 
					for i = 1, 20 do
						game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(x,false)
					end
					for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.Name == "DeathMark" then
							game.ReplicatedStorage.ReaperGone:FireServer(v)
							game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
						end 
					end
				end})
				-- i need fix
				local AutoTycoon = ExtraFuncSection:Toggle({Name = "Auto Tycoon",Flag = "AutoTycoon",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.AutoTycoon = Toggle_Bool
					for i,v in pairs(workspace:GetDescendants()) do
						if v.Name == "End" and v.ClassName == "Part" then
							v.Size = Vector3.new(28, 0.3, 4)
						end
					end
					while getgenv().settings.AutoTycoon do
						for i,v in pairs(workspace:GetDescendants()) do
							if v.Name == "Click" and v:FindFirstChild("ClickDetector") then
								fireclickdetector(v.ClickDetector)
							end
						end
						task.wait()
					end
				end})

				-- i need fix
				local DestroyTycoon = ExtraFuncSection:Toggle({Name = "Destroy Tycoon",Flag = "DestroyTycoon",Side = "Left",Value = false,Callback = function(Toggle_Bool)
					getgenv().settings.DestroyTycoon = Toggle_Bool
					while getgenv().settings.DestroyTycoon do
						for i,v in pairs(workspace:GetDescendants()) do
							if v.Name == "Destruct" and v:FindFirstChild("ClickDetector") then
								fireclickdetector(v.ClickDetector)
							end
						end
						task.wait()
					end
				end})
			end
		end
	end
	print(getGlove())
	game:GetService("RunService").RenderStepped:Connect(function()
		if game.PlaceId ~= 9431156611 and game:GetService("Players").LocalPlayer ~= nil and getTool() ~= nil and game:GetService("Players").LocalPlayer.Character:FindFirstChild("entered") ~= nil or game.PlaceId == 9431156611 and game:GetService("Players").LocalPlayer ~= nil and getTool() ~= nil and game:GetService("Players").LocalPlayer.Character:FindFirstChild("inMatch").Value then
			if getgenv().settings.GloveExtend and getgenv().settings.ExtendOption == "Meat Stick" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 25, 2) then
				getTool().Glove.Transparency = 0.5
				getTool().Glove.Size = Vector3.new(0, 25, 2)
			elseif getgenv().settings.GloveExtend and getgenv().settings.ExtendOption == "Pancake" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 25, 25) then
				getTool().Glove.Transparency = 0.5
				getTool().Glove.Size = Vector3.new(0, 25, 25)
			elseif getgenv().settings.GloveExtend and getgenv().settings.ExtendOption == "Growth" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(25, 25, 25) then
				getTool().Glove.Transparency = 0.5
				getTool().Glove.Size = Vector3.new(25, 25, 25)
			elseif getgenv().settings.GloveExtend and getgenv().settings.ExtendOption == "North Korea Wall" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 3.5, 2) then
				getTool().Glove.Transparency = 0.5
				getTool().Glove.Size = Vector3.new(45, 0, 45)
			elseif getgenv().settings.GloveExtend and getgenv().settings.ExtendOption == "Slight Extend" and getTool():FindFirstChild("Glove").Size ~= Vector3.new(0, 3.5, 2) then
				getTool().Glove.Transparency = 0
				getTool().Glove.Size = Vector3.new(3, 3, 3.7)
			elseif getgenv().settings.GloveExtend == false then
				getTool().Glove.Transparency = 0
				getTool().Glove.Size = Vector3.new(2.5, 2.5, 1.7)
			end
		end
	end)
end
