local WindowLib = {}
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Elements'i çekiyoruz
local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Elements.lua"))()

function WindowLib:CreateWindow(options)
    local WindowName = (options and options.Name) or "DRAGO INTERNAL"
    
    local DragoUI = Instance.new("ScreenGui")
    DragoUI.Name = "Drago_v4"
    -- Executor desteğine göre GUI'yi korumalı yere koyalım
    local Parent = (gethui and gethui()) or CoreGui
    DragoUI.Parent = Parent

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 650, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.Parent = DragoUI
    Instance.new("UICorner", MainFrame)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(180, 0, 0)

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Sidebar.BorderSizePixel = 0
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
        TabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.Parent = TabHolder
        Instance.new("UICorner", TabBtn)

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.Visible = false
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 0
        Page.Parent = PageHolder
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 10)

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PageHolder:GetChildren()) do v.Visible = false end
            Page.Visible = true
        end)
        
        -- Eğer ilk sekme ise otomatik göster
        if #TabHolder:GetChildren() == 2 then Page.Visible = true end 

        local ElementFunctions = {}
        function ElementFunctions:CreateButton(t, c) Elements:CreateButton(Page, t, c) end
        function ElementFunctions:CreateToggle(t, d, c) Elements:CreateToggle(Page, t, d, c) end
        
        return ElementFunctions
    end

    print("DragoLib: Window Created")
    return WindowFunctions -- BURASI OLMADAN HATA VERİR!
end

print("DragoLib: WindowLib Loaded")
return WindowLib
