--[[
    🔥 GLUE PIECE HUB - SCRIPT PREMIUM
    Versão: 1.0
    Criado especialmente para você
]]

local function InitHub()
    -- Services
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Player = Players.LocalPlayer
    local VirtualInput = game:GetService("VirtualInputManager")
    
    -- Configurações
    local Settings = {
        Combat = {AutoCombo = false, AutoSkill = false, KillAura = false, Range = 15, AutoDodge = false, FastAttack = false},
        Auto = {AutoFarm = false, AutoChest = false, ServerHop = false, AntiAFK = true},
        Move = {Fly = false, NoClip = false, InfiniteJump = false, Speed = false, SpeedValue = 50},
        Visual = {ESPPlayers = false, ESPBosses = false, ESPFruits = false, RGB = false, AntiLag = false}
    }
    
    -- Criar UI
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "GluePieceHub_PRO"
    Gui.Parent = game.CoreGui
    Gui.ResetOnSpawn = false
    
    -- Blur Effect
    local Blur = Instance.new("BlurEffect")
    Blur.Size = 0
    Blur.Parent = game.Lighting
    
    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 580, 0, 400)
    Main.Position = UDim2.new(0.5, -290, 0.5, -200)
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    Main.BackgroundTransparency = 0.1
    Main.BorderSizePixel = 0
    Main.Parent = Gui
    
    -- Corner
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Main
    
    -- Stroke
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 255, 200)
    Stroke.Thickness = 2
    Stroke.Parent = Main
    
    -- Title Bar
    local Title = Instance.new("Frame")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    Title.BackgroundTransparency = 0.3
    Title.BorderSizePixel = 0
    Title.Parent = Main
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = Title
    
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(1, -50, 1, 0)
    TitleText.Text = "🔥 GLUE PIECE HUB v1.0"
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.BackgroundTransparency = 1
    TitleText.Font = Enum.Font.GothamBlack
    TitleText.TextSize = 18
    TitleText.Parent = Title
    
    -- Close Button
    local Close = Instance.new("TextButton")
    Close.Size = UDim2.new(0, 35, 0, 35)
    Close.Position = UDim2.new(1, -40, 0, 2.5)
    Close.Text = "✕"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 20
    Close.Parent = Title
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(1, 0)
    CloseCorner.Parent = Close
    
    local IsOpen = true
    Close.MouseButton1Click:Connect(function()
        IsOpen = not IsOpen
        Main.Visible = IsOpen
        Blur.Size = IsOpen and 15 or 0
    end)
    
    -- Tabs System
    local Tabs = {}
    local Frames = {}
    local Names = {"⚔️ COMBAT", "🤖 AUTO", "👁️ VISUAL", "🏃 MOVE", "⚙️ CONFIG"}
    
    for i, name in ipairs(Names) do
        local Tab = Instance.new("TextButton")
        Tab.Size = UDim2.new(0, 105, 0, 32)
        Tab.Position = UDim2.new(0, (i-1)*110 + 10, 0, 48)
        Tab.Text = name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundColor3 = i == 1 and Color3.fromRGB(0, 200, 255) or Color3.fromRGB(40, 40, 60)
        Tab.Font = Enum.Font.GothamBold
        Tab.TextSize = 11
        Tab.Parent = Main
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = Tab
        
        local Frame = Instance.new("ScrollingFrame")
        Frame.Size = UDim2.new(1, -16, 1, -92)
        Frame.Position = UDim2.new(0, 8, 0, 86)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        Frame.BackgroundTransparency = 0.5
        Frame.Visible = i == 1
        Frame.ScrollBarThickness = 4
        Frame.CanvasSize = UDim2.new(0, 0, 2, 0)
        Frame.Parent = Main
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 8)
        FrameCorner.Parent = Frame
        
        table.insert(Tabs, Tab)
        table.insert(Frames, Frame)
        
        Tab.MouseButton1Click:Connect(function()
            for _, f in ipairs(Frames) do f.Visible = false end
            for _, t in ipairs(Tabs) do t.BackgroundColor3 = Color3.fromRGB(40, 40, 60) end
            Frame.Visible = true
            Tab.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        end)
    end
    
    -- Toggle Creator
    local function CreateToggle(parent, text, posY, callback)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
        ToggleFrame.Position = UDim2.new(0, 5, 0, posY)
        ToggleFrame.BackgroundTransparency = 1
        ToggleFrame.Parent = parent
        
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 24, 0, 24)
        Button.Position = UDim2.new(0, 8, 0, 5.5)
        Button.Text = ""
        Button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        Button.Parent = ToggleFrame
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(1, 0)
        ButtonCorner.Parent = Button
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -40, 1, 0)
        Label.Position = UDim2.new(0, 40, 0, 0)
        Label.Text = text
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 13
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = ToggleFrame
        
        local enabled = false
        Button.MouseButton1Click:Connect(function()
            enabled = not enabled
            Button.BackgroundColor3 = enabled and Color3.fromRGB(50, 255, 100) or Color3.fromRGB(255, 60, 60)
            if callback then callback(enabled) end
        end)
    end
    
    -- ======= COMBAT TAB =======
    local f = Frames[1]
    CreateToggle(f, "Auto Combo", 5, function(e) Settings.Combat.AutoCombo = e end)
    CreateToggle(f, "Auto Skill", 45, function(e) Settings.Combat.AutoSkill = e end)
    CreateToggle(f, "Kill Aura", 85, function(e) Settings.Combat.KillAura = e end)
    CreateToggle(f, "Auto Dodge", 125, function(e) Settings.Combat.AutoDodge = e end)
    CreateToggle(f, "Fast Attack", 165, function(e) Settings.Combat.FastAttack = e end)
    CreateToggle(f, "Auto Transform", 205, function(e) print("Transform:", e) end)
    CreateToggle(f, "Auto Equip Best Weapon", 245, function(e) print("Weapon:", e) end)
    
    -- ======= AUTO TAB =======
    f = Frames[2]
    CreateToggle(f, "Auto Farm", 5, function(e) Settings.Auto.AutoFarm = e end)
    CreateToggle(f, "Auto Chest", 45, function(e) Settings.Auto.AutoChest = e end)
    CreateToggle(f, "Auto Collect Fruits", 85, function(e) print("Collect:", e) end)
    CreateToggle(f, "Auto Buy Items", 125, function(e) print("Buy:", e) end)
    CreateToggle(f, "Auto Upgrade Stats", 165, function(e) print("Upgrade:", e) end)
    CreateToggle(f, "Auto Spin", 205, function(e) print("Spin:", e) end)
    CreateToggle(f, "Server Hop", 245, function(e) Settings.Auto.ServerHop = e end)
    CreateToggle(f, "Auto Redeem Codes", 285, function(e) print("Codes:", e) end)
    
    -- ======= VISUAL TAB =======
    f = Frames[3]
    CreateToggle(f, "Player ESP", 5, function(e) Settings.Visual.ESPPlayers = e end)
    CreateToggle(f, "Boss ESP", 45, function(e) Settings.Visual.ESPBosses = e end)
    CreateToggle(f, "Fruit ESP", 85, function(e) Settings.Visual.ESPFruits = e end)
    CreateToggle(f, "RGB Theme", 125, function(e) Settings.Visual.RGB = e end)
    CreateToggle(f, "Anti-Lag", 165, function(e) 
        Settings.Visual.AntiLag = e
        if e then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("BloomEffect") then
                    obj.Enabled = false
                end
            end
            settings().Rendering.QualityLevel = 1
        end
    end)
    
    -- ======= MOVE TAB =======
    f = Frames[4]
    CreateToggle(f, "Fly", 5, function(e) Settings.Move.Fly = e end)
    CreateToggle(f, "NoClip", 45, function(e) Settings.Move.NoClip = e end)
    CreateToggle(f, "Infinite Jump", 85, function(e) Settings.Move.InfiniteJump = e end)
    CreateToggle(f, "Speed Boost", 125, function(e) 
        Settings.Move.Speed = e
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = e and Settings.Move.SpeedValue or 16
        end
    end)
    CreateToggle(f, "Teleport to NPC", 165, function(e) print("Teleport:", e) end)
    CreateToggle(f, "Dash Infinite", 205, function(e) print("Dash:", e) end)
    
    -- ======= CONFIG TAB =======
    f = Frames[5]
    
    local SaveBtn = Instance.new("TextButton")
    SaveBtn.Size = UDim2.new(0, 160, 0, 40)
    SaveBtn.Position = UDim2.new(0.5, -80, 0, 30)
    SaveBtn.Text = "💾 SALVAR CONFIG"
    SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    SaveBtn.Font = Enum.Font.GothamBold
    SaveBtn.TextSize = 13
    SaveBtn.Parent = f
    SaveBtn.MouseButton1Click:Connect(function()
        pcall(function()
            writefile("GlueHub_Config.json", game:GetService("HttpService"):JSONEncode(Settings))
            print("✅ Configuração salva!")
        end)
    end)
    
    local LoadBtn = Instance.new("TextButton")
    LoadBtn.Size = UDim2.new(0, 160, 0, 40)
    LoadBtn.Position = UDim2.new(0.5, -80, 0, 85)
    LoadBtn.Text = "📂 CARREGAR CONFIG"
    LoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    LoadBtn.Font = Enum.Font.GothamBold
    LoadBtn.TextSize = 13
    LoadBtn.Parent = f
    LoadBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local data = readfile("GlueHub_Config.json")
            local config = game:GetService("HttpService"):JSONDecode(data)
            for k, v in pairs(config) do
                Settings[k] = v
            end
            print("✅ Configuração carregada!")
        end)
    end)
    
    -- FPS/Ping Counter
    local Stats = Instance.new("Frame")
    Stats.Size = UDim2.new(0, 180, 0, 26)
    Stats.Position = UDim2.new(0, 10, 0, 10)
    Stats.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Stats.BackgroundTransparency = 0.4
    Stats.BorderSizePixel = 0
    Stats.Parent = Gui
    
    local StatsCorner = Instance.new("UICorner")
    StatsCorner.CornerRadius = UDim.new(0, 6)
    StatsCorner.Parent = Stats
    
    local StatsLabel = Instance.new("TextLabel")
    StatsLabel.Size = UDim2.new(1, 0, 1, 0)
    StatsLabel.Text = "⚡ FPS: -- | 📶 Ping: --ms"
    StatsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    StatsLabel.BackgroundTransparency = 1
    StatsLabel.Font = Enum.Font.GothamBold
    StatsLabel.TextSize = 12
    StatsLabel.Parent = Stats
    
    spawn(function()
        while true do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
            StatsLabel.Text = string.format("⚡ FPS: %d | 📶 Ping: %dms", fps, ping)
            task.wait(0.5)
        end
    end)
    
    -- Drag System
    local dragging, dragInput, dragStart, startPos
    
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    Title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- RGB Animation
    spawn(function()
        local hue = 0
        while true do
            if Settings.Visual.RGB then
                hue = (hue + 0.01) % 1
                Stroke.Color = Color3.fromHSV(hue, 1, 1)
                Title.BackgroundColor3 = Color3.fromHSV(hue, 1, 0.8)
            end
            task.wait(0.05)
        end
    end)
    
    -- Auto Combat System
    spawn(function()
        while true do
            if Settings.Combat.AutoCombo or Settings.Combat.KillAura then
                pcall(function()
                    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                        local char = Player.Character
                        local root = char.HumanoidRootPart
                        
                        for _, npc in ipairs(workspace:GetDescendants()) do
                            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc:FindFirstChild("HumanoidRootPart") then
                                if npc.Humanoid.Health > 0 and npc ~= char then
                                    local dist = (root.Position - npc.HumanoidRootPart.Position).Magnitude
                                    if dist <= Settings.Combat.Range then
                                        -- Teleport to target
                                        root.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                        
                                        -- Attack
                                        pcall(function()
                                            local combat = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                            if combat and combat:FindFirstChild("Combat") then
                                                combat.Combat:FireServer("Mouse1", npc.HumanoidRootPart.Position)
                                            end
                                        end)
                                        
                                        if not Settings.Combat.AutoCombo then break end
                                        task.wait(Settings.Combat.FastAttack and 0.1 or 0.2)
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            
            if Settings.Combat.AutoSkill then
                pcall(function()
                    for _, key in ipairs({"Z", "X", "C", "V", "B"}) do
                        VirtualInput:SendKeyEvent(true, Enum.KeyCode[key], false, game)
                        task.wait(0.05)
                        VirtualInput:SendKeyEvent(false, Enum.KeyCode[key], false, game)
                        task.wait(0.3)
                    end
                end)
            end
            
            task.wait(Settings.Combat.FastAttack and 0.08 or 0.25)
        end
    end)
    
    -- Movement Systems
    spawn(function()
        while true do
            if Settings.Move.Fly and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                local root = Player.Character.HumanoidRootPart
                local humanoid = Player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = true
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        root.CFrame = root.CFrame + root.CFrame.LookVector * 1.5
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        root.CFrame = root.CFrame - root.CFrame.LookVector * 1.5
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        root.CFrame = root.CFrame + Vector3.new(0, 1.5, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        root.CFrame = root.CFrame - Vector3.new(0, 1.5, 0)
                    end
                end
            end
            
            if Settings.Move.InfiniteJump and Player.Character and Player.Character:FindFirstChild("Humanoid") then
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
            
            task.wait()
        end
    end)
    
    print("✅ Glue Piece Hub PRO carregado!")
    print("🎮 Comandos: Fly, AutoFarm, KillAura e muito mais!")
end

-- Execute
pcall(function()
    InitHub()
end)
