-- Guarkyummy UI Lib v2 - Design fidèle avec glow violet
-- Par Azzury 🧃

local UILib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GuarkYummyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 350)
Main.Position = UDim2.new(0.5, -300, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.ZIndex = 1
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(0, 620, 0, 370)
Glow.Position = UDim2.new(0.5, -310, 0.5, -185)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://4996891970"
Glow.ImageColor3 = Color3.fromRGB(170, 0, 255)
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(20, 20, 80, 80)
Glow.ZIndex = 0
Glow.Parent = Main

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 16)
Corner.Parent = Main

local Menu = Instance.new("Frame")
Menu.Size = UDim2.new(0, 150, 1, 0)
Menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Menu.Parent = Main
Menu.ZIndex = 2

local MenuLayout = Instance.new("UIListLayout")
MenuLayout.Padding = UDim.new(0, 6)
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

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -170, 1, -20)
ContentFrame.Position = UDim2.new(0, 160, 0, 10)
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ContentFrame.ZIndex = 2
ContentFrame.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

local Pages = {}
local CurrentPage

function UILib:CreatePage(name, callback)
	local PageFrame = Instance.new("Frame")
	PageFrame.Visible = false
	PageFrame.Size = UDim2.new(1, 0, 1, 0)
	PageFrame.BackgroundTransparency = 1
	PageFrame.Name = name
	PageFrame.ZIndex = 3
	PageFrame.Parent = ContentFrame

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0, 8)
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.Parent = PageFrame

	local Pad = Instance.new("UIPadding")
	Pad.PaddingTop = UDim.new(0, 10)
	Pad.PaddingLeft = UDim.new(0, 10)
	Pad.Parent = PageFrame

	Pages[name] = PageFrame

	local Btn = Instance.new("TextButton")
	Btn.Text = name
	Btn.Size = UDim2.new(1, 0, 0, 32)
	Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Btn.TextColor3 = Color3.new(1, 1, 1)
	Btn.Font = Enum.Font.Gotham
	Btn.TextSize = 14
	Btn.AutoButtonColor = true
	Btn.ZIndex = 3
	Btn.Parent = Menu

	local BtnCorner = Instance.new("UICorner", Btn)
	BtnCorner.CornerRadius = UDim.new(0, 6)

	local Border = Instance.new("UIStroke", Btn)
	Border.Color = Color3.fromRGB(170, 0, 255)
	Border.Thickness = 1.5
	Border.Transparency = 1
	Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	Btn.MouseButton1Click:Connect(function()
		for _, p in pairs(Pages) do p.Visible = false end
		for _, b in pairs(Menu:GetChildren()) do
			if b:IsA("TextButton") then
				b.UIStroke.Transparency = 1
			end
		end
		PageFrame.Visible = true
		Border.Transparency = 0
		CurrentPage = name
	end)

	if not CurrentPage then
		
if not CurrentPage then
    for _, p in pairs(Pages) do p.Visible = false end
    for _, b in pairs(Menu:GetChildren()) do
        if b:IsA("TextButton") then
            b.UIStroke.Transparency = 1
        end
    end
    PageFrame.Visible = true
    Border.Transparency = 0
    CurrentPage = name
end

	end

	callback(PageFrame)
end

function UILib:AddLabel(parent, text)
	local Label = Instance.new("TextLabel")
	Label.Text = text or "Texte"
	Label.Size = UDim2.new(1, -10, 0, 25)
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.BackgroundTransparency = 1
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.ZIndex = 3
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
	Btn.ZIndex = 3
	Btn.Parent = parent

	local c = Instance.new("UICorner", Btn)
	c.CornerRadius = UDim.new(0, 6)

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
	Box.ZIndex = 3
	Box.Parent = parent

	local c = Instance.new("UICorner", Box)
	c.CornerRadius = UDim.new(0, 6)

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
	Toggle.ZIndex = 3
	Toggle.Parent = parent

	local state = false
	local c = Instance.new("UICorner", Toggle)
	c.CornerRadius = UDim.new(0, 6)

	Toggle.MouseButton1Click:Connect(function()
		state = not state
		Toggle.Text = (state and "[ ON ] " or "[ OFF ] ") .. text
		if callback then
			callback(state)
		end
	end)
end

return UILib
