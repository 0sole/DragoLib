local Button = {}

function Button:Create(parent, cfg)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Text = cfg.Name
    b.Parent = parent
    b.MouseButton1Click:Connect(cfg.Callback)
    return b
end

return Button
