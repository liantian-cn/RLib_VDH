--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, Rotation = ...


local category = Settings.RegisterVerticalLayoutCategory("RLib-复仇DH")
Settings.RegisterAddOnCategory(category)


function Rotation.InitSettings()
    if RLib_VDH_SavedVar == nil then
        RLib_VDH_SavedVar = {}
    end
    if not RLib_VDH_SavedVar.ReaverGlaiveTargetHp then
        RLib_VDH_SavedVar.ReaverGlaiveTargetHp = 10
    end
    if not RLib_VDH_SavedVar.BurstTime then
        RLib_VDH_SavedVar.BurstTime = 15
    end
    if not RLib_VDH_SavedVar.THROW_GLAIVE then
        RLib_VDH_SavedVar.THROW_GLAIVE = false
    end
    if not RLib_VDH_SavedVar.USE_FEL_DEVASTATION then
        RLib_VDH_SavedVar.USE_FEL_DEVASTATION = true
    end
end

do
    local name = "收割者战刃"
    local variable = "ReaverGlaiveTargetHp"
    local defaultValue = 10
    local minValue = 10
    local maxValue = 100
    local step = 1
    local function GetValue()
        return RLib_ProtPally_SavedVar.ReaverGlaiveTargetHp or defaultValue
    end
    local function SetValue(value)
        RLib_ProtPally_SavedVar.ReaverGlaiveTargetHp = value
    end
    local setting = Settings.RegisterProxySetting(category, variable, type(defaultValue), name, defaultValue, GetValue, SetValue)
    local tooltip = "使用收割者战刃的目标最低生命值"
    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
    Settings.CreateSlider(category, setting, options, tooltip)
end

do
    local name = "开怪时间"
    local variable = "BurstTime"
    local defaultValue = 15
    local minValue = 1
    local maxValue = 30
    local step = 1
    local function GetValue()
        return RLib_ProtPally_SavedVar.BurstTime or defaultValue
    end
    local function SetValue(value)
        RLib_ProtPally_SavedVar.BurstTime = value
    end
    local setting = Settings.RegisterProxySetting(category, variable, type(defaultValue), name, defaultValue, GetValue, SetValue)
    local tooltip = "超过开怪时间，将不会使用邪能毁灭、怨念咒符、"
    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
    Settings.CreateSlider(category, setting, options, tooltip)
end


do
    local variable = "THROW_GLAIVE"
    local name = "使用投掷利刃"
    local tooltip = "使用投掷利刃，好像没啥仇恨，用也白用"
    local defaultValue = false
    local function GetValue()
        return RLib_ProtPally_SavedVar.THROW_GLAIVE or defaultValue
    end
    local function SetValue(value)
        RLib_ProtPally_SavedVar.THROW_GLAIVE = value
    end
    local setting = Settings.RegisterProxySetting(category, variable, type(defaultValue), name, defaultValue, GetValue, SetValue)
    Settings.CreateCheckbox(category, setting, tooltip)
end

do
    local variable = "USE_FEL_DEVASTATION"
    local name = "使用邪能毁灭"
    local tooltip = "使用邪能毁灭，可能导致吃地板。"
    local defaultValue = true
    local function GetValue()
        return RLib_ProtPally_SavedVar.USE_FEL_DEVASTATION or defaultValue
    end
    local function SetValue(value)
        RLib_ProtPally_SavedVar.USE_FEL_DEVASTATION = value
    end
    local setting = Settings.RegisterProxySetting(category, variable, type(defaultValue), name, defaultValue, GetValue, SetValue)
    Settings.CreateCheckbox(category, setting, tooltip)
end
