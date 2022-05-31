getgenv().AutoTap = false
getgenv().AutoSell = false

local remotePath = game:GetService("ReplicatedStorage")


function doTap()
    spawn(function()
        while AutoTap == true do
            local args = {[1] = {[1] = "GainMuscle"}}
            remotePath.RemoteEvent:FireServer(unpack(args))
            wait()
        end
    end)
end


function doSell()
    spawn(function()
        while AutoSell == true do
            local args = {[1] = {[1] = "SellMuscle"}}
            remotePath.RemoteEvent:FireServer(unpack(args))
            wait(3)
        end
    end)
end


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/T4st3MyLight/libs/main/ui.lua')))()

local w = library:CreateWindow("Lifting Simulator") -- Creates the window

local b = w:CreateFolder("Farming") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("Other")

c:DestroyGui()


b:Toggle("Auto Tap",function(bool)
    getgenv().AutoTap = bool
    print('Auto Tap is: ', bool)
    if bool then
        doTap()
    end
end)

b:Toggle("Auto Sell",function(bool)
    getgenv().AutoSell = bool
    print('Auto Sell is: ', bool)
    if bool then
        doSell()
    end
end)
