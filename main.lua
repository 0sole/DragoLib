local DragoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Window.lua"))()

local Drago = DragoLib:CreateWindow({Name = "DRAGO INTERNAL"})

local Tab1 = Drago:CreateTab("test1")
local Tab2 = Drago:CreateTab("test")

Tab1:CreateButton("Long Button Example", function() print("Clicked!") end)
Tab1:CreateToggle("Auto Kill", false, function(state) print("Status:", state) end)
Tab1:CreateKeybind("Aimbot Key", Enum.KeyCode.E, function(key) print("New Key:", key.Name) end)
