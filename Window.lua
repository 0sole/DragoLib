local WindowLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Elements dosyasını internetten çekiyoruz
local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Elements.lua"))()

function WindowLib:CreateWindow(options)
    local WindowName = options.Name or "DRAGO INTERNAL"
    local TargetSize = UDim2.new(0, 650, 0, 420) 
    
    local DragoUI = Instance.new("ScreenGui")
    DragoUI.Name = "Drago_v4_Final"
    DragoUI.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = DragoUI
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
    
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(180, 0, 0)
    MainStroke.Thickness = 1.8

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame

    local TabHolder = Instance.new("ScrollingFrame")
    TabHolder.Size = UDim2.new(1, -20, 1, -95)
    TabHolder.Position = UDim2.new(0, 10, 0, 85)
    TabHolder.BackgroundTransparency = 1
    TabHolder.BorderSizePixel = 0
    TabHolder.ScrollBarThickness = 0
    TabHolder.Parent = Sidebar
    Instance.new("UIListLayout", TabHolder).Padding = UDim.new(0, 8)

    local PageHolder = Instance.new("Frame")
    PageHolder.Size = UDim2.new(1, -175, 1, -95)
    PageHolder.Position = UDim2.new(0, 170, 0, 90)
    PageHolder.BackgroundTransparency = 1
    PageHolder.Parent = MainFrame

    -- Açılış Animasyonu
    TweenService:Create(MainFrame, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = TargetSize}):Play()

    local WindowFunctions = {}
    local FirstTab = true

    function WindowFunctions:CreateTab(name)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 0, 40)
        TabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextSize = 16
        TabBtn.Parent = TabHolder
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 5)
        
        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 2
        Page.Parent = PageHolder
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 10)

        if FirstTab then
            Page.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
            FirstTab = false
        end

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PageHolder:GetChildren()) do v.Visible = false end
            for _, v in pairs(TabHolder:GetChildren()) do 
                if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(120, 120, 120) end
            end
            Page.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
        end)

        local ElementFunctions = {}
        function ElementFunctions:CreateButton(text, callback) Elements:CreateButton(Page, text, callback) end
        function ElementFunctions:CreateToggle(text, default, callback) Elements:CreateToggle(Page, text, default, callback) end
        function ElementFunctions:CreateKeybind(text, def, callback) Elements:CreateKeybind(Page, text, def, callback) end
        
        return ElementFunctions
    end

    return WindowFunctions
end

return WindowLib
