local WindowLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Elements.lua"))()

function WindowLib:CreateWindow(options)
    local WindowName = options.Name or "DRAGO INTERNAL"
    
    local DragoUI = Instance.new("ScreenGui")
    DragoUI.Name = "Drago_v4"
    DragoUI.Parent = (gethui and gethui()) or CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 650, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.Parent = DragoUI
    Instance.new("UICorner", MainFrame)

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Sidebar.Parent = MainFrame

    local TabHolder = Instance.new("ScrollingFrame")
    TabHolder.Size = UDim2.new(1, -10, 1, -20)
    TabHolder.Position = UDim2.new(0, 5, 0, 10)
    TabHolder.BackgroundTransparency = 1
    TabHolder.ScrollBarThickness = 0
    TabHolder.Parent = Sidebar
    Instance.new("UIListLayout", TabHolder).Padding = UDim.new(0, 5)

    local PageHolder = Instance.new("Frame")
    PageHolder.Size = UDim2.new(1, -170, 1, -20)
    PageHolder.Position = UDim2.new(0, 165, 0, 10)
    PageHolder.BackgroundTransparency = 1
    PageHolder.Parent = MainFrame

    local WindowFunctions = {}

    function WindowFunctions:CreateTab(name)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 0, 35)
        TabBtn.Text = name
        TabBtn.Parent = TabHolder

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.Visible = false
        Page.BackgroundTransparency = 1
        Page.Parent = PageHolder
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 10)

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PageHolder:GetChildren()) do v.Visible = false end
            Page.Visible = true
        end)
        
        if #TabHolder:GetChildren() == 2 then Page.Visible = true end -- İlk sekmeyi aç

        local ElementFunctions = {}
        function ElementFunctions:CreateButton(t, c) Elements:CreateButton(Page, t, c) end
        function ElementFunctions:CreateToggle(t, d, c) Elements:CreateToggle(Page, t, d, c) end
        
        return ElementFunctions
    end

    return WindowFunctions -- BURASI KRİTİK: Tabloyu döndürmeli!
end

return WindowLib
