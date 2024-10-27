-- Loadstring to get the core functionalities
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()

-- Function to simulate random delays
local function randomDelay(min, max)
    wait(math.random(min, max))
end

-- Teleport Function
local function teleportTo(position)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character:SetPrimaryPartCFrame(CFrame.new(position))
end

-- Auto Farm Function with Anti-Ban
local function autoFarm()
    while true do
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Part") and item.Name == "Coin" then -- Adjust item name as needed
                teleportTo(item.Position) -- Teleport to the item
                randomDelay(0.5, 1.5) -- Random delay between 0.5 and 1.5 seconds
            end
        end
        randomDelay(1, 3) -- Random delay before the next collection
    end
end

-- ESP Function
local function createESP(item)
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Size = item.Size + Vector3.new(0.2, 0.2, 0.2)
    espBox.Color3 = Color3.new(1, 0, 0) -- Red color
    espBox.Adornee = item
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 10
    espBox.Parent = item
end

-- Auto Craft Potion Function with Anti-Ban
local function autoCraftPotion()
    local craftingTable = workspace:FindFirstChild("CraftingTable") -- Replace with actual path
    if craftingTable then
        while true do
            local craftButton = craftingTable:FindFirstChild("CraftButton")
            if craftButton then
                fireclickdetector(craftButton.ClickDetector) -- Simulate button click
                randomDelay(1, 2) -- Random delay to avoid detection
            end
            randomDelay(5, 10) -- Random delay before checking again
        end
    end
end

-- Start the auto farm function
spawn(autoFarm)
-- Start the auto crafting function
spawn(autoCraftPotion)

-- Create ESP for all items in the workspace
for _, item in pairs(workspace:GetChildren()) do
    if item:IsA("Part") then
        createESP(item)
    end
end

-- Add ESP for newly added items
workspace.ChildAdded:Connect(function(item)
    if item:IsA("Part") then
        createESP(item)
    end
end)
