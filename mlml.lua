local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ========== ACCESSORY REMOVAL ==========
local function RemoveAccessories(character)
    if not character then return end
    
    for _, accessory in ipairs(character:GetDescendants()) do
        if accessory:IsA("Accessory") then
            accessory:Destroy()
        end
    end
    
    character.DescendantAdded:Connect(function(child)
        if child:IsA("Accessory") then
            child:Destroy()
        end
    end)
    
    RunService.Heartbeat:Connect(function()
        for _, item in ipairs(character:GetChildren()) do
            if item:IsA("Accessory") then
                item:Destroy()
            end
        end
    end)
end

if LocalPlayer.Character then
    RemoveAccessories(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(RemoveAccessories)

-- ========== MAIN GUI ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CombinedUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- ========== AP SPAMMER GUI ==========
local SpammerFrame = Instance.new("Frame")
SpammerFrame.Name = "APSpammerFrame"
SpammerFrame.Size = UDim2.fromOffset(180, 200)
SpammerFrame.Position = UDim2.fromScale(0.5, 0.25)
SpammerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
SpammerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpammerFrame.BorderSizePixel = 0
SpammerFrame.Parent = ScreenGui

local SpammerCorner = Instance.new("UICorner")
SpammerCorner.CornerRadius = UDim.new(0, 12)
SpammerCorner.Parent = SpammerFrame

-- Title Bar for Spammer
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 28)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = SpammerFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -28, 1, 0)
TitleLabel.Position = UDim2.new(0, 6, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "MLML673 HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
MinimizeButton.Position = UDim2.new(1, -24, 0, 3)
MinimizeButton.Text = "-"
MinimizeButton.TextScaled = true
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MinimizeButton.Parent = TitleBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeButton

-- Player List
local Scroll = Instance.new("ScrollingFrame")
Scroll.Position = UDim2.new(0, 0, 0, 32)
Scroll.Size = UDim2.new(1, 0, 1, -34)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarImageColor3 = Color3.fromRGB(40, 40, 40)
Scroll.BackgroundTransparency = 1
Scroll.Parent = SpammerFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = Scroll

-- ========== SPEED BOOSTER GUI ==========
local BoosterFrame = Instance.new("Frame")
BoosterFrame.Name = "SpeedBoosterFrame"
BoosterFrame.Size = UDim2.new(0, 180, 0, 100)
BoosterFrame.Position = UDim2.new(0, 20, 0, 20)
BoosterFrame.BackgroundColor3 = Color3.new(0, 0, 0)
BoosterFrame.BackgroundTransparency = 0.2
BoosterFrame.BorderSizePixel = 0
BoosterFrame.Parent = ScreenGui

local BoosterCorner = Instance.new("UICorner", BoosterFrame)
BoosterCorner.CornerRadius = UDim.new(0, 8)

-- Gradient effect
local UIGradient = Instance.new("UIGradient", BoosterFrame)
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
})
UIGradient.Rotation = 45

-- Animated white stroke
local Stroke = Instance.new("UIStroke", BoosterFrame)
Stroke.Color = Color3.new(1, 1, 1)
Stroke.Thickness = 2
Stroke.Transparency = 0.3

-- Animate the stroke
RunService.Heartbeat:Connect(function()
    UIGradient.Offset = Vector2.new((tick() % 2) - 1, 0)
end)

-- Title
local BoosterTitle = Instance.new("TextLabel")
BoosterTitle.Size = UDim2.new(1, -20, 0, 20)
BoosterTitle.Position = UDim2.new(0, 10, 0, 8)
BoosterTitle.BackgroundTransparency = 1
BoosterTitle.Text = "MLML673 HUB BOOST"
BoosterTitle.TextColor3 = Color3.new(1, 0, 0)
BoosterTitle.Font = Enum.Font.GothamBold
BoosterTitle.TextSize = 14
BoosterTitle.TextXAlignment = Enum.TextXAlignment.Left
BoosterTitle.Parent = BoosterFrame

-- Speed Row
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 50, 0, 20)
SpeedLabel.Position = UDim2.new(0, 10, 0, 40)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "SPEED:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 12
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = BoosterFrame

local SpeedBox = Instance.new("TextBox")
SpeedBox.Name = "SpeedBox"
SpeedBox.Size = UDim2.new(0, 60, 0, 22)
SpeedBox.Position = UDim2.new(0, 65, 0, 39)
SpeedBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
SpeedBox.Text = "22.5"
SpeedBox.TextColor3 = Color3.new(1, 0, 0)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.TextSize = 12
SpeedBox.ClearTextOnFocus = false
SpeedBox.Parent = BoosterFrame

local SpeedBoxCorner = Instance.new("UICorner", SpeedBox)
SpeedBoxCorner.CornerRadius = UDim.new(0, 4)

local SpeedBoxStroke = Instance.new("UIStroke", SpeedBox)
SpeedBoxStroke.Color = Color3.new(1, 0, 0)
SpeedBoxStroke.Thickness = 1

-- Jump Row
local JumpLabel = Instance.new("TextLabel")
JumpLabel.Size = UDim2.new(0, 50, 0, 20)
JumpLabel.Position = UDim2.new(0, 10, 0, 65)
JumpLabel.BackgroundTransparency = 1
JumpLabel.Text = "JUMP:"
JumpLabel.TextColor3 = Color3.new(1, 1, 1)
JumpLabel.Font = Enum.Font.Gotham
JumpLabel.TextSize = 12
JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
JumpLabel.Parent = BoosterFrame

local JumpBox = Instance.new("TextBox")
JumpBox.Name = "JumpBox"
JumpBox.Size = UDim2.new(0, 60, 0, 22)
JumpBox.Position = UDim2.new(0, 65, 0, 64)
JumpBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
JumpBox.Text = "35"
JumpBox.TextColor3 = Color3.new(1, 0, 0)
JumpBox.Font = Enum.Font.Gotham
JumpBox.TextSize = 12
JumpBox.ClearTextOnFocus = false
JumpBox.Parent = BoosterFrame

local JumpBoxCorner = Instance.new("UICorner", JumpBox)
JumpBoxCorner.CornerRadius = UDim.new(0, 4)

local JumpBoxStroke = Instance.new("UIStroke", JumpBox)
JumpBoxStroke.Color = Color3.new(1, 0, 0)
JumpBoxStroke.Thickness = 1

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleBooster"
ToggleButton.Size = UDim2.new(0, 40, 0, 16)
ToggleButton.Position = UDim2.new(1, -50, 0, 8)
ToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ToggleButton.Text = ""
ToggleButton.AutoButtonColor = false
ToggleButton.Parent = BoosterFrame

local ToggleCorner = Instance.new("UICorner", ToggleButton)
ToggleCorner.CornerRadius = UDim.new(0, 8)

-- Toggle Background
local ToggleBackground = Instance.new("Frame", ToggleButton)
ToggleBackground.Size = UDim2.new(1, 0, 1, 0)
ToggleBackground.BackgroundColor3 = Color3.new(0.8, 0, 0)
ToggleBackground.BackgroundTransparency = 0.3
ToggleBackground.ZIndex = 0
Instance.new("UICorner", ToggleBackground).CornerRadius = UDim.new(0, 8)

-- Toggle Knob
local Knob = Instance.new("Frame", ToggleButton)
Knob.Name = "ToggleKnob"
Knob.Size = UDim2.new(0, 12, 0, 12)
Knob.Position = UDim2.new(0, 2, 0.5, 0)
Knob.AnchorPoint = Vector2.new(0, 0.5)
Knob.BackgroundColor3 = Color3.new(1, 1, 1)
Knob.ZIndex = 2
Knob.Parent = ToggleButton

local KnobCorner = Instance.new("UICorner", Knob)
KnobCorner.CornerRadius = UDim.new(0, 6)

-- Status indicator
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0, 40, 0, 12)
StatusLabel.Position = UDim2.new(1, -50, 0, 26)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "OFF"
StatusLabel.TextColor3 = Color3.new(1, 0, 0)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 10
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = BoosterFrame

-- ========== DRAGGING FUNCTIONALITY ==========
local draggingSpammer = false
local draggingBooster = false
local dragStart, startPos

-- Spammer dragging
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSpammer = true
        dragStart = input.Position
        startPos = SpammerFrame.Position
    end
end)

-- Booster dragging
BoosterFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingBooster = true
        dragStart = input.Position
        startPos = BoosterFrame.Position
        TweenService:Create(BoosterFrame, TweenInfo.new(0.1), { BackgroundTransparency = 0.3 }):Play()
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingBooster = false
                TweenService:Create(BoosterFrame, TweenInfo.new(0.1), { BackgroundTransparency = 0.2 }):Play()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingSpammer and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        SpammerFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
    
    if draggingBooster and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        BoosterFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSpammer = false
        draggingBooster = false
    end
end)

-- ========== MINIMIZE FUNCTIONALITY ==========
local minimized = false
local normalSize = SpammerFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    
    if minimized then
        Scroll.Visible = false
        SpammerFrame.Size = UDim2.fromOffset(180, 28)
        MinimizeButton.Text = "+"
    else
        Scroll.Visible = true
        SpammerFrame.Size = normalSize
        MinimizeButton.Text = "-"
    end
end)

-- ========== SEND COMMANDS (AP SPAMMER) ==========
local function sendCommands(targetName)
    local commands = {
        ";balloon " .. targetName,
        ";rocket " .. targetName,
        ";morph " .. targetName,
        ";jumpscare " .. targetName,
        ";jail " .. targetName
    }

    local channel = TextChatService.TextChannels.RBXGeneral
    for _, cmd in ipairs(commands) do
        channel:SendAsync(cmd)
        task.wait(0.12)
    end
end

-- ========== PLAYER BUTTONS ==========
local function createPlayerButton(player)
    if player == LocalPlayer then return end
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -6, 0, 24)
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.Font = Enum.Font.Gotham
    Button.Text = player.Name
    Button.Parent = Scroll
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        sendCommands(player.Name)
    end)
end

-- ========== REFRESH PLAYER LIST ==========
local function refreshList()
    for _, child in pairs(Scroll:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        createPlayerButton(player)
    end
    
    task.wait()
    Scroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 4)
end

Players.PlayerAdded:Connect(refreshList)
Players.PlayerRemoving:Connect(refreshList)

refreshList()

-- ========== BOOSTER STATE ==========
local BoosterEnabled = false
local SpeedValue = 22.5
local JumpValue = 35

local TweenInfoSmooth = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TweenInfoBounce = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- Toggle Logic
ToggleButton.MouseButton1Click:Connect(function()
    BoosterEnabled = not BoosterEnabled
    
    local targetColor = BoosterEnabled and Color3.new(0, 0.8, 0) or Color3.new(0.8, 0, 0)
    local targetPos = BoosterEnabled and UDim2.new(1, -14, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
    local statusText = BoosterEnabled and "ON" or "OFF"
    local statusColor = BoosterEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    
    TweenService:Create(ToggleBackground, TweenInfoSmooth, { BackgroundColor3 = targetColor }):Play()
    TweenService:Create(Knob, TweenInfoBounce, { Position = targetPos }):Play()
    TweenService:Create(StatusLabel, TweenInfoSmooth, { TextColor3 = statusColor }):Play()
    
    TweenService:Create(Knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 16, 0, 16) }):Play()
    task.wait(0.1)
    TweenService:Create(Knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 12, 0, 12) }):Play()
    
    StatusLabel.Text = statusText
    
    if BoosterEnabled then
        TweenService:Create(Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Thickness = 3 }):Play()
        task.wait(0.3)
        TweenService:Create(Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Thickness = 2 }):Play()
    end
end)

-- Update values when typing
SpeedBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local num = tonumber(SpeedBox.Text)
        if num and num > 0 then
            SpeedValue = num
            TweenService:Create(SpeedBoxStroke, TweenInfo.new(0.2), { Color = Color3.new(0, 1, 0) }):Play()
            task.wait(0.2)
            TweenService:Create(SpeedBoxStroke, TweenInfo.new(0.2), { Color = Color3.new(1, 0, 0) }):Play()
        else
            SpeedBox.Text = tostring(SpeedValue)
        end
    end
end)

JumpBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local num = tonumber(JumpBox.Text)
        if num and num > 0 then
            JumpValue = num
            TweenService:Create(JumpBoxStroke, TweenInfo.new(0.2), { Color = Color3.new(0, 1, 0) }):Play()
            task.wait(0.2)
            TweenService:Create(JumpBoxStroke, TweenInfo.new(0.2), { Color = Color3.new(1, 0, 0) }):Play()
        else
            JumpBox.Text = tostring(JumpValue)
        end
    end
end)

-- ========== BOOSTER HEARTBEAT ==========
RunService.Heartbeat:Connect(function()
    if not BoosterEnabled then return end
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end
    
    if humanoid.MoveDirection.Magnitude > 0 then
        rootPart.Velocity = Vector3.new(
            humanoid.MoveDirection.X * SpeedValue,
            rootPart.Velocity.Y,
            humanoid.MoveDirection.Z * SpeedValue
        )
    end
    
    humanoid.UseJumpPower = true
    humanoid.JumpPower = JumpValue
end)

-- ========== BOOSTER FRAME EFFECTS ==========
BoosterFrame.MouseEnter:Connect(function()
    TweenService:Create(Stroke, TweenInfo.new(0.2), { Transparency = 0.1 }):Play()
end)

BoosterFrame.MouseLeave:Connect(function()
    TweenService:Create(Stroke, TweenInfo.new(0.2), { Transparency = 0.3 }):Play()
end)
