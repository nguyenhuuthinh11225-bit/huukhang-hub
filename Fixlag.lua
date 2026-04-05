--// PRIME VIP - ALL IN ONE CLEAN HUB

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

------------------------------------------------
-- STATE
------------------------------------------------
local AntiAFK = true
local FixLag = true
local UIVisible = true

------------------------------------------------
-- ANTI AFK
------------------------------------------------
LocalPlayer.Idled:Connect(function()
    if AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)

------------------------------------------------
-- FIX LAG (CLIENT SAFE)
------------------------------------------------
local function ApplyFixLag(state)

    if state then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.Brightness = 1

        for _,v in ipairs(Lighting:GetDescendants()) do
            if v:IsA("PostEffect") then
                v.Enabled = false
            end
        end

        for _,v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = false
            elseif v:IsA("Trail") then
                v.Enabled = false
            elseif v:IsA("Beam") then
                v.Enabled = false
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end

        Lighting.ExposureCompensation = -0.2
    else
        Lighting.GlobalShadows = true
        Lighting.Brightness = 2
        Lighting.ExposureCompensation = 0
    end
end

-- AUTO ON
ApplyFixLag(true)

------------------------------------------------
-- UI
------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "PrimeVIP_AllInOne"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 240, 0, 170)
main.Position = UDim2.new(0.5, -120, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "PRIME VIP ALL IN ONE"
title.TextColor3 = Color3.fromRGB(0,255,170)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local function btn(text, y)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.85,0,0,30)
    b.Position = UDim2.new(0.075,0,y,0)
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    Instance.new("UICorner", b)
    return b
end

------------------------------------------------
-- BUTTONS
------------------------------------------------
local antiBtn = btn("Anti AFK : ON", 0.22)
local fixBtn  = btn("Fix Lag : ON", 0.45)

------------------------------------------------
-- TOGGLES
------------------------------------------------
antiBtn.MouseButton1Click:Connect(function()
    AntiAFK = not AntiAFK
    antiBtn.Text = AntiAFK and "Anti AFK : ON" or "Anti AFK : OFF"
end)

fixBtn.MouseButton1Click:Connect(function()
    FixLag = not FixLag
    ApplyFixLag(FixLag)
    fixBtn.Text = FixLag and "Fix Lag : ON" or "Fix Lag : OFF"
end)

------------------------------------------------
-- FPS BUTTON (TOGGLE UI)
------------------------------------------------
local fpsGui = Instance.new("ScreenGui", game.CoreGui)

local fps = Instance.new("TextButton", fpsGui)
fps.Size = UDim2.new(0, 100, 0, 30)
fps.Position = UDim2.new(0, 10, 0, 10)
fps.BackgroundColor3 = Color3.fromRGB(0,0,0)
fps.BackgroundTransparency = 0.4
fps.TextColor3 = Color3.fromRGB(0,255,120)
fps.Font = Enum.Font.GothamBold
fps.TextSize = 14
fps.Text = "FPS"

local last = tick()
local frames = 0

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - last >= 1 then
        fps.Text = "FPS: " .. frames
        frames = 0
        last = tick()
    end
end)

fps.MouseButton1Click:Connect(function()
    UIVisible = not UIVisible
    main.Visible = UIVisible
end)
