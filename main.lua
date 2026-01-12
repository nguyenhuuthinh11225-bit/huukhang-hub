repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

-- =========================
-- LOAD RAYFIELD UI
-- =========================
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "huukhang-hub",
    LoadingTitle = "huukhang-hub",
    LoadingSubtitle = "Cộng Đồng Việt Nam",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "huukhang-hub",
        FileName = "CDVN_Config"
    },
    KeySystem = false
})

-- =========================
-- SERVICES
-- =========================
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- =========================
-- SETTINGS
-- =========================
local Settings = {
    AutoNPC = false,
    AutoBoss = false,
    NPCName = "",
    BossName = "giang",
    AttackDelay = 0.25,
    AntiAFK = false,
    ShowBossHP = true
}

-- =========================
-- TAB AUTO FARM
-- =========================
local MainTab = Window:CreateTab("Auto Farm", 4483362458)

MainTab:CreateInput({
    Name = "Tên NPC nhỏ (không bắt buộc)",
    PlaceholderText = "để trống = farm tất cả NPC",
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
        Settings.NPCName = txt:lower()
    end
})

MainTab:CreateInput({
    Name = "Tên Boss Giang Hồ",
    PlaceholderText = "vd: giang",
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
        if txt ~= "" then
            Settings.BossName = txt:lower()
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Farm NPC nhỏ",
    CurrentValue = false,
    Callback = function(v)
        Settings.AutoNPC = v
    end
})

MainTab:CreateToggle({
    Name = "Auto Farm Boss Giang Hồ",
    CurrentValue = false,
    Callback = function(v)
        Settings.AutoBoss = v
    end
})

MainTab:CreateToggle({
    Name = "Anti AFK (treo lâu không kick)",
    CurrentValue = false,
    Callback = function(v)
        Settings.AntiAFK = v
    end
})

-- Boss HP
local BossHPLabel = MainTab:CreateParagraph({
    Title = "Boss HP",
    Content = "Chưa có boss"
})

-- =========================
-- BLOCK IDLE KICK
-- =========================
Player.Idled:Connect(function()
    if Settings.AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- =========================
-- FIND TARGET (CDVN)
-- =========================
local function GetTarget(isBoss)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model")
        and v:FindFirstChild("Humanoid")
        and v:FindFirstChild("HumanoidRootPart") then

            if v.Humanoid.Health > 0 then
                local name = v.Name:lower()

                if isBoss then
                    if name:find(Settings.BossName) then
                        return v
                    end
                else
                    if not name:find(Settings.BossName) then
                        if Settings.NPCName == "" or name:find(Settings.NPCName) then
                            return v
                        end
                    end
                end
            end
        end
    end
end

local angle = 0
local radius = 6 -- khoảng cách quay

local function GetBossHP(boss)
    if boss and boss:FindFirstChild("Humanoid") then
        return math.floor(boss.Humanoid.Health),
               math.floor(boss.Humanoid.MaxHealth)
    end
    return 0,0
end

-- =========================
-- ATTACK FUNCTIONS
-- =========================
local function AttackNPC(target)
    local char = Player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    hrp.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
    pcall(function()
        mouse1click()
    end)
end

local function AttackBoss(target)
    local char = Player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    angle = angle + math.rad(15)
    local offset = CFrame.new(
        math.cos(angle) * radius,
        2,
        math.sin(angle) * radius
    )

    hrp.CFrame = target.HumanoidRootPart.CFrame * offset

    pcall(function()
        mouse1click()
    end)

    if Settings.ShowBossHP then
        local hp, maxhp = GetBossHP(target)
        BossHPLabel:Set({
            Title = "Boss HP",
            Content = hp .. " / " .. maxhp
        })
    end
end

-- =========================
-- ANTI AFK MOVE
-- =========================
task.spawn(function()
    while task.wait(math.random(25,40)) do
        if Settings.AntiAFK then
            local char = Player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                hrp.CFrame = hrp.CFrame * CFrame.new(
                    math.random(-1,1),
                    0,
                    math.random(-1,1)
                )
            end
        end
    end
end)

-- =========================
-- AUTO FARM LOOP
-- =========================
task.spawn(function()
    while task.wait(Settings.AttackDelay) do
        if Settings.AutoNPC then
            local npc = GetTarget(false)
            if npc then
                AttackNPC(npc)
            end
        end

        if Settings.AutoBoss then
            local boss = GetTarget(true)
            if boss then
                AttackBoss(boss)
            end
        end
    end
end)
