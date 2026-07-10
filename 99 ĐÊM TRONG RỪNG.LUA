--============================
-- SCRIPT REZ HUB PREMIUM💎
--============================
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TargetGui = CoreGui
local success = pcall(function() local _ = CoreGui.Name end)
if not success then TargetGui = LocalPlayer:WaitForChild("PlayerGui") end

-- 🌈 Rainbow
local RainbowColor = Color3.fromRGB(255,0,0)
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.005) % 1
        RainbowColor = Color3.fromHSV(hue, 1, 1)
        task.wait(0.02)
    end
end)

-- 🚀 Loading
local LoadingGui = Instance.new("ScreenGui", TargetGui)
LoadingGui.Name = "Rez Hub_LoadingScreen"
local LoadFrame = Instance.new("Frame", LoadingGui)
LoadFrame.Size = UDim2.fromOffset(500,200)
LoadFrame.Position = UDim2.new(0.5,-250,0.5,-100)
LoadFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", LoadFrame).CornerRadius = UDim.new(0,15)
local LoadStroke = Instance.new("UIStroke", LoadFrame)
LoadStroke.Thickness = 5
local TitleLabel = Instance.new("TextLabel", LoadFrame)
TitleLabel.Size = UDim2.new(1,0,0.3,0)
TitleLabel.Position = UDim2.fromOffset(0,30)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "✨ RezHub xin chào " .. LocalPlayer.Name
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 30
TitleLabel.TextColor3 = Color3.new(1,1,1)
local PercentLabel = Instance.new("TextLabel", LoadFrame)
PercentLabel.Size = UDim2.new(0.8,0,0.2,0)
PercentLabel.Position = UDim2.new(0.1,0,0.45,0)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Text = "0/100%"
PercentLabel.Font = Enum.Font.SourceSansBold
PercentLabel.TextColor3 = Color3.new(1,1,1)
PercentLabel.TextScaled = true
PercentLabel.TextXAlignment = Enum.TextXAlignment.Center
PercentLabel.TextYAlignment = Enum.TextYAlignment.Center
local BarBG = Instance.new("Frame", LoadFrame)
BarBG.Size = UDim2.new(0.85,0,0,20)
BarBG.Position = UDim2.new(0.075,0,0.7,0)
BarBG.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", BarBG)
local BarFill = Instance.new("Frame", BarBG)
BarFill.Size = UDim2.new(0,0,1,0)
Instance.new("UICorner", BarFill)

local loadConnection = RunService.Heartbeat:Connect(function()
    LoadStroke.Color = RainbowColor
    BarFill.BackgroundColor3 = RainbowColor
    PercentLabel.TextColor3 = RainbowColor
    TitleLabel.TextColor3 = RainbowColor
end)

for i = 1, 100 do
    PercentLabel.Text = i .. "/100%"
    BarFill.Size = UDim2.new(i/100,0,1,0)
    task.wait(0.015)
end
loadConnection:Disconnect()
LoadingGui:Destroy()

-- 📦 Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "REZ HUB PREMIUM | Free",
    SubTitle = "REZ HUB NGON",
    TabWidth = 150,
    Theme = "Darker",
    Size = UDim2.fromOffset(700, 400)
})

local Tabs = {
    Auto = Window:AddTab({ Title = "Auto", Icon = "clock" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    FixLag = Window:AddTab({ Title = "Fix Lag", Icon = "cpu" }),
    Server = Window:AddTab({ Title = "Server", Icon = "globe" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

-- 🖼️ Minimize button
function nut()
    local ScreenIcon = Instance.new("ScreenGui", TargetGui)
    ScreenIcon.Name = "Zidwi_ToggleIcon"
    local IconBtn = Instance.new("ImageButton", ScreenIcon)
    IconBtn.Size = UDim2.fromOffset(64,64)
    IconBtn.Position = UDim2.new(0.1,0,0.15,0)
    IconBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    IconBtn.Image = "rbxassetid://12694777893"
    Instance.new("UICorner", IconBtn).CornerRadius = UDim.new(0,10)
    local IconStroke = Instance.new("UIStroke", IconBtn)
    IconStroke.Thickness = 2.5
    RunService.Heartbeat:Connect(function() IconStroke.Color = RainbowColor end)

    local dragging, dragStart, startPos
    IconBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = IconBtn.Position
        end
    end)
    IconBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            IconBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    IconBtn.MouseButton1Click:Connect(function() Window:Minimize() end)
end
nut()

-- ============================================================
--  ⚡ KILL AURA & CHOP AURA (KHÔNG CẦN CẦM TOOL)
-- ============================================================

local remoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

local toolsDamageIDs = {
    ["Old Axe"] = "3_7367831688",
    ["Good Axe"] = "112_7367831688",
    ["Strong Axe"] = "116_7367831688",
    ["Chainsaw"] = "647_8992824875",
    ["Spear"] = "196_8999010016"
}

local function getTool(onlyChop)
    local inv = LocalPlayer:FindFirstChild("Inventory")
    if not inv then return nil, nil end
    for name, id in pairs(toolsDamageIDs) do
        if not (onlyChop and (name ~= "Old Axe" and name ~= "Good Axe" and name ~= "Strong Axe")) then
            local tool = inv:FindFirstChild(name)
            if tool then return tool, id end
        end
    end
end

-- Kill Aura (KHÔNG CẦN CẦM TOOL)
local killAuraActive = false
local killAuraRange = 100
local killAuraThread

local function startKillAura()
    if killAuraThread then task.cancel(killAuraThread) end
    killAuraThread = task.spawn(function()
        while killAuraActive do
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Lấy tool và damage ID
                local tool, id = getTool(false)
                if not tool or not id then
                    task.wait(0.5)
                end
                
                for _, mob in ipairs(Workspace.Characters:GetChildren()) do
                    if mob:IsA("Model") and mob ~= char and mob.PrimaryPart then
                        if (mob.PrimaryPart.Position - hrp.Position).Magnitude <= killAuraRange then
                            task.defer(function()
                                pcall(function()
                                    -- Gọi ToolDamageObject KHÔNG CẦN CẦM TOOL
                                    remoteEvents.ToolDamageObject:InvokeServer(
                                        mob,           -- target
                                        tool,          -- tool
                                        id,            -- damage id
                                        mob.PrimaryPart.CFrame, -- vị trí
                                        true           -- không cần cầm tool
                                    )
                                end)
                            end)
                        end
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

Tabs.Auto:AddToggle("KillAura", {
    Title = "💀 Kill Aura (Multi)",
    Default = false,
    Description = "Tấn công tất cả mob trong phạm vi (không cần cầm tool)",
    Callback = function(state)
        killAuraActive = state
        if state then startKillAura() else
            if killAuraThread then task.cancel(killAuraThread) killAuraThread = nil end
        end
    end
})

Tabs.Auto:AddSlider("KillAuraRange", {
    Title = "📏 Tầm hoạt động",
    Default = 100,
    Min = 10, Max = 300, Rounding = 1,
    Callback = function(v) killAuraRange = tonumber(v) or 100 end
})

-- Chop Aura (KHÔNG CẦN CẦM TOOL)
local currentammount = 0
local auraRadius = 50
local chopAuraToggle = false

local function getAnyToolWithDamageID(onlyChop)
    local inv = LocalPlayer:FindFirstChild("Inventory")
    if not inv then return nil, nil end
    for name, id in pairs(toolsDamageIDs) do
        if not (onlyChop and (name ~= "Old Axe" and name ~= "Good Axe" and name ~= "Strong Axe")) then
            local tool = inv:FindFirstChild(name)
            if tool then return tool, id end
        end
    end
end

local function chopAuraLoop()
    while chopAuraToggle do
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local tool = getAnyToolWithDamageID(true)
            if tool then
                currentammount = currentammount + 1
                local trees = {}
                local map = Workspace:FindFirstChild("Map")
                if map then
                    if map:FindFirstChild("Foliage") then
                        for _, obj in ipairs(map.Foliage:GetChildren()) do
                            if obj:IsA("Model") and (obj.Name == "Small Tree" or obj.Name:find("Dead Tree")) then
                                table.insert(trees, obj)
                            end
                        end
                    end
                    if map:FindFirstChild("Landmarks") then
                        for _, obj in ipairs(map.Landmarks:GetChildren()) do
                            if obj:IsA("Model") and (obj.Name == "Small Tree" or obj.Name:find("Dead Tree")) then
                                table.insert(trees, obj)
                            end
                        end
                    end
                end
                for _, tree in ipairs(trees) do
                    local trunk = tree:FindFirstChild("Trunk")
                    if trunk and trunk:IsA("BasePart") and (trunk.Position - hrp.Position).Magnitude <= auraRadius then
                        local alreadyammount = false
                        task.spawn(function()
                            while chopAuraToggle and tree and tree.Parent and not alreadyammount do
                                alreadyammount = true
                                currentammount = currentammount + 1
                                pcall(function()
                                    -- Gọi ToolDamageObject KHÔNG CẦN CẦM TOOL
                                    remoteEvents.ToolDamageObject:InvokeServer(
                                        tree,                                          -- target (cây)
                                        tool,                                          -- tool
                                        tostring(currentammount) .. "_7367831688",     -- damage id
                                        CFrame.new(-2.962610244751, 4.5547881126404, -75.950843811035, 
                                            0.89621275663376, -1.3894891459643e-08, 0.44362446665764, 
                                            -7.994568895775e-10, 1, 3.293635941759e-08, 
                                            -0.44362446665764, -2.9872644802253e-08, 0.89621275663376), -- vị trí
                                        false                                          -- không cần cầm tool
                                    )
                                end)
                                task.wait(0.5)
                            end
                        end)
                    end
                end
                task.wait(0.1)
            else
                task.wait(0.5)
            end
        else
            task.wait(0.5)
        end
    end
end

Tabs.Auto:AddSection("🪓 Chặt Cây")

Tabs.Auto:AddToggle("ChopAura", {
    Title = "🌳 Auto Chặt Cây",
    Default = false,
    Description = "Tự động chặt cây trong phạm vi (không cần cầm tool)",
    Callback = function(Value)
        chopAuraToggle = Value
        if Value then
            task.spawn(chopAuraLoop)
        end
    end
})

Tabs.Auto:AddSlider("AuraRange", {
    Title = "📏 Tầm Aura",
    Default = 50,
    Min = 10, Max = 500, Rounding = 0,
    Callback = function(Value) auraRadius = math.clamp(Value, 10, 500) end
})

-- ============================================================
--  🧑‍💻 PLAYER TAB
-- ============================================================

-- Tốc độ chạy nhanh
local runSpeedValue = 20

local function updateRunSpeed()
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = runSpeedValue
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.1)
    updateRunSpeed()
end)

updateRunSpeed()

Tabs.Player:AddSlider("RunSpeedSlider", {
    Title = "🏃 Tốc độ chạy nhanh",
    Description = "Kéo để thay đổi tốc độ (20-200)",
    Default = 20,
    Min = 20,
    Max = 200,
    Rounding = 0,
    Callback = function(value)
        runSpeedValue = value
        updateRunSpeed()
    end
})

-- Nhảy liên tục & Nhảy cao
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local Char, Humanoid = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait(), nil
local Conns, RunSpeed = {}, 16

local function UpdateHumanoid(c)
    Char, Humanoid = c, c:WaitForChild("Humanoid")
    Humanoid.WalkSpeed = RunSpeed
end
UpdateHumanoid(Char)
LocalPlayer.CharacterAdded:Connect(UpdateHumanoid)

local function ClearConn(tag)
    if Conns[tag] then Conns[tag]:Disconnect() Conns[tag] = nil end
end

Tabs.Player:AddToggle("InfJump", {
    Title = "🦘 Nhảy liên tục",
    Default = false,
    Callback = function(state)
        ClearConn("InfJump")
        if state then
            Conns["InfJump"] = UIS.JumpRequest:Connect(function()
                if Humanoid then Humanoid:ChangeState("Jumping") end
            end)
        end
    end
})

Tabs.Player:AddSlider("JumpPower", {
    Title = "📈 Nhảy cao",
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 1,
    Callback = function(v) if Humanoid then Humanoid.UseJumpPower = true Humanoid.JumpPower = v end end
})

-- Fly
local flyToggle = false
local flySpeed = 1
local FLYING = false
local flyConnection = nil
local charConnection = nil
local bv, bg = nil, nil

local function StopFly()
    FLYING = false
    if flyConnection then flyConnection:Disconnect() flyConnection = nil end
    if charConnection then charConnection:Disconnect() charConnection = nil end
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if hum then hum.PlatformStand = false end
        if root then
            if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end
            if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end
        end
    end
end

local function StartFly()
    StopFly()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:WaitForChild("HumanoidRootPart", 5)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end
    FLYING = true

    local playerModule = LocalPlayer.PlayerScripts:FindFirstChild("PlayerModule")
    local controlModule = nil
    if playerModule then
        local suc, res = pcall(function() return require(playerModule:WaitForChild("ControlModule")) end)
        if suc then controlModule = res end
    end

    bv = Instance.new("BodyVelocity")
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Velocity = Vector3.new(0,0,0)
    bv.Parent = root

    bg = Instance.new("BodyGyro")
    bg.Name = "FlyGyro"
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.P = 90000
    bg.CFrame = workspace.CurrentCamera.CFrame
    bg.Parent = root

    hum.PlatformStand = true

    flyConnection = RunService.RenderStepped:Connect(function()
        local currentChar = LocalPlayer.Character
        if not flyToggle or not currentChar then StopFly() return end
        local currentRoot = currentChar:FindFirstChild("HumanoidRootPart")
        local currentHum = currentChar:FindFirstChildOfClass("Humanoid")
        if currentRoot and currentHum and bv.Parent == currentRoot and bg.Parent == currentRoot then
            currentHum.PlatformStand = true
            local camera = workspace.CurrentCamera
            bg.CFrame = camera.CFrame

            local moveVector = Vector3.new(0,0,0)
            if controlModule then moveVector = controlModule:GetMoveVector() end

            local verticalMove = 0
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then verticalMove = 1
            elseif UserInputService:IsKeyDown(Enum.KeyCode.Q) then verticalMove = -1 end

            local forward = camera.CFrame.LookVector
            local right = camera.CFrame.RightVector
            local up = camera.CFrame.UpVector
            local direction = (right * moveVector.X) + (forward * -moveVector.Z) + (up * verticalMove)

            if direction.Magnitude > 0 then
                bv.Velocity = direction.Unit * (flySpeed * 50)
            else
                bv.Velocity = Vector3.new(0,0,0)
            end
        else
            StopFly()
        end
    end)

    charConnection = LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        if flyToggle then StartFly() end
    end)
end

Tabs.Player:AddToggle("FlyToggle", {
    Title = "✈️ Fly (Bay)",
    Default = false,
    Callback = function(state)
        flyToggle = state
        if state then StartFly() else StopFly() end
    end
})

Tabs.Player:AddSlider("FlySpeed", {
    Title = "🚀 Tốc độ bay",
    Default = 1,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Callback = function(value) flySpeed = value end
})

-- Auto Spin
local spinEnabled = false
local spinAngle = 0
local spinSpeed = 50

Tabs.Player:AddToggle("AutoSpin", {
    Title = "🔄 Auto Xoay",
    Default = false,
    Callback = function(state) spinEnabled = state end
})

Tabs.Player:AddSlider("SpinSpeed", {
    Title = "⚡ Tốc độ xoay",
    Default = 50,
    Min = 10,
    Max = 1000,
    Rounding = 0,
    Callback = function(value) spinSpeed = value end
})

RunService.Heartbeat:Connect(function(dt)
    local Character = LocalPlayer.Character
    if spinEnabled and Character and Character:FindFirstChild("HumanoidRootPart") then
        spinAngle = spinAngle + dt * spinSpeed
        local root = Character.HumanoidRootPart
        root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, spinAngle, 0)
    end
end)

-- Camera FOV
Tabs.Player:AddSlider("CamFOV", {
    Title = "📷 Độ rộng camera",
    Default = 70,
    Min = 70,
    Max = 120,
    Rounding = 0,
    Callback = function(value) workspace.CurrentCamera.FieldOfView = value end
})

-- ============================================================
--  ⚙️ FIX LAG (ĐÃ SỬA - AN TOÀN HƠN)
-- ============================================================

Tabs.FixLag:AddButton({
    Title = "🔧Fix Lag 10% (Nhẹ)",
    Description = "Xóa hiệu ứng khói bụi, lửa, tia lửa nhỏ",
    Callback = function()
        local count = 0
        -- Chỉ quét những thứ gây nặng GPU do chuyển động nhiều
        local effects = {"ParticleEmitter", "Fire", "Smoke", "Sparkles", "Explosion"}
        
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            for _, className in pairs(effects) do
                if obj:IsA(className) then
                    obj.Enabled = false -- Chỉ tắt, không xóa vĩnh viễn (An toàn)
                    count = count + 1
                end
            end
        end
        
        Fluent:Notify({
            Title = "Performance",
            Content = "Đã tối ưu 10%: Tắt " .. count .. " hiệu ứng gây lag!",
            Duration = 3
        })
    end
})


Tabs.FixLag:AddButton({
    Title = "🔧Fix Lag 25% (Cân bằng)",
    Description = "Tắt hiệu ứng & giảm độ bóng đổ",
    Callback = function()
        local count = 0
        local effects = {"ParticleEmitter", "Fire", "Smoke", "Sparkles", "Explosion"}
        
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            -- 1. Tắt các hiệu ứng hạt (giống 10%)
            for _, className in pairs(effects) do
                if obj:IsA(className) then
                    obj.Enabled = false
                    count = count + 1
                end
            end
            
            -- 2. Tắt đổ bóng cho các vật thể tĩnh (BasePart)
            -- Đây là chìa khóa của mức 25%: Giảm gánh nặng cho GPU
            if obj:IsA("BasePart") then
                if obj.CastShadow == true then
                    obj.CastShadow = false
                    count = count + 1
                end
            end
        end
        
        Fluent:Notify({
            Title = "Performance",
            Content = "Đã tối ưu 25%: Tắt hiệu ứng & Đổ bóng (" .. count .. " đối tượng)",
            Duration = 3
        })
    end
})


Tabs.FixLag:AddButton({
    Title = "🔧 Fix Lag 50% (Vật liệu Plastic)",
    Description = "Chuyển vật liệu về Plastic, giảm tải GPU",
    Callback = function()
        pcall(function()
            UserSettings().GameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Manual
            UserSettings().GameSettings.GraphicsQualityLevel = 1
        end)
        
        local count = 0
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                if obj.Material ~= Enum.Material.Plastic then 
                    obj.Material = Enum.Material.Plastic
                    obj.Reflectance = 0
                    count = count + 1
                end
                obj.CastShadow = false
            end
            if obj:IsA("Light") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("ParticleEmitter") then
                obj.Enabled = false
            end
        end
        
        Fluent:Notify({ 
            Title = "⚡ Performance", 
            Content = "Đã chuyển " .. count .. " vật liệu sang Plastic", 
            Duration = 3 
        })
    end
})


Tabs.FixLag:AddButton({
    Title = "🔧Fix Lag 70% (Tối thượng)",
    Description = "Xóa toàn bộ vật thể phụ & Tối ưu hóa render",
    Callback = function()
        -- 1. Giảm Graphics Roblox về thấp nhất có thể
        UserSettings().GameSettings.GraphicsQualityLevel = 1
        
        local count = 0
        local toRemove = {"Smoke", "Fire", "Sparkles", "ParticleEmitter", "Trail", "Explosion", "PointLight", "SpotLight", "SurfaceLight"}
        
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            -- 2. Xóa sạch các vật thể phụ không cần thiết
            for _, class in pairs(toRemove) do
                if obj:IsA(class) then
                    obj:Destroy()
                    count = count + 1
                end
            end
            
            -- 3. Cực hạn: Chuyển toàn bộ Part về Plastic và tắt Shadow
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic
                obj.CastShadow = false
                obj.Reflectance = 0
            end
            
            -- 4. Xóa Decal/Texture (Ở mức 70% này chúng ta xóa để tối ưu tuyệt đối)
            if obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
                count = count + 1
            end
        end
        
        Fluent:Notify({
            Title = "Performance",
            Content = "Đã tối ưu 70%: Xóa hiệu ứng & vật thể phụ (" .. count .. " đối tượng)",
            Duration = 5
        })
    end
})


Tabs.FixLag:AddButton({
    Title = "🔧Fix Lag 80% (Siêu mượt)",
    Description = "Ép game về trạng thái tối giản nhất",
    Callback = function()
        -- 1. Ép đồ họa xuống mức thấp nhất và tắt mọi hiệu ứng hệ thống
        UserSettings().GameSettings.GraphicsQualityLevel = 1
        
        -- 2. Xóa sạch mọi thứ dư thừa bằng cách "Clean World"
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            -- Xóa toàn bộ hiệu ứng, ánh sáng, vật thể trang trí, decal, textures
            if obj:IsA("ParticleEmitter") or obj:IsA("Fire") or obj:IsA("Smoke") or 
               obj:IsA("Sparkles") or obj:IsA("Explosion") or obj:IsA("Light") or 
               obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("Trail") then
                obj:Destroy()
            end
            
            -- Ép toàn bộ vật thể về Plastic màu xám/trắng để giảm tải GPU tuyệt đối
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.Plastic
                obj.CastShadow = false
                obj.Reflectance = 0
                obj.MaterialVariant = "" -- Xóa biến thể vật liệu
            end
        end
        
        -- 3. Xóa cả Skybox (bầu trời) để giảm gánh nặng render môi trường
        if game.Lighting:FindFirstChildOfClass("Sky") then
            game.Lighting:FindFirstChildOfClass("Sky"):Destroy()
        end
        
        -- 4. Ép Fog (Sương mù) về 0 để camera không phải render tầm xa
        game.Lighting.FogEnd = 99999
        game.Lighting.FogStart = 0
        
        Fluent:Notify({
            Title = "Performance",
            Content = "Đã tối ưu 80%: Siêu nén toàn bộ hệ thống!",
            Duration = 5
        })
    end
})

-- ============================================================
--  🌐 SERVER
-- ============================================================
local function Server()
    local PlaceId = game.PlaceId
    local JobId = game.JobId
    local jobIdInput = ""
    local hopCursor = ""
    local triedServers = {}

    local function notify(title, content, duration)
        Fluent:Notify({ Title = title, Content = content, Duration = duration or 3 })
    end

    local statusParagraph = Tabs.Server:AddParagraph({ Title = "📊 Server Status", Content = "Loading..." })
    local function getServerTime()
        local t = workspace:GetServerTimeNow()
        return string.format("%02d:%02d", math.floor(t/60), math.floor(t%60))
    end
    task.spawn(function()
        while task.wait(1) do
            statusParagraph:SetDesc(
                "👥 Player: " .. #Players:GetPlayers() .. "\n" ..
                "🆔 JobId: " .. JobId .. "\n" ..
                "⏱ Time: " .. getServerTime() .. "\n" ..
                "📍 PlaceId: " .. PlaceId
            )
        end
    end)

    Tabs.Server:AddButton({
        Title = "📋 Copy JobId",
        Callback = function()
            setclipboard(JobId)
            notify("✅ Copied!", JobId)
        end
    })

    Tabs.Server:AddInput("Input", {
        Title = "🔗 Nhập JobId",
        Placeholder = "Paste JobId vào đây",
        Default = "",
        Callback = function(input) jobIdInput = input end
    })
    Tabs.Server:AddButton({
        Title = "🚀 Join JobId",
        Callback = function()
            if jobIdInput == "" then notify("❌ Error", "Vui lòng nhập JobId") return end
            local suc, err = pcall(function()
                TeleportService:TeleportToPlaceInstance(PlaceId, jobIdInput, LocalPlayer)
            end)
            if suc then notify("📡 Teleporting...", "Đang vào JobId: " .. jobIdInput, 4)
            else notify("❌ Error", "Không thể join: " .. tostring(err), 4) end
        end
    })

    Tabs.Server:AddButton({
        Title = "🔄 Rejoin Server",
        Callback = function()
            if game.PrivateServerId ~= "" then
                TeleportService:TeleportToPrivateServer(PlaceId, game.PrivateServerId, {LocalPlayer})
            else
                TeleportService:Teleport(PlaceId, LocalPlayer)
            end
        end
    })

    local function serverHop()
        while true do
            local success, result = pcall(function()
                return HttpService:JSONDecode(game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. hopCursor
                ))
            end)
            if not success or not result or not result.data then
                notify("❌ Error", "Không lấy được dữ liệu server", 4)
                return
            end
            for _, server in ipairs(result.data) do
                if server.playing < server.maxPlayers and server.id ~= JobId and not triedServers[server.id] then
                    triedServers[server.id] = true
                    notify("🔄 Hop Server", "Đang chuyển...", 5)
                    task.wait(1)
                    TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
                    return
                end
            end
            hopCursor = result.nextPageCursor or ""
            if hopCursor == "" then
                notify("❌ No Servers", "Không tìm thấy server trống", 4)
                return
            end
        end
    end
    Tabs.Server:AddButton({
        Title = "🎲 Hop Server",
        Callback = function()
            hopCursor = ""
            triedServers = {}
            serverHop()
        end
    })
end
Server()

-- ============================================================
--  ⚙️ SETTINGS
-- ============================================================
local ThemeList = {"Dark", "Light", "Amethyst", "Aqua"}
Tabs.Settings:AddDropdown("ThemeDropdown", {
    Title = "🎨 Chọn Theme",
    Values = ThemeList,
    Multi = false,
    Default = "Dark",
    Callback = function(Value)
        pcall(function() Fluent:SetTheme(Value) end)
        Fluent:Notify({ Title = "🎨 Theme", Content = "Đã áp dụng: " .. Value, Duration = 2 })
    end
})

-- ============================================================
--  🖼️ CHUYỂN ĐỔI ICON (ANIME & CAT)
-- ============================================================

local iconData = {
    { id = "rbxassetid://12694777893", name = "🐷 Heo Peppa" },
    { id = "rbxassetid://5430597512", name = "🐱 Cat 1" },
    { id = "rbxassetid://5009915795", name = "🐱 Cat 2" },
    { id = "rbxassetid://13333189485", name = "🐱 Cat 3" }
}

local currentIcon = 1
local iconButton = nil

local function findIconButton()
    for _, gui in ipairs(TargetGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name == "Zidwi_ToggleIcon" then
            for _, child in ipairs(gui:GetChildren()) do
                if child:IsA("ImageButton") then
                    iconButton = child
                    return true
                end
            end
        end
    end
    return false
end

findIconButton()

local function setIcon(index)
    if iconButton then
        iconButton.Image = iconData[index].id
        currentIcon = index
        Fluent:Notify({
            Title = "🖼️ Đổi Icon",
            Content = "Đã chọn: " .. iconData[index].name,
            Duration = 2
        })
    end
end

-- UI Settings
Tabs.Settings:AddSection("🎨 Tùy Chỉnh Icon")

Tabs.Settings:AddDropdown("IconSelect", {
    Title = "🎨 Chọn Icon",
    Description = "Chọn icon yêu thích",
    Values = {
        "🐷 Heo Peppa",
        "🐱 Cat 1",
        "🐱 Cat 2",
        "🐱 Cat 3"
    },
    Multi = false,
    Default = 1,
    Callback = function(option)
        if not iconButton then findIconButton() end
        if iconButton then
            local map = {
                ["🐷 Heo Peppa"] = 1,
                ["🐱 Cat 1"] = 2,
                ["🐱 Cat 2"] = 3,
                ["🐱 Cat 3"] = 4,
            }
            setIcon(map[option] or 1)
        end
    end
})

Tabs.Settings:AddButton({
    Title = "🔄 Đổi Icon Ngẫu Nhiên",
    Description = "Chuyển đổi icon ngẫu nhiên",
    Callback = function()
        if not iconButton then findIconButton() end
        if iconButton then
            local random = math.random(1, #iconData)
            setIcon(random)
        end
    end
})

-- ============================================================
--  📦 AUTO BRING SYSTEM
-- ============================================================

-- ==================== BIẾN BRING ====================
local junkItems = {"Tyre", "Bolt", "Broken Fan", "Broken Microwave", "Sheet Metal", "Old Radio", "Washing Machine", "Old Car Engine"}
local selectedJunkItems = {}

local fuelItems = {"Log", "Chair", "Coal", "Fuel Canister", "Oil Barrel"}
local selectedFuelItems = {}

local foodItems = {"Cake", "Cooked Steak", "Cooked Morsel", "Steak", "Morsel", "Berry", "Carrot"}
local selectedFoodItems = {}

local medicalItems = {"Bandage", "MedKit"}
local selectedMedicalItems = {}

local equipmentItems = {"Revolver", "Rifle", "Leather Body", "Iron Body", "Revolver Ammo", "Rifle Ammo", "Giant Sack", "Good Sack", "Strong Axe", "Good Axe"}
local selectedEquipmentItems = {}

-- ==================== HÀM CHUYỂN ĐỔI DROPDOWN ====================
-- Fluent trả về dạng: {["Item1"] = true, ["Item2"] = true}
-- Cần chuyển thành array: {"Item1", "Item2"}
local function convertDropdownToArray(dropdownTable)
    local result = {}
    if type(dropdownTable) == "table" then
        for key, value in pairs(dropdownTable) do
            if value == true then
                table.insert(result, key)
            end
        end
    end
    return result
end

-- ==================== HÀM BRING ====================
local function moveItemToPos(item, position)
    if not item or not item:IsDescendantOf(workspace) then return end
    local part = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")) or item
    if not part or not part:IsA("BasePart") then return end

    if item:IsA("Model") and not item.PrimaryPart then
        pcall(function() item.PrimaryPart = part end)
    end

    pcall(function()
        if ReplicatedStorage:FindFirstChild("RemoteEvents") then
            local remoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
            if remoteEvents:FindFirstChild("RequestStartDraggingItem") then
                remoteEvents.RequestStartDraggingItem:FireServer(item)
            end
        end
        if item:IsA("Model") then
            item:SetPrimaryPartCFrame(CFrame.new(position))
        else
            part.CFrame = CFrame.new(position)
        end
        task.wait(0.05)
        if ReplicatedStorage:FindFirstChild("RemoteEvents") then
            local remoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
            if remoteEvents:FindFirstChild("StopDraggingItem") then
                remoteEvents.StopDraggingItem:FireServer(item)
            end
        end
    end)
end

local function BringItems(selectedTable, name)
    -- Chuyển đổi từ dropdown table sang array
    local list = convertDropdownToArray(selectedTable)
    
    if #list == 0 then
        Fluent:Notify({Title = "📦 Bring", Content = "Chưa chọn item nào!", Duration = 2})
        return
    end
    
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then 
        Fluent:Notify({Title = "❌ Lỗi", Content = "Không tìm thấy nhân vật!", Duration = 2})
        return 
    end

    local hrp = char.HumanoidRootPart
    local targetPos = hrp.Position + Vector3.new(3, 0, 0)

    Fluent:Notify({Title = "📦 Bring", Content = "Đang kéo " .. name .. "...", Duration = 3})

    local itemsFolder = Workspace:FindFirstChild("Items")
    if not itemsFolder then
        Fluent:Notify({Title = "❌ Lỗi", Content = "Không tìm thấy folder Items!", Duration = 2})
        return
    end

    for _, itemName in ipairs(list) do
        for _, item in ipairs(itemsFolder:GetChildren()) do
            if item.Name == itemName then
                moveItemToPos(item, targetPos)
                task.wait(0.08)
            end
        end
    end

    Fluent:Notify({Title = "✅ Bring", Content = "Hoàn thành " .. name .. "!", Duration = 3})
end

local function BringAllItems(itemsList, name)
    if not itemsList or #itemsList == 0 then
        Fluent:Notify({Title = "📦 Bring", Content = "Không có item nào để bring!", Duration = 2})
        return
    end
    
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then 
        Fluent:Notify({Title = "❌ Lỗi", Content = "Không tìm thấy nhân vật!", Duration = 2})
        return 
    end

    local hrp = char.HumanoidRootPart
    local targetPos = hrp.Position + Vector3.new(3, 0, 0)

    Fluent:Notify({Title = "📦 Bring", Content = "Đang kéo ALL " .. name .. "...", Duration = 3})

    local itemsFolder = Workspace:FindFirstChild("Items")
    if not itemsFolder then
        Fluent:Notify({Title = "❌ Lỗi", Content = "Không tìm thấy folder Items!", Duration = 2})
        return
    end

    for _, itemName in ipairs(itemsList) do
        for _, item in ipairs(itemsFolder:GetChildren()) do
            if item.Name == itemName then
                moveItemToPos(item, targetPos)
                task.wait(0.08)
            end
        end
    end

    Fluent:Notify({Title = "✅ Bring", Content = "Hoàn thành ALL " .. name .. "!", Duration = 3})
end

-- ============================================================
-- 📦 BRING UI (Tabs.Auto)
-- ============================================================

-- Junk
Tabs.Auto:AddSection("🗑️ Junk")

Tabs.Auto:AddDropdown("JunkDropdown", {
    Title = "Chọn Junk Items",
    Values = junkItems,
    Multi = true,
    Default = {},
    Callback = function(options)
        selectedJunkItems = options
    end
})

Tabs.Auto:AddButton({
    Title = "🚀 Bring Junk",
    Callback = function()
        BringItems(selectedJunkItems, "Junk")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Junk",
    Callback = function()
        BringAllItems(junkItems, "Junk")
    end
})

-- Fuel
Tabs.Auto:AddSection("🔥 Fuel")

Tabs.Auto:AddDropdown("FuelDropdown", {
    Title = "Chọn Fuel Items",
    Values = fuelItems,
    Multi = true,
    Default = {},
    Callback = function(options)
        selectedFuelItems = options
    end
})

Tabs.Auto:AddButton({
    Title = "🚀 Bring Fuel",
    Callback = function()
        BringItems(selectedFuelItems, "Fuel")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Fuel",
    Callback = function()
        BringAllItems(fuelItems, "Fuel")
    end
})

-- Food
Tabs.Auto:AddSection("🍖 Food")

Tabs.Auto:AddDropdown("FoodDropdown", {
    Title = "Chọn Food Items",
    Values = foodItems,
    Multi = true,
    Default = {},
    Callback = function(options)
        selectedFoodItems = options
    end
})

Tabs.Auto:AddButton({
    Title = "🚀 Bring Food",
    Callback = function()
        BringItems(selectedFoodItems, "Food")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Food",
    Callback = function()
        BringAllItems(foodItems, "Food")
    end
})

-- Medical
Tabs.Auto:AddSection("🩹 Medical")

Tabs.Auto:AddDropdown("MedDropdown", {
    Title = "Chọn Medical Items",
    Values = medicalItems,
    Multi = true,
    Default = {},
    Callback = function(options)
        selectedMedicalItems = options
    end
})

Tabs.Auto:AddButton({
    Title = "🚀 Bring Medical",
    Callback = function()
        BringItems(selectedMedicalItems, "Medical")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Medical",
    Callback = function()
        BringAllItems(medicalItems, "Medical")
    end
})

-- Equipment
Tabs.Auto:AddSection("🛡️ Equipment")

Tabs.Auto:AddDropdown("EquipDropdown", {
    Title = "Chọn Equipment Items",
    Values = equipmentItems,
    Multi = true,
    Default = {},
    Callback = function(options)
        selectedEquipmentItems = options
    end
})

Tabs.Auto:AddButton({
    Title = "🚀 Bring Equipment",
    Callback = function()
        BringItems(selectedEquipmentItems, "Equipment")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Equipment",
    Callback = function()
        BringAllItems(equipmentItems, "Equipment")
    end
})

-- Quick All
Tabs.Auto:AddSection("⚡ Quick Bring All")

Tabs.Auto:AddButton({
    Title = "🚀 Bring TẤT CẢ Đã Chọn",
    Callback = function()
        local all = {}
        for _, v in pairs(selectedJunkItems) do if v == true then table.insert(all, _) end end
        for _, v in pairs(selectedFuelItems) do if v == true then table.insert(all, _) end end
        for _, v in pairs(selectedFoodItems) do if v == true then table.insert(all, _) end end
        for _, v in pairs(selectedMedicalItems) do if v == true then table.insert(all, _) end end
        for _, v in pairs(selectedEquipmentItems) do if v == true then table.insert(all, _) end end
        BringItems(all, "All Items")
    end
})

Tabs.Auto:AddButton({
    Title = "📦 Bring ALL Items (Tất cả)",
    Callback = function()
        local all = {}
        for _, v in ipairs(junkItems) do table.insert(all, v) end
        for _, v in ipairs(fuelItems) do table.insert(all, v) end
        for _, v in ipairs(foodItems) do table.insert(all, v) end
        for _, v in ipairs(medicalItems) do table.insert(all, v) end
        for _, v in ipairs(equipmentItems) do table.insert(all, v) end
        BringAllItems(all, "All Items (Tất cả)")
    end
})

3
