--This code was created by nerna or zemboxo sx and silentabsolutedayn. Anyway, blah blah, join our Discord server
-- Step 1: Bypass Anti-Cheat
local startmessage = Instance.new("ScreenGui")
startmessage.Name = "LoadingGui"
startmessage.ResetOnSpawn = false
startmessage.Parent = game:GetService("CoreGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BorderSizePixel = 0
bg.Parent = startmessage

local msgLabel = Instance.new("TextLabel")
msgLabel.Size = UDim2.new(1, 0, 0, 50)
msgLabel.Position = UDim2.new(0, 0, 0.5, -25)
msgLabel.BackgroundTransparency = 1
msgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
msgLabel.TextScaled = true
msgLabel.Font = Enum.Font.GothamBold
msgLabel.Text = "Bypassing Anti-Cheat..."
msgLabel.Parent = bg

msgLabel.Text = "Bypassing Anti-Cheat..."
if game.PlaceId==101960002094215 or game.PlaceId==9431156611 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/SB/Modules/CleanClientAntiCheat.luau"))("Slap Royale")
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/SB/Modules/CleanClientAntiCheat.luau"))("Slap Battles")
end


msgLabel.Text = "Loading Wind UI..."
local WindUI
local success, err = pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)

if not success or not WindUI then
    warn("error WindUI: " .. tostring(err))
    startmessage:Destroy()
    return
end

startmessage:Destroy()


-- ==========================================================
-- SCRIPT SCRIPT SCRIPT SCRIPT SCRIPT SCRIPT SCRIPT SCRIPT 
-- ==========================================================


local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local BadgeService = game:GetService("BadgeService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local lp = Players.LocalPlayer
local placeId = game.PlaceId

local function runAutoGetLotus()
    local TARGET_PLACE_ID = 93981091811742
    local player = Players.LocalPlayer

    if game.PlaceId == TARGET_PLACE_ID then
        local remotes = ReplicatedStorage:WaitForChild("Remotes")

        local function clickLotus(container)
            local lotus = container:WaitForChild("Lotus", 10)
            if not lotus then return end
            local primary = lotus:WaitForChild("Primary", 10)
            if not primary then return end
            local cd = primary:WaitForChild("ClickDetector", 10)
            if cd then
                fireclickdetector(cd)
            end
        end

        local function touch(part)
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            firetouchinterest(hrp, part, 0)
            task.wait()
            firetouchinterest(hrp, part, 1)
        end

        clickLotus(workspace:WaitForChild("Lotus1_Red"))
        remotes:WaitForChild("Lotus2Complete"):FireServer()
        clickLotus(workspace:WaitForChild("Lotus4_Pink"))
        clickLotus(workspace:WaitForChild("Lotus5_White"))

        touch(workspace:WaitForChild("Lotus3_Blue"):WaitForChild("Detector"))
        task.wait(0.2)
        remotes:WaitForChild("Minigames"):WaitForChild("Complete"):FireServer()

        local blue = workspace:WaitForChild("Lotus3_Blue")
        repeat task.wait() until blue:FindFirstChild("Lotus") and blue.Lotus:FindFirstChild("Primary") and blue.Lotus.Primary:FindFirstChild("ClickDetector")
        fireclickdetector(blue.Lotus.Primary.ClickDetector)

        return
    end

    local ok, err = pcall(function()
        TeleportService:Teleport(TARGET_PLACE_ID, player)
    end)

    if not ok then
        warn("Teleport failed: ", err)
    end
end

local function runAutoGetTycoon()
    task.spawn(function()
        local BADGE_ID = 2129212145
        local TARGET_CFRAME = CFrame.new(
            -1309.1750, 328.8217, 5.7857,
            -0.0867, 0.0130, 0.9962,
            -0.0026, 0.9999, -0.0133,
            -0.9962, -0.0038, -0.0867
        )

        local function hasBadge()
            local ok, result = pcall(function()
                return BadgeService:UserHasBadgeAsync(lp.UserId, BADGE_ID)
            end)
            return ok and result
        end

        local function waitForCharacter()
            if not lp.Character then
                lp.CharacterAdded:Wait()
            end
            lp.Character:WaitForChild("HumanoidRootPart", 10)
            task.wait(0.5)
        end

        if #Players:GetPlayers() < 7 then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Plate Master",
                Text = "Bro, there aren't 7 people on the server; try reconnecting or just wait.",
                Duration = 10,
            })
            while #Players:GetPlayers() < 7 do
                task.wait(1)
            end
        end

        if hasBadge() then
            task.wait(603)
            return
        end

        waitForCharacter()

        local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = TARGET_CFRAME
        end
        task.wait(0.5)

        local Arena = Workspace:WaitForChild("Arena", 30)
        if not Arena then return end
        local Plate = Arena:WaitForChild("Plate", 30)
        if not Plate then return end

        local function lockToPlate()
            local char = lp.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            root.CFrame = Plate.CFrame + Vector3.new(0, 3, 0)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end

        local connection = RunService.Heartbeat:Connect(lockToPlate)

        local startTime = tick()
        while not hasBadge() do
            task.wait(1)
            if tick() - startTime > 300 then
                break
            end
        end

        connection:Disconnect()

        if hasBadge() then
            task.wait(1)
            local char = lp.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Health = 0
                end
            end
        end
    end)
end

local function runSuctionCode()
    task.spawn(function()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local targets = {"PlungerMain", "plunger glove", "ToiletPlunger", "Unity"}
        for _, name in ipairs(targets) do
            local item = workspace:FindFirstChild(name, true)
            if item then
                hrp.CFrame = item:GetPivot()
                task.wait(0.4)
                local cd = item:FindFirstChildWhichIsA("ClickDetector", true)
                if cd then fireclickdetector(cd) end
                local part = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) or item
                if part and firetouchinterest then
                    firetouchinterest(hrp, part, 0)
                    firetouchinterest(hrp, part, 1)
                end
                task.wait(0.4)
            end
        end
    end)
end

local function runAutoGetCamera()
    task.spawn(function()
        local Players      = game:GetService("Players")
        local RS           = game:GetService("ReplicatedStorage")
        local VIM          = game:GetService("VirtualInputManager")

        local player       = Players.LocalPlayer
        local char         = player.Character or player.CharacterAdded:Wait()
        local hrp          = char:WaitForChild("HumanoidRootPart")
        local humanoid     = char:WaitForChild("Humanoid")
        local camRemotes   = RS.Assets.Obtainments.Camera.Remotes
        local isPhotoValid = camRemotes.IsPhotoValid

        local function tp(pos)
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
            task.wait(0.35)
        end

        local function pressQ()
            VIM:SendKeyEvent(true,  Enum.KeyCode.Q, false, game)
            task.wait(0.15)
            VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
            task.wait(0.5)
        end

        local function waitFor(condition, timeout)
            local t = tick()
            repeat task.wait(0.25) until condition() or tick() - t > (timeout or 15)
            return condition()
        end

        pressQ()

        local CAMERA_SPAWN = Vector3.new(-385.063934, 52.0801315, 2.81142139)
        tp(CAMERA_SPAWN)

        local cameraModel = nil

        local gotIt = waitFor(function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "CameraModel" and v:IsA("Model") then
                    cameraModel = v
                    return true
                end
            end
        end, 0.4)

        if not gotIt or not cameraModel then
            pressQ()
            tp(CAMERA_SPAWN)
            waitFor(function()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v.Name == "CameraModel" and v:IsA("Model") then
                        cameraModel = v
                        return true
                    end
                end
            end, 0.4)
        end

        if cameraModel then
            local camPartPos = cameraModel.PrimaryPart and cameraModel.PrimaryPart.Position
                or cameraModel:GetPivot().Position
            tp(camPartPos)

            local prompt = cameraModel:FindFirstChildWhichIsA("ProximityPrompt", true)
            if prompt then
                fireproximityprompt(prompt)
            end
        end

        task.wait(1.5)

        local camTool = player.Backpack:FindFirstChild("Camera")
            or (char and char:FindFirstChild("Camera"))

        if camTool then
            humanoid:EquipTool(camTool)
            task.wait(1.2)
        end

        local PNG_SPOTS = {
            { "1 – Cannon Island",           Vector3.new( 316.721,  31.268,  188.642), Vector3.new( 0.996, 0, -0.087) },
            { "2 – Chain Obby to Slapple",   Vector3.new(-128.993,  -1.786,  125.199), Vector3.new( 0.705, 0, -0.709) },
            { "3 – Moai Island Statue",      Vector3.new(-274.513, -19.490,  -10.172), Vector3.new(-0.714, 0,  0.700) },
            { "4 – Slapple Island Big Tree", Vector3.new(-425.410,  56.777,  -23.400), Vector3.new( 0,     0,  1    ) },
            { "5 – East Island Tree",        Vector3.new(  -8.155,  -2.694, -208.862), Vector3.new(-0.985, 0, -0.174) },
            { "6 – The Fort",                Vector3.new( 242.086, -10.646,  -25.781), Vector3.new( 0.445, 0,  0.895) },
            { "7 – Chain (Default↔Normal)",  Vector3.new( 116.677,  -2.879,    1.637), Vector3.new(-0.991, 0, -0.131) },
        }

        local function photographPart(part, lookVec)
            local standPos = part.Position + lookVec * 7
            tp(standPos)

            workspace.CurrentCamera.CFrame = CFrame.lookAt(
                standPos + Vector3.new(0, 2, 0),
                part.Position
            )
            task.wait(0.25)

            local ok, result = pcall(function()
                return isPhotoValid:InvokeServer(part)
            end)

            if ok and result then
                part:Destroy()
                return true
            elseif ok then
                VIM:SendMouseButtonEvent(0, 0, 0, true,  game, 1)
                task.wait(0.05)
                VIM:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                task.wait(0.4)
                return false
            else
                return false
            end
        end

        local folder = workspace:FindFirstChild("Camera_Obtainment_PNGS")
        if not folder then return end

        for i, spot in ipairs(PNG_SPOTS) do
            local name, targetPos, lookVec = spot[1], spot[2], spot[3]

            local matchedPart = nil
            for _, p in ipairs(folder:GetChildren()) do
                if p:IsA("BasePart") and (p.Position - targetPos).Magnitude < 2 then
                    matchedPart = p
                    break
                end
            end

            if not matchedPart then
                continue
            end

            photographPart(matchedPart, lookVec)
            task.wait(0.5)
        end
    end)
end

local function runAutoGetAlchemist()
    pcall(function()
        local Namecall
        Namecall = hookmetamethod(game, "__namecall", function(self, ...)
           if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
               return
           elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
               return
           elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
               return
           end
           return Namecall(self, ...)
        end)
    end)

    _G.AntiRagdoll = true
    if _G.AntiRagdoll then
        game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
            local ragdolled = char:WaitForChild("Ragdolled", 5)
            if ragdolled then
                ragdolled.Changed:Connect(function()
                    if ragdolled.Value == true and _G.AntiRagdoll then
                        repeat task.wait() 
                            if char:FindFirstChild("Torso") then
                                char.Torso.Anchored = true
                            end
                        until ragdolled.Value == false
                        if char:FindFirstChild("Torso") then
                            char.Torso.Anchored = false
                        end
                    end
                end)
            end
        end)
    end

    local arenaBarrier = workspace:FindFirstChild("ArenaBarrier")
    local deathBarrier = workspace:FindFirstChild("DEATHBARRIER")
    local deathBarrier2 = workspace:FindFirstChild("DEATHBARRIER2")
    local dedBarrier = workspace:FindFirstChild("dedBarrier")

    if arenaBarrier then arenaBarrier:Destroy() end
    if deathBarrier then deathBarrier:Destroy() end
    if deathBarrier2 then deathBarrier2:Destroy() end
    if dedBarrier then dedBarrier:Destroy() end

    local platform = Instance.new("Part")
    platform.Size = Vector3.new(1000, 1, 1000) 
    platform.Position = Vector3.new(-24058.8594, 306.104187, -844.946045)
    platform.CFrame = CFrame.new(platform.Position)
    platform.BrickColor = BrickColor.new("Bright blue")
    platform.Material = Enum.Material.Plastic
    platform.Transparency = 1
    platform.Parent = workspace

    local weld = Instance.new("WeldConstraint")
    weld.Parent = platform
    weld.Part0 = platform
    weld.Part1 = workspace.Terrain

    task.wait(0.2)

    pcall(function()
        if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 666 then
            pcall(function() fireclickdetector(workspace.Lobby.Ghost.ClickDetector) end)
            task.wait(0.3)
            pcall(function() game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer() end)
        end
    end)

    task.wait(0.3)

    local scriptActive = true

    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        scriptActive = false
    end)

    pcall(function()
        if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2124819262) then
            pcall(function() fireclickdetector(workspace.Lobby.Plague.ClickDetector) end)
            task.wait(0.3)
            
            task.spawn(function()
                local killCount = 0
                local trackedPlayers = {}
                
                while scriptActive do
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        for _, targetPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
                            if not scriptActive then break end
                            if targetPlayer ~= player and targetPlayer.Character then
                                local char = targetPlayer.Character
                                local leftArm = char:FindFirstChild("Left Arm")
                                local humanoid = char:FindFirstChildOfClass("Humanoid")
                                
                                if leftArm and humanoid and humanoid.Health > 0 then
                                    game:GetService("ReplicatedStorage").PlagueHit:FireServer(leftArm)
                                    
                                    if (humanoid.Health <= 1 or char:FindFirstChild("ded")) and not trackedPlayers[targetPlayer] then
                                        trackedPlayers[targetPlayer] = true
                                        killCount = killCount + 1
                                        
                                        if killCount >= 5 then
                                            scriptActive = false
                                            task.wait(6)
                                            
                                            if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                                                player.Character:FindFirstChildOfClass("Humanoid").Health = 0
                                            end
                                            
                                            return
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end)

    task.spawn(function()
        local player = game.Players.LocalPlayer
        
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Head") then
                firetouchinterest(player.Character.Head, workspace.Lobby.Teleport1, 0)
            end
        end)
        
        while scriptActive do
            task.wait(2)
            if not scriptActive then break end
            pcall(function()
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-24036.2266, 316.696503, -855.74939)
            end)
            
            task.wait(2)
            if not scriptActive then break end
            
            pcall(function()
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                
                local validPlayers = {}
                for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local char = p.Character
                        if not char:FindFirstChild("InLobby") and not char:FindFirstChild("ded") and not char:FindFirstChild("InLabyrinth") then
                            table.insert(validPlayers, char)
                        end
                    end
                end
                
                if #validPlayers > 0 then
                    local randomTarget = validPlayers[math.random(1, #validPlayers)]
                    player.Character.HumanoidRootPart.CFrame = randomTarget.HumanoidRootPart.CFrame
                end
            end)
        end
    end)

    task.spawn(function()
        while scriptActive do
            pcall(function()
                for _, v in pairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild("rock") then
                        v.Character:FindFirstChild("rock").CanTouch = false
                        v.Character:FindFirstChild("rock").CanQuery = false
                    end
                end
            end)
            task.wait()
        end
    end)
end

local function runAutoGetSand()
    local LocalPlayer = Players.LocalPlayer
    local TeleportService = game:GetService("TeleportService")
    local Workspace = game:GetService("Workspace")
    local Camera = Workspace.CurrentCamera
    local queue = queueonteleport or queue_on_teleport

    local targetPlace = 122902713960550

    if game.PlaceId ~= targetPlace then
        TeleportService:Teleport(targetPlace)
        if queue then
            queue([[
                if not game:IsLoaded() then
                   game.Loaded:Wait()
                end
                if game.PlaceId ~= 122902713960550 then return end
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local Workspace = game:GetService("Workspace")
                local Camera = Workspace.CurrentCamera
                
                repeat task.wait() until Workspace:FindFirstChild("Island") and Workspace.Island:FindFirstChild("John Surfboard")
                
                LocalPlayer.Character:PivotTo(Workspace.Island["John Surfboard"].Head:GetPivot())
                task.wait(.3)
                fireproximityprompt(Workspace.Island["John Surfboard"].Head:FindFirstChildWhichIsA("ProximityPrompt"))
                wait(.1)
                for i = 1,20 do
                    local args = {
                        [1] = 0
                    }
                    game:GetService("ReplicatedStorage").Modules.Common.Dialogue.Remotes.ResondToDialogue:FireServer(unpack(args))
                    wait()
                end
                
                task.wait(1)
                Camera.CameraType = Enum.CameraType.Custom
                Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                while wait() do
                    for i,v in pairs(workspace.ObjectSpawner_Objects:GetChildren()) do
                        v:Destroy()
                    end
                end
            ]])
        end
        return
    end

    repeat task.wait() until Workspace:FindFirstChild("Island") and Workspace.Island:FindFirstChild("John Surfboard")

    LocalPlayer.Character:PivotTo(Workspace.Island["John Surfboard"].Head:GetPivot())
    task.wait(.3)
    fireproximityprompt(Workspace.Island["John Surfboard"].Head:FindFirstChildWhichIsA("ProximityPrompt"))
    wait(.1)
    for i = 1,20 do
        local args = {
            [1] = 0
        }
        
        game:GetService("ReplicatedStorage").Modules.Common.Dialogue.Remotes.ResondToDialogue:FireServer(unpack(args))
        wait()
    end

    task.wait(1)
    Camera.CameraType = Enum.CameraType.Custom
    Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

    while wait() do
        for i,v in pairs(workspace.ObjectSpawner_Objects:GetChildren()) do
            v:Destroy()
        end
    end
end

local function runAutoGetFrostbite()
    local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
            task.wait(0.7)
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    fireproximityprompt(v)
                end
            end
        ]])
    end
    game:GetService("TeleportService"):Teleport(17290438723)
end

local function runFreeRecall()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local recallReset = ReplicatedStorage:WaitForChild("RecallReset")
    local recallSteps = ReplicatedStorage:WaitForChild("RecallLastInteractionSteps")

    local portal = workspace:WaitForChild("RepressedMemories"):WaitForChild("Portal")

    task.spawn(function()
        while true do
            recallReset:FireServer(nil, true)
            local success, result = pcall(function()
                return recallSteps:InvokeServer(false)
            end)
            
            if success and type(result) == "string" and result:lower() == "simon says walk through the portal to collect your reward" then
                break
            end
            task.defer(task.wait)
        end

        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        rootPart:PivotTo(portal.CFrame)
    end)
end

local function runAutoGetConkerNew()
    local TARGET_PLACES = { 101113181694564, 78804514423551 }
    local MAIN_PLACE    = 101113181694564

    local Players           = game:GetService("Players")
    local TeleportService   = game:GetService("TeleportService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local LocalPlayer = Players.LocalPlayer

    _G.ConkerNumber      = "3"
    _G.AutoCollectConker = true
    _G.AutoSubmitConker  = true
    _G.AutoSlapSquirrel  = true

    local PAYLOAD = [==[
        local Players           = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer       = Players.LocalPlayer

        _G.ConkerNumber      = _G.ConkerNumber      or "3"
        _G.AutoCollectConker = _G.AutoCollectConker ~= false
        _G.AutoSubmitConker  = _G.AutoSubmitConker  ~= false
        _G.AutoSlapSquirrel  = _G.AutoSlapSquirrel  ~= false

        local function waitForCharacter()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            char:WaitForChild("HumanoidRootPart", 15)
            char:WaitForChild("Humanoid", 15)
            return char
        end

        repeat task.wait() until workspace:FindFirstChild("Map")
            and workspace.Map:FindFirstChild("Props")
            and workspace.Map.Props:FindFirstChild("BasketCollection")
            and workspace.Map.Props.BasketCollection:FindFirstChild("Basket")

        local remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
        if remotes and remotes:FindFirstChild("Dialogue") then
            pcall(function()
                remotes.Dialogue.FinishedNPCDialogue:FireServer(true)
            end)
        end
        task.wait(3)

        local basket = workspace.Map.Props.BasketCollection:FindFirstChild("Basket")
        if basket then
            local cd = basket:FindFirstChild("ClickDetector")
            if cd then
                pcall(function() fireclickdetector(cd) end)
            end
        end
        task.wait(5)

        task.spawn(function()
            while _G.AutoCollectConker do
                task.wait()
                local char = LocalPlayer.Character
                if not char then continue end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local visual = char:FindFirstChild("ConkerHoldVisual")

                local alreadyHas = visual and visual:FindFirstChild(tostring(_G.ConkerNumber))
                local squirrel   = workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("squirrel")
                local conker     = workspace:FindFirstChild("Conker")

                if not alreadyHas and not squirrel and conker and hrp then
                    pcall(function()
                        hrp.CFrame = conker.CFrame
                    end)
                    task.wait(0.5)
                end
            end
        end)

        task.spawn(function()
            while _G.AutoSubmitConker do
                task.wait()
                local char = LocalPlayer.Character
                if not char then continue end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local visual = char:FindFirstChild("ConkerHoldVisual")

                if hrp and visual and visual:FindFirstChild(tostring(_G.ConkerNumber)) then
                    local bowl = workspace.Map
                        and workspace.Map:FindFirstChild("CoreAssets")
                        and workspace.Map.CoreAssets:FindFirstChild("Bowl")
                    if bowl then
                        local bowlPart = bowl:FindFirstChild("bowl")
                        local prompt   = bowl:FindFirstChild("ProximityPrompt")
                        if bowlPart then
                            pcall(function() hrp.CFrame = bowlPart.CFrame end)
                            task.wait(0.3)
                        end
                        if prompt then
                            pcall(function() fireproximityprompt(prompt) end)
                        end
                        task.wait(0.5)
                    end
                end
            end
        end)

        task.spawn(function()
            while _G.AutoSlapSquirrel do
                task.wait()
                local char = LocalPlayer.Character
                if not char then continue end
                local hrp = char:FindFirstChild("HumanoidRootPart")

                local glove = char:FindFirstChild("Glove")
                if not glove then
                    local bp = LocalPlayer:FindFirstChild("Backpack")
                    local bpGlove = bp and bp:FindFirstChild("Glove")
                    if bpGlove then
                        pcall(function()
                            char.Humanoid:EquipTool(bpGlove)
                        end)
                    end
                else
                    pcall(function() glove:Activate() end)
                end

                local npcs = workspace:FindFirstChild("NPCs")
                if npcs and hrp then
                    for _, v in ipairs(npcs:GetChildren()) do
                        if v.Name == "squirrel" and v:FindFirstChild("HumanoidRootPart") then
                            pcall(function()
                                hrp.CFrame = v.HumanoidRootPart.CFrame
                            end)
                        end
                    end
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(1)
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                end
            end
        end)
    ]==]

    local function isTarget()
        for _, id in ipairs(TARGET_PLACES) do
            if game.PlaceId == id then return true end
        end
        return false
    end

    if isTarget() then
        local fn, err = loadstring(PAYLOAD)
        if fn then
            fn()
        else
            warn("[conker] loadstring error: " .. tostring(err))
        end
    else
        local queue = queue_on_teleport or queueonteleport
        if queue then
            pcall(function() queue(PAYLOAD) end)
        else
            warn("[conker] no queue_on_teleport available — payload will not carry across teleport")
        end
        pcall(function()
            TeleportService:Teleport(MAIN_PLACE, LocalPlayer)
        end)
    end
end

-- ==========================================================
-- NEW: Auto-Get Catseye
-- ==========================================================
local function runAutoGetCatseye()
    task.spawn(function()
        local LocalPlayer = Players.LocalPlayer

        local function SelectGlove(gloveName)
            local success, result = pcall(function()
                local network = require(ReplicatedStorage.BACKEND.Lib.Network)
                local upval = debug.getupvalues(network.fireServer)[3]
                local equip = upval("SelectGlove")
                return equip
            end)

            if success and result then
                result:FireServer(gloveName)
            else
                warn("Failed to change the glove via the network.")
            end
        end

        local function EnterArena(part)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
            end
        end

        local function TeleportToPosition(cf, offset)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = cf + Vector3.new(0, offset or 0, 0)
            end
        end

        local Character = LocalPlayer.Character
        if not Character then return end
        if Character:FindFirstChild("entered") then
            warn("[Catseye] You have to use this in lobby!")
            return
        end

        if LocalPlayer.leaderstats.Glove.Value ~= "Recall" then
            SelectGlove("Recall")
            task.wait(0.5)
        end

        EnterArena(workspace.Lobby["Teleport1"])
        ReplicatedStorage.GlitchTP:FireServer(true)
        TeleportToPosition(workspace["Debug Room"].File.CFrame, 3)

        local fileObj = workspace["Debug Room"].File
        local detector = fileObj:FindFirstChildWhichIsA("ClickDetector")

        if detector then
            pcall(fireclickdetector, detector)
        else
            local prompt = fileObj:FindFirstChildWhichIsA("ProximityPrompt")
            if prompt then
                prompt.HoldDuration = 0
                pcall(fireproximityprompt, prompt)
            end
        end

        for i = 1, 3 do
            ReplicatedStorage.Events.CatseyeObtainmentCanProgress:InvokeServer()
        end
        task.wait(2)

        for i = 1, 3 do
            ReplicatedStorage.ClaimRetroFastTravel:FireServer(true, true)
            TeleportToPosition(CFrame.new(-17004, -4, 4542), 3)
            for j = 1, 3 do
                ReplicatedStorage.Events.CatseyeObtainmentCanProgress:InvokeServer()
            end
            LocalPlayer.Reset:FireServer()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Anchored = true
            end
            LocalPlayer.CharacterAdded:Wait()
            task.wait(1)
        end

        EnterArena(workspace.Lobby["Teleport1"])
        ReplicatedStorage.GlitchTP:FireServer(true)
        TeleportToPosition(workspace["Debug Room"].File.CFrame, 3)

        if detector then
            pcall(fireclickdetector, detector)
        else
            local prompt = fileObj:FindFirstChildWhichIsA("ProximityPrompt")
            if prompt then
                prompt.HoldDuration = 0
                pcall(fireproximityprompt, prompt)
            end
        end

        for i = 1, 3 do
            ReplicatedStorage.Events.CatseyeObtainmentCanProgress:InvokeServer()
        end
    end)
end
-- ==========================================================
-- END: Auto-Get Catseye
-- ==========================================================

-- ==========================================================
-- NEW: Auto-Get Revenant (by nexer)
-- ==========================================================
local function runAutoGetRevenant()
    task.spawn(function()
        local function CreateMessage()
            return {
                Text = "",
                Destroy = function() end,
            }
        end

        local function TouchObject(part)
            local plr = game:GetService("Players").LocalPlayer
            local char = plr.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp or not part then return end
            if firetouchinterest then
                firetouchinterest(hrp, part, 0)
                task.wait(0.05)
                firetouchinterest(hrp, part, 1)
            else
                hrp.CFrame = part.CFrame
            end
        end

        local function AutoGetRevenant()
            local obtainmentmsg = CreateMessage()
            obtainmentmsg.Text = "Teleporting to Trick or Treat..."

            task.spawn(function()
                if game.PlaceId ~= 82340649038345 then return end
                repeat task.wait(.5) until game:GetService("Players").LocalPlayer and game:IsLoaded()

                local LocalPlayer = game:GetService("Players").LocalPlayer
                local Character, HumanoidRootPart, Humanoid
                pcall(function()
                    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                end)
                pcall(function()
                    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 3600)
                end)
                pcall(function()
                    Humanoid = Character:WaitForChild("Humanoid", 3600)
                end)
                LocalPlayer.CharacterAdded:Connect(function(AddedCharacter)
                    pcall(function()
                        Character = nil
                        HumanoidRootPart = nil
                        Humanoid = nil
                        task.wait()
                        Character = AddedCharacter
                        repeat task.wait() until Character:FindFirstChild("HumanoidRootPart")
                        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 3600)
                        repeat task.wait() until Character:FindFirstChild("Humanoid")
                        Humanoid = Character:WaitForChild("Humanoid", 3600)
                    end)
                end)

                local OverrideVelocity = function()
                    pcall(function()
                        for i, v in next, Character:GetDescendants() do
                            if v and v:IsA("BasePart") then
                                v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
                            end
                        end
                    end)
                end

                local TeleportToPosition = function(cFrame, time, huh)
                    local huh = huh or false
                    local time = time or 1
                    local starttimee = tick()
                    while tick() - starttimee < time do
                        pcall(function()
                            OverrideVelocity()
                            if huh == true then
                                for i, v in next, Character:GetChildren() do
                                    if v:IsA("BasePart") then v:PivotTo(cFrame) end
                                end
                            elseif huh == false then
                                HumanoidRootPart:PivotTo(cFrame)
                            end
                        end)
                        task.wait()
                    end
                end

                if not workspace:GetAttribute("ToolsInitCompleted") then
                    workspace:SetAttribute("ToolsInitCompleted", true)
                    task.spawn(function()
                        while true do
                            pcall(function()
                                game:GetService("ReplicatedStorage").Modules.Common.DialogueServer.Remotes.ResondToDialogue:FireServer(0)
                                game:GetService("ReplicatedStorage").Modules.Common.DialogueServer.Remotes.VoteSkip:FireServer("Count Cornifier")
                            end)
                            for _, Tool in next, LocalPlayer.Backpack:GetChildren() do
                                if Tool and Tool:IsA("Tool") and Character then
                                    Tool.Parent = Character
                                end
                            end
                            task.wait(.1777)
                        end
                    end)
                    task.spawn(function()
                        while true do
                            pcall(function()
                                for _, Tool in next, Character:GetChildren() do
                                    if Tool and Tool:IsA("Tool") and LocalPlayer.Backpack then
                                        Tool.Parent = LocalPlayer.Backpack
                                    end
                                end
                            end)
                            task.wait(1)
                        end
                    end)
                end

                function StartFarming()
                    local IsBagFull = function()
                        local Ok, Result = pcall(function()
                            local Hud = LocalPlayer.PlayerGui:FindFirstChild("HUD")
                            if not Hud then return false end
                            local Bag = Hud:FindFirstChild("bag_full")
                            if not Bag then return false end
                            return Bag.Visible == true and Bag.TextTransparency == 0
                        end)
                        return Ok and Result
                    end
                    local PartSize = function(Part)
                        local Ok, Result = pcall(function()
                            local S = Part.Size
                            return S.X * S.Y * S.Z
                        end)
                        if Ok and Result then return Result end
                        return math.huge
                    end
                    local IsTargetValid = function(Target)
                        if not Target or not Target.Parent then return false end
                        local Model = Target
                        if Target:IsA("BasePart") then Model = Target.Parent end
                        if Model and Model.GetAttribute and Model:GetAttribute("IsDead") == true then return false end
                        if Target.GetAttribute and Target:GetAttribute("IsDead") == true then return false end
                        return true
                    end
                    local PositionAboveTarget = function(Target)
                        if not HumanoidRootPart or not Target or not Target.Parent then return end
                        local TargetPos = Target.Position
                        local AbovePos = TargetPos + Vector3.new(0, 12, 0)
                        local LookAt = CFrame.lookAt(AbovePos, TargetPos)
                        pcall(function() HumanoidRootPart.CFrame = LookAt end)
                        OverrideVelocity()
                    end
                    local CountTargets = function()
                        local Count = 0
                        for _, v in next, workspace.NPC:GetChildren() do
                            if v and v.Name == "Minion" and v.Name ~= LocalPlayer.Name then
                                if v:FindFirstChild("CandyCorn") or v:FindFirstChildWhichIsA("BasePart") then
                                    if v:GetAttribute("IsDead") ~= true then
                                        Count = Count + 1
                                    end
                                end
                            end
                        end
                        return Count
                    end
                    local FarmOnce = function()
                        local Targets = {}
                        for _, v in next, workspace.NPC:GetChildren() do
                            if v and v.Name ~= LocalPlayer.Name and Character and v.Name == "Minion" then
                                local Part = nil
                                if v:FindFirstChild("CandyCorn") then
                                    Part = v.CandyCorn
                                elseif v:FindFirstChildWhichIsA("BasePart") then
                                    Part = v:FindFirstChildWhichIsA("BasePart")
                                end
                                if Part then
                                    table.insert(Targets, { Model = v, Part = Part })
                                end
                            end
                        end
                        table.sort(Targets, function(a, b)
                            return PartSize(a.Part) < PartSize(b.Part)
                        end)
                        local BagFilled = false
                        for _, Entry in ipairs(Targets) do
                            local Model = Entry.Model
                            local Part = Entry.Part
                            local LastHit = 0
                            local StuckStart = os.clock()
                            while true do
                                if IsBagFull() then
                                    BagFilled = true
                                    break
                                end
                                local Valid = IsTargetValid(Model) and Part ~= nil and Part.Parent ~= nil and Character ~= nil and Character.Parent ~= nil
                                if not Valid then break end
                                if not Part.Parent then break end
                                if Model:GetAttribute("IsDead") == true then break end
                                if os.clock() - StuckStart > 11 then
                                    pcall(function() Model:Destroy() end)
                                    break
                                end
                                PositionAboveTarget(Part)
                                local Now = os.clock()
                                if Now - LastHit >= 0.15 then
                                    LastHit = Now
                                    for _, Remote in next, Character:GetDescendants() do
                                        if Remote and Remote:IsA("RemoteEvent") and Remote.Name == "Network" then
                                            pcall(function()
                                                if Remote.Parent and Remote.Parent:IsA("Tool") then
                                                    Remote.Parent:Activate()
                                                end
                                                Remote:FireServer("Hit", Part)
                                            end)
                                        end
                                    end
                                end
                                task.wait()
                            end
                            if BagFilled then break end
                        end
                        return BagFilled
                    end

                    while IsBagFull() do task.wait(0.5) end

                    local BagFilled = false
                    while not BagFilled do
                        if CountTargets() == 0 then
                            pcall(function()
                                if HumanoidRootPart and HumanoidRootPart.Parent then
                                    HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-math.pi / 2, 0, 0)
                                end
                            end)
                            OverrideVelocity()
                            while CountTargets() == 0 do
                                if IsBagFull() then
                                    BagFilled = true
                                    break
                                end
                                pcall(function()
                                    if HumanoidRootPart and HumanoidRootPart.Parent then
                                        HumanoidRootPart.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-math.pi / 2, 0, 0)
                                    end
                                end)
                                OverrideVelocity()
                                task.wait()
                            end
                            if BagFilled then break end
                        end
                        BagFilled = FarmOnce()
                        if not BagFilled then task.wait(0.5) end
                    end

                    if HumanoidRootPart and HumanoidRootPart.Parent then
                        TeleportToPosition(CFrame.new(-30, 11, 662), 2)
                    end
                end

                function StartDefending()
                    local DefenseActive = true
                    local IsTargetValid = function(Target)
                        if not Target or not Target.Parent then return false end
                        local Model = Target
                        if Target:IsA("BasePart") then Model = Target.Parent end
                        if Model and Model.GetAttribute and Model:GetAttribute("IsDead") == true then return false end
                        if Target.GetAttribute and Target:GetAttribute("IsDead") == true then return false end
                        return true
                    end
                    local PositionAboveTarget = function(Target, Height)
                        Height = Height or 12
                        if not HumanoidRootPart or not Target or not Target.Parent then return end
                        local TargetPos = Target.Position
                        local AbovePos = TargetPos + Vector3.new(0, Height, 0)
                        pcall(function()
                            HumanoidRootPart.CFrame = CFrame.lookAt(AbovePos, TargetPos)
                        end)
                        OverrideVelocity()
                    end
                    local HitTarget = function(Part)
                        if not Character or not Part or not Part.Parent then return end
                        for _, Remote in next, Character:GetDescendants() do
                            if Remote and Remote:IsA("RemoteEvent") and Remote.Name == "Network" then
                                pcall(function()
                                    if Remote.Parent and Remote.Parent:IsA("Tool") then
                                        Remote.Parent:Activate()
                                    end
                                    Remote:FireServer("Hit", Part)
                                end)
                            end
                        end
                    end
                    local GetDefendPos = function()
                        local Ok, Result = pcall(function()
                            local DropZone = workspace:FindFirstChild("DropZone")
                            if not DropZone then return nil end
                            local NpcFolder = DropZone:FindFirstChild("NPC")
                            if not NpcFolder then return nil end
                            local NpcModel = NpcFolder:FindFirstChild("NPC")
                            if not NpcModel then return nil end
                            return NpcModel.WorldPivot.Position
                        end)
                        return Ok and Result or nil
                    end
                    local HoldPost = function(DefendPos)
                        if not HumanoidRootPart or not HumanoidRootPart.Parent then return end
                        local PostPos = DefendPos + Vector3.new(0, 12, 0)
                        pcall(function()
                            HumanoidRootPart.CFrame = CFrame.lookAt(PostPos, DefendPos)
                        end)
                        OverrideVelocity()
                    end

                    pcall(function()
                        LocalPlayer.CharacterAdded:Connect(function(AddedCharacter)
                            DefenseActive = false
                        end)
                    end)

                    while DefenseActive do
                        local DefendPos = GetDefendPos()
                        if DefendPos then
                            local Chosen = nil
                            local ChosenDist = 80
                            for _, v in next, workspace.NPC:GetChildren() do
                                if v and v.Name == "Minion" and v.Name ~= LocalPlayer.Name
                                    and v:GetAttribute("IsDead") ~= true
                                then
                                    local Part = v:FindFirstChild("CandyCorn") or v:FindFirstChildWhichIsA("BasePart")
                                    if Part and Part.Parent then
                                        local Dist = (Part.Position - DefendPos).Magnitude
                                        if Dist <= 80 and Dist < ChosenDist then
                                            ChosenDist = Dist
                                            Chosen = { Model = v, Part = Part }
                                        end
                                    end
                                end
                            end
                            if Chosen then
                                local Model = Chosen.Model
                                local Part = Chosen.Part
                                local LastHit = 0
                                while DefenseActive and IsTargetValid(Model) and Part ~= nil and Part.Parent ~= nil
                                    and Character ~= nil and Character.Parent ~= nil
                                    and Model:GetAttribute("IsDead") ~= true do
                                    local CurDefendPos = GetDefendPos()
                                    if not CurDefendPos then break end
                                    if (Part.Position - CurDefendPos).Magnitude > 80 then break end
                                    PositionAboveTarget(Part, 12)
                                    local Now = os.clock()
                                    if Now - LastHit >= 0.15 then
                                        LastHit = Now
                                        HitTarget(Part)
                                    end
                                    task.wait()
                                end
                                if DefenseActive then
                                    local CurDefendPos = GetDefendPos()
                                    if CurDefendPos then
                                        HoldPost(CurDefendPos)
                                        task.wait()
                                    end
                                end
                            else
                                HoldPost(DefendPos)
                            end
                        end
                        task.wait()
                    end
                end

                function DepositCandy()
                    TeleportToPosition((CFrame.new(workspace.DropZone.DropZone.WorldPivot.Position) * CFrame.new(0, 10, 0)), 2)
                    task.wait(1)
                    workspace.DropZone.DropZone.ProximityPrompt.HoldDuration = 0
                    pcall(fireproximityprompt, workspace.DropZone.DropZone.ProximityPrompt)
                    task.wait(2)
                end

                function InteractWithCornifier()
                    TeleportToPosition((CFrame.new(workspace.DropZone.NPC.NPC.WorldPivot.Position) * CFrame.new(0, 10, 0)), 2)
                    task.wait(1)
                    workspace.DropZone.NPC.NPC.ProximityPrompt.HoldDuration = 0
                    pcall(fireproximityprompt, workspace.DropZone.NPC.NPC.ProximityPrompt)
                    task.wait(2)
                end

                function TakeSoulCandy()
                    TeleportToPosition((CFrame.new(workspace.EndSequence.SoulCandy.Model.Model.WorldPivot.Position) * CFrame.new(0, 10, 0)), 2)
                    task.wait(1)
                    workspace.EndSequence.SoulCandy.Model.Model:FindFirstChild("ProximityPrompt", true).HoldDuration = 0
                    pcall(fireproximityprompt, workspace.EndSequence.SoulCandy.Model.Model:FindFirstChild("ProximityPrompt", true))
                    task.wait(2)
                end

                function CollectGlove()
                    TeleportToPosition((CFrame.new(workspace.EndSequence.RevenantGlove.WorldPivot.Position) * CFrame.new(0, 10, 0)), 2)
                    task.wait(1)
                    workspace.EndSequence.RevenantGlove.glove.ProximityPrompt.HoldDuration = 0
                    while true do
                        pcall(fireproximityprompt, workspace.EndSequence.RevenantGlove.glove.ProximityPrompt)
                        task.wait(.667)
                    end
                end

                repeat task.wait() until Character:FindFirstChildWhichIsA("Tool") or LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
                StartFarming()
                for i = 1, 2 do DepositCandy() end
                StartDefending()
                task.wait(2)
                StartFarming()
                DepositCandy()
                StartFarming()
                for i = 1, 2 do DepositCandy() end
                StartDefending()
                task.wait(2)
                StartFarming()
                DepositCandy()
                StartFarming()
                DepositCandy()
                StartFarming()
                for i = 1, 2 do DepositCandy() end
                StartDefending()
                task.wait(20)
                TakeSoulCandy()
                task.spawn(function()
                    while true do
                        if workspace.DropZone.NPC.NPC:FindFirstChild("ProximityPrompt", true).Enabled == true then
                            pcall(fireproximityprompt, workspace.DropZone.NPC.NPC:FindFirstChild("ProximityPrompt", true))
                        end
                        task.wait(1.777)
                    end
                end)
                StartDefending()
                task.wait(2)
                task.spawn(function()
                    while true do
                        pcall(function()
                            fireproximityprompt(workspace.EndSequence.RevenantGlove:FindFirstChild("ProximityPrompt", true))
                        end)
                        task.wait(1.777)
                    end
                end)
            end)

            repeat task.wait() until
                workspace.Arena.Halloween_Decorations:FindFirstChild("TrickOrTreatTeleport", true).Counter.SurfaceGui.TextLabel.Text == "1"
                and workspace.Arena.Halloween_Decorations:FindFirstChild("TrickOrTreatTeleport", true).PlayerCounter.SurfaceGui.TextLabel.Text == "0/4 Players"
                and game:GetService("Players").LocalPlayer.Character
                and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
                and game:GetService("Players").LocalPlayer.Character.Humanoid.Health ~= 0

            TouchObject(workspace.Arena.Halloween_Decorations:FindFirstChild("TrickOrTreatTeleport", true).Hitbox)
        end

        local ok, err = pcall(AutoGetRevenant)
        if not ok then
            warn("[Revenant] error: " .. tostring(err))
        end
    end)
end


local Window

if placeId == 122902713960550 then
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Button = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")

    ScreenGui.Name = "SandGui"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
    MainFrame.Size = UDim2.new(0, 220, 0, 90)

    UICorner.Parent = MainFrame

    Button.Name = "AutoGetSandButton"
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Position = UDim2.new(0.08, 0, 0.2, 0)
    Button.Size = UDim2.new(0, 185, 0, 50)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = "Auto-Get sand"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 18

    UICorner_2.Parent = Button

    Button.MouseButton1Click:Connect(function()
        runAutoGetSand()
    end)

elseif placeId == 17290438723 then
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Button = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")

    ScreenGui.Name = "FrostbiteGui"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
    MainFrame.Size = UDim2.new(0, 220, 0, 90)

    UICorner.Parent = MainFrame

    Button.Name = "AutoGetFrostbiteButton"
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Position = UDim2.new(0.08, 0, 0.2, 0)
    Button.Size = UDim2.new(0, 185, 0, 50)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = "Auto-Get frostbite"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 18

    UICorner_2.Parent = Button

    Button.MouseButton1Click:Connect(function()
        runAutoGetFrostbite()
    end)

elseif placeId == 14422118326 then
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Title = Instance.new("TextLabel")
    local UICornerTitle = Instance.new("UICorner")

    ScreenGui.Name = "GlovesGui"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
    MainFrame.Size = UDim2.new(0, 220, 0, 200)
    MainFrame.Active = true
    MainFrame.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    UIPadding.PaddingTop = UDim.new(0, 8)
    UIPadding.PaddingBottom = UDim.new(0, 8)
    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.PaddingRight = UDim.new(0, 8)
    UIPadding.Parent = MainFrame

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 6)
    UIListLayout.Parent = MainFrame

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Title.Size = UDim2.new(1, 0, 0, 28)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Femboy Hub - Gloves"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.LayoutOrder = 0
    UICornerTitle.CornerRadius = UDim.new(0, 6)
    UICornerTitle.Parent = Title

    local function makeButton(labelText, layoutOrder)
        local btn = Instance.new("TextButton")
        local btnCorner = Instance.new("UICorner")
        btn.Parent = MainFrame
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.Size = UDim2.new(1, 0, 0, 42)
        btn.Font = Enum.Font.GothamSemibold
        btn.Text = labelText
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.LayoutOrder = layoutOrder
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        return btn
    end

    local btnNull = makeButton("Get Null", 1)
    local btnTinker = makeButton("Get Tinker", 2)
    local btnRob = makeButton("Get Rob Plushie", 3)

    local function tpAndInteract(targetCF)
        task.spawn(function()
            local char = lp.Character or lp.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart", 5)
            if not hrp then return end
            hrp.CFrame = targetCF
            task.wait(0.6)
            pcall(function()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        local parent = v.Parent
                        if parent and parent:IsA("BasePart") then
                            if (parent.Position - hrp.Position).Magnitude < 25 then
                                fireproximityprompt(v)
                                task.wait(0.05)
                            end
                        end
                    elseif v:IsA("ClickDetector") then
                        local parent = v.Parent
                        if parent and parent:IsA("BasePart") then
                            if (parent.Position - hrp.Position).Magnitude < 25 then
                                fireclickdetector(v)
                                task.wait(0.05)
                            end
                        end
                    end
                end
            end)
            task.wait(0.2)
            pcall(function()
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                        if (v.Position - hrp.Position).Magnitude < 12 then
                            firetouchinterest(hrp, v, 0)
                            task.wait(0.03)
                            firetouchinterest(hrp, v, 1)
                        end
                    end
                end
            end)
        end)
    end

    btnNull.MouseButton1Click:Connect(function()
        tpAndInteract(CFrame.new(5456.61, -189.00, 1853.98, -0.951, -0.000, 0.308, -0.000, 1.000, 0.000, -0.308, 0.000, -0.951))
    end)

    btnTinker.MouseButton1Click:Connect(function()
        tpAndInteract(CFrame.new(4834.91, -214.00, 802.50, 0.052, 0.000, 0.999, -0.000, 1.000, -0.000, -0.999, -0.000, 0.052))
    end)

    btnRob.MouseButton1Click:Connect(function()
        tpAndInteract(CFrame.new(5260.08, -139.20, 864.11, -0.717, 0.000, -0.697, 0.000, 1.000, 0.000, 0.697, -0.000, -0.717))
    end)

elseif placeId == 11828384869 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Counter & Elude",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Badges"})
    Tab:Button({
        Title = "Counter + Elude",
        Callback = function()
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                for i, v in next, workspace:GetDescendants() do
                    if v:IsA("ClickDetector") then fireclickdetector(v) end
                end
                humanoidRootPart:PivotTo(CFrame.new(0, 1500, 0))
                task.wait(1)
                humanoidRootPart.Anchored = true
                local timeLeft = 120
                for i = 1, 120 do
                    timeLeft = timeLeft - 1
                    local msg = Instance.new("Message", workspace)
                    msg.Text = "Seconds left to receive: " .. timeLeft
                    task.wait(1)
                    msg:Destroy()
                end
                task.wait(2)
                task.spawn(function()
                    while task.wait() do
                        if character and humanoidRootPart and workspace:FindFirstChild("Ruins") then
                            humanoidRootPart:PivotTo(workspace.Ruins.Elude.Glove.CFrame)
                        end
                    end
                end)
                task.wait(0.25)
                for i, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then fireclickdetector(v) end
                end
            end)
        end
    })
    Tab:Button({
        Title = "Get Alchemist Plushie",
        Callback = function()
            for i, v in next, workspace:GetDescendants() do
                if v:IsA("ClickDetector") then fireclickdetector(v) end
            end
        end
    })

elseif placeId == 18550498098 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Place 18550498098",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Auto-Get scripts"})

    Tab:Button({
        Title = "Avatar + Relude",
        Callback = function()
            local plrs = game:GetService("Players")
            local storage = game:GetService("ReplicatedStorage")
            local lp = plrs.LocalPlayer
            local function getChar()
                local char = lp.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then return char, hrp end
                end
            end
            local function freeze(hrp, enable)
                if not hrp then return end
                local bv = hrp:FindFirstChild("ServerHoldVelocity")
                if enable then
                    if not bv then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "ServerHoldVelocity"
                        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        bv.Velocity = Vector3.zero
                        bv.Parent = hrp
                    end
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                else
                    if bv then bv:Destroy() end
                end
            end
            task.spawn(function()
                local cf = CFrame.new(3249.47, -58.50, 821.98, 0.017, 0, -1, 0, 1, 0, 1, 0, 0.017)
                local t = tick()
                while tick() - t < 26 do
                    local _, hrp = getChar()
                    if hrp then hrp.CFrame = cf end
                    task.wait()
                end
            end)
            task.wait(5)
            for _, v in workspace:GetDescendants() do
                if v.Name == "ShackLever" then
                    local cd = v:FindFirstChildWhichIsA("ClickDetector")
                    if cd then
                        pcall(function()
                            for _ = 1, 10 do fireclickdetector(cd) task.wait(0.1) end
                        end)
                    end
                end
            end
            repeat task.wait(0.5)
            until workspace:FindFirstChild("Map")
              and workspace.Map:FindFirstChild("Components")
              and workspace.Map.Components:FindFirstChild("GuideNPC")
            local cf2 = CFrame.new(589.10, 189.86, -246.86, -1, 0, 0.012, 0, 1, -0.004, -0.012, -0.004, -1)
            task.spawn(function()
                while true do
                    local char, hrp = getChar()
                    if char and hrp then char:PivotTo(cf2) freeze(hrp, true) end
                    task.wait()
                end
            end)
            while task.wait(0.1) do
                local char, hrp = getChar()
                if char then
                    local item = lp.Backpack:FindFirstChild("Lantern")
                    if item then item.Parent = char end
                    pcall(function()
                        local remotes = storage:FindFirstChild("Remotes")
                        if remotes and remotes:FindFirstChild("Data") and remotes.Data:FindFirstChild("AnswerInCutscene") then
                            remotes.Data.AnswerInCutscene:FireServer("Spare")
                        end
                    end)
                    local lantern = char:FindFirstChild("Lantern")
                    if lantern then
                        lantern:Activate()
                        local net = lantern:FindFirstChild("Network")
                        if net then
                            for _, v in workspace:GetChildren() do
                                if v.Name == "PusherWall" and v:IsA("BasePart") then v.CanCollide = false
                                elseif v.Name == "golem" and v:FindFirstChild("Hitbox") then net:FireServer("Hit", v.Hitbox)
                                elseif (v.Name == "GuideNPC" or v.Name == "ReplicaNPC") and v:FindFirstChild("HumanoidRootPart") then net:FireServer("Hit", v.HumanoidRootPart)
                                elseif v.Name == "TrackGloveMissile" then net:FireServer("Hit", v)
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    Tab:Button({
        Title = "Avatar + Hunters",
        Callback = function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local function getChar()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
                    if char.Humanoid.Health > 0 then return char, char.HumanoidRootPart end
                end
                return nil, nil
            end
            local function setPhysicsFreeze(hrp, state)
                if not hrp then return end
                local bv = hrp:FindFirstChild("ServerHoldVelocity")
                if state then
                    if not bv then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "ServerHoldVelocity"
                        bv.MaxForce = Vector3.new(30000000, 30000000, 30000000)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = hrp
                    end
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                else
                    if bv then bv:Destroy() end
                end
            end
            task.spawn(function()
                local targetCFrame = CFrame.new(3249.47, -58.50, 821.98, 0.017, -0.000, -1.000, -0.000, 1.000, -0.000, 1.000, 0.000, 0.017)
                local start = tick()
                while tick() - start < 26 do
                    local char, hrp = getChar()
                    if char and hrp then hrp.CFrame = targetCFrame end
                    task.wait()
                end
            end)
            task.wait(5)
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "ShackLever" then
                    local detector = v:FindFirstChildWhichIsA("ClickDetector")
                    if detector then
                        pcall(function()
                            for i = 1, 10 do fireclickdetector(detector) task.wait(0.1) end
                        end)
                    end
                end
            end
            repeat task.wait(0.5)
            until workspace:FindFirstChild("Map")
              and workspace.Map:FindFirstChild("Components")
              and workspace.Map.Components:FindFirstChild("GuideNPC")
            local targetCFrame2 = CFrame.new(589.10, 189.86, -246.86, -1.000, 0.000, 0.012, 0.000, 1.000, -0.004, -0.012, -0.004, -1.000)
            task.spawn(function()
                while true do
                    local char, hrp = getChar()
                    if char and hrp then char:PivotTo(targetCFrame2) setPhysicsFreeze(hrp, true) end
                    task.wait()
                end
            end)
            while task.wait(0.1) do
                local char, hrp = getChar()
                if char then
                    local backpackLantern = LocalPlayer.Backpack:FindFirstChild("Lantern")
                    if backpackLantern then backpackLantern.Parent = char end
                    local lantern = char:FindFirstChild("Lantern")
                    if lantern then
                        lantern:Activate()
                        local network = lantern:FindFirstChild("Network")
                        if network then
                            for _, v in ipairs(workspace:GetChildren()) do
                                if v.Name == "PusherWall" and v:IsA("BasePart") then v.CanCollide = false end
                                if v.Name == "golem" and v:FindFirstChild("Hitbox") then network:FireServer("Hit", v.Hitbox) end
                                if (v.Name == "GuideNPC" or v.Name == "ReplicaNPC") and v:FindFirstChild("HumanoidRootPart") then network:FireServer("Hit", v.HumanoidRootPart) end
                                if v.Name == "TrackGloveMissile" then network:FireServer("Hit", v) end
                            end
                        end
                    end
                end
            end
        end
    })

    Tab:Button({
        Title = "Relude",
        Callback = function()
            local plrs = game:GetService("Players")
            local storage = game:GetService("ReplicatedStorage")
            local lp = plrs.LocalPlayer
            local function getChar()
                local char = lp.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then return char, hrp end
                end
            end
            local function freeze(hrp, enable)
                if not hrp then return end
                local bv = hrp:FindFirstChild("ServerHoldVelocity")
                if enable then
                    if not bv then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "ServerHoldVelocity"
                        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        bv.Velocity = Vector3.zero
                        bv.Parent = hrp
                    end
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                else
                    if bv then bv:Destroy() end
                end
            end
            local startCF = CFrame.new(3270.68, -227.50, 822.93, 0.580, 0.000, -0.814, -0.000, 1.000, 0.000, 0.814, 0.000, 0.580)
            local t0 = tick()
            while tick() - t0 < 0.5 do
                local char, hrp = getChar()
                if char and hrp then char:PivotTo(startCF) end
                task.wait()
            end
            task.spawn(function()
                local cf = CFrame.new(3249.47, -58.50, 821.98, 0.017, 0, -1, 0, 1, 0, 1, 0, 0.017)
                local t = tick()
                while tick() - t < 26 do
                    local _, hrp = getChar()
                    if hrp then hrp.CFrame = cf end
                    task.wait()
                end
            end)
            task.wait(5)
            for _, v in workspace:GetDescendants() do
                if v.Name == "ShackLever" then
                    local cd = v:FindFirstChildWhichIsA("ClickDetector")
                    if cd then
                        pcall(function()
                            for _ = 1, 10 do fireclickdetector(cd) task.wait(0.1) end
                        end)
                    end
                end
            end
            repeat task.wait(0.5)
            until workspace:FindFirstChild("Map")
              and workspace.Map:FindFirstChild("Components")
              and workspace.Map.Components:FindFirstChild("GuideNPC")
            local cf2 = CFrame.new(589.10, 189.86, -246.86, -1, 0, 0.012, 0, 1, -0.004, -0.012, -0.004, -1)
            task.spawn(function()
                while true do
                    local char, hrp = getChar()
                    if char and hrp then char:PivotTo(cf2) freeze(hrp, true) end
                    task.wait()
                end
            end)
            while task.wait(0.1) do
                local char, hrp = getChar()
                if char then
                    local item = lp.Backpack:FindFirstChild("Lantern")
                    if item then item.Parent = char end
                    pcall(function()
                        local remotes = storage:FindFirstChild("Remotes")
                        if remotes and remotes:FindFirstChild("Data") and remotes.Data:FindFirstChild("AnswerInCutscene") then
                            remotes.Data.AnswerInCutscene:FireServer("Spare")
                        end
                    end)
                    local lantern = char:FindFirstChild("Lantern")
                    if lantern then
                        lantern:Activate()
                        local net = lantern:FindFirstChild("Network")
                        if net then
                            for _, v in workspace:GetChildren() do
                                if v.Name == "PusherWall" and v:IsA("BasePart") then v.CanCollide = false
                                elseif v.Name == "golem" and v:FindFirstChild("Hitbox") then net:FireServer("Hit", v.Hitbox)
                                elseif (v.Name == "GuideNPC" or v.Name == "ReplicaNPC") and v:FindFirstChild("HumanoidRootPart") then net:FireServer("Hit", v.HumanoidRootPart)
                                elseif v.Name == "TrackGloveMissile" then net:FireServer("Hit", v)
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    Tab:Button({
        Title = "Hunters",
        Callback = function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local function getChar()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
                    if char.Humanoid.Health > 0 then return char, char.HumanoidRootPart end
                end
            end
            local function setPhysicsFreeze(hrp, state)
                if not hrp then return end
                local bv = hrp:FindFirstChild("ServerHoldVelocity")
                if state then
                    if not bv then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "ServerHoldVelocity"
                        bv.MaxForce = Vector3.new(30000000, 30000000, 30000000)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = hrp
                    end
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                else
                    if bv then bv:Destroy() end
                end
            end
            local initStart = tick()
            while tick() - initStart < 0.5 do
                local char, hrp = getChar()
                if char and hrp then
                    hrp.CFrame = CFrame.new(3270.68, -227.50, 822.93, 0.580, 0.000, -0.814, -0.000, 1.000, 0.000, 0.814, 0.000, 0.580)
                end
                task.wait()
            end
            task.spawn(function()
                local targetCFrame = CFrame.new(3249.47, -58.50, 821.98, 0.017, -0.000, -1.000, -0.000, 1.000, -0.000, 1.000, 0.000, 0.017)
                local start = tick()
                while tick() - start < 26 do
                    local char, hrp = getChar()
                    if char and hrp then hrp.CFrame = targetCFrame end
                    task.wait()
                end
            end)
            task.wait(5)
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "ShackLever" then
                    local detector = v:FindFirstChildWhichIsA("ClickDetector")
                    if detector then
                        pcall(function()
                            for i = 1, 10 do fireclickdetector(detector) task.wait(0.1) end
                        end)
                    end
                end
            end
            repeat task.wait(0.5)
            until workspace:FindFirstChild("Map")
              and workspace.Map:FindFirstChild("Components")
              and workspace.Map.Components:FindFirstChild("GuideNPC")
            local targetCFrame2 = CFrame.new(589.10, 189.86, -246.86, -1.000, 0.000, 0.012, 0.000, 1.000, -0.004, -0.012, -0.004, -1.000)
            task.spawn(function()
                while true do
                    local char, hrp = getChar()
                    if char and hrp then char:PivotTo(targetCFrame2) setPhysicsFreeze(hrp, true) end
                    task.wait()
                end
            end)
            while task.wait(0.1) do
                local char, hrp = getChar()
                if char then
                    local backpackLantern = LocalPlayer.Backpack:FindFirstChild("Lantern")
                    if backpackLantern then backpackLantern.Parent = char end
                    local lantern = char:FindFirstChild("Lantern")
                    if lantern then
                        lantern:Activate()
                        local network = lantern:FindFirstChild("Network")
                        if network then
                            for _, v in ipairs(workspace:GetChildren()) do
                                if v.Name == "PusherWall" and v:IsA("BasePart") then v.CanCollide = false end
                                if v.Name == "golem" and v:FindFirstChild("Hitbox") then network:FireServer("Hit", v.Hitbox) end
                                if (v.Name == "GuideNPC" or v.Name == "ReplicaNPC") and v:FindFirstChild("HumanoidRootPart") then network:FireServer("Hit", v.HumanoidRootPart) end
                                if v.Name == "TrackGloveMissile" then network:FireServer("Hit", v) end
                            end
                        end
                    end
                end
            end
        end
    })

elseif placeId == 128229958211947 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Shellbert",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Shellbert"})
    Tab:Button({
        Title = "Auto-Get Shellbert",
        Callback = function()
            local char = lp.Character or lp.CharacterAdded:Wait()
            local HumanoidRootPart = char:WaitForChild("HumanoidRootPart", 5)
            local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
            if not remotes then return end
            for i = 1, 3 do
                pcall(function()
                    remotes.Cutscene.OnComplete:FireServer("Scene1")
                    task.wait(0.1)
                    remotes.PhaseTransition.Switch:FireServer()
                    task.wait(0.1)
                    remotes.PhaseTransition.Finished:FireServer()
                    task.wait(0.1)
                    remotes.Cutscene.OnLoaded:FireServer("Scene2")
                    task.wait(0.1)
                    remotes.Cutscene.OnComplete:FireServer("Scene2")
                    task.wait(0.1)
                    remotes.GloveReward.Replicate:FireServer()
                    task.wait(0.1)
                end)
            end
            task.wait(2)
            if HumanoidRootPart then
                for i = 1, 50 do
                    if Workspace:FindFirstChild("RewardGlove") and Workspace.RewardGlove:FindFirstChild("RewardGlove") then
                        HumanoidRootPart:PivotTo(Workspace.RewardGlove.RewardGlove.CFrame)
                    end
                    task.wait(0.05)
                end
            end
        end
    })

elseif placeId == 89837553336708 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Suction",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Suction"})
    Tab:Button({
        Title = "Auto-Get suction",
        Callback = function() runSuctionCode() end
    })

elseif placeId == 74169485398268 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Bind",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Bind"})
    Tab:Button({
        Title = "Auto-Get bind",
        Callback = function()
            task.spawn(function()
                local orb = workspace:FindFirstChild("Orb")
                if orb then
                    local cd = orb:FindFirstChildWhichIsA("ClickDetector")
                    if cd then
                        for i = 1, 10 do fireclickdetector(cd) end
                    end
                end
            end)
        end
    })

elseif placeId == 129665246576996 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Eggler",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Eggler"})
    Tab:Button({
        Title = "Auto-Get eggler",
        Callback = function()
            local char = lp.Character or lp.CharacterAdded:Wait()
            local folder = workspace:FindFirstChild("TrialCompletedPoints")
            if char and char:FindFirstChild("HumanoidRootPart") and folder then
                local cf = char.HumanoidRootPart.CFrame
                for i = 1, 3 do
                    local trial = folder:FindFirstChild("Trial " .. i)
                    if trial and trial:FindFirstChild("root") then
                        trial.root.CFrame = cf
                    end
                end
            end
        end
    })
    Tab:Button({
        Title = "Auto-Get Shellbert",
        Callback = function()
            local tpdata = (queue_on_teleport or queueonteleport)
            local code = [[
                for i=1,3 do
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Cutscene"):WaitForChild("OnComplete"):FireServer("Scene1")
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PhaseTransition"):WaitForChild("Switch"):FireServer()
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PhaseTransition"):WaitForChild("Finished"):FireServer()
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Cutscene"):WaitForChild("OnLoaded"):FireServer("Scene2")
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Cutscene"):WaitForChild("OnComplete"):FireServer("Scene2")
                    task.wait(0.1)
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GloveReward"):WaitForChild("Replicate"):FireServer()
                    task.wait(0.1)
                end
                task.wait(2)
                local char = game:GetService("Players").LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for i=1,50 do
                        if workspace:FindFirstChild("RewardGlove") then
                            char.HumanoidRootPart:PivotTo(workspace.RewardGlove.RewardGlove.CFrame)
                        end
                        task.wait(0.05)
                    end
                end
            ]]
            if tpdata then
                pcall(function() tpdata((GlobalTPData or "") .. code) end)
            end
            task.spawn(function()
                local remotes = ReplicatedStorage:WaitForChild("Remotes", 5)
                if not remotes then return end
                for i = 1, 50 do
                    pcall(function()
                        remotes.FourthTrialTeleport:FireServer()
                        remotes.InviteFriends.PlayWithParty:FireServer()
                        remotes.InviteFriends.CancelPartyTeleport:FireServer()
                    end)
                    task.wait(0.2)
                end
            end)
        end
    })

elseif placeId == 106620300132058 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Plate ID",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Plate"})
    Tab:Button({
        Title = "Plate",
        Callback = function()
            local RED_COLOR = Color3.fromRGB(255, 0, 0)
            local function cleanAndNoclip()
                local character = lp.Character
                if not character then return end
                for _, part in pairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if part.Color == RED_COLOR then pcall(function() part:Destroy() end) end
                        if part:IsDescendantOf(character) then part.CanCollide = false end
                    end
                end
            end
            RunService.Stepped:Connect(cleanAndNoclip)
        end
    })

elseif placeId == 97220865182663 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Rat Place",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Rats"})
    Tab:Button({
        Title = "Instail kills rat",
        Callback = function()
            _G.KillRatsInstantly = true
            task.spawn(function()
                while _G.KillRatsInstantly do
                    pcall(function()
                        for _, rat in ipairs(game.Workspace.Game.Enemies:GetChildren()) do
                            if rat.Name == 'Rat' and rat:FindFirstChild('Humanoid') then
                                rat.Humanoid.Health = 0
                            end
                        end
                    end)
                    task.wait()
                end
            end)
        end
    })
    Tab:Button({
        Title = "auto Master Whiskers Potion",
        Callback = function()
            _G.AutoPotion = true
            task.spawn(function()
                while _G.AutoPotion do
                    game:GetService('ReplicatedStorage').Remotes.UnlockGloveWithOrbs:FireServer()
                    task.wait(0.2)
                end
            end)
        end
    })

elseif placeId == 113228834069218 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Penguin / Fish",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Quest"})
    Tab:Button({
        Title = "collect all fish",
        Callback = function()
            local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            for i, v in workspace.Fih:GetChildren() do
                if v:FindFirstChild("Fish") then
                    firetouchinterest(hrp, v.Fish, 0)
                    firetouchinterest(hrp, v.Fish, 1)
                end
            end
            task.wait(0.5)
            firetouchinterest(hrp, workspace.FinishPart, 0)
        end
    })

elseif placeId == 86643839793301 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Quests",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Quests"})
    Tab:Button({
        Title = "Teleport to Alex's quest",
        Callback = function() game:GetService("TeleportService"):Teleport(95356852680586) end
    })
    Tab:Button({
        Title = "Teleport to Sam quest",
        Callback = function() game:GetService("TeleportService"):Teleport(113228834069218) end
    })

elseif placeId == 95356852680586 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Snowman",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Snowman"})
    Tab:Button({
        Title = "Build a snowman",
        Callback = function()
            local lp = game:GetService("Players").LocalPlayer
            local char = lp.Character
            local hrp = char.HumanoidRootPart
            local fpp = function(proximity, sec)
                hrp.CFrame = proximity.Parent:GetPivot()
                task.wait(sec or 1)
                fireproximityprompt(proximity)
            end
            local acc = {}
            for i, v in workspace.Snowman.Models.DisplaySnowman.Accessories:GetDescendants() do
                if v.Name == "Handle" and v.Transparency == 0 then
                    table.insert(acc, workspace.Accessories:FindFirstChild(v.Parent.Name).ProximityPrompt)
                end
            end
            local playerSnowman = workspace.Snowman.Models.PlayerSnowman.ProximityPrompt
            fpp(workspace.Interactables.SnowObject.ProximityPrompt, 0.5)
            char.Humanoid:EquipTool(lp.Backpack:WaitForChild("Snow"))
            for i = 1, 3 do fpp(playerSnowman) end
            for i, v in acc do fpp(v, 0.5) fpp(playerSnowman) end
        end
    })

elseif placeId == 7234087065 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - ID 7234087065",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Fan & Riftshot"})
    Tab:Button({
        Title = "Auto-Get Fan",
        Callback = function()
            local character = lp.Character or lp.CharacterAdded:Wait()
            local HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
            if not HumanoidRootPart then return end
            for i = 1, 50 do
                if workspace:FindFirstChild("QuestStuff") and workspace.QuestStuff:FindFirstChild("Key") then
                    HumanoidRootPart:PivotTo(workspace.QuestStuff.Key.CFrame)
                end
                task.wait(0.02)
            end
            task.wait(1.5)
            local remotes = ReplicatedStorage:FindFirstChild("RemoteEvents")
            if remotes then
                pcall(function()
                    remotes.SuitUpClown:FireServer()
                    task.wait(0.25)
                    remotes.KeyQuest:FireServer()
                    task.wait(0.25)
                    remotes.KeyAcquired:FireServer()
                    task.wait(0.25)
                    remotes.GOHOME:FireServer()
                    task.wait(0.25)
                    remotes.KeyBadgeReward:FireServer()
                end)
            end
        end
    })
    Tab:Button({
        Title = "Auto-Get Riftshot",
        Callback = function()
            pcall(function()
                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    lp.Character.HumanoidRootPart.CFrame = CFrame.new(-260, 16, 477)
                    task.wait(0.8)
                    if ReplicatedStorage:FindFirstChild("RemoteEvents") and ReplicatedStorage.RemoteEvents:FindFirstChild("TargetPractice") then
                        ReplicatedStorage.RemoteEvents.TargetPractice.OnComplete:FireServer()
                    end
                    lp.Character.HumanoidRootPart.CFrame = CFrame.new(-260, 16, 477)
                    task.wait(1)
                    if ReplicatedStorage:FindFirstChild("RemoteEvents") and ReplicatedStorage.RemoteEvents:FindFirstChild("TargetPractice") then
                        ReplicatedStorage.RemoteEvents.TargetPractice.OnComplete:FireServer()
                    end
                end
            end)
        end
    })
    Tab:Button({
        Title = "Auto Boxing Gloves",
        Callback = function()
            local targetCFrame = CFrame.new(4231.91, 3505.89, 269.59, 0.993, -0.000, 0.120, 0.000, 1.000, 0.000, -0.120, -0.000, 0.993)
            local character = lp.Character or lp.CharacterAdded:Wait()
            character:PivotTo(targetCFrame)
            task.wait(1.5)
            if workspace:FindFirstChild("BoxingGloves") and workspace.BoxingGloves:FindFirstChild("ClickDetector") then
                fireclickdetector(workspace.BoxingGloves.ClickDetector)
            end
        end
    })
    Tab:Button({
        Title = "Auto-Get UTG",
        Callback = function()
            local targetCFrame = CFrame.new(-1233.92, 9900.16, 704.24, 0.936, -0.000, -0.352, 0.000, 1.000, 0.000, 0.352, -0.000, 0.936)
            if placeId == 115782629143468 then
                local character = lp.Character or lp.CharacterAdded:Wait()
                character:PivotTo(targetCFrame)
            else
                TeleportService:Teleport(115782629143468, lp)
            end
        end
    })
    Tab:Button({
        Title = "Auto-Get Clock",
        Callback = function()
            local character = lp.Character or lp.CharacterAdded:Wait()
            local HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
            if not HumanoidRootPart then return end
            local tpdata = (queue_on_teleport or queueonteleport)
            if tpdata then
                pcall(function()
                    tpdata((GlobalTPData or '') .. ' for i=1,2 do for i,v in ipairs(workspace:GetDescendants()) do if v.ClassName == "ClickDetector" then fireclickdetector(v) end end task.wait(2.5) end while task.wait() do game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:PivotTo(CFrame.new(26.34,4,-1.84)) end')
                end)
            end
            task.wait(.5)
            for i = 1, 100 do
                task.wait(0.1)
                if workspace:FindFirstChild("Buildings") and workspace.Buildings:FindFirstChild("wizard twoer") and workspace.Buildings["wizard twoer"]:FindFirstChild("Cone") then
                    HumanoidRootPart:PivotTo(workspace.Buildings["wizard twoer"].Cone.CFrame * CFrame.new(0,15,0))
                end
            end
        end
    })
    Tab:Button({
        Title = "Auto-Get Metaverse",
        Callback = function()
            local p = game:GetService("Players").LocalPlayer
            local c = p.Character or p.CharacterAdded:Wait()
            local h = c:WaitForChild("HumanoidRootPart")
            local q = queue_on_teleport or queueonteleport
            if q then
                q([[
                    local p = game:GetService("Players").LocalPlayer
                    local c = p.Character or p.CharacterAdded:Wait()
                    local h = c:WaitForChild("HumanoidRootPart")
                    local pf = (game.UserInputService.TouchEnabled and not game.UserInputService.MouseEnabled) and "Mobile" or "PC"
                    task.wait(2)
                    fireclickdetector(workspace.Kitchen.Fridge.HitBox.ClickDetector)
                    fireclickdetector(workspace.Kitchen.Fridge.GrantAward.ClickDetector)
                    task.wait(.25)
                    fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
                    task.wait(10)
                    fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
                    task.wait(1)
                    fireclickdetector(workspace.Microwave.Brewzucki.ClickDetector)
                    repeat task.wait() until p.Backpack:FindFirstChild("Brewzucki")
                    if p.Backpack:FindFirstChild("Brewzucki") then p.Backpack["Brewzucki"].Parent = c end
                    c["Brewzucki"]:Activate()
                    task.wait(3)
                    if p.Backpack:FindFirstChild("Brewzucki") then p.Backpack["Brewzucki"].Parent = c end
                    repeat task.wait() until c:FindFirstChild("Brewzucki")
                    c["Brewzucki"]:Destroy()
                    task.wait(2)
                    fireclickdetector(workspace.BasementTable.HitBox.ClickDetector)
                    task.wait(15)
                    h.CFrame = workspace.ComputerChair.Seat.CFrame
                    task.wait(5)
                    game:GetService("ReplicatedStorage").Remotes.ComputerState:FireServer("Victory")
                    task.wait(.25)
                    game:GetService("ReplicatedStorage").Remotes.ComputerState:Destroy()
                    if p.PlayerGui:FindFirstChild("RealComputerScreenGui") then p.PlayerGui.RealComputerScreenGui.Enabled = false end
                    c.Humanoid.Sit = false
                    task.wait(1.5)
                    h.CFrame = CFrame.new(-14, 37, 49)
                    task.wait(2)
                    repeat
                        task.wait()
                        if pf == "Mobile" then
                            local sa = p.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea
                            if sa:FindFirstChild("TapLabel") then
                                sa.TapLabel.Size = UDim2.new(10000, 0, 10000, 0)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                            end
                        else
                            local ql = p.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel
                            if ql.Visible == true then
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, ql.Text, false, game:GetService("VirtualInputManager"))
                                task.wait()
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, ql.Text, false, game:GetService("VirtualInputManager"))
                            end
                        end
                    until p.PlayerGui.DavidShrineQTE.DavidShrineQTE.ScoreLabel.Text == "Score: 150"
                ]])
            end
            task.spawn(function()
                while task.wait() do
                    local b = workspace.Buildings:FindFirstChild("wizard twoer 2")
                    if b and b:FindFirstChild("Model") and b.Model:FindFirstChild("Trigger") then
                        h:PivotTo(b.Model.Trigger.CFrame)
                    end
                end
            end)
        end
    })

elseif placeId == 136005148166028 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Metaverse ID",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Metaverse"})
    Tab:Button({
        Title = "Auto-Get Metaverse",
        Callback = function()
            local p = game:GetService("Players").LocalPlayer
            local c = p.Character or p.CharacterAdded:Wait()
            local h = c:WaitForChild("HumanoidRootPart")
            local q = queue_on_teleport or queueonteleport
            if q then
                q([[
                    local p = game:GetService("Players").LocalPlayer
                    local c = p.Character or p.CharacterAdded:Wait()
                    local h = c:WaitForChild("HumanoidRootPart")
                    local pf = (game.UserInputService.TouchEnabled and not game.UserInputService.MouseEnabled) and "Mobile" or "PC"
                    task.wait(2)
                    fireclickdetector(workspace.Kitchen.Fridge.HitBox.ClickDetector)
                    fireclickdetector(workspace.Kitchen.Fridge.GrantAward.ClickDetector)
                    task.wait(.25)
                    fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
                    task.wait(10)
                    fireclickdetector(workspace.Microwave.HitBox.ClickDetector)
                    task.wait(1)
                    fireclickdetector(workspace.Microwave.Brewzucki.ClickDetector)
                    repeat task.wait() until p.Backpack:FindFirstChild("Brewzucki")
                    if p.Backpack:FindFirstChild("Brewzucki") then p.Backpack["Brewzucki"].Parent = c end
                    c["Brewzucki"]:Activate()
                    task.wait(3)
                    if p.Backpack:FindFirstChild("Brewzucki") then p.Backpack["Brewzucki"].Parent = c end
                    repeat task.wait() until c:FindFirstChild("Brewzucki")
                    c["Brewzucki"]:Destroy()
                    task.wait(2)
                    fireclickdetector(workspace.BasementTable.HitBox.ClickDetector)
                    task.wait(15)
                    h.CFrame = workspace.ComputerChair.Seat.CFrame
                    task.wait(5)
                    game:GetService("ReplicatedStorage").Remotes.ComputerState:FireServer("Victory")
                    task.wait(.25)
                    game:GetService("ReplicatedStorage").Remotes.ComputerState:Destroy()
                    if p.PlayerGui:FindFirstChild("RealComputerScreenGui") then p.PlayerGui.RealComputerScreenGui.Enabled = false end
                    c.Humanoid.Sit = false
                    task.wait(1.5)
                    h.CFrame = CFrame.new(-14, 37, 49)
                    task.wait(2)
                    repeat
                        task.wait()
                        if pf == "Mobile" then
                            local sa = p.PlayerGui.DavidShrineQTE.DavidShrineQTE.Mobile.SpawnArea
                            if sa:FindFirstChild("TapLabel") then
                                sa.TapLabel.Size = UDim2.new(10000, 0, 10000, 0)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                            end
                        else
                            local ql = p.PlayerGui.DavidShrineQTE.DavidShrineQTE.PC.QuickTimeLabel
                            if ql.Visible == true then
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, ql.Text, false, game:GetService("VirtualInputManager"))
                                task.wait()
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, ql.Text, false, game:GetService("VirtualInputManager"))
                            end
                        end
                    until p.PlayerGui.DavidShrineQTE.DavidShrineQTE.ScoreLabel.Text == "Score: 150"
                ]])
            end
            task.spawn(function()
                while task.wait() do
                    local b = workspace.Buildings:FindFirstChild("wizard twoer 2")
                    if b and b:FindFirstChild("Model") and b.Model:FindFirstChild("Trigger") then
                        h:PivotTo(b.Model.Trigger.CFrame)
                    end
                end
            end)
        end
    })

elseif placeId == 115782629143468 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - UTG ID",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "UTG"})
    Tab:Button({
        Title = "Auto-Get UTG",
        Callback = function()
            local targetCFrame = CFrame.new(-1233.92, 9900.16, 704.24, 0.936, -0.000, -0.352, 0.000, 1.000, 0.000, 0.352, -0.000, 0.936)
            local character = lp.Character or lp.CharacterAdded:Wait()
            character:PivotTo(targetCFrame)
        end
    })

elseif placeId == 118650724506449 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Snowroller",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Snowroller"})
    Tab:Button({
        Title = "Auto-Get snowroller",
        Callback = function()
            local character = lp.Character or lp.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            hrp.CFrame = CFrame.new(59.134, 44.207, 187.602, -1.000, 0.000, -0.031, 0.000, 1.000, 0.000, 0.031, 0.000, -1.000)
        end
    })

elseif placeId == 79885102123162 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Collector"})
    Tab:Button({
        Title = "Auto-Get Collector",
        Callback = function()
            task.spawn(function()
                local function touch(part)
                    if part and firetouchinterest then
                        local char = lp.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            firetouchinterest(hrp, part, 0)
                            task.wait(0.1)
                            firetouchinterest(hrp, part, 1)
                        end
                    end
                end
                local hexaPath = Workspace:FindFirstChild("Map")
                    and Workspace.Map:FindFirstChild("obstacle/puzzles")
                    and Workspace.Map["obstacle/puzzles"]:FindFirstChild("CastleIsland")
                    and Workspace.Map["obstacle/puzzles"].CastleIsland:FindFirstChild("Hexa_Path")
                if hexaPath then
                    for _, v in ipairs(hexaPath:GetChildren()) do
                        if v and v:IsA("BasePart") then v.Size = Vector3.new(100, 1, 100) end
                    end
                end
                repeat
                    task.wait(0.2)
                    local gloveLocation = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("GloveLocation")
                    if gloveLocation then
                        for _, location in ipairs(gloveLocation:GetChildren()) do
                            if location then
                                local targetPart = location:FindFirstChildWhichIsA("BasePart", true)
                                local char = lp.Character or lp.CharacterAdded:Wait()
                                local hrp = char:FindFirstChild("HumanoidRootPart")
                                if hrp and targetPart then hrp.CFrame = targetPart.CFrame end
                                task.wait(5)
                                for _, glove in ipairs(location:GetChildren()) do
                                    if glove then
                                        local solved = glove:GetAttribute("Solved")
                                        local visible = glove:GetAttribute("Visible")
                                        local touchTarget = glove:GetChildren()[1]
                                        if (solved ~= nil and solved == false) and visible == false then
                                            glove:SetAttribute("Solved", true)
                                            task.wait(1)
                                            touch(touchTarget)
                                        elseif (solved == nil or solved == true) and visible == true then
                                            touch(touchTarget)
                                        else
                                            continue
                                        end
                                    end
                                end
                            end
                        end
                    end
                until BadgeService:UserHasBadgeAsync(lp.UserId, 1902849233175110)
            end)
        end
    })

elseif placeId == 132277598079047 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Slender"})
    Tab:Button({
        Title = "Collection Pages",
        Callback = function()
            task.spawn(function()
                local folder = Workspace:WaitForChild("Pages", 10)
                if folder then
                    for _, obj in ipairs(folder:GetChildren()) do
                        if obj:FindFirstChild("Part") and obj.Part:FindFirstChildWhichIsA("ProximityPrompt") then
                            local char = lp.Character or lp.CharacterAdded:Wait()
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = obj.Part.CFrame
                                task.wait(0.2)
                                fireproximityprompt(obj.Part.ProximityPrompt)
                                task.wait(0.5)
                            end
                        end
                    end
                end
            end)
        end
    })

elseif placeId == 101113181694564 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Conker",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Conker"})
    Tab:Button({
        Title = "Auto-Get conker",
        Callback = function()
            runAutoGetConkerNew()
        end
    })

elseif placeId == 125845699717230 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Doorkeeper",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Doorkeeper"})
    Tab:Button({
        Title = "Auto-Get doorkeeper",
        Callback = function()
            task.spawn(function()
                while task.wait(0.1) do
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "ClickDetector" then
                            pcall(function()
                                fireclickdetector(v)
                            end)
                        end
                    end
                end
            end)
        end
    })

elseif placeId == 93981091811742 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Lotus",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "Lotus"})
    Tab:Button({
        Title = "Get lotus",
        Callback = function()
            runAutoGetLotus()
        end
    })

elseif placeId == 77283826005207 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - G-X ID",
        ConfigurationSaving = { Enabled = false }
    })
    local Tab = Window:Tab({Title = "G-X"})
    Tab:Button({
        Title = "Auto-Get G-X",
        Callback = function()
            local localPlayer = Players.LocalPlayer
            local function touchPart(part)
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") and part then
                    character.HumanoidRootPart.CFrame = part.CFrame
                    if firetouchinterest then
                        firetouchinterest(character.HumanoidRootPart, part, 0)
                        task.wait(0.05)
                        firetouchinterest(character.HumanoidRootPart, part, 1)
                    end
                end
            end
            task.spawn(function()
                task.wait(math.random(130, 170) / 10)
                local map = Workspace:WaitForChild("Map", 10)
                if not map then return end
                local lobby = map:WaitForChild("Lobby", 10)
                if not lobby then return end
                for i = 1, 3 do
                    local portal = lobby:FindFirstChild("Portal" .. i)
                    local part = portal and portal:FindFirstChild("Part")
                    if part then
                        touchPart(part)
                        local startTime = tick()
                        repeat task.wait() until map:FindFirstChild("Challenge" .. i) or (tick() - startTime > 10)
                        task.wait(math.random(8, 14) / 10)
                        local challenge = map:FindFirstChild("Challenge" .. i)
                        if challenge then
                            local redButton = challenge:FindFirstChild("RedButton")
                            local button = redButton and redButton:FindFirstChild("Button")
                            local detector = button and button:FindFirstChild("ClickDetector")
                            if detector then fireclickdetector(detector) end
                        end
                        startTime = tick()
                        repeat task.wait() until not map:FindFirstChild("Challenge" .. i) or (tick() - startTime > 15)
                    end
                    task.wait(math.random(9, 16) / 10)
                end
                local endPortalParent = lobby:FindFirstChild("EndPortal")
                local endPortalPart = endPortalParent and endPortalParent:FindFirstChild("Portal")
                if endPortalPart then touchPart(endPortalPart) end
            end)
        end
    })

elseif placeId == 13833961666 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - The Eternal Bob",
        ConfigurationSaving = { Enabled = false }
    })
    _G.AutoSlapBobBoss = false
    _G.AutoTycoon = false
    _G.SlapBobClone = false
    local GloveSlap = "Tycoon"
    local TabAuto = Window:Tab({Title = "Auto Scripts"})
    TabAuto:Toggle({
        Title = "Auto Slap BobBoss",
        Value = false,
        Flag = "AutoSlapBobBoss",
        Callback = function(Value)
            _G.AutoSlapBobBoss = Value
            if Value then
                task.spawn(function()
                    while _G.AutoSlapBobBoss do
                        pcall(function()
                            local Event = game:GetService("Workspace").bobBoss.DamageEvent
                            Event:FireServer()
                        end)
                        task.wait()
                    end
                end)
            end
        end
    })
    TabAuto:Toggle({
        Title = "Auto Click Tycoon",
        Value = false,
        Flag = "AutoTycoon",
        Callback = function(Value)
            _G.AutoTycoon = Value
            if Value then
                task.spawn(function()
                    while _G.AutoTycoon do
                        pcall(function()
                            for _, v in pairs(workspace:GetChildren()) do
                                if string.find(v.Name, "Tycoon") and v:FindFirstChild("Click") then
                                    local cd = v.Click:FindFirstChildWhichIsA("ClickDetector")
                                    if cd then fireclickdetector(cd, 0) fireclickdetector(cd, 1) end
                                end
                            end
                        end)
                        task.wait()
                    end
                end)
            end
        end
    })
    TabAuto:Toggle({
        Title = "Slap Bob Clone",
        Value = false,
        Flag = "SlapBobClone",
        Callback = function(Value)
            _G.SlapBobClone = Value
            if Value then
                task.spawn(function()
                    while _G.SlapBobClone do
                        pcall(function()
                            if game.Workspace:FindFirstChild("BobClone") then
                                for _, v in pairs(workspace:GetChildren()) do
                                    if v.Name == "BobClone" then
                                        local hrp = v:FindFirstChild("HumanoidRootPart")
                                        if hrp then
                                            if GloveSlap == "Killstreak" then game:GetService("ReplicatedStorage").KSHit:FireServer(hrp)
                                            elseif GloveSlap == "Reaper" then game:GetService("ReplicatedStorage").ReaperHit:FireServer(hrp)
                                            elseif GloveSlap == "God's Hand" then game:GetService("ReplicatedStorage").Godshand:FireServer(hrp)
                                            elseif GloveSlap == "Tycoon" then game:GetService("ReplicatedStorage").GeneralHit:FireServer(hrp)
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                        task.wait(0.7)
                    end
                end)
            end
        end
    })
    TabAuto:Dropdown({
        Title = "Glove for Slap Bob Clone",
        Values = {"Tycoon", "Killstreak", "Reaper", "God's Hand"},
        Default = Tycoon,
                Flag = "GloveSlapDropdown",
        Callback = function(Selected)
            GloveSlap = Selected[1] or Selected
        end
    })
    local TabTp = Window:Tab({Title = "Teleport"})
    local TeleportLocations = {
        {Name = "Arena",          CF = CFrame.new(0,    5,  0)},
        {Name = "Lobby",          CF = CFrame.new(0,    5,  100)},
        {Name = "Hunter Room",    CF = CFrame.new(100,  5,  0)},
        {Name = "Brazil",         CF = CFrame.new(-100, 5,  0)},
        {Name = "Island Slapple", CF = CFrame.new(0,    5, -100)},
        {Name = "Plate",          CF = CFrame.new(200,  5,  0)},
    }
    for _, loc in ipairs(TeleportLocations) do
        local locCF = loc.CF
        TabTp:Button({
            Title = loc.Name,
            Callback = function()
                local char = lp.Character or lp.CharacterAdded:Wait()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = locCF end
            end
        })
    end

elseif placeId == 80420091630966 then

    local lighting = game:GetService("Lighting")
    local _OldLighting = {
        Brightness    = lighting.Brightness,
        ClockTime     = lighting.ClockTime,
        FogEnd        = lighting.FogEnd,
        FogStart      = lighting.FogStart,
        GlobalShadows = lighting.GlobalShadows,
        OutdoorAmbient = lighting.OutdoorAmbient,
    }

    local oldCF = nil
    local AreaBoss = nil
    local NotificationUnSh = false
    local _CooldownProximityConn = nil
    local _FlyConn = nil

    local function Fly(enabled)
        _G.StartFly = enabled
        local char = lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end

        if enabled then
            hum.PlatformStand = true

            local flyBV = Instance.new("BodyVelocity")
            flyBV.Name = "MortisHubFlyBV"
            flyBV.Velocity = Vector3.zero
            flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            flyBV.Parent = hrp

            local flyBAV = Instance.new("BodyAngularVelocity")
            flyBAV.Name = "MortisHubFlyBAV"
            flyBAV.AngularVelocity = Vector3.zero
            flyBAV.MaxTorque = Vector3.new(1e4, 1e4, 1e4)
            flyBAV.Parent = hrp

            if _FlyConn then _FlyConn:Disconnect() end
            _FlyConn = RunService.Heartbeat:Connect(function()
                if not _G.StartFly then
                    if flyBV and flyBV.Parent then flyBV:Destroy() end
                    if flyBAV and flyBAV.Parent then flyBAV:Destroy() end
                    hum.PlatformStand = false
                    _FlyConn:Disconnect()
                    return
                end

                local speed = tonumber(_G.SetSpeedFly) or 50
                local cam = workspace.CurrentCamera
                local vel = Vector3.zero

                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0, 1, 0) end

                if flyBV and flyBV.Parent then
                    flyBV.Velocity = vel.Magnitude > 0 and vel.Unit * speed or Vector3.zero
                end
            end)
        else
            _G.StartFly = false
            local existBV = hrp:FindFirstChild("MortisHubFlyBV")
            local existBAV = hrp:FindFirstChild("MortisHubFlyBAV")
            if existBV then existBV:Destroy() end
            if existBAV then existBAV:Destroy() end
            hum.PlatformStand = false
            if _FlyConn then _FlyConn:Disconnect() _FlyConn = nil end
        end
    end

    local function CreateFreezeBV(opts)
        opts = opts or {}
        local char = lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if opts.Remove then
            local bv = hrp:FindFirstChild("MortisFreezeBV")
            if bv then bv:Destroy() end
            return
        end

        if not hrp:FindFirstChild("MortisFreezeBV") then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "MortisFreezeBV"
            bv.Velocity = Vector3.zero
            bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bv.Parent = hrp
        end
    end

    _G.StartFly = false
    _G.SetSpeedFly = 50

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.R then
            _G.StartFly = not _G.StartFly
            Fly(_G.StartFly)
        end
    end)

    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Boss Mortis",
        ConfigurationSaving = { Enabled = false }
    })

    local TabRound = Window:Tab({Title = "Rounds"})
    local TabBoss = Window:Tab({Title = "Boss"})

    TabRound:Section({Title = "Round 1"})

    TabRound:Toggle({
        Title = "Auto Slap Snoob",
        Value = false,
        Flag = "MortisAutoSlapSnoob",
        Callback = function(Value)
            _G.AutoSlapMortis = Value
            task.spawn(function()
                while _G.AutoSlapMortis do
                    if workspace:FindFirstChild("TheOutside") then
                        for _, v in pairs(workspace.TheOutside:GetChildren()) do
                            if v.Name == "evilSnoob" and v:FindFirstChild("hittable") then
                                local char = lp.Character
                                if char and char:FindFirstChild("Lantern") and char.Lantern:FindFirstChild("Network") then
                                    char.Lantern.Network:FireServer("Hit", v.hittable)
                                    char.Lantern:Activate()
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    })

    TabRound:Button({
        Title = "Get Key",
        Callback = function()
            task.spawn(function()
                for _, v in pairs(workspace:GetChildren()) do
                    if v:IsA("Tool") and v.Name:find("Key") and v:FindFirstChild("Handle") and v:FindFirstChild("KeyClient") then
                        repeat
                            task.wait()
                            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                                lp.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                            end
                        until not v:IsDescendantOf(workspace)
                    end
                end
                task.wait(0.1)
                local gate = workspace:FindFirstChild("GateMechanism")
                if gate and gate:FindFirstChild("Touchpad") and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    lp.Character.HumanoidRootPart.CFrame = gate.Touchpad.CFrame
                end
            end)
        end
    })

    TabRound:Button({
        Title = "Teleport Portal",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local outside = workspace:FindFirstChild("TheOutside")
                if outside and outside:FindFirstChild("TowerENT1") and outside.TowerENT1:FindFirstChild("teleport") then
                    char.HumanoidRootPart.CFrame = outside.TowerENT1.teleport.CFrame
                end
            end
        end
    })

    TabRound:Section({Title = "Round 2"})

    TabRound:Button({
        Title = "Fix Elevator",
        Callback = function()
            task.spawn(function()
                local char = lp.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end

                if not char:FindFirstChild("Screwdriver") and not lp.Backpack:FindFirstChild("Screwdriver") then
                    repeat
                        task.wait()
                        if workspace:FindFirstChild("Screwdriver") then
                            char.HumanoidRootPart.CFrame = workspace.Screwdriver.CFrame
                        end
                    until not workspace:FindFirstChild("Screwdriver")
                end

                task.wait(0.3)
                local clickable = workspace:FindFirstChild("Clickable")
                if clickable and clickable:FindFirstChild("boltClick") then
                    char.HumanoidRootPart.CFrame = clickable.boltClick.CFrame
                end

                WindUI:Notify({
                    Title = "Fix Elevator",
                    Content = "Teleported to bolt — click to fix!",
                    Duration = 5
                })
            end)
        end
    })

    TabRound:Button({
        Title = "Teleport Eli Vator",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local dialogue = workspace:FindFirstChild("DialoguePrompts")
                if dialogue and dialogue:FindFirstChild("Eli Vator") then
                    char.HumanoidRootPart.CFrame = dialogue["Eli Vator"].Camera.CFrame
                    task.wait(0.4)
                    local prompt = dialogue["Eli Vator"]:FindFirstChild("ProximityPrompt")
                    if prompt then fireproximityprompt(prompt) end
                end
            end
        end
    })

    TabRound:Section({Title = "Round 3"})

    TabRound:Button({
        Title = "Teleport Hammer Big",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local office = workspace:FindFirstChild("TheOffice")
                if office then
                    local section = office:FindFirstChild("HallwaySection3")
                    if section then
                        local box = section:FindFirstChild("LargeHammerBox1")
                        if box then
                            local hammer = box:FindFirstChild("Large Hammer")
                            if hammer then
                                char.HumanoidRootPart.CFrame = hammer.CFrame * CFrame.new(0, 0, 5)
                                task.wait(0.4)
                                local prompt = hammer:FindFirstChild("ProximityPrompt")
                                if prompt then fireproximityprompt(prompt) end
                            end
                        end
                    end
                end
            end
        end
    })

    TabRound:Button({
        Title = "Teleport Hook",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local office = workspace:FindFirstChild("TheOffice")
                if office then
                    local section = office:FindFirstChild("HallwaySection3")
                    if section then
                        for _, v in pairs(section:GetChildren()) do
                            if v.Name == "GlassShowcase1" then
                                for _, z in pairs(v:GetChildren()) do
                                    if z.Name == "Hook" then
                                        local prompt = z:FindFirstChild("ProximityPrompt")
                                        if prompt then
                                            char.HumanoidRootPart.CFrame = z.CFrame
                                            task.wait(0.4)
                                            fireproximityprompt(prompt)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    TabRound:Button({
        Title = "Teleport Glasses",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local office = workspace:FindFirstChild("TheOffice")
                if office and office:FindFirstChild("toIndoor") then
                    char.HumanoidRootPart.CFrame = office.toIndoor.CFrame
                end
            end
        end
    })

    TabRound:Button({
        Title = "Grappler",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local office = workspace:FindFirstChild("TheOffice")
                if office then
                    local scaffold = office:FindFirstChild("Scaffold")
                    if scaffold then
                        local grappler = scaffold:FindFirstChild("Grappler")
                        if grappler then
                            local parts = grappler:FindFirstChild("GrapplingParts")
                            if parts then
                                for _, v in pairs(parts:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        pcall(function()
                                            ReplicatedStorage:WaitForChild("Remotes")
                                                :WaitForChild("TheOffice")
                                                :WaitForChild("GrapplerHook")
                                                :WaitForChild("onActivated")
                                                :FireServer(v)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    })

    TabBoss:Section({Title = "Boss Dice"})

    TabBoss:Toggle({
        Title = "Anti Glare Wire",
        Value = false,
        Flag = "MortisAntiGlare",
        Callback = function(Value)
            _G.AntiGlare = Value
            task.spawn(function()
                while _G.AntiGlare do
                    local char = lp.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("WeldConstraint") then
                        pcall(function()
                            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ProcessJump"):FireServer()
                        end)
                    end
                    task.wait()
                end
            end)
        end
    })

    TabBoss:Toggle({
        Title = "Anti Touch Head",
        Value = false,
        Flag = "MortisAntiHead",
        Callback = function(Value)
            _G.AntiHead = Value
            task.spawn(function()
                while _G.AntiHead do
                    local storage = workspace:FindFirstChild("bossStorage")
                    if storage and storage:FindFirstChild("head") then
                        storage.head.CanTouch = false
                    end
                    task.wait()
                end
                local storage = workspace:FindFirstChild("bossStorage")
                if storage and storage:FindFirstChild("head") then
                    storage.head.CanTouch = true
                end
            end)
        end
    })

    TabBoss:Toggle({
        Title = "Auto Slap Left Hand",
        Value = false,
        Flag = "MortisAutoSlapLeft",
        Callback = function(Value)
            _G.AutoSlap = Value
            task.spawn(function()
                while _G.AutoSlap do
                    local char = lp.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Lantern") then
                        local storage = workspace:FindFirstChild("bossStorage")
                        if storage and storage:FindFirstChild("leftHand") then
                            local lh = storage.leftHand
                            if lh:FindFirstChild("PointerMimic") and lh.PointerMimic:FindFirstChild("TouchInterest") then
                                char.Lantern:Activate()
                                char.HumanoidRootPart.CFrame = lh.PointerMimic.CFrame * CFrame.new(0, 0, 6.8)
                            end
                        end
                    end
                    task.wait()
                end
            end)
            if Value and not NotificationUnSh then
                NotificationUnSh = true
                WindUI:Notify({
                    Title = "Auto Slap Left Hand",
                    Content = "Turn off Shiftlock, stand still, and dodge the attack hand!",
                    Duration = 10
                })
            end
        end
    })

    TabBoss:Toggle({
        Title = "Auto Slap Nail",
        Value = false,
        Flag = "MortisNailSlap",
        Callback = function(Value)
            _G.NailSlap = Value
            task.spawn(function()
                while _G.NailSlap do
                    _G.TeleportSafe = false

                    local storage = workspace:FindFirstChild("bossStorage")
                    if storage and storage:FindFirstChild("head") then
                        storage.head.CanTouch = false
                    end

                    local core = workspace:FindFirstChild("BossfightCore")
                    if core and core:FindFirstChild("BossTargetArea") then
                        AreaBoss = core.BossTargetArea
                    end

                    if storage then
                        for _, v in pairs(storage:GetChildren()) do
                            if (v.Name:find("thicc") or v.Name == "nail") and v:FindFirstChild("object") then
                                local char = lp.Character
                                if char and char:FindFirstChild("Lantern") then
                                    local animCtrl = v:FindFirstChild("AnimationController")
                                    if animCtrl and animCtrl:FindFirstChild("Animator") then
                                        local tracks = animCtrl.Animator:GetPlayingAnimationTracks()
                                        if #tracks == 0 then
                                            if char:FindFirstChild("HumanoidRootPart") then
                                                char.HumanoidRootPart.CFrame = v.object.CFrame * CFrame.new(0, -10, 0)
                                                char.Lantern:Activate()
                                            end
                                        else
                                            _G.TeleportSafe = true
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if _G.TeleportSafe and AreaBoss then
                        local char = lp.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = AreaBoss.CFrame * CFrame.new(0, 100, 0)
                        end
                        if not _G.StartFly then
                            CreateFreezeBV()
                        end
                    elseif not _G.TeleportSafe then                        CreateFreezeBV({ Remove = true })
                    end

                    task.wait()
                end

                local storage = workspace:FindFirstChild("bossStorage")
                if storage and storage:FindFirstChild("head") then
                    storage.head.CanTouch = _G.AntiHead or false
                end
                CreateFreezeBV({ Remove = true })
            end)
        end
    })

    TabBoss:Button({
        Title = "PickUp C4",
        Callback = function()
            task.spawn(function()
                local char = lp.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                oldCF = char.HumanoidRootPart.CFrame
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "C4" then
                        char.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.4)
                        local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                        if prompt then fireproximityprompt(prompt) end
                        v.Destroying:Wait()
                    end
                end
                task.wait(0.4)
                char = lp.Character
                if char and char:FindFirstChild("HumanoidRootPart") and oldCF then
                    char.HumanoidRootPart.CFrame = oldCF
                end
            end)
        end
    })

    TabBoss:Button({
        Title = "Install C4",
        Callback = function()
            task.spawn(function()
                local char = lp.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                oldCF = char.HumanoidRootPart.CFrame
                local ghosts = workspace:FindFirstChild("ExplosiveGhosts")
                if ghosts then
                    for _, v in pairs(ghosts:GetChildren()) do
                        if v:IsA("BasePart") and not v:FindFirstChild("SurfaceAppearance") then
                            local c4 = lp.Backpack:FindFirstChild("C4")
                            if c4 then
                                char.Humanoid:EquipTool(c4)
                            end
                            task.wait(0.3)
                            char.HumanoidRootPart.CFrame = v.CFrame
                            task.wait(0.4)
                            local prompt = v:FindFirstChildOfClass("ProximityPrompt")
                            if prompt then fireproximityprompt(prompt) end
                            task.wait(0.3)
                            char = lp.Character
                            if char and char:FindFirstChild("HumanoidRootPart") and oldCF then
                                char.HumanoidRootPart.CFrame = oldCF
                            end
                            task.wait(0.5)
                        end
                    end
                end
            end)
        end
    })

    TabBoss:Button({
        Title = "Pickup Bomb",
        Callback = function()
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local bomb = workspace:FindFirstChild("BombGlove")
                if bomb and bomb:FindFirstChild("Glove") then
                    char.HumanoidRootPart.CFrame = bomb.Glove.CFrame
                    task.wait(0.4)
                    local prompt = bomb.Glove:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then fireproximityprompt(prompt) end
                end
            end
        end
    })

    TabBoss:Section({Title = "Misc"})

    TabBoss:Toggle({
        Title = "No Cooldown Proximity",
        Value = false,
        Flag = "MortisNoCooldownProx",
        Callback = function(Value)
            _G.NoCooldownProximity = Value
            if Value then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        v.HoldDuration = 0
                    end
                end
            end
            if _CooldownProximityConn then
                _CooldownProximityConn:Disconnect()
                _CooldownProximityConn = nil
            end
            _CooldownProximityConn = workspace.DescendantAdded:Connect(function(item)
                if _G.NoCooldownProximity and item:IsA("ProximityPrompt") then
                    item.HoldDuration = 0
                end
            end)
        end
    })

    TabBoss:Input({
        Title = "Fly Speed",
        Default = "50",
                Placeholder = "Enter fly speed...",
        Callback = function(Value)
            _G.SetSpeedFly = tonumber(Value) or 50
        end
    })

    TabBoss:Toggle({
        Title = "Start Fly  [R to toggle]",
        Value = false,
        Flag = "MortisStartFly",
        Callback = function(Value)
            Fly(Value)
        end
    })

    TabBoss:Toggle({
        Title = "Full Bright",
        Value = false,
        Flag = "MortisFullBright",
        Callback = function(Value)
            _G.FullBright = Value
            if Value then
                lighting.Brightness    = 2
                lighting.ClockTime     = 14
                lighting.FogEnd        = 200000
                lighting.FogStart      = 100000
                lighting.GlobalShadows = false
                lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            else
                for prop, val in pairs(_OldLighting) do
                    lighting[prop] = val
                end
            end
        end
    })

    for _, prop in ipairs({"Brightness","ClockTime","FogEnd","FogStart","GlobalShadows","OutdoorAmbient"}) do
        lighting:GetPropertyChangedSignal(prop):Connect(function()
            if _G.FullBright then
                local newVals = {
                    Brightness = 2, ClockTime = 14, FogEnd = 200000,
                    FogStart = 100000, GlobalShadows = false,
                    OutdoorAmbient = Color3.fromRGB(128,128,128)
                }
                lighting[prop] = newVals[prop]
            end
        end)
    end

    TabBoss:Toggle({
        Title = "No Fog",
        Value = false,
        Flag = "MortisNoFog",
        Callback = function(Value)
            _G.MortisNoFog = Value
            task.spawn(function()
                while _G.MortisNoFog do
                    for _, v in pairs(lighting:GetChildren()) do
                        if v.ClassName == "Atmosphere" then
                            v.Density = 0
                            v.Haze = 0
                        end
                    end
                    task.wait()
                end
                for _, v in pairs(lighting:GetChildren()) do
                    if v.ClassName == "Atmosphere" then
                        v.Density = 0.3
                        v.Haze = 1
                    end
                end
            end)
        end
    })

elseif placeId == 82340649038345 then
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub - Revenant",
        ConfigurationSaving = { Enabled = false }
    })

    local Tab = Window:Tab({Title = "Revenant"})

    Tab:Button({
        Title = "Auto-Get Revenant (by nexer)",
        Callback = function()
            runAutoGetRevenant()
        end
    })

else
    Window = WindUI:CreateWindow({
        Title = "Femboy Hub",
        ConfigurationSaving = { Enabled = true, FolderName = "FemboyHubConfig", FileName = "Config" }
    })

    local currentJob = game.JobId
    local req = (syn and syn.request) or (http and http.request) or http_request or request

    local function hop()
        if not req then return TeleportService:Teleport(placeId, lp) end
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Desc&limit=100"
        local res = req({Url = url, Method = "GET"})
        if res and res.Body then
            local data = HttpService:JSONDecode(res.Body)
            if data and data.data then
                for _, server in pairs(data.data) do
                    if server.id ~= currentJob and server.playing < server.maxPlayers then
                        local success = pcall(function()
                            TeleportService:TeleportToPlaceInstance(placeId, server.id, lp)
                        end)
                        if success then return end
                    end
                end
            end
        end
        TeleportService:Teleport(placeId, lp)
    end

    local Tab1 = Window:Tab({Title = "Slap Battles Badges"})

    Tab1:Button({
        Title = "Auto-Get Alchemist",
        Callback = function()
            runAutoGetAlchemist()
        end
    })

    Tab1:Button({
        Title = "Auto-Get sand",
        Callback = function()
            runAutoGetSand()
        end
    })

    Tab1:Button({
        Title = "Auto-Get frostbite",
        Callback = function()
            runAutoGetFrostbite()
        end
    })

    Tab1:Button({
        Title = "Free Recall",
        Callback = function()
            runFreeRecall()
        end
    })

    Tab1:Button({
        Title = "Auto-Get camera (Nothing is needed)",
        Callback = function()
            runAutoGetCamera()
        end
    })

    Tab1:Button({
        Title = "Auto-Get conker",
        Callback = function()
            runAutoGetConkerNew()
        end
    })

    Tab1:Button({
        Title = "Auto-Get Catseye",
        Callback = function()
            runAutoGetCatseye()
        end
    })

    Tab1:Button({
        Title = "Auto-Get Revenant (by nexer)",
        Callback = function()
            runAutoGetRevenant()
        end
    })

    Tab1:Button({ Title = "Auto-Get G-X", Callback = function() TeleportService:Teleport(77283826005207) end })
    Tab1:Button({ Title = "Auto-Get Counter + Elude", Callback = function() TeleportService:Teleport(11828384869, lp) end })
    Tab1:Button({ Title = "Auto-Get penguin", Callback = function() TeleportService:Teleport(113228834069218) end })

    Tab1:Button({
        Title = "Auto-Get mouse (request el gato)",
        Callback = function()
            pcall(function()
                local equip = debug.getupvalues(require(game.ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                equip:FireServer("el gato")
                task.wait(0.5)
                fireclickdetector(workspace.Arena.Cheese.ClickDetector)
            end)
        end
    })

    Tab1:Button({
        Title = "[REDACTED] ( Requires 5000 Slaps)",
        Callback = function()
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                if character:FindFirstChild("entered") then return end
                for i = 1, 10 do
                    local pocketDim = workspace:FindFirstChild("PocketDimension")
                    local doors = pocketDim and pocketDim:FindFirstChild("Doors")
                    local door = doors and doors:FindFirstChild(tostring(i))
                    if door then
                        firetouchinterest(character.HumanoidRootPart, door, 0)
                        firetouchinterest(character.HumanoidRootPart, door, 1)
                    end
                    task.wait(1)
                    if humanoid.Health ~= 0 then
                        humanoid.Health = 0
                        break
                    else
                        task.wait(3)
                        character = player.Character or player.CharacterAdded:Wait()
                        humanoid = character:WaitForChild("Humanoid")
                        character:WaitForChild("HumanoidRootPart")
                    end
                end
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Link",
        Callback = function()
            pcall(function()
                local equip = debug.getupvalues(require(game.ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                equip:FireServer("Error")
            end)
        end
    })

    Tab1:Button({ Title = "Auto-Get bind", Callback = function() TeleportService:Teleport(74169485398268) end })
    Tab1:Button({ Title = "Auto-Get suction", Callback = function() runSuctionCode() end })

    Tab1:Button({
        Title = "Auto-Get lag",
        Callback = function()
            pcall(function()
                if ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("celestial") then
                    ReplicatedStorage.Events.celestial:FireServer("air_time_guy")
                end
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get the schlob",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    local LocalPlayer = lp
                    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                    local Humanoid = Character:WaitForChild("Humanoid")
                    local equip = debug.getupvalues(require(ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                    local function getLatestCloud()
                        local latest = nil
                        for _, v in pairs(Workspace:GetChildren()) do
                            if v.Name:find("_Cloud") and v:FindFirstChild("VehicleSeat") then latest = v end
                        end
                        return latest
                    end
                    HumanoidRootPart:PivotTo(CFrame.new(243, -16, 0))
                    task.wait(0.3)
                    equip:FireServer("Cloud")
                    task.wait(0.2)
                    ReplicatedStorage.CloudAbility:FireServer()
                    task.wait(0.3)
                    HumanoidRootPart:PivotTo(CFrame.new(243.14, -15.72, -8.10, 1, 0, -0.021, 0, 1, 0, 0.021, 0, 1))
                    task.wait(0.2)
                    equip:FireServer("fish")
                    task.wait(0.3)
                    HumanoidRootPart:PivotTo(CFrame.new(120, 360, -3))
                    local cloudModel = nil
                    local seat = nil
                    for i = 1, 20 do
                        local cloud = getLatestCloud()
                        if cloud and cloud:FindFirstChild("VehicleSeat") then
                            cloudModel = cloud
                            seat = cloud.VehicleSeat
                            break
                        end
                        task.wait(0.1)
                    end
                    if seat then
                        repeat
                            HumanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 2, 0)
                            seat:Sit(Humanoid)
                            task.wait(0.1)
                        until Humanoid.Sit == true
                    end
                    task.wait(0.8)
                    local targetCloudCFrame = CFrame.new(196.48, 147.59, 88.80, 0.234, 0.000, 0.972, -0.000, 1.000, 0.000, -0.972, -0.000, 0)
                end)
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get voodoo",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    local equip = debug.getupvalues(require(game.ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                    equip:FireServer("Ghost")
                    task.wait(0.2)
                    local Event = game:GetService("ReplicatedStorage").Ghostinvisibilityactivated
                    Event:FireServer()
                end)
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get fish",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local equip = debug.getupvalues(require(game.ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                    equip:FireServer("ZZZZZZZ")
                    task.wait(0.1)
                    local Event = game:GetService("ReplicatedStorage").ZZZZZZZSleep
                    Event:FireServer()
                    task.wait(0.5)
                    local targetCFrame = CFrame.new(61345.22514, -5.1729, -55.3795, -0.0262, -0.0000, -0.9997, -0.0000, 1.0000, -0.0000, 0.9997, 0.0000, -0.0262)
                    local char = player.Character
                    if not char then return end
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    hrp.CFrame = targetCFrame
                    task.wait(7)
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("Accessory") then
                            local p = part:IsA("Accessory") and part:FindFirstChildWhichIsA("BasePart") or part
                            if p then
                                p.Transparency = p:IsA("BasePart") and p.Transparency or 0
                                p.LocalTransparencyModifier = 0
                                p.Anchored = true
                                p.CanCollide = false
                                p.CFrame = targetCFrame
                            end
                        end
                    end
                    for _, acc in ipairs(char:GetChildren()) do
                        if acc:IsA("Accessory") then
                            local handle = acc:FindFirstChild("Handle")
                            if handle and handle:IsA("BasePart") then
                                handle.Anchored = true
                                handle.CanCollide = false
                                handle.CFrame = targetCFrame
                            end
                        end
                    end
                    char:PivotTo(targetCFrame)
                end)
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get lotus",
        Callback = function()
            runAutoGetLotus()
        end
    })

    Tab1:Button({
        Title = "Auto-Get Tycoon",
        Callback = function()
            runAutoGetTycoon()
        end
    })

    Tab1:Button({
        Title = "Teleport Brazil",
        Callback = function()
            local char = lp.Character or lp.CharacterAdded:Wait()
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local portal = workspace:FindFirstChild("Lobby") and workspace.Lobby:FindFirstChild("brazil") and workspace.Lobby.brazil:FindFirstChild("portal")
            if hrp and portal then
                hrp.CFrame = portal.CFrame
            end
        end
    })

    Tab1:Button({
        Title = "Auto-Get Plank",
        Callback = function()
            task.spawn(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local Workspace = game:GetService("Workspace")

                local player = Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local rootPart = character:WaitForChild("HumanoidRootPart")
                local humanoid = character:WaitForChild("Humanoid")

                local function teleportTo(cf)
                    rootPart.CFrame = cf
                end

                local fort = Workspace.Lobby.Fort
                local clickDetector = fort:FindFirstChildOfClass("ClickDetector")
                if not clickDetector then
                    for _, v in ipairs(fort:GetDescendants()) do
                        if v:IsA("ClickDetector") then
                            clickDetector = v
                            break
                        end
                    end
                end

                if clickDetector then
                    fireclickdetector(clickDetector)
                end

                task.wait(0.5)

                teleportTo(CFrame.new(-1309.2385, 328.2168, 3.8135, -0.0138, 0.0102, 0.9999, 0.0022, 0.9999, -0.0101, -0.9999, 0.0021, -0.0139))
                task.wait(0.6)

                teleportTo(CFrame.new(-363.9898, 77.8639, 14.7980, -0.1823, -0.0000, -0.9833, -0.0000, 1.0000, -0.0000, 0.9833, 0.0000, -0.1823))
                task.wait(0.6)

                ReplicatedStorage.Fortlol:FireServer()
                task.wait(0.6)

                teleportTo(CFrame.new(-354.3725, 89.3643, 16.5186, 0.8527, -0.0000, -0.5224, 0.0000, 1.0000, -0.0000, 0.5224, -0.0000, 0.8527))

                task.wait(4)
                humanoid.Health = 0
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Water",
        Callback = function()
            task.spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local AlchemistEvent = ReplicatedStorage:WaitForChild("AlchemistEvent")

                local function brew(items, mixes)
                    AlchemistEvent:FireServer("BrewPotion")
                    for _, item in ipairs(items) do
                        AlchemistEvent:FireServer("AddItem", item)
                    end
                    task.wait(0.15)
                    for _, mix in ipairs(mixes) do
                        AlchemistEvent:FireServer("MixItem", mix)
                    end
                    task.wait(0.15)
                    AlchemistEvent:FireServer("BrewPotion")
                end

                brew(
                    {"Mushroom", "Blue Crystal", "Jade Stone", "Plane Flower"},
                    {"Mushroom", "Mushroom", "Blue Crystal", "Blue Crystal", "Jade Stone", "Plane Flower"}
                )
                brew(
                    {"Mushroom", "Hazel Lily"},
                    {"Mushroom", "Hazel Lily", "Hazel Lily"}
                )
                brew(
                    {"Mushroom", "Hazel Lily", "Jade Stone"},
                    {"Mushroom", "Mushroom", "Hazel Lily", "Jade Stone"}
                )
                brew(
                    {"Blue Crystal", "Glowing Mushroom", "Elder Wood", "Plane Flower"},
                    {"Plane Flower", "Plane Flower", "Elder Wood", "Glowing Mushroom", "Blue Crystal"}
                )
                brew(
                    {"Red Crystal", "Wild Vine", "Dark Root"},
                    {"Red Crystal", "Red Crystal", "Wild Vine", "Dark Root"}
                )
                brew(
                    {"Hazel Lily", "Blue Crystal", "Dark Root"},
                    {"Hazel Lily", "Blue Crystal", "Blue Crystal", "Dark Root"}
                )
                brew(
                    {"Wild Vine", "Blood Rose", "Dark Root", "Elder Wood", "Jade Stone"},
                    {"Wild Vine", "Wild Vine", "Wild Vine", "Blood Rose", "Dark Root", "Elder Wood", "Jade Stone"}
                )
                brew(
                    {"Hazel Lily", "Plane Flower"},
                    {"Hazel Lily", "Plane Flower", "Plane Flower"}
                )
                brew(
                    {"Dark Root", "Blood Rose", "Glowing Mushroom"},
                    {"Dark Root", "Dark Root", "Blood Rose", "Glowing Mushroom", "Glowing Mushroom"}
                )
                brew(
                    {"Dark Root", "Blood Rose", "Wild Vine", "Red Crystal"},
                    {"Dark Root", "Dark Root", "Blood Rose", "Wild Vine", "Red Crystal"}
                )
                brew(
                    {"Blue Crystal", "Elder Wood", "Red Crystal"},
                    {"Elder Wood", "Elder Wood", "Elder Wood", "Red Crystal", "Blue Crystal"}
                )
                brew(
                    {"Glowing Mushroom", "Red Crystal"},
                    {"Glowing Mushroom", "Glowing Mushroom", "Red Crystal"}
                )
                brew(
                    {"Blue Crystal", "Mushroom"},
                    {"Blue Crystal", "Blue Crystal", "Blue Crystal", "Mushroom"}
                )
                brew(
                    {"Red Crystal", "Cake Mix"},
                    {"Red Crystal", "Red Crystal", "Cake Mix"}
                )
                brew(
                    {"Cake Mix"},
                    {"Cake Mix"}
                )
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Bob (need Counter by nexer)",
        Callback = function()
            task.spawn(function()
                local LocalPlayer, LP = game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer
                local Character, Char
                local HumanoidRootPart, HRP
                local Humanoid, Hum
                pcall(function()
                    Character, Char = LocalPlayer.Character, LocalPlayer.Character
                end)
                pcall(function()
                    HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
                end)
                pcall(function()
                    Humanoid, Hum = Character.Humanoid, Character.Humanoid
                end)

                if identifyexecutor and (string.find(identifyexecutor(), "Xeno") or string.find(identifyexecutor(), "Solara")) then
                    local FixedFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Fix.lua"))()
                    getgenv().fireclickdetector = FixedFunctions.fireclickdetector
                    getgenv().fireproximityprompt = FixedFunctions.fireproximityprompt
                end

                local SelectGlove = function(g)
                    repeat task.wait(.1)
                        fireclickdetector(workspace.Lobby[g]:FindFirstChildWhichIsA("ClickDetector", true))
                    until LocalPlayer.leaderstats.Glove.Value == g
                    task.wait(.1)
                end

                local msghint = Instance.new("Hint")
                msghint.Parent = game:GetService("CoreGui")
                msghint.Text = "Getting ready... (1/4)"

                if workspace:FindFirstChild("ÅBOB_" .. LocalPlayer.Name) then
                    workspace["ÅBOB_" .. LocalPlayer.Name]:Destroy()
                end

                task.spawn(function()
                    repeat task.wait()
                        HumanoidRootPart:PivotTo(CFrame.new(-125, -5, 121))
                        task.wait()
                    until Humanoid.Health == 0
                end)

                task.wait(2.5)
                msghint.Text = "Getting ready... (2/4)"
                SelectGlove("Counter")
                game:GetService("ReplicatedStorage").Counter:FireServer()
                repeat task.wait() until Character.isInArena.Value == true

                msghint.Text = "Getting ready... (3/4)"
                SelectGlove("Screwdriver")
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                task.wait(1)

                msghint.Text = "Getting ready... (4/4)"
                SelectGlove("Replica")

                local msghint2 = Instance.new("Hint")
                msghint2.Parent = game:GetService("CoreGui")
                msghint2.Text = "Waiting for bob... ( Just wait, can take 30+ seconds )"

                game:GetService("RunService").RenderStepped:Connect(function()
                    game:GetService("GuiService"):ClearError()
                    pcall(function()
                        game:GetService("CoreGui").RobloxLoadingGUI:Destroy()
                    end)
                end)

                for i = 1, 200000 do
                    game:GetService("ReplicatedStorage").Duplicate:FireServer(true)
                end

                repeat task.wait() until workspace:FindFirstChild("ÅBOB_" .. LocalPlayer.Name)
                msghint2.Text = "Bob appeared. Rejoining to revert lags..."
                task.wait(3)

                while task.wait(.05) do
                    task.spawn(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
                    end)
                end
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Trap",
        Callback = function()
            task.spawn(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")

                local LocalPlayer = Players.LocalPlayer
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local Humanoid = Character:WaitForChild("Humanoid")
                local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

                if Character:FindFirstChild("entered") then return end

                local equip = debug.getupvalues(require(ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                equip:FireServer("Brick")
                task.wait(0.5)

                local portal = workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
                HumanoidRootPart.CFrame = portal.CFrame
                task.wait(0.5)
                firetouchinterest(HumanoidRootPart, portal, 0)
                task.wait(0.1)
                firetouchinterest(HumanoidRootPart, portal, 1)
                task.wait(2)

                HumanoidRootPart:PivotTo(CFrame.new(3000, 3000, 3000))
                task.wait(1.5)
                HumanoidRootPart.Anchored = true

                task.spawn(function()
                    if getconnections then
                        pcall(function()
                            for _, v in next, getconnections(LocalPlayer.Idled) do
                                if v.Disable then v:Disable() end
                            end
                        end)
                    end
                end)

                local FarmBricks = true
                local brickRemote = ReplicatedStorage:WaitForChild("lbrick")

                task.spawn(function()
                    while FarmBricks do
                        pcall(function() brickRemote:FireServer() end)
                        task.wait(0.05)
                    end
                end)

                local gui = Instance.new("ScreenGui")
                gui.Name = "TrapTimer"
                gui.IgnoreGuiInset = true
                gui.ResetOnSpawn = false
                gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                gui.DisplayOrder = 999
                gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(0, 200, 0, 40)
                frame.Position = UDim2.new(0.5, -100, 0, 50)
                frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                frame.BackgroundTransparency = 0.2
                frame.BorderSizePixel = 0
                frame.Parent = gui

                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 6)
                corner.Parent = frame

                local barBg = Instance.new("Frame")
                barBg.Size = UDim2.new(1, -20, 0, 4)
                barBg.Position = UDim2.new(0, 10, 1, -10)
                barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                barBg.BorderSizePixel = 0
                barBg.Parent = frame

                local barCornerBg = Instance.new("UICorner")
                barCornerBg.CornerRadius = UDim.new(1, 0)
                barCornerBg.Parent = barBg

                local barFill = Instance.new("Frame")
                barFill.Size = UDim2.new(1, 0, 1, 0)
                barFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                barFill.BorderSizePixel = 0
                barFill.Parent = barBg

                local barCornerFill = Instance.new("UICorner")
                barCornerFill.CornerRadius = UDim.new(1, 0)
                barCornerFill.Parent = barFill

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Position = UDim2.new(0, 0, 0, -2)
                label.BackgroundTransparency = 1
                label.Font = Enum.Font.GothamMedium
                label.TextColor3 = Color3.fromRGB(240, 240, 240)
                label.TextSize = 14
                label.Text = "Farming Trap | 16:00"
                label.Parent = frame

                local secondsLeft = 960

                for i = 1, 960 do
                    if not FarmBricks then break end

                    if not Character or not Character.Parent then
                        Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        Humanoid = Character:WaitForChild("Humanoid")
                        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
                    end

                    if Humanoid.Health == 0 then
                        FarmBricks = false
                        break
                    end

                    secondsLeft = secondsLeft - 1
                    local mins = math.floor(secondsLeft / 60)
                    local secs = secondsLeft % 60

                    if label and label.Parent then
                        label.Text = string.format("Farming Trap | %02d:%02d", mins, secs)
                        barFill.Size = UDim2.new(secondsLeft / 960, 0, 1, 0)
                    end

                    task.wait(1)
                end

                FarmBricks = false
                if gui then gui:Destroy() end
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get 🗿 (Trap request)",
        Callback = function()
            task.spawn(function()
                local equip = debug.getupvalues(require(game.ReplicatedStorage.BACKEND.Lib.Network).fireServer)[3]("SelectGlove")
                equip:FireServer("Trap")

                task.wait(1)

                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:WaitForChild("HumanoidRootPart")
                hrp.CFrame = CFrame.new(-1309.7913, 328.2221, 1.4192, 0.9997, -0.0000, -0.0248, 0.0000, 1.0000, -0.0000, 0.0248, 0.0000, 0.9997)

                task.wait(1.5)
                hrp.CFrame = CFrame.new(312.8075, 62.3753, 185.1011, -0.7490, -0.0000, 0.6626, 0.0000, 1.0000, 0.0000, -0.6626, 0.0000, -0.7490)

                task.wait(1.5)

                local Event = game:GetService("ReplicatedStorage").funnyhilariousbeartrap
                Event:FireServer()

                task.wait(1.5)
                hrp.CFrame = CFrame.new(309.2433, 67.4885, 187.0331, 1.0000, -0.0000, -0.0031, 0.0000, 1.0000, -0.0000, 0.0031, 0.0000, 1.0000)

                task.wait(3)

                local ResetEvent = game:GetService("Players").LocalPlayer.Reset
                ResetEvent:FireServer()
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Doorkeeper",
        Callback = function()
            task.spawn(function()
                local TeleportService = game:GetService("TeleportService")
                local DOORKEEPER_PLACE_ID = 125845699717230
                local QUEUE_FN = queue_on_teleport or queueonteleport

                local function clickAllDoors()
                    while task.wait(0.1) do
                        for _, v in ipairs(workspace:GetDescendants()) do
                            if v.Name == "ClickDetector" then
                                pcall(function()
                                    fireclickdetector(v)
                                end)
                            end
                        end
                    end
                end

                if game.PlaceId == DOORKEEPER_PLACE_ID then
                    clickAllDoors()
                    return
                end

                if not QUEUE_FN then
                    warn("Your executor does not support queue_on_teleport")
                    return
                end

                local payload = ([[
if game.PlaceId ~= %d then return end

while task.wait(0.1) do
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "ClickDetector" then
            pcall(function()
                fireclickdetector(v)
            end)
        end
    end
end
]]):format(DOORKEEPER_PLACE_ID)

                QUEUE_FN(payload)
                TeleportService:Teleport(DOORKEEPER_PLACE_ID)
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Kraken (Needs to be in bossfight)",
        Callback = function()
            task.spawn(function()
                game:GetService("ReplicatedStorage").AbyssEvent:FireServer(true)
            end)
        end
    })

    Tab1:Button({
        Title = "Auto-Get Fish + Trap + Voodoo",
        Callback = function()
            task.spawn(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local LocalPlayer = Players.LocalPlayer
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local Humanoid = Character:WaitForChild("Humanoid")
                local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

                if not HumanoidRootPart or not Humanoid then return end

                if Character:FindFirstChild("entered") then
                    warn("Error! Use in lobby!")
                    return
                end

                fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
                task.wait(0.3)
                game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
                task.wait(0.5)

                fireclickdetector(workspace.Lobby.ZZZZZZZ.ClickDetector)
                task.wait(0.3)
                game.ReplicatedStorage.ZZZZZZZSleep:FireServer()
                task.wait(2)

                fireclickdetector(workspace.Lobby.Brick.ClickDetector)
                task.wait(0.3)

                local teleportPad = workspace.Lobby:FindFirstChild("Teleport1")
                if teleportPad then
                    HumanoidRootPart.CFrame = teleportPad.CFrame
                    task.wait(0.1)
                    firetouchinterest(HumanoidRootPart, teleportPad, 0)
                    task.wait(0.1)
                    firetouchinterest(HumanoidRootPart, teleportPad, 1)
                end
                task.wait(1)

                for _, v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v:PivotTo(CFrame.new(3000, 3000, 3000))
                    end
                end

                task.wait(2.5)
                HumanoidRootPart.Anchored = true

                task.spawn(function()
                    if getconnections then
                        pcall(function()
                            for _, v in pairs(getconnections(LocalPlayer.Idled)) do
                                v:Disable()
                            end
                        end)
                    end
                end)

                local FarmBricks = true
                task.spawn(function()
                    repeat
                        task.wait(0.05)
                        ReplicatedStorage.lbrick:FireServer()
                    until FarmBricks == false
                end)

                local TimeLeft = 3600
                for i = 1, TimeLeft do
                    TimeLeft = TimeLeft - 1
                    local msg = Instance.new("Message", workspace)
                    msg.Text = "Seconds left to receive: " .. TimeLeft
                    task.wait(1)
                    if msg and msg.Parent then
                        msg:Destroy()
                    end

                    if Humanoid.Health == 0 then
                        FarmBricks = false
                        break
                    end
                end
            end)
        end
    })

    local isAutoSlenderRunning = false

    local function startAutoSlender()
        local lp = game:GetService("Players").LocalPlayer
        local Workspace = game:GetService("Workspace")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local placeId = game.PlaceId

        if placeId ~= 6403373529 and placeId ~= 9015014224 then
            WindUI:Notify({
                Title = "Auto Slender",
                Content = "This script is not supported on this place.",
                Duration = 4
            })
            return
        end

        local firstCFrame = CFrame.new(
            -1309.2104, 328.2443, 3.3180,
            0.0074, 0.0060, 1.0000,
            0.0012, 1.0000, -0.0061,
            -1.0000, 0.0012, 0.0074
        )

        local function gethrp()
            local c = lp.Character or lp.CharacterAdded:Wait()
            return c:WaitForChild("HumanoidRootPart", 5)
        end

        local function teleportToFirst()
            local root = gethrp()
            if root then
                root.CFrame = firstCFrame
                task.wait(0.3)
            end
        end

        local function equipGlove(glove)
            local stats = lp:FindFirstChild("leaderstats")
            if stats and stats:FindFirstChild("Glove") and stats.Glove.Value ~= glove then
                if lp.Character and not lp.Character:FindFirstChild("entered") then
                    local g = Workspace.Lobby:FindFirstChild(glove)
                    if g and g:FindFirstChild("ClickDetector") then
                        fireclickdetector(g.ClickDetector)
                        task.wait(0.5)
                    end
                end
            end
        end

        local function reset()
            if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                lp.Character.Humanoid.Health = 0
            end
            lp.CharacterAdded:Wait()
            task.wait(1.5)
        end

        equipGlove("Balloony")
        task.wait(0.5)
        teleportToFirst()

        local tape = Workspace:WaitForChild("TapeRecorder", 10)
        if tape and tape:FindFirstChild("Front") then
            local root = gethrp()
            if root then
                root.CFrame = tape.Front.CFrame * CFrame.new(0, 0, -1)
            end
            task.wait(0.2)

            if tape.Front:FindFirstChild("ProximityPrompt") then
                fireproximityprompt(tape.Front.ProximityPrompt)
            end
            task.wait(0.15)

            local code = ""
            local rec = true
            local sfx = tape.Front:FindFirstChild("DigitsSFX")

            while rec do
                task.wait()
                if sfx then
                    for i = 0, 9 do
                        local d = tostring(i)
                        local snd = sfx:FindFirstChild(d)
                        if snd and snd.Playing then
                            code = code .. d
                            task.wait(1)
                            break
                        end
                    end
                end

                if tape.Front.ProximityPrompt.Enabled then
                    rec = false
                end
            end

            reset()
            equipGlove("Pocket")
            task.wait(1.5)
            teleportToFirst()

            root = gethrp()
            if root then
                root.CFrame = CFrame.new(-1210.02, 331.92, 3.47, 0.018, 0, 1, 0, 1, 0, -1, 0, 0.018)
                task.wait(0.5)
                root.CFrame = CFrame.new(123.28, 255.30, 1.05, 0.998, 0, -0.055, 0, 1, 0, 0.055, 0, 0.998)
                task.wait(0.5)
                root.CFrame = CFrame.new(17944.88, -130.16, -3492.70, -0.998, 0, -0.070, 0, 1, 0, 0.070, 0, -0.998)
                task.wait(0.5)
            end

            local rem = ReplicatedStorage:FindFirstChild("GeneralAbility")
            if rem and root then
                rem:FireServer(root.CFrame)
            end

            local pocket = nil
            local t = tick() + 10
            repeat
                task.wait(0.2)
                for _, v in ipairs(Workspace:GetChildren()) do
                    if v:IsA("Model") and string.find(v.Name, "'s Pocket") then
                        if v:FindFirstChildWhichIsA("ProximityPrompt", true) then
                            pocket = v
                            break
                        end
                    end
                end
            until pocket or tick() > t

            if pocket then
                local prompt = pocket:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt then
                    local parent = prompt.Parent
                    root = gethrp()
                    if root then
                        if parent:IsA("BasePart") then
                            root.CFrame = parent.CFrame * CFrame.new(0, 0, 3)
                        else
                            root.CFrame = pocket:GetPivot() * CFrame.new(0, 0, 3)
                        end
                    end

                    task.wait(0.3)
                    prompt.HoldDuration = 0
                    prompt.MaxActivationDistance = 9999
                    prompt.RequiresLineOfSight = false

                    task.wait(0.1)
                    fireproximityprompt(prompt)
                    task.wait(0.2)
                    fireproximityprompt(prompt)
                    task.wait(2)
                end
            end

            local pad = nil
            t = tick() + 10
            repeat
                task.wait(0.2)
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v.Name == "PocketKeypad" then
                        pad = v
                        break
                    end
                end
            until pad or tick() > t

            if pad then
                root = gethrp()
                if root then
                    if pad:IsA("BasePart") then
                        root.CFrame = pad.CFrame * CFrame.new(0, 0, 3)
                    else
                        root.CFrame = pad:GetPivot() * CFrame.new(0, 0, 3)
                    end
                end
                task.wait(0.5)

                local openPrompt = pad:FindFirstChildWhichIsA("ProximityPrompt", true)
                if openPrompt then
                    fireproximityprompt(openPrompt)
                    task.wait(0.5)
                end

                local function pressBtn(btnName)
                    local btnFolder = pad:FindFirstChild("Buttons")
                    if btnFolder then
                        local btn = btnFolder:FindFirstChild(btnName)
                        if btn then
                            local cd = btn:FindFirstChild("ClickDetector")
                            if cd then
                                fireclickdetector(cd)
                                return true
                            end
                        end
                    end
                    return false
                end

                pressBtn("Reset")
                task.wait(0.3)

                for i = 1, #code do
                    local char = code:sub(i, i)
                    pressBtn(char)
                    task.wait(0.5)
                end

                task.wait(0.3)
                pressBtn("Enter")
                task.wait(1.5)
            end

            local function getPages()
                local bRoom = Workspace:FindFirstChild("BountyHunterRoom")
                if bRoom then
                    local m = bRoom:FindFirstChild("BountyHunterMysteryRoom")
                    if m and m:FindFirstChild("Pages") then
                        for _, p in ipairs(m.Pages:GetChildren()) do
                            local cd = p:FindFirstChild("ClickDetector")
                            if cd then fireclickdetector(cd) end
                        end
                    end
                end

                for _, o in ipairs(Workspace:GetDescendants()) do
                    if o.Name == "Pages" or string.find(o.Name:lower(), "page") then
                        for _, p in ipairs(o:GetChildren()) do
                            local cd = p:FindFirstChild("ClickDetector")
                            if cd then fireclickdetector(cd) end
                        end
                    end
                end
            end

            getPages()
            task.wait(0.5)
            reset()
        end
    end

    Tab1:Button({
        Title = "Auto Slender",
        Callback = function()
            if isAutoSlenderRunning then
                WindUI:Notify({
                    Title = "Auto Slender",
                    Content = "Slender is already at work",
                    Duration = 3
                })
                return
            end

            isAutoSlenderRunning = true
            local ok, errMsg = pcall(function()
                startAutoSlender()
            end)
            if not ok then
                WindUI:Notify({
                    Title = "Auto Slender",
                    Content = "Error: " .. tostring(errMsg),
                    Duration = 5
                })
            end
            isAutoSlenderRunning = false
        end
    })

    Tab1:Button({
        Title = "Auto-Get Debug",
        Callback = function()
            task.spawn(function()
                local DebugRoom = workspace:WaitForChild("Debug Room", 10)
                if not DebugRoom then
                    WindUI:Notify({
                        Title = "Auto-Get Debug",
                        Content = "Debug Room not found in workspace.",
                        Duration = 4
                    })
                    return
                end

                local Buttons = DebugRoom:WaitForChild("Keypad", 10):WaitForChild("Buttons", 10)
                if not Buttons then
                    WindUI:Notify({
                        Title = "Auto-Get Debug",
                        Content = "Keypad Buttons not found.",
                        Duration = 4
                    })
                    return
                end

                local function press(name)
                    local btn = Buttons:FindFirstChild(tostring(name))
                    if btn and btn:FindFirstChildOfClass("ClickDetector") then
                        fireclickdetector(btn.ClickDetector)
                    end
                end

                press(DebugRoom.DuckTable.DuckTable.Duckies.Value)
                task.wait(0.3)
                press(DebugRoom.AdminGloves.GlovesCode.SurfaceGui.AdminNumber.Text)
                task.wait(0.3)
                press(DebugRoom.Maze:FindFirstChild("MazeNumber", true).Text)
                task.wait(0.3)
                press("7")
                task.wait(0.3)
                press("Enter")
            end)
        end
    })

end
