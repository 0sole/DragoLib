local DragoLib = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer

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
    local ResStroke = Instance.new("UIStroke", RestoreBtn)
    ResStroke.Color = Color3.fromRGB(180, 0, 0)
    ResStroke.Thickness = 2

    local Title = Instance.new("TextLabel")
    Title.Text = WindowName
    Title.Size = UDim2.new(1, -160, 0, 80)
    Title.Position = UDim2.new(0, 160, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 60, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.Parent = MainFrame

    local ResizeHandle = Instance.new("Frame")
    ResizeHandle.Size = UDim2.new(0, 20, 0, 20)
    ResizeHandle.Position = UDim2.new(1, -20, 1, -20)
    ResizeHandle.BackgroundTransparency = 1
    ResizeHandle.ZIndex = 10
    ResizeHandle.Parent = MainFrame

    local resizing = false
    local isMinimized = false
    local LastSize = TargetSize
    local LastPos = MainFrame.Position

    RunService.RenderStepped:Connect(function()
        if MainFrame.Visible and not isMinimized and MinBtn.Visible then
            local mPos = MainFrame.Position
            local mSize = MainFrame.AbsoluteSize
            local tMin = mPos + UDim2.new(0, mSize.X - 85, 0, -45)
            MinBtn.Position = MinBtn.Position:Lerp(tMin, 0.2)
            local tClose = mPos + UDim2.new(0, mSize.X - 40, 0, -45)
            CloseBtn.Position = CloseBtn.Position:Lerp(tClose, 0.1)
        end
    end)

    local function MakeDraggableTopBar(frame, topbar)
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
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = false end
        end)
    end

    local function MakeDraggable(obj)
        local isDragging, dragStart, startPos
        obj.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isDragging = true
                dragStart = input.Position
                startPos = obj.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then isDragging = false end
        end)
    end

    MakeDraggableTopBar(MainFrame, TopBar)
    MakeDraggable(RestoreBtn)

    local resizeStartPos, resizeStartSize
    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            resizing = true
            resizeStartPos = input.Position
            resizeStartSize = MainFrame.AbsoluteSize
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - resizeStartPos
            MainFrame.Size = UDim2.new(0, math.max(400, resizeStartSize.X + delta.X), 0, math.max(300, resizeStartSize.Y + delta.Y))
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end
    end)

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

    MinBtn.MouseButton1Click:Connect(function()
        if isMinimized then return end
        isMinimized = true
        LastSize = MainFrame.Size
        LastPos = MainFrame.Position
        MinBtn.Visible = false
        CloseBtn.Visible = false
        local absPos = MainFrame.AbsolutePosition
        local profileAbsPos = Profile.AbsolutePosition
        MainFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y)
        local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0, profileAbsPos.X + 25, 0, profileAbsPos.Y + 25)
        })
        closeTween:Play()
        closeTween.Completed:Wait()
        MainFrame.Visible = false
        RestoreBtn.Position = UDim2.new(0, profileAbsPos.X, 0, profileAbsPos.Y)
        RestoreBtn.Visible = true
    end)

    RestoreBtn.MouseButton1Click:Connect(function()
        if not isMinimized then return end
        isMinimized = false
        MainFrame.Visible = true
        RestoreBtn.Visible = false
        TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = LastSize, Position = LastPos}):Play()
        MinBtn.Visible = true
        CloseBtn.Visible = true
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        CloseBtn.Active = false
        MinBtn.Active = false
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
                fire.BorderSizePixel = 0
                fire.ZIndex = 20
                local pSize = math.random(5, 14)
                fire.Size = UDim2.new(0, pSize, 0, pSize)
                local spawnX = frameAbsPos.X + math.random(0, math.floor(frameAbsSize.X))
                local progress = (i - 1) / 80
                local spawnY = frameAbsPos.Y + frameAbsSize.Y - (frameAbsSize.Y * progress * 0.6)
                fire.Position = UDim2.new(0, spawnX, 0, spawnY)
                fire.Parent = DragoUI
                Instance.new("UICorner", fire).CornerRadius = UDim.new(1, 0)
                local flyX = spawnX + math.random(-30, 30)
                local flyY = spawnY - math.random(40, 100)
                TweenService:Create(fire, TweenInfo.new(math.random(5, 10) / 10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, flyX, 0, flyY),
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play()
                game:GetService("Debris"):AddItem(fire, 1.1)
                task.wait(0.018)
            end
        end)
        task.spawn(function()
            task.wait(0.3)
            local startSizeY = MainFrame.AbsoluteSize.Y
            local startPosX = MainFrame.Position.X.Scale
            local startPosXO = MainFrame.Position.X.Offset
            local startPosYO = MainFrame.Position.Y.Offset
            local startPosYS = MainFrame.Position.Y.Scale
            local startSizeX = MainFrame.AbsoluteSize.X
            local steps = 40
            for i = 1, steps do
                local t = i / steps
                local ease = t * t
                local newSizeY = startSizeY * (1 - ease)
                local newPosYO = startPosYO + (startSizeY - newSizeY)
                MainFrame.Size = UDim2.new(0, startSizeX, 0, math.max(0, newSizeY))
                MainFrame.Position = UDim2.new(startPosXS or startPosX, startPosXO, startPosYS, newPosYO)
                local redAmount = math.min(1, ease * 2)
                MainFrame.BackgroundColor3 = Color3.fromRGB(12 + math.floor(redAmount * 60), math.floor(12 * (1 - redAmount)), math.floor(12 * (1 - redAmount)))
                MainFrame.BackgroundTransparency = 0.15 + ease * 0.6
                task.wait(1.2 / steps)
            end
            DragoUI:Destroy()
        end)
    end)

    local WindowFunctions = {}
    local FirstTab = true

    function WindowFunctions:CreateTab(name)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Name = name .. "_Tab"
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
        Page.Name = name .. "_Page"
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 2
        Page.ScrollBarImageColor3 = Color3.fromRGB(180, 0, 0)
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

        local ElementFunctions = {}
        function ElementFunctions:CreateButton(t, c) Elements:CreateButton(Page, t, c) end
        function ElementFunctions:CreateToggle(t, d, c) Elements:CreateToggle(Page, t, d, c) end
        function ElementFunctions:CreateKeybind(t, k, c) Elements:CreateKeybind(Page, t, k, c) end

        return ElementFunctions
    end

    return WindowFunctions
end

return DragoLib
