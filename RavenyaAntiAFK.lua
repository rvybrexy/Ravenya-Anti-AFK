local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

--================ LOADING =================--
local loadingScreen = Instance.new("ScreenGui", game.CoreGui)
loadingScreen.ResetOnSpawn = false

local blackFrame = Instance.new("Frame", loadingScreen)
blackFrame.Size = UDim2.new(2,0,2,0)
blackFrame.Position = UDim2.new(-0.5,0,-0.5,0)
blackFrame.BackgroundColor3 = Color3.new(0,0,0)
blackFrame.BackgroundTransparency = 0

local ravenyaText = Instance.new("TextLabel", blackFrame)
ravenyaText.Size = UDim2.new(0.6,0,0.15,0)
ravenyaText.Position = UDim2.new(0.2,0,0.4,0)
ravenyaText.BackgroundTransparency = 1
ravenyaText.Text = "Ravenya Anti Afk"
ravenyaText.Font = Enum.Font.GothamBold
ravenyaText.TextColor3 = Color3.new(1,1,1)
ravenyaText.TextScaled = true
ravenyaText.TextStrokeTransparency = 0

local loadingLabel = Instance.new("TextLabel", blackFrame)
loadingLabel.Size = UDim2.new(0.3,0,0.05,0)
loadingLabel.Position = UDim2.new(0.35,0,0.55,0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Yükleniyor..."
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextColor3 = Color3.fromRGB(200,200,200)
loadingLabel.TextScaled = true

RunService.RenderStepped:Connect(function()
	loadingLabel.TextTransparency =
		(math.sin(os.clock()*2)+1)/2*0.5+0.25
end)

--================ BIG GUI =================--
local bigGui = Instance.new("ScreenGui", game.CoreGui)
bigGui.ResetOnSpawn = false
bigGui.Enabled = false

local bigFrame = Instance.new("Frame", bigGui)
bigFrame.Size = UDim2.new(0,400,0,200)
bigFrame.Position = UDim2.new(1,-410,0,50)
bigFrame.BackgroundColor3 = Color3.fromRGB(60,0,140)
bigFrame.BorderSizePixel = 0
Instance.new("UICorner", bigFrame).CornerRadius = UDim.new(0,20)

local title = Instance.new("TextLabel", bigFrame)
title.Size = UDim2.new(1,-20,0,40)
title.Position = UDim2.new(0,10,0,5)
title.BackgroundTransparency = 1
title.Text = "Ravenya Anti Afk"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = Enum.TextXAlignment.Left

local hideButton = Instance.new("TextButton", bigFrame)
hideButton.Size = UDim2.new(0,50,0,25)
hideButton.Position = UDim2.new(1,-65,0,5)
hideButton.Text = "❌"
hideButton.Font = Enum.Font.GothamBold
hideButton.TextSize = 16
hideButton.BackgroundColor3 = Color3.fromRGB(180,0,220)
hideButton.TextColor3 = Color3.new(1,1,1)
hideButton.BorderSizePixel = 0
Instance.new("UICorner", hideButton).CornerRadius = UDim.new(0,8)

local bottomFrame = Instance.new("Frame", bigFrame)
bottomFrame.Size = UDim2.new(1,-20,0,130)
bottomFrame.Position = UDim2.new(0,10,0,55)
bottomFrame.BackgroundColor3 = Color3.fromRGB(90,0,170)
bottomFrame.BorderSizePixel = 0
Instance.new("UICorner", bottomFrame).CornerRadius = UDim.new(0,16)

local statusText = Instance.new("TextLabel", bottomFrame)
statusText.Size = UDim2.new(1,0,0,40)
statusText.Position = UDim2.new(0,0,0.05,0)
statusText.BackgroundTransparency = 1
statusText.Text = "Durum: Çalışıyor"
statusText.Font = Enum.Font.GothamBold
statusText.TextSize = 20
statusText.TextColor3 = Color3.fromRGB(255,200,255)

-- 🔴🟢 AÇ / KAPA BUTONU
local toggleButton = Instance.new("TextButton", bottomFrame)
toggleButton.Size = UDim2.new(0.6,0,0,35)
toggleButton.Position = UDim2.new(0.2,0,0.45,0)
toggleButton.Text = "Anti AFK: AÇIK"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.BackgroundColor3 = Color3.fromRGB(0,200,100)
toggleButton.TextColor3 = Color3.new(1,1,1)
toggleButton.BorderSizePixel = 0
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0,12)

local discordText = Instance.new("TextLabel", bottomFrame)
discordText.Size = UDim2.new(1,0,0,25)
discordText.Position = UDim2.new(0,0,0.78,0)
discordText.BackgroundTransparency = 1
discordText.Text = "discord.gg/PA6HdV49JS"
discordText.Font = Enum.Font.Gotham
discordText.TextSize = 18
discordText.TextColor3 = Color3.fromRGB(230,200,255)

--================ SMALL GUI =================--
local smallGui = Instance.new("ScreenGui", game.CoreGui)
smallGui.Enabled = false
smallGui.ResetOnSpawn = false

local smallFrame = Instance.new("Frame", smallGui)
smallFrame.Size = UDim2.new(0,50,0,50)
smallFrame.Position = UDim2.new(1,-120,0,10)
smallFrame.BackgroundColor3 = Color3.fromRGB(140,0,220)
smallFrame.BorderSizePixel = 0
Instance.new("UICorner", smallFrame).CornerRadius = UDim.new(0,12)

local rvy = Instance.new("TextLabel", smallFrame)
rvy.Size = UDim2.new(1,0,1,0)
rvy.BackgroundTransparency = 1
rvy.Text = "RVY"
rvy.Font = Enum.Font.GothamBold
rvy.TextSize = 22
rvy.TextColor3 = Color3.new(1,1,1)

hideButton.MouseButton1Click:Connect(function()
	bigGui.Enabled = false
	smallGui.Enabled = true
end)

smallFrame.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		smallGui.Enabled = false
		bigGui.Enabled = true
	end
end)

--================ START =================--
task.spawn(function()
	task.wait(5)
	TweenService:Create(blackFrame, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(ravenyaText, TweenInfo.new(1.5), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
	TweenService:Create(loadingLabel, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
	task.wait(1.6)
	loadingScreen:Destroy()
	bigGui.Enabled = true
end)

--================ ANTI AFK (AÇ / KAPA KONTROLLÜ) =================--
local AntiAfkEnabled = true

toggleButton.MouseButton1Click:Connect(function()
	AntiAfkEnabled = not AntiAfkEnabled

	if AntiAfkEnabled then
		toggleButton.Text = "Anti AFK: AÇIK"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0,200,100)
		statusText.Text = "Durum: Çalışıyor"
	else
		toggleButton.Text = "Anti AFK: KAPALI"
		toggleButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
		statusText.Text = "Durum: Kapalı"
	end
end)

task.spawn(function()
	while true do
		task.wait(30)

		if AntiAfkEnabled then
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
			task.wait(1)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)

			for i = 1,2 do
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				task.wait(0.1)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
				task.wait(0.3)
			end

			statusText.Text = "AFK önlendi (hareket + zıplama)"
			task.wait(2)
			if AntiAfkEnabled then
				statusText.Text = "Durum: Çalışıyor"
			end
		end
	end
end)

--================ GLOW =================--
RunService.RenderStepped:Connect(function()
	local g = (math.sin(os.clock()*2)+1)/2
	statusText.TextColor3 = Color3.fromRGB(255,200*g,255)
end)
