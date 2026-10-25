-- =======================================================
-- 7b1 Hub - Universal Loader & Router
-- Specializing in: Blox Fruits & Steal An Egg
-- Supported: PC, Android, Cloud Phone | Keyless
-- =======================================================

-- 1. Danh Sách Script Tương Ứng
local SAE_SCRIPT = "https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEggg"
local BF_SCRIPT  = "https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"

-- 2. Bảng Ánh Xạ Theo GameId (Cơ chế giống Chilli.lua)
local byGameId = {
    [10563114921] = SAE_SCRIPT, -- Steal An Egg GameId
}

-- 3. Bảng Ánh Xạ Theo PlaceId (Chứa cả ID Blox Fruits & Steal An Egg)
local byPlaceId = {
    -- Steal An Egg Place IDs
    [107778070777162] = SAE_SCRIPT,
    [18806284102]     = SAE_SCRIPT,
    
    -- Blox Fruits Place IDs (Sea 1, Sea 2, Sea 3)
    [2753915549] = BF_SCRIPT,
    [4442272183] = BF_SCRIPT,
    [7449423635] = BF_SCRIPT,
}

-- 4. Chờ Lấy GameId & PlaceId
local gameId = game.GameId
while gameId == 0 and game.PlaceId == 0 do
    task.wait()
    gameId = game.GameId
end

-- 5. Lấy URL Script Tương Ứng
local url = byGameId[gameId] or byPlaceId[game.PlaceId]

-- Nếu không thuộc 2 game trên, tự động chạy Anti-AFK & Fix Lag nhẹ
if not url then
    local ba = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        ba:CaptureController()
        ba:ClickButton2(Vector2.new())
    end)
    return
end

-- 6. Cơ Chế Thử Kết Nối 3 Lần (Đảm bảo load 100% không bị xịt)
for _ = 1, 3 do
    local ok, source = pcall(game.HttpGet, game, url)
    if ok and type(source) == "string" and source ~= "" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
        return
    end
    task.wait(0.5)
end
