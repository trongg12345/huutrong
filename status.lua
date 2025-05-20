-- Script Lua hiển thị thông tin server Roblox
-- Hiển thị nhiệm vụ, FPS, thời gian và Job ID

local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local teleportService = game:GetService("TeleportService")

-- Tạo giao diện người dùng
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ServerInfoGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Khung chính
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.Position = UDim2.new(0.5, -200, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 75)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Tiêu đề
local titleFrame = Instance.new("Frame")
titleFrame.Name = "TitleFrame"
titleFrame.Size = UDim2.new(1, 0, 0, 40)
titleFrame.BackgroundColor3 = Color3.fromRGB(255, 126, 75)
titleFrame.BorderSizePixel = 0
titleFrame.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "Thời Gian Còn Lại: 04:49"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
titleLabel.TextSize = 24
titleLabel.Parent = titleFrame

-- Tab buttons
local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = mainFrame

local infoTab = Instance.new("TextButton")
infoTab.Name = "InfoTab"
infoTab.Size = UDim2.new(0.5, 0, 1, 0)
infoTab.BackgroundColor3 = Color3.fromRGB(80, 170, 255)
infoTab.BorderSizePixel = 0
infoTab.Font = Enum.Font.SourceSansBold
infoTab.Text = "Information"
infoTab.TextColor3 = Color3.fromRGB(255, 255, 255)
infoTab.TextSize = 18
infoTab.Parent = tabFrame

local settingTab = Instance.new("TextButton")
settingTab.Name = "SettingTab"
settingTab.Size = UDim2.new(0.5, 0, 1, 0)
settingTab.Position = UDim2.new(0.5, 0, 0, 0)
settingTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
settingTab.BorderSizePixel = 0
settingTab.Font = Enum.Font.SourceSansBold
settingTab.Text = "Setting"
settingTab.TextColor3 = Color3.fromRGB(255, 255, 255)
settingTab.TextSize = 18
settingTab.Parent = tabFrame

-- Nội dung chính
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -70)
contentFrame.Position = UDim2.new(0, 0, 0, 70)
contentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Thông tin
local usernameLabel = Instance.new("TextLabel")
usernameLabel.Name = "UsernameLabel"
usernameLabel.Size = UDim2.new(0.3, 0, 0, 30)
usernameLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.SourceSansSemibold
usernameLabel.Text = "Username:"
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.TextSize = 18
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
usernameLabel.Parent = contentFrame

local usernameValue = Instance.new("TextLabel")
usernameValue.Name = "UsernameValue"
usernameValue.Size = UDim2.new(0.6, 0, 0, 30)
usernameValue.Position = UDim2.new(0.35, 0, 0.05, 0)
usernameValue.BackgroundTransparency = 1
usernameValue.Font = Enum.Font.SourceSansBold
usernameValue.Text = player.Name
usernameValue.TextColor3 = Color3.fromRGB(220, 0, 0)
usernameValue.TextSize = 18
usernameValue.TextXAlignment = Enum.TextXAlignment.Left
usernameValue.Parent = contentFrame

local taskLabel = Instance.new("TextLabel")
taskLabel.Name = "TaskLabel"
taskLabel.Size = UDim2.new(0.3, 0, 0, 30)
taskLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
taskLabel.BackgroundTransparency = 1
taskLabel.Font = Enum.Font.SourceSansSemibold
taskLabel.Text = "Task:"
taskLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
taskLabel.TextSize = 18
taskLabel.TextXAlignment = Enum.TextXAlignment.Left
taskLabel.Parent = contentFrame

local taskValue = Instance.new("TextLabel")
taskValue.Name = "TaskValue"
taskValue.Size = UDim2.new(0.6, 0, 0, 30)
taskValue.Position = UDim2.new(0.35, 0, 0.25, 0)
taskValue.BackgroundTransparency = 1
taskValue.Font = Enum.Font.SourceSansBold
taskValue.Text = "FULL GEAR DRACO CHÂU ANH"
taskValue.TextColor3 = Color3.fromRGB(255, 215, 0)
taskValue.TextSize = 18
taskValue.TextXAlignment = Enum.TextXAlignment.Left
taskValue.Parent = contentFrame

local timeLabel = Instance.new("TextLabel")
timeLabel.Name = "TimeLabel"
timeLabel.Size = UDim2.new(0.3, 0, 0, 30)
timeLabel.Position = UDim2.new(0.05, 0, 0.45, 0)
timeLabel.BackgroundTransparency = 1
timeLabel.Font = Enum.Font.SourceSansSemibold
timeLabel.Text = "Time:"
timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.TextSize = 18
timeLabel.TextXAlignment = Enum.TextXAlignment.Left
timeLabel.Parent = contentFrame

local timeValue = Instance.new("TextLabel")
timeValue.Name = "TimeValue"
timeValue.Size = UDim2.new(0.6, 0, 0, 30)
timeValue.Position = UDim2.new(0.35, 0, 0.45, 0)
timeValue.BackgroundTransparency = 1
timeValue.Font = Enum.Font.SourceSansBold
timeValue.Text = "0m 0s - FPS: 0"
timeValue.TextColor3 = Color3.fromRGB(255, 255, 255)
timeValue.TextSize = 18
timeValue.TextXAlignment = Enum.TextXAlignment.Left
timeValue.Parent = contentFrame

local jobIdLabel = Instance.new("TextLabel")
jobIdLabel.Name = "JobIdLabel"
jobIdLabel.Size = UDim2.new(0.3, 0, 0, 30)
jobIdLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
jobIdLabel.BackgroundTransparency = 1
jobIdLabel.Font = Enum.Font.SourceSansSemibold
jobIdLabel.Text = "Job Id:"
jobIdLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
jobIdLabel.TextSize = 18
jobIdLabel.TextXAlignment = Enum.TextXAlignment.Left
jobIdLabel.Parent = contentFrame

local jobIdValue = Instance.new("TextLabel")
jobIdValue.Name = "JobIdValue"
jobIdValue.Size = UDim2.new(0.6, 0, 0, 30)
jobIdValue.Position = UDim2.new(0.35, 0, 0.65, 0)
jobIdValue.BackgroundTransparency = 1
jobIdValue.Font = Enum.Font.SourceSans
jobIdValue.Text = game.JobId or "N/A"
jobIdValue.TextColor3 = Color3.fromRGB(200, 200, 200)
jobIdValue.TextSize = 16
jobIdValue.TextXAlignment = Enum.TextXAlignment.Left
jobIdValue.Parent = contentFrame

-- Biến theo dõi
local timeInServer = 0
local fps = 0
local frameCount = 0
local lastUpdate = tick()
local countdown = 5 * 60 -- 5 phút (300 giây)

-- Xử lý tab
infoTab.MouseButton1Click:Connect(function()
    infoTab.BackgroundColor3 = Color3.fromRGB(80, 170, 255)
    settingTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

settingTab.MouseButton1Click:Connect(function()
    settingTab.BackgroundColor3 = Color3.fromRGB(80, 170, 255)
    infoTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    -- Code cho trang cài đặt có thể thêm sau
end)

-- Cập nhật thời gian và FPS
local function updateInfo()
    -- Tính FPS
    frameCount = frameCount + 1
    local currentTime = tick()
    local elapsed = currentTime - lastUpdate
    
    if elapsed >= 1 then
        fps = math.floor(frameCount / elapsed)
        frameCount = 0
        lastUpdate = currentTime
        
        -- Cập nhật thời gian trong server
        timeInServer = timeInServer + 1
        local minutes = math.floor(timeInServer / 60)
        local seconds = timeInServer % 60
        
        -- Cập nhật đếm ngược
        countdown = math.max(0, countdown - 1)
        local countMinutes = math.floor(countdown / 60)
        local countSeconds = countdown % 60
        
        -- Cập nhật giao diện
        timeValue.Text = string.format("%dm %ds - FPS: %d", minutes, seconds, fps)
        titleLabel.Text = string.format("Thời Gian Còn Lại: %02d:%02d", countMinutes, countSeconds)
    end
end

-- Kết nối cập nhật mỗi frame
runService.RenderStepped:Connect(updateInfo)

-- Cho phép kéo thả GUI
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

runService.RenderStepped:Connect(function()
    if dragging and dragInput then
        update(dragInput)
    end
end)

-- Tạo nút đóng
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Parent = titleFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

print("Server Info GUI loaded successfully!")