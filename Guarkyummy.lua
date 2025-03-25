--Currently v0.0.1
--Ui lib by Azzury
local gameid = game.PlaceId

--[[
    UI Lib by Azzury, le boss du code
    Utilisation :
    local UI = loadstring(game:HttpGet("URL"))()
    UI:CreateWindow("Titre")
    UI:AddButton("Mon Bouton", function() print("Clické !") end)
    UI:AddLabel("Un texte")
]]

local UILib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- UI Elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UI_Lib"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.Padding = UDim.new(0, 5)

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.PaddingBottom = UDim.new(0, 10)
Padding.Parent = MainFrame

-- Methodes
function UILib:CreateWindow(title)
	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 0, 30)
	Title.Text = title or "Fenêtre"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 16
	Title.Parent = MainFrame
end

function UILib:AddButton(text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 30)
	Button.Text = text or "Bouton"
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.AutoButtonColor = true
	Button.Parent = MainFrame

	Button.MouseButton1Click:Connect(function()
		if callback then
			pcall(callback)
		end
	end)
end

function UILib:AddLabel(text)
	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1, 0, 0, 25)
	Label.Text = text or "Label"
	Label.TextColor3 = Color3.fromRGB(200, 200, 200)
	Label.BackgroundTransparency = 1
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.Parent = MainFrame
end

return UILib
