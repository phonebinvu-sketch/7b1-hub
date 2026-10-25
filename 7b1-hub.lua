-- =======================================================
-- 7b1 Hub - Universal GUI Loader
-- Tự động bật Menu trên Delta X / Cloud Phone
-- =======================================================

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Khởi tạo Window 7b1 Hub
local Window = Fluent:CreateWindow({
    Title = "7b1 Hub | Universal",
    SubTitle = "Select Your Script",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 320),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tạo các Tab
local Tabs = {
    Main = Window:AddTab({ Title = "Kho Script", Icon = "code" }),
    Utils = Window:AddTab({ Title = "Tối Ưu / Fix Lag", Icon = "zap" })
}

-- TAB 1: SCRIPT CHÍNH (Chilli V7 & Kid Hub)
Tabs.Main:AddButton({
    Title = "▶ Run Chilli Hub V7 (Steal An Egg)",
    Description = "Bản chuẩn chính chủ tienkhanh1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
        Fluent:Notify({ Title = "7b1 Hub", Content = "Đang chạy Chilli Hub V7...", Duration = 3 })
    end
})

Tabs.Main:AddButton({
    Title = "▶ Run Kid Hub (Blox Fruits)",
    Description = "Bản chuẩn cho Blox Fruits",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
        Fluent:Notify({ Title = "7b1 Hub", Content = "Đang chạy Kid Hub...", Duration = 3 })
    end
})

-- TAB 2: TỐI ƯU & FIX LAG
Tabs.Utils:AddButton({
    Title = "⚡ Kích Hoạt Fix Lag Max",
    Description = "Tăng FPS tối đa cho máy yếu / Cloud Phone",
    Callback = function()
        local Terrain = workspace:FindFirstChildOfClass('Terrain')
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 0
        end
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").FogEnd = 9e9
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
        Fluent:Notify({ Title = "7b1 Hub", Content = "Đã bật Fix Lag Max thành công!", Duration = 3 })
    end
})

Tabs.Utils:AddButton({
    Title = "🛡️ Bật Chống AFK (Anti-AFK)",
    Description = "Tránh bị treo văng game sau 20 phút",
    Callback = function()
        local ba = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            ba:CaptureController()
            ba:ClickButton2(Vector2.new())
        end)
        Fluent:Notify({ Title = "7b1 Hub", Content = "Đã kích hoạt Anti-AFK!", Duration = 3 })
    end
})

Window:SelectTab(1)
