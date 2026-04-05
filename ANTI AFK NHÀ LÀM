-- PRIME VIP - AMETHYST STYLE

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer

-- Xóa GUI cũ
if player:WaitForChild("PlayerGui"):FindFirstChild("PrimeVIP") then
    player.PlayerGui.PrimeVIP:Destroy()
end

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PrimeVIP"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 260, 0, 150)
Main.Position = UDim2.new(0.35, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(120, 60, 200) -- tím amethyst
Main.Active = true
Main.Draggable = true

-- Bo góc
Instance.new("UICorner", Main)

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "PRIME VIP"
Title.BackgroundColor3 = Color3.fromRGB(90, 40, 160)
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.FredokaOne -- gần giống graffiti
Title.TextScaled = true

-- Toggle Anti AFK
local AntiAFK = false

local Toggle = Instance.new("TextButton", Main)
Toggle.Size = UDim2.new(0.8,0,0,40)
Toggle.Position = UDim2.new(0.1,0,0.4,0)
Toggle.Text = "ANTI AFK: OFF"
Toggle.BackgroundColor3 = Color3.fromRGB(170,0,0) -- đỏ
Toggle.TextColor3 = Color3.fromRGB(255,255,255)
Toggle.Font = Enum.Font.FredokaOne
Toggle.TextScaled = true

Toggle.MouseButton1Click:Connect(function()
    AntiAFK = not AntiAFK
    
    if AntiAFK then
        Toggle.Text = "ANTI AFK: ON"
        Toggle.BackgroundColor3 = Color3.fromRGB(0,170,0) -- xanh
    else
        Toggle.Text = "ANTI AFK: OFF"
        Toggle.BackgroundColor3 = Color3.fromRGB(170,0,0) -- đỏ
    end
end)

-- Anti AFK Function
player.Idled:Connect(function()
    if AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new(0,0))
    end
end)

-- Nút ẩn menu
local Hide = Instance.new("TextButton", Main)
Hide.Size = UDim2.new(0.8,0,0,30)
Hide.Position = UDim2.new(0.1,0,0.75,0)
Hide.Text = "HIDE"
Hide.BackgroundColor3 = Color3.fromRGB(60,0,90)
Hide.TextColor3 = Color3.fromRGB(255,255,255)
Hide.Font = Enum.Font.FredokaOne
Hide.TextScaled = true

Hide.MouseButton1Click:Connect(function()
    Main.Visible = false
end)
