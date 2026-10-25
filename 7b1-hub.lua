-- =======================================================
-- 7b1 Hub - Fluent UI Version
-- Supported: PC, Android, Cloud Phone | Keyless
-- =======================================================

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local PlaceId = game.PlaceId

-- Khởi tạo Window
local Window = Fluent:CreateWindow({
    Title = "7b1 Hub | Universal",
    SubTitle = "Auto Detect Game",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 320),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Hàm Fix Lag Max
local function ApplyMaxFixLag()
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
    
    Fluent:Notify({
        Title = "7b1 Hub",
        Content = "Đã kích hoạt Fix Lag Max thành công!",
        Duration = 3
    })
end

-- TAB 1: FIX LAG & UTILITY
local Tabs = {
    Utility = Window:AddTab({ Title = "Fix Lag & Utility", Icon = "zap" })
}

Tabs.Utility:AddButton({
    Title = "⚡ Kích Hoạt Fix Lag Max",
    Description = "Tăng FPS tối đa cho Cloud Phone & Điện thoại",
    Callback = function()
        ApplyMaxFixLag()
    end
})

Tabs.Utility:AddButton({
    Title = "🛡️ Chống AFK (Tránh Văng 20p)",
    Description = "Tự động giữ kết nối 24/7",
    Callback = function()
        local ba = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            ba:CaptureController()
            ba:ClickButton2(Vector2.new())
        end)
        Fluent:Notify({
            Title = "7b1 Hub",
            Content = "Đã bật Anti-AFK!",
            Duration = 3
        })
    end
})

-- NHẬN DIỆN GAME & THÊM TAB
local isSAE = string.find(game:GetService("MarketplaceService"):GetProductInfo(PlaceId).Name:lower(), "egg")
local isBF  = (PlaceId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635) or string.find(game:GetService("MarketplaceService"):GetProductInfo(PlaceId).Name:lower(), "blox fruit")

if isSAE then
    Tabs.SAE = Window:AddTab({ Title = "Steal An Egg", Icon = "egg" })

    Tabs.SAE:AddButton({
        Title = "▶ Run Chilli V4 (Tiếng Việt)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kadit9999/stealanegg/refs/heads/main/chillimodrubu.lua"))()
        end
    })

    Tabs.SAE:AddButton({
        Title = "▶ Run Chilli Vzexe (Spicy)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
        end
    })

    Tabs.SAE:AddButton({
        Title = "▶ Run Chilli Venyx (Mod Viễn Đông)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ronnei/hihi/refs/heads/main/chillihubnew.lua"))()
        end
    })

elseif isBF then
    Tabs.BF = Window:AddTab({ Title = "Blox Fruits", Icon = "swords" })

    Tabs.BF:AddButton({
        Title = "▶ Run RealKid Hub (Blox Fruits)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
        end
    })

else
    Tabs.All = Window:AddTab({ Title = "All Scripts", Icon = "layers" })

    Tabs.All:AddButton({
        Title = "▶ Run RealKid Hub (Blox Fruits)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
        end
    })

    Tabs.All:AddButton({
        Title = "▶ Run Chilli V4 (Steal An Egg)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kadit9999/stealanegg/refs/heads/main/chillimodrubu.lua"))()
        end
    })
end

Window:SelectTab(1)
