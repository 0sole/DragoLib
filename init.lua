local DragoLib = {}
DragoLib.BaseUrl = "https://raw.githubusercontent.com/0sole/DragoLib/main/Components/"
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
    MainFrame.Size = UDim2.new(0, 550, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local Content = Instance.new("ScrollingFrame")
    Content.Name = "Content"
    Content.Size = UDim2.new(1, -140, 1, -40)
    Content.Position = UDim2.new(0, 130, 0, 35)
    Content.BackgroundTransparency = 1
    Content.Parent = MainFrame

    local Window = {}

    function Window:CreateTab(name)
        local Tab = {}
        
        function Tab:CreateButton(cfg)
            local comp = fetch("Button")
            return comp:Create(Content, cfg)
        end

        function Tab:CreateToggle(cfg)
            local comp = fetch("Toggle")
            return comp:Create(Content, cfg)
        end

        function Tab:CreateSlider(cfg)
            local comp = fetch("Slider")
            return comp:Create(Content, cfg)
        end

        function Tab:CreateKeybind(cfg)
            local comp = fetch("Keybind")
            return comp:Create(Content, cfg)
        end

        function Tab:CreateSection(name)
            local comp = fetch("Section")
            return comp:Create(Content, name)
        end

        return Tab
    end

    function Window:Notify(cfg)
        local comp = fetch("Notify")
        if comp then
            comp:Show(cfg)
        end
    end

    return Window
end

return DragoLib
