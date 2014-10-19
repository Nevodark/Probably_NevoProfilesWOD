--Nevo = {}
if not Nevo then Nevo = {} end

function Nevo.GetSpellCD(MySpell)
    if GetSpellCooldown(GetSpellInfo(MySpell)) == nil then
        return 0
    else
        local Start ,CD = GetSpellCooldown(MySpell)
        local MyCD = Start + CD - GetTime()
        return MyCD
    end
end

function Nevo.Pooling()
    local Energy = UnitPower("player",SPELL_POWER_ENERGY)
    local _Pooling = 0
    if UnitDebuff("target", GetSpellInfo(91021)) then --Find weakness
        _Pooling = 0
    end   
	
	if Nevo.GetSpellCD(1856) <= 5 then
			_Pooling = 30
			end
    local EndTime = select(7,UnitDebuff("target", GetSpellInfo(91021)))
    
    if EndTime and Nevo.GetSpellCD(1856) <= 5 then --Vanish off cd or soon to be
        local Remaining = EndTime - GetTime()
        if Remaining <= 5 then --Find weakness 
            _Pooling = 36
        end
    end
    if Nevo.GetSpellCD(51713) < 5 then
        _Pooling = 43
    end
	if UnitBuff("player", GetSpellInfo(51713)) then --SHADOW DANCE SPAM SHIT 
		_Pooling = 0
		end
    
    return _Pooling
end


---function Nevo.snd()
-- if UnitAura("player", GetSpellInfo(5171)) == nil then
--    return 0
--else
-- local SND,SNDtime,Dtime = SND,SNDtime,Dtime
--  SND = select(7,UnitAura("player", GetSpellInfo(5171)))
--  if SND then SNDtime = SND - GetTime() end
--  Dtime = Nevo.GetSpellCD(1856)

--  if Dtime <= 10 and SNDtime <= Dtime then 
--    return true
--end
--end


function Nevo.Ambush()
    if UnitPower("player") >= (38 + Nevo.Pooling()) then
        return true
    end
end

function Nevo.BackStab()
    if UnitPower("player") >= (34 + Nevo.Pooling()) then
        return true
    end
end

function Nevo.Hemo()
    if UnitPower("player") >= (30 + Nevo.Pooling()) then
        return true
    end
end

function Nevo.Evis()
	if UnitPower("player") >= (30 + Nevo.Pooling()) then
		return true
	end
end

function Nevo.shdmsg()
  if UnitBuff("player", GetSpellInfo(51713)) then
   xrn:message("\124cFF008cba.::Shadow danceing::.")
    return true
  end
  return false

end


function canRED(var1,var2)
 if RedTarget and RedTarget ~= UnitGUID("target") and RedCombos ~= 0 then
  RedTarget = nil
     return true
 end
 RedTarget = UnitGUID("target")
 RedCombos = GetComboPoints("player", "target")
end




function Nevo.CPooling()
    local Energy = UnitPower("player",SPELL_POWER_ENERGY)
    local _Pooling = 0
    if UnitDebuff("target", GetSpellInfo(91021)) then --Find weakness
        _Pooling = 0
    end   
    
    if Nevo.GetSpellCD(1856) <= 5 then
            _Pooling = 25
            end
    local EndTime = select(7,UnitDebuff("target", GetSpellInfo(91021)))
    
    if EndTime and Nevo.GetSpellCD(1856) <= 5 then --Vanish off cd or soon to be 
        local Remaining = EndTime - GetTime()
        if Remaining <= 5 then --Find weakness 
            _Pooling = 35
        end
    end
    if Nevo.GetSpellCD(51713) < 5 then
        _Pooling = 40
    end
    if UnitBuff("player", GetSpellInfo(51713)) then --SHADOW DANCE SPAM SHIT 
        _Pooling = 0
        end
    
    return _Pooling
end


------------------------------------
------TESTING SHIT LoL WTF IS DIS----
local function onUpdate(self,elapsed) 
  if self.time < GetTime() - 6 then
if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
  end
end
xrn = CreateFrame("Frame",nil,ChatFrame1) 
xrn:SetSize(ChatFrame1:GetWidth(),300)
xrn:Hide()
xrn:SetScript("OnUpdate",onUpdate)
xrn:SetPoint("TOP",650,600)
xrn.text = xrn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
xrn.text:SetAllPoints()
xrn.texture = xrn:CreateTexture()
xrn.texture:SetAllPoints()
xrn.texture:SetTexture(100,100,100,.0) 
xrn.time = 0
function xrn:message(message) 
  self.text:SetText(message)
  self:SetAlpha(1)
  self.time = GetTime() 
  self:Show() 
end 
xrn:message("\.::NevoDarks Rogue::.")


--STOLEN BUTTON STUFF PLZ

--ProbablyEngine.condition.register("modifier.mouse4", function()
--  return IsMouseButtonDown(4) == 1
-- end)
 
-- ProbablyEngine.condition.register("modifier.mouse5", function()
--  return IsMouseButtonDown(5) == 1
-- end)






ProbablyEngine.library.register("Nevo", Nevo)
