-- Window dosyasını internetten çekiyoruz
local DragoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Window.lua"))()

local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

local Tab1 = Drago:CreateTab("Main")
local Tab2 = Drago:CreateTab("Settings")

Tab1:CreateButton("Merhaba Drago!", function() 
    print("Buton çalışıyor!") 
end)

Tab1:CreateToggle("Örnek Toggle", false, function(state) 
    print("Toggle:", state) 
end)

Tab1:CreateKeybind("Menü Tuşu", Enum.KeyCode.RightControl, function(key) 
    print("Yeni tuş:", key.Name) 
end)
