local DragoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Window.lua"))()

-- Hata kontrolü yapalım
if not DragoLib then 
    warn("DragoLib yüklenemedi! Linkleri kontrol et.") 
    return 
end

local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

-- CreateWindow nil döndürürse burada durdurur
if not Drago then 
    warn("Pencere oluşturulamadı! return satırlarını kontrol et.") 
    return 
end

local Tab1 = Drago:CreateTab("Main")

Tab1:CreateButton("Test Butonu", function()
    print("Buton Başarıyla Çalıştı!")
end)

Tab1:CreateToggle("Örnek Özellik", false, function(state)
    print("Özellik Durumu:", state)
end)
