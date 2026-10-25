-- =======================================================
-- 7b1 Hub - Universal Loader
-- Supported: PC, Android, Cloud Phone | Keyless
-- =======================================================

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Khởi tạo Window 7b1 Hub
local Window = OrionLib:MakeWindow({
    Name = "7b1 Hub | Universal",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "7b1HubConfig",
    IntroText = "Loading 7b1 Hub..."
})

-- Hàm Tối Ưu Đồ Họa (Fix Lag Max)
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
    OrionLib:MakeNotification({
        Name = "7b1 Hub",
        Content = "Đã kích hoạt Fix Lag Max!",
        Image = "rbxassetid://4483345998",
        Time = 3
    })
end

-- TAB 1: FIX LAG & UTILITY
local TabUtility = Window:MakeTab({
    Name = "Fix Lag & Utility",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TabUtility:AddButton({
    Name = "⚡ Kích Hoạt Fix Lag Max (Tăng FPS)",
    Callback = function()
        ApplyMaxFixLag()
    end    
})

TabUtility:AddButton({
    Name = "🛡️ Chống AFK (Tránh Văng 20p)",
    Callback = function()
        local ba = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            ba:CaptureController()
            ba:ClickButton2(Vector2.new())
        end)
        OrionLib:MakeNotification({
            Name = "7b1 Hub",
            Content = "Đã bật Anti-AFK!",
            Time = 3
        })
    end    
})

-- TAB 2: STEAL AN EGG
local TabSAE = Window:MakeTab({
    Name = "Steal An Egg",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TabSAE:AddButton({
    Name = "▶ Run Chilli V4 (Tiếng Việt)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kadit9999/stealanegg/refs/heads/main/chillimodrubu.lua"))()
    end    
})

TabSAE:AddButton({
    Name = "▶ Run Chilli Vzexe (Spicy)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    end    
})

TabSAE:AddButton({
    Name = "▶ Run Chilli Venyx (Mod Viễn Đông)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ronnei/hihi/refs/heads/main/chillihubnew.lua"))()
    end    
})

-- TAB 3: BLOX FRUITS
local TabBF = Window:MakeTab({
    Name = "Blox Fruits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TabBF:AddButton({
    Name = "▶ Run RealKid Hub (Blox Fruits)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
    end    
})

-- TAB 4: LOW-END OPTIMIZATION
local TabOptimize = Window:MakeTab({
    Name = "Low-End Optimizer",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local lowEndMode = false

local function DisableVisualHeavyEffects()
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.FogStart = 9e9
    lighting.Brightness = 1
    lighting.ClockTime = 14
    lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 0
    end

    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("UnionOperation") or obj:IsA("MeshPart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Reflectance = 0
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            if obj.Parent then
                obj:Destroy()
            end
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
            obj.Enabled = false
        elseif obj:IsA("Explosion") then
            obj.BlastPressure = 0
            obj.BlastRadius = 0
        end
    end
end

local function RestoreVisualEffects()
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = true
    lighting.FogEnd = 1000
    lighting.FogStart = 0
    lighting.Brightness = 2
    lighting.ClockTime = 14
    lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
            obj.Enabled = true
        elseif obj:IsA("Explosion") then
            obj.BlastPressure = 1
            obj.BlastRadius = 10
        end
    end
end

TabOptimize:AddButton({
    Name = "⚡ Bật/Tắt Low-End Fix",
    Callback = function()
        lowEndMode = not lowEndMode
        if lowEndMode then
            DisableVisualHeavyEffects()
            OrionLib:MakeNotification({
                Name = "7b1 Hub",
                Content = "Đã bật Low-End Fix cho máy yếu!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            RestoreVisualEffects()
            OrionLib:MakeNotification({
                Name = "7b1 Hub",
                Content = "Đã tắt Low-End Fix!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

TabOptimize:AddButton({
    Name = "🧹 Xóa Hiệu Ứng Đồ Họa Nặng",
    Callback = function()
        DisableVisualHeavyEffects()
        OrionLib:MakeNotification({
            Name = "7b1 Hub",
            Content = "Đã xóa hiệu ứng đồ họa nặng!",
            Time = 3
        })
    end
})

TabOptimize:AddButton({
    Name = "📉 Khôi Phục Hiệu Ứng Mặc Định",
    Callback = function()
        RestoreVisualEffects()
        OrionLib:MakeNotification({
            Name = "7b1 Hub",
            Content = "Đã khôi phục hiệu ứng mặc định!",
            Time = 3
        })
    end
})

OrionLib:Init()
