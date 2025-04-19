-- Создание кнопки
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", gui)

button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.8, 0)
button.Text = "Лететь к финишу"
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 20

-- Координаты финиша (замени на нужные!)
local endPosition = Vector3.new(1000, 5, -200)

button.MouseButton1Click:Connect(function()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Удаляем гравитацию
    character:FindFirstChildOfClass("Humanoid").PlatformStand = true

    -- Создаём BodyVelocity
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = (endPosition - hrp.Position).Unit * 100 -- скорость (можно изменить)
    bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * math.huge
    bodyVelocity.Parent = hrp

    -- Остановить через 5 секунд
    task.delay(5, function()
        if bodyVelocity then
            bodyVelocity:Destroy()
            character:FindFirstChildOfClass("Humanoid").PlatformStand = false
        end
    end)
end)
