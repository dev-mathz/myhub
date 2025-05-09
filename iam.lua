-- GUI Moderna e Estilizada com Animações

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Sim, sou gotão"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = PlayerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 360)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(70, 130, 180)
uiStroke.Thickness = 2
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Sim, sou o goat."
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

-- Tween function for button hover
local function animateButton(button)
	local originalColor = button.BackgroundColor3
	local hoverColor = Color3.fromRGB(50, 50, 50)

	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = hoverColor}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
	end)
end

-- Função utilitária para criar botões
local function createButton(text, order, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.9, 0, 0, 40)
	button.Position = UDim2.new(0.05, 0, 0, 50 + (order * 45))
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.Font = Enum.Font.Gotham
	button.TextSize = 18
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Text = text
	button.Parent = mainFrame

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 8)

	animateButton(button)

	button.MouseButton1Click:Connect(callback)
end

-- BOTÕES PERSONALIZADOS
createButton("Esconde ai", 0, function()
	hookfunction(print, function() end)
	hookfunction(warn, function() end)
	hookfunction(error, function() return end)
	hookfunction(debug.traceback, function() return end)

	local LogService = game:GetService("LogService")
	LogService.MessageOut:Connect(function() end)
end)

createButton("Corre ai", 1, function()
	local lp = game.Players.LocalPlayer
	local char = lp.Character or lp.CharacterAdded:Wait()
	local characterScript = char:WaitForChild("CharacterScript", 5)

	local function lockStamina()
		for _, v in pairs(getgc(true)) do
			if typeof(v) == "table" and rawget(v, "Stamina") and type(v.Stamina) == "number" then
				print("Stamina encontrada, bloqueando em infinito.")
				v.Stamina = math.huge
				task.spawn(function()
					while true do
						v.Stamina = math.huge
						task.wait(0.1)
					end
				end)
				break
			end
		end
	end

	lockStamina()
end)

createButton("Ve a bola ai", 2, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dev-mathz/prever/refs/heads/main/prever.lua"))()
end)

createButton("Diva ai", 3, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PolzovatelSilq0/AutoDiveHub/refs/heads/main/42autodive"))()
end)

createButton("Reca ai", 4, function()
	loadstring(game:HttpGet(" 
getgenv().script = "autoreceive"
loadstring(game:HttpGet("https://raw.githubusercontent.com/clearstring/cracked_by_mawlood/refs/heads/main/crack.txt"))() "))()
end)

-- Rodapé
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 30)
footer.Position = UDim2.new(0, 0, 1, -30)
footer.BackgroundTransparency = 1
footer.Text = "L e K"
footer.Font = Enum.Font.Gotham
footer.TextSize = 14
footer.TextColor3 = Color3.fromRGB(120, 120, 120)
footer.Parent = mainFrame

-- Minimizar/Restaurar com tecla Insert
local minimized = false
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.Insert then
		minimized = not minimized
		if minimized then
			-- Minimizar o painel e esconder os elementos internos
			TweenService:Create(mainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()

			-- Tornar invisíveis os botões e o título
			for _, button in ipairs(mainFrame:GetChildren()) do
				if button:IsA("TextButton") or button:IsA("TextLabel") then
					button.Visible = false
				end
			end
		else
			-- Restaurar o painel e mostrar os elementos internos
			mainFrame.BackgroundTransparency = 0
			TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 400, 0, 360)}):Play()

			-- Tornar visíveis os botões e o título
			for _, button in ipairs(mainFrame:GetChildren()) do
				if button:IsA("TextButton") or button:IsA("TextLabel") then
					button.Visible = true
				end
			end
		end
	end
end)