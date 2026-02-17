local _call5 = game:GetService('ReplicatedStorage')
local _LocalPlayer6 = game:GetService('Players').LocalPlayer
local _call10 = Instance.new('ScreenGui')

_call10.Name = 'SillysPlotControl'
_call10.ResetOnSpawn = false
_call10.Parent = _LocalPlayer6:WaitForChild('PlayerGui')

local _call12 = Instance.new('Frame')

_call12.Size = UDim2.new(0, 220, 0, 110)
_call12.Position = UDim2.new(0, 10, 0, 10)
_call12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_call12.BorderSizePixel = 0
_call12.Parent = _call10

local _call20 = Instance.new('UICorner')

_call20.CornerRadius = UDim.new(0, 10)
_call20.Parent = _call12

local _call24 = Instance.new('UIStroke')

_call24.Thickness = 4
_call24.Color = Color3.fromRGB(255, 255, 255)
_call24.Parent = _call12
_call12.Active = true
_call12.Draggable = true

local _call28 = Instance.new('TextLabel')

_call28.Parent = _call12
_call28.Size = UDim2.new(1, -20, 0, 40)
_call28.Position = UDim2.new(0, 10, 0, 5)
_call28.BackgroundTransparency = 1
_call28.Text = "Silly's Plot Control"
_call28.Font = Enum.Font.GothamBlack
_call28.TextColor3 = Color3.fromRGB(255, 255, 255)
_call28.TextScaled = true
_call28.TextWrapped = true

local _call38 = Instance.new('TextLabel')

_call38.Parent = _call12
_call38.Size = UDim2.new(1, -20, 0, 20)
_call38.Position = UDim2.new(0, 10, 0, 35)
_call38.BackgroundTransparency = 1
_call38.Text = '@chilliesupersilly on tt'
_call38.Font = Enum.Font.Gotham
_call38.TextColor3 = Color3.fromRGB(200, 200, 200)
_call38.TextScaled = true
_call38.TextWrapped = true

local _call48 = Instance.new('TextButton')

_call48.Parent = _call12
_call48.Size = UDim2.new(0, 180, 0, 35)
_call48.Position = UDim2.new(0, 20, 0, 60)
_call48.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_call48.BorderSizePixel = 0
_call48.Font = Enum.Font.GothamBlack
_call48.Text = 'Allow/Disallow'
_call48.TextColor3 = Color3.fromRGB(255, 255, 255)
_call48.TextScaled = true

local _call60 = Instance.new('UICorner')

_call60.CornerRadius = UDim.new(0, 8)
_call60.Parent = _call48

local _call68 = _call5:WaitForChild('Packages'):WaitForChild('Net'):WaitForChild('RE/PlotService/ToggleFriends')

_call48.MouseButton1Click:Connect(function(_72, _72_2)
    _call68:FireServer()
end)
