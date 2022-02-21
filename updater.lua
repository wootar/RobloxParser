local ver = io.popen("curl http://setup.roblox.com/version"):read("a")
print(ver)
local list = {
    [1] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-fonts.zip", name = "rblx\\content\\fonts"},
    [2] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-avatar.zip", name = "rblx\\content\\avatar"},
    [3] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-configs.zip", name = "rblx\\content\\configs"},
    [4] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-models.zip", name = "rblx\\content\\models"},
    [5] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-sky.zip", name = "rblx\\content\\sky"},
    [6] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-sounds.zip", name = "rblx\\content\\sounds"},
    [7] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-textures2.zip", name = "rblx\\content\\textures"},
    [8] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-RobloxApp.zip", name = "rblx"},
    [9] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-ssl.zip", name = "rblx\\ssl"},
    [10] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-shaders.zip", name = "rblx\\shaders"},
    [11] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-textures3.zip", name = "rblx\\PlatformContent\\pc\\textures"},
    [12] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-extracontent-luapackages.zip", name = "rblx\\ExtraContent\\LuaPackages"},
    [13] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-extracontent-models.zip", name = "rblx\\ExtraContent\\models"},
    [14] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-extracontent-places.zip", name = "rblx\\ExtraContent\\places"},
    [15] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-extracontent-textures.zip", name = "rblx\\ExtraContent\\textures"},
    [16] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-extracontent-translations.zip", name = "rblx\\ExtraContent\\translations"},
    [17] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-terrain.zip", name = "rblx\\PlatformContent\\pc\\terrain"},
    [18] = {url = "https://s3.amazonaws.com/setup.roblox.com/"..ver.."-content-platform-fonts.zip", name = "rblx\\PlatformContent\\pc\\fonts"}
}
-- -d
print(list[1])
-- Clean up the old version of roblox
os.execute("rd C:\\Roblox\\rblx /s /q")
--
os.execute("mkdir rblx")
os.execute("mkdir rblx\\PlatformContent")
os.execute("mkdir rblx\\PlatformContent\\pc")
os.execute("mkdir rblx\\content")
os.execute("mkdir rblx\\ssl")
os.execute("mkdir rblx\\ExtraContent")
local g = io.open("rblx\\AppSettings.xml","w+")
g = g.write(g,[[<?xml version="1.0" encoding="UTF-8"?>
<Settings>
<ContentFolder>content</ContentFolder>
<BaseUrl>http://www.roblox.com</BaseUrl>
</Settings>
]])
g.flush(g)
g.close(g)
for i,v in pairs(list) do
    os.execute("mkdir "..v.name)
    print("curl "..list[i].url.." > ".."tmp.zip")
    os.execute("curl "..list[i].url.." > ".."tmp.zip")
    os.execute("unzip ".."tmp.zip".." -d "..v.name)
    os.execute("del tmp.zip")
end
os.execute("rd /s /q rblx\\content\\fonts\\families")
os.execute("rd /s /q rblx\\ssl\\_")
local dell = io.open("version.txt","w+")
dell:write(ver)
dell:flush()
dell:close()
