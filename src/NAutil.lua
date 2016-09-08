NA_Target = 'target';
NA_Player = 'player';
NA_Nil = nil;
NA_Pet = 'pet';
NA_Focus = 'focus';
NA_lastMsg = '';

function W_Log(level, msg)
  if(level >= NA_LogLevel and not NA_IsTest) then
		if(NA_lastMsg == msg)then 
			return;
		end
		NA_lastMsg = msg;
    if(level > 3)then
      UIErrorsFrame:AddMessage(msg);
    else
      DEFAULT_CHAT_FRAME:AddMessage(msg);
    end
  elseif(level >= NA_LogLevel and NA_IsTest) then
    print(msg);
  end
end

function W_toString(var)
  if type(var) == "table" then
    local out = '{';
    for k in pairs(var) do
      out = out .. k..'=' .. W_toString(var[k]) ..', ';
    end
    if strlen(out) > 1 then
      out = strsub(out, 0, strlen(out)-2);
    end
    out = out .. '}';
    return out;
  elseif type(var) == 'string' then
    return '"'..var..'"';
  elseif type(var) == 'boolean' then
    if var then return 'true' else return 'false' end;
  else
    return var;
  end
end

function W_SetBinding(no, text, f)
  local key;
  if(no >0 and no<10) then
    key = "CTRL-"..no;
  elseif(no == 0) then
    key = "ALT-CTRL-`";
  elseif(no == 10) then
    key = "CTRL-0";
  elseif(no == 11) then
    key = "CTRL--";
  elseif(no == 12) then
    key = "CTRL-=";
  elseif(no >12 and no<22) then
    key = "ALT-CTRL-"..(no-12);
  elseif(no == 22) then
    key = "ALT-CTRL-0";
  elseif(no == 23) then
    key = "ALT-CTRL--";
  elseif(no == 24) then
    key = "ALT-CTRL-=";
  elseif(no >24 and no<34) then
    key = "SHIFT-"..(no-24);
  elseif(no == 34) then
    key = "SHIFT-0";
  elseif(no == 35) then
    key = "SHIFT--";
  elseif(no == 36) then
    key = "SHIFT-=";
  else
    W_Log(4,"W_SetBinding error no: ".. no);
    return;
  end

  W_Log(2,"W_SetBinding: ".. key .."->"..text);
  if(f==1) then --spell
    if(not SetBindingSpell(key, text) == 1)then
      W_Log(4,"SetBindingSpell error : ".. key .."->"..text);
  end
  elseif(f==2) then --item
    if(not SetBindingItem(key, 'item:'..text) == 1)then
      W_Log(4,"SetBindingItem error : ".. key .."->"..text);
  end
  elseif(f==3) then --macro
    if(not SetBindingMacro(key, text) == 1)then
      W_Log(4,"SetBindingMacro error : ".. key .."->"..text);
  end
  else
    W_Log(4,"W_SetBinding error type: ".. f);
    return;
  end
end

function NA_ClearAction()
  --	if(NA_IsRunning == true)then
  --		NA_ShowVars(99);
  --	else
  --		NA_ShowVars(0);
  --	end
  NA_ShowVars(0);
end

function NA_test(cnd, yes, no)
  if(NA_IsRunning == true)then
  	return yes;
  else
  	return no;
  end
end

function W_UnitBuff(isBuff, UnitId, i)
  if(isBuff)then
    return UnitBuff(UnitId, i);
  else
    return UnitDebuff(UnitId, i);
  end
end

--buffID>0:buff; buffID<0:debuff
function W_getBuff(UnitId, buffID, onlyMine)
  local i=1;
  local buff = W_UnitBuff(buffID>0, UnitId, i);
  while buff do
    local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = W_UnitBuff(buffID>0, UnitId, i);
    --print(name..'--'..unitCaster..'--'..spellId..'=='..math.abs(buffID));
    if(spellId == math.abs(buffID))then
      if((onlyMine == true and unitCaster==NA_Player) or onlyMine ~= true)then
        return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId;
      end
    end
    i = i + 1;
    buff = W_UnitBuff(buffID>0, UnitId, i);
  end;
  return nil;
end

function W_BuffCount(UnitId, buffID, onlyMine)
  local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = W_getBuff(UnitId, buffID, onlyMine);
  if(name ~= nil)then
    if(count == nil or count < 1)then
      count =1;
    end
    return count;
  end
  return 0;
end

function W_HasBuff(UnitId, buffID, onlyMine)
  return W_BuffCount(UnitId, buffID, onlyMine)>0;
end

function W_RetainBuff(UnitId, buffID, onlyMine)
  return W_BuffTime(UnitId, buffID, onlyMine) > 3;
end

function W_BuffTime(UnitId, buffID, onlyMine)
  local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = W_getBuff(UnitId, buffID, onlyMine);
  if(name ~= nil)then
    W_Log(1, "W_BuffTime:"..expirationTime..'----->'..(expirationTime-GetTime()));
    return expirationTime-GetTime();
  end
  return 0;
end

--/run print(W_HasStealableBuff(NA_Target));
function W_HasStealableBuff(UnitId)
  for i=1,40 do
    local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff = UnitBuff(UnitId, i);
    if(isStealable == 1 or shouldConsolidate == 1 or canApplyAura == true or  isBossDebuff == true)then
      print(name ..':isStealable='..tostring(isStealable)..'; shouldConsolidate='..tostring(shouldConsolidate)..'; canApplyAura='..tostring(canApplyAura)..';isBossDebuff='..tostring(isBossDebuff));
      return true;
    end
  end
  return false;
end

function W_IsDeadTarget()
  if(UnitIsDead(NA_Target) and UnitCanAttack(NA_Player,NA_Target) and
    (UnitIsEnemy(NA_Player,NA_Target) or UnitIsTapped(NA_Target) or UnitIsPlayer(NA_Target))) then
    return true;
  else
    return false
  end
end

function W_TargetCanAttack()
  if(not UnitIsDead(NA_Target) and UnitCanAttack(NA_Player,NA_Target)) then
    return true;
  else
    return false
  end
end

function W_TargetIsBoss()
  if(
    (UnitLevel(NA_Target) - UnitLevel(NA_Player) >=2 or UnitLevel(NA_Target) == -1) and
    (UnitClassification(NA_Target) == 'worldboss' or UnitClassification(NA_Target) == 'rareelite' or UnitClassification(NA_Target) == 'elite' or UnitClassification(NA_Target) == 'rare')) then
    return true;
  else
    return false
  end
end

--power level
function W_PowerLevel(UnitId)
  return UnitPower(UnitId)/UnitPowerMax(UnitId);
end

function W_HPlevel(UnitId)
  if(UnitHealthMax(UnitId) == 1)then return 1; end
  return UnitHealth(UnitId)/UnitHealthMax(UnitId);
end

function W_HP(UnitId)
  if(UnitHealthMax(UnitId) == 1) then
    return 100000;
  else
    return UnitHealth(UnitId);
  end
end

function W_isTanking()
  if(UnitHealthMax(NA_Target) == 1)then return true; end
  local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation(NA_Player, NA_Target);
  return isTanking;
end

function NA_Fire(cond, spellID, UnitId, interval)
  --	if(interval == nil)then
  --		interval = 0;
  --		NA_SpellTimes[spellID] = nil;
  --	end
  --
  --	if(NA_SpellTimes[spellID] ~= nil and (GetTime() - NA_SpellTimes[spellID]) < interval)then
  --		return false;
  --	end
  if(spellID == 'NA_fireByOvale')then
    return NA_fireByOvale();
  end

  local spellType = NA_SpellInfoType(spellID)
  if(cond and spellType == 1 and NA_FireSpell(spellID, UnitId)) then
    NA_SpellTimes[spellID] = 0;
    return true;
  elseif(cond and spellType == 2 and NA_FireItem(spellID, UnitId)) then
    NA_SpellTimes[spellID] = 0;
    return true;
  elseif(cond and spellType == 3 and NA_FireMacro(spellID, UnitId)) then
    NA_SpellTimes[spellID] = 0;
    return true;
  end
  return false;
end

function NA_FireSpell(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo ~= nil and spellInfo.keyNo ~= nil and (W_IsUsableSpell(spellID, UnitId) and W_UnitIsVisible(UnitId))) then
    W_Log(2,"NA_FireSpell:" .. spellID .."->"..spellInfo.name..spellInfo.keyNo);
    W_UpdateLabelText('NA_SpellLabel', spellInfo.name);
    NA_ShowVars(spellInfo.keyNo);
    return true;
  else
    W_UpdateLabelText('NA_SpellLabel', '');
    -- W_Log(3,"NA_FireSpell:" .. spellID..'-'..UnitId);
    return false;
  end
end

function NA_FireItem(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo ~= nil and spellInfo.keyNo ~= nil and W_IsUsableItem(spellID, UnitId)) then
    W_Log(2,"NA_FireItem:" .. spellID .."->"..spellInfo.keyNo);
    W_UpdateLabelText('NA_SpellLabel', spellInfo.name);
    NA_ShowVars(spellInfo.keyNo);
    return true;
  else
    W_UpdateLabelText('NA_SpellLabel', '');
    return false;
  end
end

function NA_FireMacro(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo ~= nil and spellInfo.keyNo ~= nil) then
    W_Log(2,"NA_FireMacro:" .. spellID .."->"..spellInfo.keyNo);
    W_UpdateLabelText('NA_SpellLabel', spellInfo.spellID);
    NA_ShowVars(spellInfo.keyNo);
    return true;
  else
    W_UpdateLabelText('NA_SpellLabel', '');
    return false;
  end
end

function NA_FireBuffs(buffs, spellID)
  local bufftarget;
  if(UnitExists(NA_Target) == false or UnitName(NA_Target) ~= UnitName(NA_Player))then
    bufftarget = NA_Player;
  elseif(UnitExists(NA_Target) and UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
    bufftarget = NA_Target;
  end
  if(bufftarget ~= nil and NA_Cast4NoBuffs(buffs, spellID, bufftarget))then return true; end
  return false;
end

function NA_targetSpell(buffs, spellID, UnitId, onlyMine)
  if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
  if(W_checkBuffs(buffs, UnitId, onlyMine)) then return NA_FireSpell(spellID,NA_Target); end
  return false;
end

function W_IsUsableSpell(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo == nil)then
    return false;
  end
  local isUsable, nomana = IsUsableSpell(spellInfo.spellID);
  if (isUsable == true and nomana == false and W_GetCooldown(1, spellID) <= 1) then
    return W_InRange(spellInfo, UnitId);
  end
  return false;
end

function W_IsUsableItem(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo == nil)then
    return false;
  end
  local isUsable, nomana = IsUsableItem(spellInfo.spellID);
  if (isUsable == true and nomana == false) then
    return true;
  end
  return false;
end

function W_IsCasting(UnitId)
  local spell, rank, displayName, icon, startTime, endTime, isTradeSkill, castID, interrupt = UnitCastingInfo(UnitId);
  if(spell ~= nil)then
    if(startTime == 0)then
      return 0;
    elseif(endTime ~= nil)then
      return endTime/1000 - GetTime();
    end
    W_Log(3,"W_IsCasting1 ".. startTime.."--"..endTime);
    return 999;
  end

  spell, rank, displayName, icon, startTime, endTime, isTradeSkill, interrupt = UnitChannelInfo(UnitId);
  if(spell ~= nil)then
    if(startTime == 0)then
      return 0;
    elseif(endTime ~= nil)then
      return endTime/1000 - GetTime() + 0.8;
    end
    W_Log(3,"W_IsCasting2 ".. startTime.."--"..endTime);
    return 999;
  end
  return 0;
end

function W_GetCooldown(type, spellID)
  local spellInfo = NA_getSpellInfo(spellID);
  local start, duration, enable
  if(type==1)then -- spell
    start, duration, enable = GetSpellCooldown(spellInfo.spellID)
  elseif(type==2)then --item
    start, duration, enable = GetItemCooldown(spellInfo.spellID)
  end
  local t = start + duration - GetTime();
  if(enable == true and (start <= 0 or t <= 0))then
    return 0;
  elseif(enable ~= 1)then
    return 99999;
  else
    return t;
  end
end

function W_GetSpellCooldown(spellID)
  local start, duration, enable = GetSpellCooldown(spellID)
  local t = start + duration - GetTime();
  if(enable == true and (start <= 0 or t <= 0))then
    return 0;
  elseif(enable ~= 1)then
    return 99999;
  else
    return t;
  end
end

function W_IsInCombat()
  if(UnitAffectingCombat(NA_Player))then
    return true;
  else
    return false;
  end
end

function W_StarCount(runetype)
  local count = 0;
  --1 : RUNETYPE_BLOOD
  --2 : RUNETYPE_CHROMATIC
  --3 : RUNETYPE_FROST
  --4 : RUNETYPE_DEATH
  if(select(3, GetRuneCooldown(1)) == true and GetRuneType(runetype)) then count=count+1; end;
  if(select(3, GetRuneCooldown(2)) == true and GetRuneType(runetype)) then count=count+1; end;
  if(select(3, GetRuneCooldown(3)) == true and GetRuneType(runetype)) then count=count+1; end;
  if(select(3, GetRuneCooldown(4)) == true and GetRuneType(runetype)) then count=count+1; end;
  if(select(3, GetRuneCooldown(5)) == true and GetRuneType(runetype)) then count=count+1; end;
  if(select(3, GetRuneCooldown(6)) == true and GetRuneType(runetype)) then count=count+1; end;
  return count;
end

function W_PaladinPower(unit)
  --return UnitPower(unit, SPELL_POWER_HOLY_POWER);
  return UnitPower(unit,9);
end

function w_GetComboPoints(unit)
  --return GetComboPoints(unit, 'target');
  return UnitPower(unit,4);
end

function W_SpellEnabled(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  return (spellInfo ~= nil and spellInfo.keyNo ~= nil and W_IsUsableSpell(spellID, UnitId) and UnitIsVisible(UnitId));
end

function W_Send(text, channel)
  SendChatMessage(text,"channel",nil, channel);
end

function NA_Sale(Item, price, unit)
  local iunit = "组";
  if(unit ~= nil) then iunit = unit; end
  W_Send("出售"..select(1,GetItemInfo(Item))..price.."/"..iunit.."~零售亦可,欢迎邮寄", 2);
end

function NA_buy(Item)
  W_Send("求购"..select(1,GetItemInfo(Item))..",有的代价密,谢谢", 2);
end

function NA_getClassInfoName(spellID)
  if(spellID == nil)then
    return nil;
  end
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo ~= nil and spellInfo.name ~= nil)then
    return spellInfo.name;
  else
    return nil;
  end
end

function NA_ArrayAppend(t1,t2)
  for k in pairs(t2) do
    table.insert(t1,t2[k]);
  end
  return t1;
end

function NA_testSpell(spellID, UnitId)
  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo == nil or spellInfo.keyNo == nil)then return; end
  print("1-spellInfo.keyNo="..spellInfo.keyNo);
  print("1.1-NA_SpellInfoType("..spellID..")="..NA_SpellInfoType(spellID));

  local spellInfo = NA_getSpellInfo(spellID);
  if(spellInfo == nil)then return; end
  print("2.0-spellInfo.name="..spellInfo.name);

  if(UnitIsVisible(UnitId) == false)then return; end
  print("3-UnitIsVisible("..UnitId..")==true");
  if(NA_SpellInfoType(spellID) == 1)then
    local isUsable, nomana = IsUsableSpell(spellInfo.spellID);
    print('isUsable='..NA_Bool(isUsable));
    print('nomana='..NA_Bool(nomana));
    if (isUsable == true and nomana == false and W_GetCooldown(1, spellID) <= 1) then
      print("3.1-W_GetCooldown(1, "..spellID..")="..W_GetCooldown(1, spellID));
			print('SpellHasRange='..NA_Bool(SpellHasRange(spellInfo.name)));
			print('IsSpellInRange='..NA_Bool(IsSpellInRange(spellInfo.name, UnitId)));
      if(W_InRange(spellInfo, UnitId)) then
        print("4-SpellHasRange("..spellInfo.name..")==true");
        print("5-IsSpellInRange("..spellInfo.name..", "..UnitId..")==true");

        if(W_IsUsableSpell(spellID, UnitId) == false)then return; end
        print("6-W_IsUsableSpell("..spellID..", "..UnitId..")==true");
        return;
      end
    end
  end

  --	if(W_IsUsableSpell(spellID, UnitId) == false)then return; end
  --	print("8-W_IsUsableSpell("..spellID..", "..UnitId..")==true");
end
--/run NA_testSpell('77758', NA_Player)
--/script print(SpellHasRange())

function W_UnitIsVisible(UnitId)
	if(UnitId == NA_Nil)then
		return true;
	end
	return UnitIsVisible(UnitId);
end

function W_InRange(spellInfo, UnitId)
	if(spellInfo.spellID == 77758)then
		return true;
	end
	if(UnitId == NA_Nil)then
		return true;
	end
	if(SpellHasRange(spellInfo.name) ~=true or IsSpellInRange(spellInfo.name, UnitId) ==1) then
		return true;
  end
	return false;
end

function NA_Bool(cond)
	if(cond)then
		return 'true';
	else
		return 'false';
	end
end
function NA_testBuff(UnitId, buffID, onlyMine)
  if(W_getBuff(UnitId, buffID, onlyMine) ~= nil)then
    print("W_getBuff("..UnitId..", "..buffID..", "..onlyMine..")="..W_getBuff(UnitId, buffID, onlyMine));
    if(W_BuffTime(UnitId, buffID, onlyMine) ~= nil)then
      print("W_BuffTime("..UnitId..", "..buffID..", "..onlyMine..")="..W_BuffTime(UnitId, buffID, onlyMine));
    end
    print("W_HasBuff("..UnitId..", "..buffID..", "..onlyMine..")="..W_HasBuff(UnitId, buffID, onlyMine));
    print("W_RetainBuff("..UnitId..", "..buffID..", "..onlyMine..")="..W_RetainBuff(UnitId, buffID, onlyMine));
    print("W_BuffCount("..UnitId..", "..buffID..", "..onlyMine..")="..W_BuffCount(UnitId, buffID, onlyMine));
  end
end
--/run NA_testBuff(NA_Player, 19615, true);

--/run W_printBuffInfo(NA_Target)
function W_printBuffInfo(UnitId)
  local buffs, i = { }, 1;
  local buff = UnitBuff(UnitId, i);
  while buff do
    buffs[#buffs + 1] = buff;
    i = i + 1;
    buff = UnitBuff(UnitId, i);
  end;
  if #buffs < 1 then
    buffs = "You have no buffs";
  else
    buffs[1] = "You're buffed with: "..buffs[1];
    buffs = table.concat(buffs, ", ");
  end;
  print(buffs);
end

--/run W_printDeBuffInfo(NA_Player)
function W_printDeBuffInfo(UnitId)
  local buffs, i = { }, 1;
  local buff = UnitDebuff(UnitId, i);
  while buff do
    buffs[#buffs + 1] = buff;
    i = i + 1;
    buff = UnitDebuff(UnitId, i);
  end;
  if #buffs < 1 then
    buffs = "You have no debuffs";
  else
    buffs[1] = "You're debuffs with: "..buffs[1];
    buffs = table.concat(buffs, ", ");
  end;
  print(buffs);
end

--姿态检测
function W_FormInfo(Num)
  local texture, name, isActive, isCastable, spellID = GetShapeshiftFormInfo(Num);
  if isActive then
    return true;
  end
  return false;
end

--检查受伤程度
function NA_checkHP(index)
  if(index == 0)then --快死了
    return W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
  elseif(index == 1)then --严重受伤
    return W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
  elseif(index == 2)then --一般伤
    return W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
  elseif(index == 3)then --伤
    return W_HPlevel(NA_Player) < 1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
  else
    return false;
  end
end

--技能打断确认
function NA_SpellInterrupt(UnitId)
--	local name, subText, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(UnitId);
--	if(name ~= nill and notInterruptible ~= 1 and startTime > 0)then
--		return true;
--	end 
--	local name2, subText2, text2, texture2, startTime2, endTime2, isTradeSkill2, notInterruptible2 = UnitChannelInfo(UnitId);
--	if(name2 ~= nill and notInterruptible2 ~= 1 and startTime > 0)then
--		return true;
--	end
  return false;
end

--buff偷取确认
function NA_hasStealableBuff(UnitId)
  for i=1,40 do
    local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff = UnitBuff(UnitId,i);
    if name and isStealable == 1 then
      return true;
    end
  end;
  return false;
end

--检查是否有buff
function NA_CheckBuff(UnitId)
  for i=1,40 do
    local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff = UnitBuff(UnitId,i);
    if name and debuffType=="Curse" then --诅咒
      return 4;
    elseif name and debuffType=="Disease" then  --疾病
      return 5;
    elseif name and debuffType=="Magic" then  --魔法
      return 1;
    elseif name and debuffType=="Poison" then  --毒药
      return 3;
    elseif name and debuffType=="" then  --激怒
      return 2;
    end;
  end;
  return 0;
end

--检查是否有debuff
function NA_CheckDebuff(UnitId)
  for i=1,40 do
    local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff = UnitDebuff(UnitId,i);
    if name and debuffType=="Curse" then --诅咒
      return 4;
    elseif name and debuffType=="Disease" then  --疾病
      return 5;
    elseif name and debuffType=="Magic" then  --魔法
      return 1;
    elseif name and debuffType=="Poison" then  --毒药
      return 3;
    elseif name and debuffType=="" then  --激怒
      return 2;
    end;
  end;
  return 0;
end

--职责测试
function NA_CheckRoles(UnitId)
  local roleToken = UnitGroupRolesAssigned(UnitId);
  if roleToken == "TANK" then
    return 1;
  elseif roleToken == "HEALER" then
    return 2;
  elseif roleToken == "DAMAGER" then
    return 3;
  end
  return 0; --NONE
end

--检查雕文
function NA_CheckGlyph(GlyphId)
  for i=1,6 do
    local enabled, glyphType, glyphTooltipIndex, glyphSpell, icon = GetGlyphSocketInfo(i, nil);
    if enabled and glyphSpell == GlyphId then
      return true;
    end
  end;
  return false;
end

--检查天赋技能是否可用
function NA_isUsableTalentSpell(tier,column)
  local talentID, name, texture, selected, available  = GetTalentInfo(tier,column,GetActiveSpecGroup());
  if talentID then
    if (selected) then
      return true;
    end
  end
  return false;
end

function NA_fireByOvale()
  return (false
    or (NA_IsMaxDps and OV_fireAction(4)) --施放第4格法术,爆发技能
    or (NA_IsAOE and OV_fireAction(3)) -- 施放第3格法术,AOE法术
    or (not NA_IsAOE and OV_fireAction(2)) --施放第2个法术
    or (OV_fireAction(1)) --施放第1格法术,短技能卡CD
    );
end

-- actionTexture, actionInRange, actionCooldownStart, actionCooldownDuration,
--		actionUsable, actionShortcut, actionIsCurrent, actionEnable, actionType, actionId, actionTarget
-- /script print(OV_fireAction(2));
function OV_fireAction(index)
	if(Ovale and Ovale["OvaleCompile"] and Ovale["OvaleCompile"].GetIconNodes() and Ovale["OvaleCompile"].GetIconNodes()[index])then 
		local OvAction = Ovale["OvaleCompile"].GetIconNodes()[index]["child"][1]["result"];
		if(OvAction ~= nil and OvAction.actionUsable and OvAction.actionEnable == 1)then
			if(OvAction.actionType == 'spell')then
				--print(OvAction.actionId.."---"..OvAction.actionTarget);
				return NA_FireSpell(OvAction.actionId..'', OvAction.actionTarget..'');
			elseif(OvAction.actionType == "item") then
				return NA_FireItem(OvAction.actionId, OvAction.actionTarget);
			end
		end	
	end
  return false;
end
