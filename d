local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Создание платформы
local platform = Instance.new("Part")
platform.Size = Vector3.new(6, 1, 6)
platform.Anchored = true
platform.Transparency = 1
platform.CanCollide = true
platform.Position = hrp.Position - Vector3.new(0, 3, 0)
platform.Name = "AutoPlatform"
platform.Parent = workspace

-- Кнопка
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.8, 0)
button.Text = "Ехать вперёд"
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 20

-- Движение платформы
local moving = false

button.MouseButton1Click:Connect(function()
    moving = not moving
    button.Text = moving and "Стоп" or "Ехать вперёд"

    while moving and platform do
        platform.Position = platform.Position + Vector3.new(0, 0, -1.5) -- Направление движения
        hrp.CFrame = CFrame.new(platform.Position + Vector3.new(0, 3, 0))
        wait(0.05)
    end
end)
