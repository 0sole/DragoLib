local DragoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Window.lua"))()

-- DragoLib'in yüklendiğinden emin olalım
if not DragoLib then warn("WindowLib yüklenemedi!") return end

local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

-- Eğer CreateWindow bir şey döndürmediyse hata vermesini engelleyelim
if not Drago then warn("Window oluşturulamadı!") return end

local Tab1 = Drago:CreateTab("Main")

Tab1:CreateButton("Test Butonu", function()
    print("Çalıştı!")
end)

Tab1:CreateToggle("Örnek Toggle", false, function(s)
    print("Durum:", s)
end)
