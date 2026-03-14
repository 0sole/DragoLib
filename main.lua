-- main.lua
-- İnternetten Window.lua'yı çekiyoruz
local DragoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Window.lua"))()

local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

local Tab1 = Drago:CreateTab("test1")
local Tab2 = Drago:CreateTab("test")

Tab1:CreateButton("Buton Testi", function() 
    print("Butona basıldı!") 
end)

Tab1:CreateToggle("Toggle Testi", false, function(state) 
    print("Durum:", state) 
end)
