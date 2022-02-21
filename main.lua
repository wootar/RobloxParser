-- Roblox Parser
--[[
    TODO:
    [Can't for now] Remove hard coding
    [Kinda] Add a auto updater :
    Example URI: https://s3.amazonaws.com/setup.roblox.com/version-dcabc777160e4d68-content-fonts.zip
    [X] Make a switch that let's you select app beta or not
]]

-- Obtain all of the arguments
local arguments = ""
for i = 1,#arg do
    arguments = arguments..arg[i]
end
local temp = io.open("C:\\Roblox\\version.txt", "r")
local temp2 = io.popen("curl --output - http://setup.roblox.com/version")
if temp:read("*l") == temp2:read("*l") then
    print("Up to date")
else
    print("We're not up to date")
    os.execute("cd C:\\Roblox & start /wait lua54.exe updater.lua")
end
-- Variables
local appBeta = 1
local token = ""
local placeLauncher = ""
local launchTime = ""
local browserTrackerID = ""
local combined = ""
token = arguments:sub(42,369)
-- We need the URI for the place launcher
placeLauncher = arguments:sub(413,583)
-- Parse the URI characters for place launcher
placeLauncher = placeLauncher:gsub("%%3A",":")
placeLauncher = placeLauncher:gsub("%%2F","/")
placeLauncher = placeLauncher:gsub("%%3F","?")
placeLauncher = placeLauncher:gsub("%%3D","=")
-- Due to how windows handles ampersands we must turn it into a escape character
placeLauncher = placeLauncher:gsub("%%26","^&")
-- Check if game ID was used
if placeLauncher:match("gameId") then
    -- Redo the place launcher
    placeLauncher = arguments:sub(413,605)
    placeLauncher = placeLauncher:gsub("%%3A",":")
    placeLauncher = placeLauncher:gsub("%%2F","/")
    placeLauncher = placeLauncher:gsub("%%3F","?")
    placeLauncher = placeLauncher:gsub("%%3D","=")
    placeLauncher = placeLauncher:gsub("%%26","^&")
end
-- Just to be sure
launchTime = arguments:sub(382,394)
-- We need the Browser Tracker ID for "seamless play"
browserTrackerID = arguments:sub(522,532)
-- Check if app beta was selected then combine it
if appBeta == 0 then
    combined = "C:\\Roblox\\rblx\\RobloxPlayerBeta.exe --play -t "..token.." -j "..placeLauncher.." -b "..browserTrackerID.." --launchtime="..launchTime.." --rloc en_us --gloc en_us"
elseif appBeta == 1 then
    combined = "C:\\Roblox\\rblx\\RobloxPlayerBeta.exe --app -t "..token.." -j "..placeLauncher.." -b "..browserTrackerID.." --launchtime="..launchTime.." --rloc en_us --gloc en_us" 
end
--local combinedPreview = ""
--combinedPreview = "C:\\Users\\CENSORED\\AppData\\Local\\Roblox\\Versions\\version-dcabc777160e4d68\\RobloxPlayerBeta.exe --app -t ".."censored".." -j ".."censored ".." -b ".."censored".." --launchtime="..launchTime.." --rloc en_us --gloc en_us"

print("Roblox Parser")
print("Place launcher URI is "..placeLauncher)
print("Token is "..token)
print("Launch time is "..launchTime)
print("Browser Tracker ID is "..browserTrackerID)
print("Combined is ".. combined)
 os.execute("start "..combined)
