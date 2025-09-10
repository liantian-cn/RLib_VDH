--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- 获取插件名称和全局表
local addonName, Rotation = ...

local RL = RLib
local Utils = RL.Utils


RL.Rotation[addonName] = Rotation


function Rotation:Check()
    local className, classFilename, classId = UnitClass("player")
    local currentSpec = GetSpecialization()
    if (classFilename == "DEMONHUNTER") and (currentSpec == 2) then
        return true
    end
    return false
end

function Rotation:Init()
    Rotation.InitSettings()
    Utils.Print(addonName .. " Inited")
end
