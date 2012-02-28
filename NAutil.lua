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
		if(not SetBindingItem(key, text) == 1)then
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
	if(NA_IsRunning == true)then
		NA_ShowVars(999);
	else
		NA_ShowVars(0);
	end
end

function W_checkBuffs(buffs, UnitId, onlyMine)
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
	for k in pairs(buffs) do
		if(W_BuffCount(buffs[k], UnitId, onlyMine) > 0)then 
			return true;
		end
	end
	return false;
end

function W_checkDeBuffs(UnitId, type_debuff)
	local tmp_count = 0;
	for i=1,50 do
		--debuffType: String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(UnitId,i);
		if(debuffType ~= nil and debuffType == type_debuff)then
			return true;
		end
	end
	return false;
end

function W_GetBuff(buffID, bufficon, UnitId, bufftype, onlyMine)
	local spellInfo = NA_getSpellInfo(buffID);
	local buffname = buffID;
	if(spellInfo ~= nil or spellInfo['name'] ~= nil)then 
		buffname = spellInfo['name'];
	end
	if(spellInfo ~= nil and (spellInfo['buff'] == 1 or spellInfo['buff'] == 2))then
		bufftype = spellInfo['buff'];
	end
	if(bufficon ~= nil)then
		bufficon = "Interface\\Icons\\"..bufficon;
	end
	for i=1,50 do
		--debuffType: String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = W_UnitBuff(UnitId, i, bufftype, onlyMine);
		if(
			--buffID
			(buffname ~= nil and name == buffname) or 
			--icon
			(bufficon ~= nil and icon == bufficon)
		)then
			return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
		end
	end
	return nil;
end

function W_UnitBuff(UnitId, i, bufftype, onlyMine)
	if(bufftype == nil)then bufftype = 1; end
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
	
	--debuffType: String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;

	if(bufftype == 1) then
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable= UnitBuff(UnitId,i);
	else
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(UnitId,i);
	end
	if(not onlyMine or unitCaster == "player")then
		return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
	end
	return nil;
end

function NA_KeepBuff(buffID, UnitId, onlyMine, n)
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = W_GetBuff(buffID, nil, UnitId, nil, onlyMine);
	local firecond = true;
	if(count ~= nil and expirationTime ~= nil and count >= n and (expirationTime - GetTime()) > 3) then
		firecond = false
	end
	return NA_Fire(firecond, buffID, UnitId);
end

function W_BuffCount(buffID, UnitId, onlyMine, bufficon)
	local count = select(4, W_GetBuff(buffID, bufficon, UnitId, bufftype, onlyMine));
	if(count ~= nil and count > 0)then
		return count;
	end
	if(count ~= nil and count == 0)then
		return 1;
	else 
		return 0;
	end

--	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
--	if(UnitId == nil) then
--		local buffCount = false;
--		buffCount = W_BuffCount(buffID, "player");
--		if (buffCount <= 0) then
--			buffCount = W_BuffCount(buffID, "target");
--		end
--		if (buffCount <= 0) then
--			buffCount = W_BuffCount(buffID, "focus");
--		end
--		return buffCount;
--	end
--
--	local flag = 1;
--	local buffInfo = NA_getSpellInfo(buffID);
--	if(buffInfo ~= nil and buffInfo['buff'] ~= nil)then
--		flag = buffInfo['buff'];
--	else
--		W_Log(2,"W_BuffCount: there is not a flag for buff " .. buffID);
--	end
--
--	local tmp_count = 0;
--	for i=1,50 do
--		--debuffType: String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.
--		local name, rank, icon, iconTexture, count, debuffType, duration, expirationTime, unitCaster, isStealable;
--		if(flag == 1) then
--			name, rank, iconTexture, count, debuffType, duration, expirationTime, unitCaster, isStealable= UnitBuff(UnitId,i);
--		else
--			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(UnitId,i);
--		end
--		if(name == buffID or name == NA_getClassInfoName(buffID)) then
--			if(count ~= nil and count == 0)then
--				count = 1;
--			elseif(count ~= nil and count > 0)then
--			else
--				count = 0;
--			end
--
--			if(count >= 0) then 
--				if(onlyMine and unitCaster == "player")then
--					return count;
--				elseif(onlyMine)then
--					tmp_count = count;
--				else
--					return count;
--				end
--			end
--		end
--	end
--
--	if(onlyMine)then return 0; end
--	return tmp_count;
end

function W_BuffCountByIcon(bufficon, bufftype, UnitId, onlyMine)
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end

	local tmp_count = 0;
	for i=1,50 do
		--debuffType: String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
		if(bufftype == 1) then
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable= UnitBuff(UnitId,i);
		else
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(UnitId,i);
		end
		if(icon == "Interface\\Icons\\"..bufficon) then
			if(count ~= nil and count >= 0) then 
				if(onlyMine and unitCaster == "player")then
					return count;
				elseif(onlyMine)then
					tmp_count = count;
				else
					return count;
				end
			end
		end
	end

	if(onlyMine)then return 0; end
	return tmp_count;
end

function W_printBuffInfo(UnitId)
	print(UnitId.." buff:");
	for i=1,50 do
		print(UnitBuff(UnitId,i));
	end
	print(UnitId.." debuff:");
	for i=1,50 do
		print(UnitDebuff(UnitId,i));
	end
end

function W_TargetCanAttack()
	if(not UnitIsDead("target") and UnitCanAttack("player","target") == 1 and 
		(UnitIsEnemy("player","target") or UnitIsTapped("target") or UnitIsPlayer("target") == true)) then
		return true;
	else
		return false
	end
end

function W_TargetIsBoss()
	if(
	(UnitLevel("target") - UnitLevel("player") >=2 or UnitLevel("target") == -1) and 
	(UnitClassification("target") == 'worldboss' or UnitClassification("target") == 'rareelite' or UnitClassification("target") == 'elite' or UnitClassification("target") == 'rare')) then
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
	if(UnitHealthMax("target") == 1)then return true; end 
	local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation("player", "target");
	return isTanking == 1;
end

function NA_Fire(cond, spellID, UnitId, interval)
	if(interval == nil)then
		interval = 0;
		NA_SpellTimes[spellID] = nil;
	end

	if(NA_SpellTimes[spellID] ~= nil and (GetTime() - NA_SpellTimes[spellID]) < interval)then
		return false;
	end

	if(cond and NA_FireSpell(spellID, UnitId)) then
		NA_SpellTimes[spellID] = 0;
		return true;
	end
	return false;
end
--spell
function NA_FireSpell(spellID, UnitId)
	local spellInfo = NA_getSpellInfo(spellID);
	if(W_IsUsableSpell(spellID, UnitId) and UnitIsVisible(UnitId) == 1 and spellInfo ~= nil and spellInfo['keyNo'] ~= nil) then
		W_Log(2,"NA_FireSpell:" .. spellID .."->"..spellInfo['name']..spellInfo['keyNo']);
		NA_ShowVars(spellInfo['keyNo']);
		return true;
	else
		return false;
	end
end

function NA_FireBuffs(buffs, spellID)
	local bufftarget = nil;
	if(UnitExists("target") ~= 1 or UnitName("target") ~= UnitName("player"))then
		bufftarget = "player";
	elseif(UnitExists("target") == 1 and UnitCanAssist("player", "target") and UnitIsPlayer("target"))then
		bufftarget = "target";
	end
	if(bufftarget ~= nil and NA_Cast4NoBuffs(buffs, spellID, bufftarget))then return true; end
	return false;
end

function NA_Cast4NoBuffs(buffs, spellID, UnitId, onlyMine)
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
	if(W_checkBuffs(buffs, UnitId, onlyMine)) then return false; end
	return NA_FireSpell(spellID,UnitId);
end

function NA_Cast4Buffs(buffs, spellID, UnitId, onlyMine)
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
	if(W_checkBuffs(buffs, UnitId, onlyMine)) then return NA_FireSpell(spellID,UnitId); end
	return false;
end

function NA_Cast4DeBuffs(buffs, spellID, UnitId)
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
	for i=1,50 do
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(UnitId, i);
		for k in pairs(buffs) do
			if(name == k or name == NA_getClassInfoName(k))then 
				return NA_FireSpell(spellID, UnitId);
			end
		end
	end
	return false;
end

function NA_targetSpell(buffs, spellID, UnitId, onlyMine)
	if(onlyMine == nil or onlyMine ~= true)then onlyMine = false; end
	if(W_checkBuffs(buffs, UnitId, onlyMine)) then return NA_FireSpell(spellID,"target"); end
	return false;
end

function W_IsUsableSpell(spellID, UnitId)
	local spellInfo = NA_getSpellInfo(spellID);
	if((spellID == 'KillCommand' or spellID == 'KillCommand' or spellID == 'Swipe_Bear' or spellID == 'Swipe_Cat' or spellID == 'Thrash' or spellID == 'SavageRoar') --FIXME for other spell
		and NA_SpellInfoType(spellID) == 1) then
      local isUsable, nomana = IsUsableSpell(spellInfo['ids']);
      if (isUsable ==1 and nomana == nil and W_GetCooldown(1, spellID) <= 1) then
         return true;
      end
	elseif(NA_SpellInfoType(spellID) == 1
      and (SpellHasRange(spellInfo['name']) ~=1 or IsSpellInRange(spellInfo['name'], UnitId) == 1)) then
      local isUsable, nomana = IsUsableSpell(spellInfo['ids']);
      if (isUsable ==1 and nomana == nil and W_GetCooldown(1, spellID) <= 1) then
         return true;
      end
	elseif(NA_SpellInfoType(spellID) == 3
      and (ItemHasRange(spellInfo['name']) ~=1 or IsItemInRange(spellInfo['name'], UnitId) == 1)) then
		local isUsable, nomana = IsUsableItem(spellInfo['ids']);
      if (isUsable ==1 and nomana == nil and W_GetCooldown(2, spellID) <= 1) then
         return true;
      end
	elseif(NA_SpellInfoType(spellID) == 4)then
		return true;
   else
		--W_Log(4,"error spellID="..spellID);
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
		W_Log(3,"W_IsCasting1 ".. startTime);
		W_Log(3,"W_IsCasting1 ".. endTime);
		return 999;
	end

	spell, rank, displayName, icon, startTime, endTime, isTradeSkill, interrupt = UnitChannelInfo(UnitId);
	if(spell ~= nil)then
		if(startTime == 0)then
			return 0;
		elseif(endTime ~= nil)then
			return endTime/1000 - GetTime() + 0.8;
		end
		W_Log(3,"W_IsCasting2 ".. startTime);
		W_Log(3,"W_IsCasting2 ".. endTime);
		return 999;
	end
	return 0;
end

function W_GetCooldown(k, spellID)
	local spellInfo = NA_getSpellInfo(spellID);
	local start, duration, enable
	if(k==1)then -- spell
		start, duration, enable = GetSpellCooldown(spellInfo['ids'])
	elseif(k==2)then --item
		start, duration, enable = GetItemCooldown(spellInfo['ids'])
	end
	local t = start + duration - GetTime();
	if(enable == 1 and (start <= 0 or t <= 0))then
		return 0;
	elseif(enable ~= 1)then
		return 99999;
	else
		return t;
	end
end

--send("<ESC><TAB>");
function NA_ChangeEnemy()
	W_Log(2,"NA_ChangeEnemy!");
end

function W_IsInCombat()
	if(UnitAffectingCombat("player") == 1)then 
		return true;
	else
		return false;
	end
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
	if(spellInfo ~= nil and spellInfo['name'] ~= nil)then
		return spellInfo['name'];
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