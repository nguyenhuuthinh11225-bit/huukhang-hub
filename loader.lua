repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

pcall(function()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/nguyenhuuthinh11225-bit/huukhang-hub/main/main.lua"
    ))()
end)
