NA_Target = 'target';
NA_Player = 'player';
NA_Pet = 'pet';
NA_Focus = 'focus';

function W_Log(level, msg)
	if(level >= NA_LogLevel and not NA_IsTest) then
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

function W_printAllKeys(var)
	for k in pairs(var) do
    print(k);
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

function W_IsDeadTarget()
	if(UnitIsDead(NA_Target) and UnitCanAttack(NA_Player,NA_Target) and
	(UnitIsEnemy(NA_Player,NA_Target) or UnitIsTapped(NA_Target) or UnitIsPlayer(NA_Target))) then
		return true;
	else
		return false
	end
end

function W_TargetCanAttack()
	if(not UnitIsDead(NA_Target) and UnitCanAttack(NA_Player,NA_Target) and
	(UnitIsTapped(NA_Target) or UnitIsPlayer(NA_Target))) then
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
	if(spellID == 'NA_ChagetTarget')then
		return NA_ChagetTarget();
	end
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

function NA_ChagetTarget()
--	NA_ShowVars(101);
--	W_UpdateLabelText('NA_SpellLabel', 'NA_ChagetTarget');
	return false;
end

function NA_FireSpell(spellID, UnitId)
	local spellInfo = NA_getSpellInfo(spellID);
	if(spellInfo ~= nil and spellInfo.keyNo ~= nil and W_IsUsableSpell(spellID, UnitId) and UnitIsVisible(UnitId)) then
		W_Log(2,"NA_FireSpell:" .. spellID .."->"..spellInfo.name..spellInfo.keyNo);
		W_UpdateLabelText('NA_SpellLabel', spellInfo.name);
		NA_ShowVars(spellInfo.keyNo);
		return true;
	else
		W_UpdateLabelText('NA_SpellLabel', '');
		return false;
	end
end

function NA_FireItem(spellID, UnitId)
	local spellInfo = NA_getSpellInfo(spellID);
	if(spellInfo ~= nil and spellInfo.keyNo ~= nil) then
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
		if(SpellHasRange(spellInfo.name) ~=true or IsSpellInRange(spellInfo.name, UnitId) ==1) then
			return true;
		end
	end
	return false;
end

function W_IsUsableItem(spellID, UnitId)
	local spellInfo = NA_getSpellInfo(spellID);
	if(spellInfo == nil)then
		return false;
	end
	local isUsable, nomana = IsUsableItem(spellInfo.spellID);
	if (isUsable == true and nomana == false and W_GetCooldown(2, spellID) <= 1) then
		if(ItemHasRange(spellInfo.name) ~=true or IsItemInRange(spellInfo.name, UnitId) == 1) then
			return true;
		end
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
	print(SpellHasRange(spellInfo.name));

	if(UnitIsVisible(UnitId) == false)then return; end
	print("3-UnitIsVisible("..UnitId..")==true");
	if(NA_SpellInfoType(spellID) == 1)then
		local isUsable, nomana = IsUsableSpell(spellInfo.spellID);
		print(isUsable);
		print(nomana);
		if (isUsable == true and nomana == false and W_GetCooldown(1, spellID) <= 1) then
			print("3.1-W_GetCooldown(1, "..spellID..")="..W_GetCooldown(1, spellID));
			if(SpellHasRange(spellInfo.name) ~=true or IsSpellInRange(spellInfo.name, UnitId) ==1) then
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
--/run NA_testSpell('82692', NA_Target)

--/run NA_printTable(NA_ClassInfo);
function NA_printTable(t)
	for k in pairs(t) do
		print(k.."="..t[k]);
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
    local texture,name,isactive,isCastable = GetShapeshiftFormInfo(Num);
    if texture then
    if isactive then
       return true;
        end
    end
    return false;
end

--日月能方向检测
function W_SunPowerDir()
    local direction = GetEclipseDirection();
      if direction == "sun" then
         return true;
      end
    return false;
end

--日月能能量检测
function W_EclipsePower()
   local power = UnitPower(NA_Player,8) 
   --power = power < 0 and -power or power
      if power<0 then
         return -1;
      elseif power>0 then
         return 1;
      elseif power==0 then
         return 0;
      end
end

--统计技能可用数量
function NA_GetSpellCharges(spellID)
	local currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(spellID);
	if(currentCharges ~= nil)then
		return currentCharges;
	end
	return 0;
	end

function NA_GetSpellChargesTime(spellID)
	local currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(spellID);
	if (currentCharges ~= nil) then
	     local chargetime = cooldownStart+cooldownDuration-GetTime();
				return chargetime;
	end
        return 999;
end



function NA_checkHP(index)
	if(index == 0)then
		return W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
	elseif(index == 1)then
		return W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
	elseif(index == 2)then
		return W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
	else
		return false;
	end
end

--技能打断确认
function NA_SpellInterrupt(UnitId)
--	return false;
	local spell, _, _, _, _, endTime, _, _, notinterrupt= UnitCastingInfo(NA_Target);
	if (spell and not notinterrupt) then
	    local finish = endTime/1000 - GetTime();
	    if (finish~=0) then
		return true;
	    end
        end
	return false;
end

--debuff驱散确认
function NA_CheckDebuff(UnitId)
	  local name, _, _, _, debuffType= UnitDebuff(UnitId,1,1); 
	    if name then
		if debuffType=="Magic" then --魔法
		return 1;
		elseif debuffType=="Disease" then --疾病
		return 2;
		elseif debuffType=="Poison" then --毒药
		return 3;
		elseif debuffType=="Curse" then  --诅咒
		return 4;
		end
	end
	return 0;
end

--buff偷取确认
function NA_CheckBuffStealable(UnitId)
	for i=1,40 do local name, _, _, _, _, _, _, _, isStealable= UnitBuff(UnitId,i); 
		if name then
		   if isStealable==1 then
			return true;
		end
	end
	end;
	return false;
end

function NA_CountLowPlayers(UnitId,minHPLevel,dist)
      local prefix = "raid";
      local numPlayers = GetNumGroupMembers();
      local count = 0;
      if not IsInRaid() then
	 prefix = "party";
	 numPlayers = numPlayers-1;
         local perc = UnitHealth("player") / UnitHealthMax("player")
	 if perc < minHPLevel then
            count = count +1;
	 end
     else
      for i=1,numPlayers do
      	        local targetName = UnitName(UnitId);
		local posX, posY = UnitPosition(UnitId);
	        local unit = prefix..i ;
		local targetName2 = UnitName(unit);
			if (targetName2 ~= targetName) then 
				local posX2, posY2 = UnitPosition(unit);
				local perc = UnitHealth(unit) / UnitHealthMax(unit);
                                local xx = posX-posX2;
	                        local yy = posY-posY2;
	                        local dist2 = xx*xx+yy*yy;
				if (perc < minHPLevel and dist2<dist) then
					count = count +1;
				end
			end		
     end;
   end
return count;
end

function NA_Autofollow()
    if ( CheckInteractDistance(NA_Target, 2) and UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target) ) then
       FollowUnit(NA_Target);
    end
end

--进攻驱散
function NA_CheckBuff(UnitId)
        local name, _, _, _, debuffType= UnitBuff(UnitId,1,1); 
	    if name then
		if debuffType=="Magic" then --魔法
		    return 1;
		elseif debuffType=="Enrage" then --激怒
		    return 2;
	    end
	end
	return 0;
end

--AOE技能测试
function NA_AOE()
	NA_ShowVars(201);
	return true;
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
	return 0;
end

function NA_CheckRace(UnitId)
	local raceName, raceId = UnitRace(UnitId);
	if raceId == "Draenei" then
	    return 1;
	end
	return 0;
end

function NA_CheckGlyph(GlyphId)
	for i=1,3 do
	local n=i*2;
	local enabled,_,_,_,_,glyphID2 = GetGlyphSocketInfo(n); 
	   if enabled then
		if GlyphId==glyphID2 then
		  return true;
		end
           end
	end;
	return false;
end

function NA_isUsableTalentSpell(tier,column)
	local talentID, name, texture, selected, available  = GetTalentInfo(tier,column,GetActiveSpecGroup());
	if talentID then
	    if (selected) then
	       return true;
	    end
	end
	return false;	
end

function NA_TimeToDie(UnitId)
	if(W_PowerLevel(UnitId)< 1) then
		return 1;	
	end
	return 1000;
end

function NA_CastSpell(spellID)
	NA_FireSpell(spellID, NA_Target);
end

function W_GetSpellRemain(spellID,remaintime)
	local start, duration, enable = GetSpellCooldown(spellID)
	local t = start + remaintime - GetTime();
	if(enable == true and (start <= 0 or t <= 0))then
		return 0;
	elseif(enable ~= 1)then
		return 99999;
	else
		return t;
	end
end

function W_CheckRange(UnitId,UnitId2)
    if (UnitExists(UnitId) and UnitExists(UnitId2)) then
	local posX3, posY3 = UnitPosition(UnitId);
        local posX4, posY4 = UnitPosition(UnitId2);
        local intx = posX3-posX4;
	local inty = posY3-posY4;
	local range =intx*intx+inty*inty;
	return range;
    end
   return 9999;
end

function NA_getOvaleActions()
	local NA_OvaleActions = {[1]=nil,[2]=nil,[3]=nil,[4]=nil};
	if(Ovale ~= nil and Ovale.frame ~= nil and Ovale.frame.actions ~= nil)then
		for i=1,4 do 
			if(Ovale.frame.actions[i] ~= nil and Ovale.frame.actions[i].spellId ~= nil)then
				NA_OvaleActions[i] = Ovale.frame.actions[i].spellId..'';
			end
		end					
	end
	return NA_OvaleActions;
end

function NA_fireByOvale()
	local NA_OvaleActions = NA_getOvaleActions();
	return (false
					or NA_Fire(NA_IsMaxDps and NA_OvaleActions[4] ~= nil, NA_OvaleActions[4], NA_Target)
					or NA_Fire(NA_OvaleActions[1] ~= nil, NA_OvaleActions[1], NA_Target)
--					or NA_Fire(not NA_IsAOE and NA_OvaleActions[2] ~= nil, NA_OvaleActions[2], NA_Target)
					or NA_Fire(NA_OvaleActions[3] ~= nil, NA_OvaleActions[3], NA_Target)
        );
end

function MistCounts(num1,num2,types,aura) 
         local prefix = "raid" 
         local numPlayers = GetNumGroupMembers() 
         local numAuras1 = 0 
         local numAuras2 = 0 
         if not IsInRaid() then 
             prefix = "party" 
             numPlayers = numPlayers-1 
              local perc = UnitHealth("player") / UnitHealthMax("player") 
             if types == 1 then  
                 local _, _, _, _, _, _, expirationTime, _, _, _, _ = UnitAura("player", aura, nil, "PLAYER|HELPFUL") 
                 if expirationTime ~= nil and perc <= num1 then 
                     numAuras1 = numAuras1 + 1 
                 end 
             else 
                 if perc <= num1 then 
                     numAuras2 = numAuras2 + 1 
                 end 
             end 
         end 
      
         for i=1,numPlayers do 
             local unit = prefix..i 
             local perc = UnitHealth(unit) / UnitHealthMax(unit) 
             if types == 1 then  
                 local _, _, _, _, _, _, expirationTime, _, _, _, _ = UnitAura(unit, aura, nil, "PLAYER|HELPFUL") 
                 if expirationTime ~= nil and perc <= num1 then 
                     numAuras1 = numAuras1 + 1 
                 end 
             else 
                 if perc <= num1 then 
                     numAuras2 = numAuras2 + 1 
                 end 
             end 
         end 
         if types == 1 then 
             return numAuras1 >= num2 
         else 
             return numAuras2 >= num2 
         end 
 end
--MistCounts(0.8,6,1,"复苏之雾")
--0.8是血量百分比,运算是<=
--6是符合的团队成员数量,运算是>=
--1是需要不需要检测buff
--最后一个就是buff名称,不能用法术ID,只能用名称.
