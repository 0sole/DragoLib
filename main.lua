-- Sadece Window.lua dosyasını çağırıyoruz, gerisini o hallediyor!
-- Not: Çalıştığın executor'a göre loadfile yerine loadstring(readfile("Window.lua"))() gerekebilir.
local DragoLib = loadfile("Window.lua")()

-- [[ KULLANIM ]] --
local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

local Tab1 = Drago:CreateTab("test1")
local Tab2 = Drago:CreateTab("test")

Tab1:CreateButton("Long Button Example", function() 
    print("Clicked!") 
end)

Tab1:CreateToggle("Auto Kill", false, function(state) 
    print("Status:", state) 
end)

Tab1:CreateKeybind("Aimbot Key", Enum.KeyCode.E, function(key) 
    print("New Key:", key.Name) 
end)
