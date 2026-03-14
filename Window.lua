local DragoLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Elements dosyasını internetten çekiyoruz
local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Elements.lua"))()

function DragoLib:CreateWindow(options)
    local WindowName = options.Name or "DRAGO INTERNAL"
    local TargetSize = UDim2.new(0, 650, 0, 420) 
    
    local DragoUI = Instance.new("ScreenGui")
    DragoUI.Name = "Drago_v4_Final"
    if syn and syn.protect_gui then syn.protect_gui(DragoUI) end
    DragoUI.Parent = (gethui and gethui()) or CoreGui

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

    -- [Yükleme Ekranı Örtüsü]
    local LoadingCover = Instance.new("Frame")
    LoadingCover.Name = "LoadingCover"
    LoadingCover.Size = UDim2.new(1, 0, 1, 0)
    LoadingCover.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    LoadingCover.ZIndex = 50 
    LoadingCover.Parent = MainFrame
    Instance.new("UICorner", LoadingCover).CornerRadius = UDim.new(0, 8)

    local LoadingText = Instance.new("TextLabel")
    LoadingText.Size = UDim2.new(1, 0, 1, 0)
    LoadingText.BackgroundTransparency = 1
    LoadingText.Text = "DRAGO YÜKLENİYOR..."
    LoadingText.TextColor3 = Color3.fromRGB(255, 60, 0)
    LoadingText.Font = Enum.Font.GothamBold
    LoadingText.TextSize = 24
    LoadingText.ZIndex = 51
    LoadingText.Parent = LoadingCover

    local pulseTween = TweenService:Create(LoadingText, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {TextTransparency = 0.6})
    pulseTween:Play()

    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 80)
    TopBar.BackgroundTransparency = 1
    TopBar.ZIndex = 5
    TopBar.Parent = MainFrame

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

    -- Çizgiler
    local HorizontalLine = Instance.new("Frame")
    HorizontalLine.Size = UDim2.new(1, 0, 0, 1)
    HorizontalLine.Position = UDim2.new(0, 0, 0, 80)
    HorizontalLine.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    HorizontalLine.Parent = MainFrame

    local VerticalLine = Instance.new("Frame")
    VerticalLine.Size = UDim2.new(0, 1, 1, 0)
    VerticalLine.Position = UDim2.new(0, 160, 0, 0)
    VerticalLine.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    VerticalLine.Parent = MainFrame

    local Profile = Instance.new("ImageLabel")
    Profile.Size = UDim2.new(0, 60, 0, 60)
    Profile.Position = UDim2.new(0, 50, 0, 10)
    Profile.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..LocalPlayer.UserId.."&width=420&height=420&format=png"
    Profile.Parent = Sidebar
    Instance.new("UICorner", Profile).CornerRadius = UDim.new(1, 0)

    -- Üst Butonlar (X ve -)
    local function CreateTopButton(text, color)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 36, 0, 36)
        btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        btn.Text = text
        btn.TextColor3 = color
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 20
        btn.Parent = DragoUI
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        Instance.new("UIStroke", btn).Color = color
        return btn
    end

    local CloseBtn = CreateTopButton("X", Color3.fromRGB(200, 0, 0))
    local MinBtn = CreateTopButton("-", Color3.fromRGB(200, 150, 0))

    local RestoreBtn = Instance.new("ImageButton")
    RestoreBtn.Size = UDim2.new(0, 65, 0, 65)
    RestoreBtn.Visible = false
    RestoreBtn.Image = "rbxassetid://133187886819604"
    RestoreBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    RestoreBtn.Parent = DragoUI
    Instance.new("UICorner", RestoreBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", RestoreBtn).Color = Color3.fromRGB(180, 0, 0)

    local Title = Instance.new("TextLabel")
    Title.Text = WindowName
    Title.Size = UDim2.new(1, -160, 0, 80)
    Title.Position = UDim2.new(0, 160, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 60, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.Parent = MainFrame

    -- SÜRÜKLEME VE BOYUTLANDIRMA MANTIĞI
    local resizing = false
    local isMinimized = false
    local LastSize = TargetSize
    local LastPos = MainFrame.Position

    RunService.RenderStepped:Connect(function()
        if MainFrame.Visible and not isMinimized and MinBtn.Visible then
            local mPos = MainFrame.Position
            local mSize = MainFrame.AbsoluteSize
            MinBtn.Position = MinBtn.Position:Lerp(mPos + UDim2.new(0, mSize.X - 85, 0, -45), 0.2)
            CloseBtn.Position = CloseBtn.Position:Lerp(mPos + UDim2.new(0, mSize.X - 40, 0, -45), 0.1)
        end
    end)

    local function MakeDraggable(frame, topbar)
        local isDragging, dragStart, startPos
        topbar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if resizing then return end
                isDragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = false end end)
    end
    MakeDraggable(MainFrame, TopBar)

    -- AÇILIŞ VE YÜKLEME BİTİŞİ
    local openTween = TweenService:Create(MainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = TargetSize})
    openTween:Play()
    task.spawn(function()
        openTween.Completed:Wait()
        task.wait(1)
        pulseTween:Cancel()
        TweenService:Create(LoadingText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        local coverFade = TweenService:Create(LoadingCover, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        coverFade:Play()
        coverFade.Completed:Wait()
        LoadingCover:Destroy()
    end)

    -- KAPANMA (ATEŞLİ VE SARSINTILI)
    CloseBtn.MouseButton1Click:Connect(function()
        task.spawn(function()
            local origX = MainFrame.Position.X.Offset
            local origY = MainFrame.Position.Y.Offset
            for i = 1, 25 do
                MainFrame.Position = UDim2.new(MainFrame.Position.X.Scale, origX + math.random(-4, 4), MainFrame.Position.Y.Scale, origY + math.random(-4, 4))
                task.wait(0.05)
            end
        end)
        task.spawn(function()
            local frameAbsPos = MainFrame.AbsolutePosition
            local frameAbsSize = MainFrame.AbsoluteSize
            for i = 1, 80 do
                local fire = Instance.new("Frame")
                fire.BackgroundColor3 = Color3.fromRGB(255, math.random(30, 160), math.random(0, 20))
                fire.Size = UDim2.new(0, math.random(5,14), 0, math.random(5,14))
                fire.Position = UDim2.new(0, frameAbsPos.X + math.random(0, math.floor(frameAbsSize.X)), 0, frameAbsPos.Y + frameAbsSize.Y - (frameAbsSize.Y * (i/80) * 0.6))
                fire.Parent = DragoUI
                Instance.new("UICorner", fire).CornerRadius = UDim.new(1, 0)
                TweenService:Create(fire, TweenInfo.new(math.random(5, 10)/10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Position = fire.Position + UDim2.new(0, math.random(-30,30), 0, -math.random(40,100)),
                    BackgroundTransparency = 1, Size = UDim2.new(0,0,0,0)
                }):Play()
                game:GetService("Debris"):AddItem(fire, 1.1)
                task.wait(0.018)
            end
        end)
        task.spawn(function()
            task.wait(0.3)
            local startSizeY = MainFrame.AbsoluteSize.Y
            for i = 1, 40 do
                local t = i / 40
                local newSizeY = startSizeY * (1 - (t*t))
                MainFrame.Size = UDim2.new(0, MainFrame.AbsoluteSize.X, 0, math.max(0, newSizeY))
                task.wait(0.03)
            end
            DragoUI:Destroy()
        end)
    end)

    -- MİNİMİZE VE RESTORE
    MinBtn.MouseButton1Click:Connect(function()
        isMinimized = true
        LastSize, LastPos = MainFrame.Size, MainFrame.Position
        MinBtn.Visible, CloseBtn.Visible = false, false
        local profileAbsPos = Profile.AbsolutePosition
        TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, profileAbsPos.X + 25, 0, profileAbsPos.Y + 25)
        }):Play()
        task.wait(0.6)
        MainFrame.Visible = false
        RestoreBtn.Position = UDim2.new(0, profileAbsPos.X, 0, profileAbsPos.Y)
        RestoreBtn.Visible = true
    end)

    RestoreBtn.MouseButton1Click:Connect(function()
        isMinimized = false
        MainFrame.Visible, RestoreBtn.Visible = true, false
        TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = LastSize, Position = LastPos}):Play()
        MinBtn.Visible, CloseBtn.Visible = true, true
    end)

    -- CREATE TAB VE ELEMENT BAĞLANTISI
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
        TabStroke.Enabled = false

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = PageHolder
        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 10)

        if FirstTab then
            Page.Visible, TabStroke.Enabled = true, true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
            FirstTab = false
        end

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PageHolder:GetChildren()) do v.Visible = false end
            for _, v in pairs(TabHolder:GetChildren()) do 
                if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(120, 120, 120) if v:FindFirstChild("UIStroke") then v.UIStroke.Enabled = false end end
            end
            Page.Visible, TabStroke.Enabled = true, true
            TabBtn.TextColor3 = Color3.fromRGB(255, 60, 0)
        end)

        local ElementFunctions = {}
        function ElementFunctions:CreateButton(t, c) Elements:CreateButton(Page, t, c) end
        function ElementFunctions:CreateToggle(t, d, c) Elements:CreateToggle(Page, t, d, c) end
        function ElementFunctions:CreateKeybind(t, k, c) Elements:CreateKeybind(Page, t, k, c) end
        
        return ElementFunctions
    end

    return WindowFunctions
end

return DragoLib
