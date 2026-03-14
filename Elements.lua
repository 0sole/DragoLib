local Elements = {}
local TweenService = game:GetService("TweenService")

function Elements:CreateButton(Page, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.96, 0, 0, 45)
    Button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Button.Text = "  " .. text
    Button.TextColor3 = Color3.fromRGB(210, 210, 210)
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Font = Enum.Font.GothamSemibold
    Button.TextSize = 16
    Button.Parent = Page
    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)
    local S = Instance.new("UIStroke", Button)
    S.Color = Color3.fromRGB(180, 0, 0)
    S.Transparency = 0.5
    Button.MouseButton1Click:Connect(function() pcall(callback) end)
end

function Elements:CreateToggle(Page, text, default, callback)
    local Toggled = default or false
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0.96, 0, 0, 45)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    ToggleBtn.Text = "  " .. text
    ToggleBtn.TextColor3 = Color3.fromRGB(210, 210, 210)
    ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
    ToggleBtn.Font = Enum.Font.GothamSemibold
    ToggleBtn.TextSize = 16
    ToggleBtn.Parent = Page
    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 42, 0, 22)
    Indicator.Position = UDim2.new(1, -52, 0.5, -11)
    Indicator.BackgroundColor3 = Toggled and Color3.fromRGB(180, 0, 0) or Color3.fromRGB(40, 40, 40)
    Indicator.Parent = ToggleBtn
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    local Switch = Instance.new("Frame")
    Switch.Size = UDim2.new(0, 18, 0, 18)
    Switch.Position = Toggled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    Switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Switch.Parent = Indicator
    Instance.new("UICorner", Switch).CornerRadius = UDim.new(1, 0)

    ToggleBtn.MouseButton1Click:Connect(function()
        Toggled = not Toggled
        local targetPos = Toggled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        local targetCol = Toggled and Color3.fromRGB(180, 0, 0) or Color3.fromRGB(40, 40, 40)
        TweenService:Create(Switch, TweenInfo.new(0.2), {Position = targetPos}):Play()
        TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = targetCol}):Play()
        pcall(callback, Toggled)
    end)
end

print("DragoLib: Elements Loaded")
return Elements
