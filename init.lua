local DragoLib = {}
DragoLib.BaseUrl = "https://raw.githubusercontent.com/0sole/DragoLibs/main/"
DragoLib.Cache = {}

local function fetch(name)
    if not DragoLib.Cache[name] then
        local success, result = pcall(game.HttpGet, game, DragoLib.BaseUrl .. name .. ".lua")
        if success then
            DragoLib.Cache[name] = loadstring(result)()
        else
            return nil
        end
    end
    return DragoLib.Cache[name]
end

function DragoLib:CreateWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Parent = ScreenGui

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 130, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame

    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -130, 1, 0)
    Container.Position = UDim2.new(0, 130, 0, 0)
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame

    local Window = {}

    function Window:CreateTab(name)
        local TabFrame = Instance.new("ScrollingFrame")
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.Parent = Container

        local List = Instance.new("UIListLayout")
        List.Padding = UDim.new(0, 5)
        List.Parent = TabFrame

        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 0, 35)
        TabBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        TabBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.Text = name
        TabBtn.Parent = Sidebar

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do v.Visible = false end
            TabFrame.Visible = true
        end)

        local Tab = {}

        function Tab:CreateButton(cfg)
            local mod = fetch("Button")
            return mod:Create(TabFrame, cfg)
        end

        function Tab:CreateToggle(cfg)
            local mod = fetch("Toggle")
            return mod:Create(TabFrame, cfg)
        end

        function Tab:CreateSlider(cfg)
            local mod = fetch("Slider")
            return mod:Create(TabFrame, cfg)
        end

        function Tab:CreateKeybind(cfg)
            local mod = fetch("Keybind")
            return mod:Create(TabFrame, cfg)
        end

        function Tab:CreateSection(name)
            local mod = fetch("Section")
            return mod:Create(TabFrame, name)
        end

        return Tab
    end

    return Window
end

return DragoLib
