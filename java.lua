-- // Go to each stage thing
for i = 1, 10 do
    local Stage = NormalStages["CaveStage" .. i]
    local DarknessPart = Stage:FindFirstChild("DarknessPart")

    if (DarknessPart) then
        -- // Teleport to next stage
        print("Teleporting to next stage: Stage " .. i)
        Character.HumanoidRootPart.CFrame = DarknessPart.CFrame

        -- // Create a temp part under you
        local Part = Instance.new("Part", LocalPlayer.Character)
        Part.Anchored = true
        Part.Position = LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 6, 0)

        -- // Wait and remove temp part
        wait(getgenv().TreasureAutoFarm.Teleport)
        Part:Destroy()
    end
end

-- // Go to end
print("Teleporting to the end")
repeat wait()
    Character.HumanoidRootPart.CFrame = NormalStages.TheEnd.GoldenChest.Trigger.CFrame
until Lighting.ClockTime ~= 14

-- // Wait until you have respawned
local Respawned = false
local Connection
Connection = LocalPlayer.CharacterAdded:Connect(function()
    Respawned = true
    Connection:Disconnect()
end)

repeat wait() until Respawned
wait(getgenv().TreasureAutoFarm.TimeBetweenRuns)
print("Auto Farm: Run " .. currentRun .. " finished")
