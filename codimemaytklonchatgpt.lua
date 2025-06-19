repeat wait() until game:IsLoaded()

-- Thông báo khởi động
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang chạy script...",
    Duration = 3
})

-- Chạy script gốc của Min Gaming
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXoE"))()
end)

if not success then
    warn("Không thể tải script Min Gaming:", err)
end

-- Thay đổi giao diện: Tên và ảnh
spawn(function()
    wait(7) -- Chờ GUI load đầy đủ
    local gui = game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui", true)
    if gui then
        for _, obj in pairs(gui:GetDescendants()) do
            if obj:IsA("TextLabel") and obj.Text:find("Min") then
                obj.Text = obj.Text:gsub("Min Gaming", "Phạm Nghĩa IOS")
            end
            if obj:IsA("ImageLabel") and obj.Image ~= nil and obj.Image:find("http") then
                obj.Image = "https://i.imgur.com/JrgPMTO.jpeg" -- ảnh Obito
            end
        end
    end
end)
