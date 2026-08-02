-- ОФІЦІЙНИЙ ХАБ СЕРІЇ PERFECT [XENO] — УСІ МОРЯ, ВКЛАДКИ, НАЛАШТУВАННЯ ТА КЛІКЕР
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Розділи (Вкладки)
local FarmTabBtn = Instance.new("TextButton")
local SettingsTabBtn = Instance.new("TextButton")
local FarmFrame = Instance.new("Frame")
local SettingsFrame = Instance.new("Frame")

-- Елементи Вкладки Фарму (Farm Tab)
local ChestBtn = Instance.new("TextButton")
local LevelBtn = Instance.new("TextButton")
local ClickerBtn = Instance.new("TextButton") -- Авто-клікер
local WeaponBtn = Instance.new("TextButton") -- Вибір зброї
local FlyBtn = Instance.new("TextButton")

-- Елементи Вкладки Налаштувань (Settings Tab)
local SpeedTitle = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local SetSpeedBtn = Instance.new("TextButton")
local CodesBtn = Instance.new("TextButton")
local ExitBtn = Instance.new("TextButton")

-- СЕРВІСНЕ ЗАВАНТАЖЕННЯ ГРАФІКИ
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "BF_Xeno_Tabbed_Menu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Blox Fruits Hub v2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.SourceSansBold

-- СТИЛІЗАЦІЯ ВКЛАДОК (ПЕРЕМИКАЧІВ)
local function styleTabSelect(btn, text, xPos)
    btn.Parent = MainFrame
    btn.Position = UDim2.new(xPos, 0, 0.12, 0)
    btn.Size = UDim2.new(0.42, 0, 0, 25)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
end
styleTabSelect(FarmTabBtn, "⚔️ Фарм", 0.05)
styleTabSelect(SettingsTabBtn, "⚙️ Налаштув.", 0.53)
FarmTabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55) -- за замовчуванням активна

-- СТВОРЕННЯ КОНТЕЙНЕРІВ ДЛЯ РОЗДІЛІВ
local function createTabFrame(f, name, visible)
    f.Name = name
    f.Parent = MainFrame
    f.BackgroundTransparency = 1
    f.Position = UDim2.new(0, 0, 0.24, 0)
    f.Size = UDim2.new(1, 0, 0.76, 0)
    f.Visible = visible
end
createTabFrame(FarmFrame, "FarmSection", true)
createTabFrame(SettingsFrame, "SettingsSection", false)

-- ШАБЛОН ДЛЯ КНОПОК ВСЕРЕДИНІ ВКЛАДОК
local function styleBtn(btn, parent, text, yPos, color, width, xPos)
    btn.Parent = parent
    btn.Position = UDim2.new(xPos or 0.05, 0, yPos, 0)
    btn.Size = UDim2.new(width or 0.9, 0, 0, 28)
    btn.BackgroundColor3 = color or Color3.fromRGB(40, 40, 48)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSans
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
end

-- ЕЛЕМЕНТИ ВКЛАДКИ «ФАРМ»
styleBtn(LevelBtn, FarmFrame, "Auto Level: OFF", 0.02)
styleBtn(ChestBtn, FarmFrame, "Auto Chest: OFF", 0.22)
styleBtn(ClickerBtn, FarmFrame, "Auto Clicker: OFF", 0.42)
styleBtn(WeaponBtn, FarmFrame, "Weapon: Melee", 0.62, Color3.fromRGB(39, 174, 96))
styleBtn(FlyBtn, FarmFrame, "Fly Mode: OFF", 0.82)

-- ЕЛЕМЕНТИ ВКЛАДКИ «НАЛАШТУВАННЯ»
SpeedTitle.Parent = SettingsFrame
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Position = UDim2.new(0.05, 0, 0.02, 0)
SpeedTitle.Size = UDim2.new(0.9, 0, 0, 20)
SpeedTitle.Text = "Швидкість авто-скринь:"
SpeedTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedTitle.TextSize = 13
SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
SpeedTitle.Font = Enum.Font.SourceSans

SpeedInput.Parent = SettingsFrame
SpeedInput.Position = UDim2.new(0.05, 0, 0.15, 0)
SpeedInput.Size = UDim2.new(0.45, 0, 0, 26)
SpeedInput.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
SpeedInput.Text = "350"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 13
Instance.new("UICorner", SpeedInput).CornerRadius = UDim.new(0, 5)

styleBtn(SetSpeedBtn, SettingsFrame, "Застосувати", 0.15, Color3.fromRGB(52, 73, 94), 0.4, 0.55)
styleBtn(CodesBtn, SettingsFrame, "Активувати всі коди ⚡", 0.42, Color3.fromRGB(41, 128, 185))
styleBtn(ExitBtn, SettingsFrame, "ВИМКНУТИ ЧИТ ПОВНІСТЮ", 0.72, Color3.fromRGB(192, 57, 43))
ExitBtn.Font = Enum.Font.SourceSansBold

-- ГЛОБАЛЬНІ НАЛАШТУВАННЯ СТАНУ
_G.ChestSpeed = 350
_G.BoatSpeed = 300
_G.ChestFarm = false
_G.LevelFarm = false
_G.AutoClick = false
_G.FlyMode = false
_G.SelectWeapon = "Melee" -- Або "Sword"

local currentTween, currentBV, flyBV, flyBG = nil, nil, nil, nil
local activeCodes = {"EASTEREXP", "LIGHTNINGABUSE", "KITT_RESET", "SUB2OFFICIALNOOBIE", "BIGNEWS", "BLUXXY", "SUB2DAIGROCK", "SUB2FER999", "THEGREATACE"}

-- СИСТЕМНЕ ЗГОРТАННЯ НА LEFT CTRL
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.LeftControl then MainFrame.Visible = not MainFrame.Visible end
end)

-- ЛОГІКА ПЕРЕМИКАННЯ ВКЛАДОК ГРАФІКИ
FarmTabBtn.MouseButton1Click:Connect(function()
    FarmFrame.Visible, SettingsFrame.Visible = true, false
    FarmTabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    SettingsTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
end)
SettingsTabBtn.MouseButton1Click:Connect(function()
    FarmFrame.Visible, SettingsFrame.Visible = false, true
    FarmTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    SettingsTabBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
end)

local function stopMovement()
    if currentTween then currentTween:Cancel(); currentTween = nil end
    if currentBV then currentBV:Destroy(); currentBV = nil end
    local Char = game:GetService("Players").LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        if Char.HumanoidRootPart:FindFirstChild("FarmVelocity") then Char.HumanoidRootPart.FarmVelocity:Destroy() end
        if Char.HumanoidRootPart:FindFirstChild("FlyVelocity") then Char.HumanoidRootPart.FlyVelocity:Destroy() end
        if Char.HumanoidRootPart:FindFirstChild("FlyGyro") then Char.HumanoidRootPart.FlyGyro:Destroy() end
    end
end

-- НАЛАШТУВАННЯ КАСТОМНОЇ ШВИДКОСТІ З ГРИ
SetSpeedBtn.MouseButton1Click:Connect(function()
    local num = tonumber(SpeedInput.Text)
    if num then _G.ChestSpeed = num; SetSpeedBtn.Text = "Збережено: " .. num; task.wait(0.8) SetSpeedBtn.Text = "Застосувати" else SpeedInput.Text = "Помилка" end
end)

-- ВИБІР ТИПУ ЗБРОЇ (Melee / Sword)
WeaponBtn.MouseButton1Click:Connect(function()
    if _G.SelectWeapon == "Melee" then _G.SelectWeapon = "Sword" WeaponBtn.Text = "Weapon: Sword"
    else _G.SelectWeapon = "Melee" WeaponBtn.Text = "Weapon: Melee" end
end)

local function getClosestChest()
    local closest, dist = nil, math.huge
    local Root = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not Root then return nil end
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("TouchTransmitter") and obj.Parent and string.find(obj.Parent.Name, "Chest") then
            local chest = obj.Parent local part = chest:IsA("BasePart") and chest or chest:FindFirstChildOfClass("BasePart")
            if part and (Root.Position - part.Position).Magnitude < dist then closest = part; dist = (Root.Position - part.Position).Magnitude end
        end
    end return closest
end

local function getMyLevelMobName()
    local player = game:GetService("Players").LocalPlayer
    if not player:FindFirstChild("Data") or not player.Data:FindFirstChild("Level") then return "Bandit" end
    local lv = player.Data.Level.Value
    if lv < 10 then return "Bandit" elseif lv < 15 then return "Monkey" elseif lv < 30 then return "Gorilla" elseif lv < 60 then return "Pirate" elseif lv < 90 then return
     "Brute" elseif lv < 120 then return "Desert Bandit" elseif lv < 150 then return "Snow Soldier" elseif lv < 190 then return "Chief Petty Officer" elseif lv < 250 then return "Prisoner" elseif lv < 350 then return "Sky Bandit" elseif lv < 450 then return "Toga Warrior" elseif lv < 525 then return "Fishman Warrior" elseif lv < 625 then return "Magma Soldier" elseif lv < 700 then return "Galley Pirate" elseif lv < 775 then return "Raider" elseif lv < 875 then return "Swan Pirate" elseif lv < 950 then return "Marine Lieutenant" elseif lv < 1025 then return "Zombie" elseif lv < 1100 then return "Snow Bandit" elseif lv < 1175 then return "Undersea Fighter" elseif lv < 1250 then return "Fishman Commando" elseif lv < 1325 then return "Arctic Warrior" elseif lv < 1425 then return "Sea Soldier" elseif lv < 1500 then return "Ship Engineer" elseif lv < 1575 then return "Pirate Millionaire" elseif lv < 1650 then return "Pistol Billionaire" elseif lv < 1725 then return "Dragon Crew Warrior" elseif lv < 1825 then return "Fishman Raider" elseif lv < 1900 then return "Mythological Pirate" elseif lv < 2000 then return "Jungle Pirate" elseif lv < 2100 then return "Reborn Skeleton" elseif lv < 2200 then return "Living Zombie" elseif lv < 2300 then return "Peanut Scout" elseif lv < 2400 then return "Ice Cream Chef" else return "Candy Cane Warrior" end
end

-- АВТО-КЛІКЕР (Працює незалежно, або допомагає фарму)
task.spawn(function()
    while true do task.wait(0.01)
        if _G.AutoClick or _G.LevelFarm then pcall(function()
            local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end) end
    end
end)

-- ЦИКЛ СВОБОДНОГО ПОЛЬОТУ (Fly Mode)
task.spawn(function()
    local Player = game:GetService("Players").LocalPlayer
    while ScreenGui.Parent do task.wait(0.01)
        if _G.FlyMode then pcall(function()
            local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if root and Player.Character:FindFirstChild("Humanoid") then
                if not root:FindFirstChild("FlyVelocity") then
                    flyBV = Instance.new("BodyVelocity", root) flyBV.Name, flyBV.MaxForce = "FlyVelocity", Vector3.new(9e9, 9e9, 9e9)
                    flyBG = Instance.new("BodyGyro", root) flyBG.Name, flyBG.MaxTorque = "FlyGyro", Vector3.new(9e9, 9e9, 9e9)
                end
                flyBG.CFrame = workspace.CurrentCamera.CFrame
                flyBV.Velocity = Player.Character.Humanoid.MoveDirection * 150
            end
        end) else
            local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if root then if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end end
        end
    end
end)

-- АВТО-БАГ НА ШВИДКИЙ ПОЛІТ ЧОВНА
task.spawn(function()
    local Player = game:GetService("Players").LocalPlayer
    while ScreenGui.Parent do task.wait(0.1)
        pcall(function()
            local seat = Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.SeatPart
            local ship = workspace.Boats:FindFirstChildOfClass("Model") or workspace:FindFirstChild("Boats") and workspace.Boats:FindFirstChild(Player.Name .. "Boat")
            if seat and seat:IsA("VehicleSeat") and ship then
                seat.MaxSpeed = _G.BoatSpeed seat.SteerFloat = seat.ThrottleFloat
                if seat.Throttle == 1 then ship:TranslateBy(seat.CFrame.LookVector * (_G.BoatSpeed / 30))
                elseif seat.Throttle == -1 then ship:TranslateBy(-seat.CFrame.LookVector * (_G.BoatSpeed / 30)) end
            end
        end)
    end
end)

-- ЦИКЛ СКРИНЬ
task.spawn(function()
    while ScreenGui.Parent do task.wait(0.1)
        if _G.ChestFarm then
            local Root = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local chest = getClosestChest()
            if chest and Root and _G.ChestFarm then stopMovement()
                currentBV = Instance.new("BodyVelocity", Root) currentBV.Velocity, currentBV.MaxForce = Vector3.new(0,0,0), Vector3.new(9e9, 9e9, 9e9)
                currentTween = game:GetService("TweenService"):Create(Root, TweenInfo.new((Root.Position - chest.Position).Magnitude / _G.ChestSpeed, Enum.EasingStyle.Linear), {CFrame = chest.CFrame})
                currentTween:Play() local completed = false local cConn = currentTween.Completed:Connect(function() completed = true end)
                while not completed and _G.ChestFarm do task.wait(0.01) end cConn:Disconnect() stopMovement() if _G.ChestFarm then task.wait(0.15) end
            end
        end
    end
end)

-- ЦИКЛ ЛЕВЕЛУ (Всі моря + Вибрана зброя)
task.spawn(function()
    while ScreenGui.Parent do task.wait(0.02)
        if _G.LevelFarm then pcall(function()
            local Player = game:GetService("Players").LocalPlayer local Char = Player.Character local Root = Char and Char:FindFirstChild("HumanoidRootPart") if not Root then return end
            local currentTool = Char:FindFirstChildOfClass("Tool")
            if not currentTool or currentTool.ToolTip ~= _G.SelectWeapon then
                for _, tool in pairs(Player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.ToolTip == _G.SelectWeapon then Char.Humanoid:EquipTool(tool); break end
                end
            end
            local targetMobName = getMyLevelMobName() local targetMob = nil
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do if enemy.Name == targetMobName and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then targetMob = enemy; break end end
            if not targetMob then for _, enemy in pairs(workspace:GetChildren()) do if enemy.Name == targetMobName and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then targetMob = enemy; break end end end
            if targetMob and _G.LevelFarm then
                Root.CFrame = targetMob.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
                if not Root:FindFirstChild("FarmVelocity") then
                    local bv = Instance.new("BodyVelocity", Root) bv.Name, bv.Velocity, bv.MaxForce = "FarmVelocity", Vector3.new(0,0,0), Vector3.new(9e9, 9e9, 9e9)
                end
            else if Root and Root:FindFirstChild("FarmVelocity") then Root.FarmVelocity:Destroy() end end
        end) else local Root = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if Root and Root:FindFirstChild("FarmVelocity") then Root.FarmVelocity:Destroy() end end
    end
end)

-- НАЛАШТУВАННЯ КЛІКІВ КНОПОК И СТАНІВ
ChestBtn.MouseButton1Click:Connect(function()
    _G.ChestFarm = not _G.ChestFarm if _G.ChestFarm then _G.LevelFarm = false LevelBtn.Text, LevelBtn.BackgroundColor3 = "Auto Level: OFF", Color3.fromRGB(40,40,48) ChestBtn.Text, ChestBtn.BackgroundColor3 = "Auto Chest: ON", Color3.fromRGB(46, 204, 113) else stopMovement() ChestBtn.Text, ChestBtn.BackgroundColor3 = "Auto Chest: OFF", Color3.fromRGB(40,40,48) end
end)
LevelBtn.MouseButton1Click:Connect(function()
    _G.LevelFarm = not _G.LevelFarm if _G.LevelFarm then _G.ChestFarm = false stopMovement() ChestBtn.Text, ChestBtn.BackgroundColor3 = "Auto Chest: OFF", Color3.fromRGB(40,40,48) LevelBtn.Text, LevelBtn.BackgroundColor3 = "Auto Level: ON", Color3.fromRGB(46, 204, 113) else stopMovement() LevelBtn.Text, LevelBtn.BackgroundColor3 = "Auto Level: OFF", Color3.fromRGB(40,40,48) end
end)
ClickerBtn.MouseButton1Click:Connect(function()
    _G.AutoClick = not _G.AutoClick ClickerBtn.Text = _G.AutoClick and "Auto Clicker: ON" or "Auto Clicker: OFF" ClickerBtn.BackgroundColor3 = _G.AutoClick and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(40,40,48)
end)
FlyBtn.MouseButton1Click:Connect(function()
    _G.FlyMode = not _G.FlyMode if _G.FlyMode then _G.ChestFarm, _G.LevelFarm = false, false stopMovement() ChestBtn.Text, ChestBtn.BackgroundColor3 = "Auto Chest: OFF", Color3.fromRGB(40,40,48) LevelBtn.Text, LevelBtn.BackgroundColor3 = "Auto Level: OFF", Color3.fromRGB(40,40,48) FlyBtn.Text, FlyBtn.BackgroundColor3 = "Fly Mode: ON", Color3.fromRGB(46, 204, 113) else FlyBtn.Text, FlyBtn.BackgroundColor3 = "Fly Mode: OFF", Color3.fromRGB(40,40,48) end
end)
CodesBtn.MouseButton1Click:Connect(function()
    CodesBtn.Text, CodesBtn.BackgroundColor3 = "Активація...", Color3.fromRGB(241, 196, 15) task.spawn(function() local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("RedeemCode") or game:GetService("ReplicatedStorage"):FindFirstChild("RedeemCode") for _, code in pairs(activeCodes) do pcall(function() remote:InvokeServer(code) end) task.wait(0.15) end CodesBtn.Text, CodesBtn.BackgroundColor3 = "Коди Активовані! ✓", Color3.fromRGB(39, 174, 96) end)
end)
ExitBtn.MouseButton1Click:Connect(function() _G.ChestFarm, _G.LevelFarm, _G.FlyMode, _G.AutoClick = false, false, false, false stopMovement() ScreenGui:Destroy() end)
