local WindowLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Elements.lua dosyasını yüklüyoruz.
-- Not: Eğer executor loadfile desteklemiyorsa şunu kullan: loadstring(readfile("Elements.lua"))()
local Elements = loadfile("Elements.lua")() 

function WindowLib:CreateWindow(options)
    local WindowName = options.Name or "DRAGO INTERNAL"
    local TargetSize = UDim2.new(0, 650, 0, 420) 
    
    local DragoUI = Instance.new("ScreenGui")
    DragoUI.Name = "Drago_v4_Final"
    if syn and syn.protect_gui then syn.protect_gui(DragoUI) end
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
    
    -- ... [BURAYA ANA PENCERE TASARIMLARINI (TopBar, Sidebar, Profile, MinBtn, CloseBtn vs.) ve SÜRÜKLEME (Draggable) İŞLEMLERİNİ YAPIŞTIR] ...
    
    -- TAB HOLDER VE PAGE HOLDER (Eksik olmasın)
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 160, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Sidebar.Parent = MainFrame
    
    local TabHolder = Instance.new("ScrollingFrame")
    TabHolder.Size = UDim2.new(1, -20, 1, -95)
    TabHolder.Position = UDim2.new(0, 10, 0, 85)
    TabHolder.BackgroundTransparency = 1
    TabHolder.Parent = Sidebar
    Instance.new("UIListLayout", TabHolder).Padding = UDim.new(0, 8)

    local PageHolder = Instance.new("Frame")
    PageHolder.Size = UDim2.new(1, -175, 1, -95)
    PageHolder.Position = UDim2.new(0, 170, 0, 90)
    PageHolder.BackgroundTransparency = 1
    PageHolder.Parent = MainFrame

    -- [AÇILIŞ ANİMASYONU VE YÜKLEME EKRANI KODLARI BURAYA] --
    local openTween = TweenService:Create(MainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = TargetSize})
    openTween:Play()


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
        
        local TabStroke = Instance.new("UIStroke", TabBtn)
        TabStroke.Color = Color3.fromRGB(180, 0, 0)
        TabStroke.Thickness = 1.2
        TabStroke.Enabled = false

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = PageHolder
        local PageLayout = Instance.new("UIListLayout", Page)
        PageLayout.Padding = UDim.new(0, 10)
        PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

        if FirstTab then
            Page.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
            TabStroke.Enabled = true
            FirstTab = false
        end

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PageHolder:GetChildren()) do v.Visible = false end
            for _, v in pairs(TabHolder:GetChildren()) do 
                if v:IsA("TextButton") then 
                    v.TextColor3 = Color3.fromRGB(120, 120, 120)
                    if v:FindFirstChild("UIStroke") then v.UIStroke.Enabled = false end
                end
            end
            Page.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
            TabStroke.Enabled = true
        end)

        -- Sekmeye (Tab) element eklemek için fonksiyonlar
        local ElementFunctions = {}

        function ElementFunctions:CreateButton(text, callback)
            -- İşlemi Elements.lua'ya devrediyoruz, sadece Page bilgisini yolluyoruz.
            Elements:CreateButton(Page, text, callback)
        end

        function ElementFunctions:CreateToggle(text, default, callback)
            Elements:CreateToggle(Page, text, default, callback)
        end

        function ElementFunctions:CreateKeybind(text, defaultKey, callback)
            Elements:CreateKeybind(Page, text, defaultKey, callback)
        end

        return ElementFunctions
    end

    return WindowFunctions
end

return WindowLib
