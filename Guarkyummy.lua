-- Guarkyummy UI Lib v1.0
-- Créé par Azzury, le boss du UI

local UILib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GuarkYummyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main UI Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 350)
Main.Position = UDim2.new(0.5, -300, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

-- Glow effet
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 4
Stroke.Color = Color3.fromRGB(170, 0, 255)
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Parent = Main

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 15)
Corner.Parent = Main

-- Left Menu
local Menu = Instance.new("Frame")
Menu.Size = UDim2.new(0, 150, 1, 0)
Menu.Position = UDim2.new(0, 0, 0, 0)
Menu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Menu.Parent = Main

local MenuLayout = Instance.new("UIListLayout")
MenuLayout.Padding = UDim.new(0, 8)
MenuLayout.FillDirection = Enum.FillDirection.Vertical
MenuLayout.SortOrder = Enum.SortOrder.LayoutOrder
MenuLayout.Parent = Menu

local MenuPadding = Instance.new("UIPadding")
MenuPadding.PaddingTop = UDim.new(0, 10)
MenuPadding.PaddingLeft = UDim.new(0, 10)
MenuPadding.PaddingRight = UDim.new(0, 10)
MenuPadding.Parent = Menu

local Title = Instance.new("TextLabel")
Title.Text = "GUARK YUMMY"
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 20
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Parent = Menu

-- Right Content
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -160, 1, -20)
ContentFrame.Position = UDim2.new(0, 160, 0, 10)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentFrame.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

-- Pages
local Pages = {}

function UILib:CreatePage(name, callback)
	local Button = Instance.new("TextButton")
	Button.Text = name
	Button.Size = UDim2.new(1, 0, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.Parent = Menu

	local PageFrame = Instance.new("Frame")
	PageFrame.Visible = false
	PageFrame.Size = UDim2.new(1, 0, 1, 0)
	PageFrame.BackgroundTransparency = 1
	PageFrame.Parent = ContentFrame

	local ElementsLayout = Instance.new("UIListLayout")
	ElementsLayout.Padding = UDim.new(0, 6)
	ElementsLayout.Parent = PageFrame

	local Padding = Instance.new("UIPadding")
	Padding.PaddingTop = UDim.new(0, 10)
	Padding.PaddingLeft = UDim.new(0, 10)
	Padding.Parent = PageFrame

	Pages[name] = PageFrame

	Button.MouseButton1Click:Connect(function()
		for _, pg in pairs(Pages) do
			pg.Visible = false
		end
		PageFrame.Visible = true
	end)

	-- callback to populate the page
	callback(PageFrame)
end

-- Méthodes de création d’éléments

function UILib:AddLabel(parent, text)
	local Label = Instance.new("TextLabel")
	Label.Text = text or "Texte"
	Label.Size = UDim2.new(1, -10, 0, 25)
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.BackgroundTransparency = 1
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = parent
end

function UILib:AddButton(parent, text, callback)
	local Btn = Instance.new("TextButton")
	Btn.Text = text or "Bouton"
	Btn.Size = UDim2.new(1, -10, 0, 30)
	Btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Btn.TextColor3 = Color3.new(1, 1, 1)
	Btn.Font = Enum.Font.Gotham
	Btn.TextSize = 14
	Btn.Parent = parent

	Btn.MouseButton1Click:Connect(function()
		pcall(callback)
	end)
end

function UILib:AddTextbox(parent, placeholder, callback)
	local Box = Instance.new("TextBox")
	Box.PlaceholderText = placeholder or "Tape ici"
	Box.Size = UDim2.new(1, -10, 0, 30)
	Box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Box.TextColor3 = Color3.new(1, 1, 1)
	Box.Font = Enum.Font.Gotham
	Box.TextSize = 14
	Box.ClearTextOnFocus = false
	Box.Parent = parent

	Box.FocusLost:Connect(function()
		if callback then
			callback(Box.Text)
		end
	end)
end

function UILib:AddToggle(parent, text, callback)
	local Toggle = Instance.new("TextButton")
	Toggle.Size = UDim2.new(1, -10, 0, 30)
	Toggle.Text = "[ OFF ] " .. text
	Toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	Toggle.TextColor3 = Color3.new(1, 1, 1)
	Toggle.Font = Enum.Font.Gotham
	Toggle.TextSize = 14
	Toggle.Parent = parent

	local state = false

	Toggle.MouseButton1Click:Connect(function()
		state = not state
		Toggle.Text = state and "[ ON ] " .. text or "[ OFF ] " .. text
		if callback then
			callback(state)
		end
	end)
end

return UILib
