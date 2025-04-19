local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Конечная точка (замени на актуальные координаты)
local endPos = Vector3.new(1000, 5, -200)

-- Кнопка
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.8, 0)
button.Text = "Медленно к финишу"
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 20

-- Пошаговый телепорт
local function smoothTeleport()
    local steps = 50 -- чем больше, тем плавнее и безопаснее
    local waitTime = 0.1 -- задержка между шагами
    local direction = (endPos - hrp.Position) / steps

    for i = 1, steps do
        hrp.CFrame = hrp.CFrame + direction
        wait(waitTime)
    end
end

button.MouseButton1Click:Connect(smoothTeleport)
