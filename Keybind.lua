local Keybind = {}

function Keybind:Create(parent, cfg)
    local k = Instance.new("TextButton")
    k.Size = UDim2.new(1, -10, 0, 30)
    k.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    k.Text = cfg.Name .. " [" .. cfg.CurrentKeybind .. "]"
    k.TextColor3 = Color3.fromRGB(255, 255, 255)
    k.Parent = parent
    k.MouseButton1Click:Connect(cfg.Callback)
    return k
end

return Keybind
