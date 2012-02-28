-- Author      : watano
-- Create Date : 8/16/2009 7:40:50 PM
NA_IsRunning = false;
NA_IsTest = false;
NA_LogLevel = 3; -- 1 - 5
NA_CurrClass = "Mage";
NA_ProfileNo = 1;
NA_Actions = nil;
NA_ClassInfo = nil;
NA_PreviousSpell = nil;
NA_MaxProfile = 3;
NA_IsAOE = false;
NA_IsMaxDps = false;
NA_IsSolo = false;
NA_SpellTimes = {};

function NA_init()
	MainMenuBarLeftEndCap:Hide();
	MainMenuBarRightEndCap:Hide();
	MainMenuBar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0);

	W_SetBinding(0, "NA_Toggle", 3);
	NA_InitProfile(NA_ProfileNo);

	SLASH_NEXTACTIONS1 = "/nextactions"
	SLASH_NEXTACTIONS2 = "/na"
	SlashCmdList["NEXTACTIONS"] = NA_SlashHandler;
end

function NA_InitProfile(no)
	NA_ProfileNo = no;
	if(NA_ProfileNo ~= 0 and NA_ProfileNo ~=1 and NA_ProfileNo ~=2 and NA_ProfileNo ~=3) then NA_ProfileNo = 0; end

	local playerClass, englishClass = UnitClass("player");
	NA_CurrClass = englishClass;
	W_Log(3, "NA_InitProfile:"..NA_ProfileNo);

	if(NA_CurrClass == "MAGE") then 
		NA_Actions = NA_MageActions[NA_ProfileNo];
		NA_ClassInfo = NA_MageInfo;
	elseif(NA_CurrClass == "DRUID") then
		NA_Actions = getNA_DruidActions(NA_ProfileNo);
		NA_ClassInfo = getNA_DruidSpells();
	elseif(NA_CurrClass == "PALADIN") then
		NA_Actions = getNA_PaladinActions(NA_ProfileNo);
		NA_ClassInfo = getNA_PaladinSpells();
	elseif(NA_CurrClass == "DEATHKNIGHT") then
		NA_Actions = getNA_DKActions(NA_ProfileNo);
		NA_ClassInfo = getNA_DKSpells();
	elseif(NA_CurrClass == "HUNTER") then
		NA_Actions = NA_HunterActions[NA_ProfileNo];
		NA_ClassInfo = NA_HunterInfo;
	else
		W_Log(4, "不能支持此职业!");
		return;
	end
	if(NA_Actions == nil) then
		W_Log(4, "不能支持此配置!");
		return;
	end
	NA_ClassInfo['NABuff_feed']={['name']='進食',['buff']=1};
	NA_ClassInfo['NABuff_drink']={['name']='喝飲料',['buff']=1};
	NA_InitClass();
end

function NA_InitClass()
	--51:spell1/buff2/item3/marco4, 52:buff/debuff
	W_Log(2, "init NA_ClassInfo");
	for k in pairs(NA_ClassInfo) do
		if(NA_SpellInfoType(k) == 1) then
			local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange;
			name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(NA_ClassInfo[k]['ids']);
			if(name ~= nil) then
				if(strlen(k) > 5 and (strsub(k,strlen(k)-3,strlen(k))=='Bear' or strsub(k,strlen(k)-2,strlen(k))=='Cat'))then name=name..'('..rank..')'; end
				NA_ClassInfo[k]['name'] = name;
				NA_ClassInfo[k]['rank'] = rank;
				NA_ClassInfo[k]['icon'] = icon;
				NA_ClassInfo[k]['cost'] = cost;
				NA_ClassInfo[k]['isFunnel'] = isFunnel;
				NA_ClassInfo[k]['powerType'] = powerType;
				NA_ClassInfo[k]['castTime'] = castTime;
				NA_ClassInfo[k]['minRange'] = minRange;
				NA_ClassInfo[k]['maxRange'] = maxRange;
				W_Log(1,"NA_ClassInfo["..k.."]: ".. name);
			else
				W_Log(3,"GetSpellInfo error: ".. k);
			end
		end
	end

	W_Log(2, "init NA_Actions");
	local no = 0;
	for k in pairs(NA_Actions) do
		no = no + 1;
		if(NA_Actions[k] == nil or NA_ClassInfo[NA_Actions[k]] == nil)then
			W_Log(4,"NA_ClassInfo error: ".. NA_Actions[k]);
			return;
		end
		NA_ClassInfo[NA_Actions[k]]['keyNo'] = no;

		if(not W_IsInCombat())then W_SetBinding(no, NA_ClassInfo[NA_Actions[k]]['name'], NA_SpellInfoType(NA_Actions[k])); end
	end
	if(not W_IsInCombat())then SaveBindings(2); end

	W_Log(2, "NA_InitClass ok!");
end

function NA_Toggle()
	if(NA_IsRunning) then 
		NA_IsRunning = false;
		NA_ClearAction();
		W_Log(4,"NextActions stop for "..NA_ProfileNo);
	else
		NA_IsRunning = true;
		W_Log(4,"NextActions start "..NA_ProfileNo);
	end
	return NA_IsRunning;
end

function NA_SlashHandler(msg)
	msg = string.lower(msg);
	if (msg == "options" or msg == "opt") then
		W_Log(4, "TODO options dialog!");
   elseif (msg == "version" or msg == "ver") then
		W_Log(3,"NextActions version: ".. 1.1);
	elseif (msg == "toggle") then
		NA_Toggle();
	elseif (msg == "0") then
		NA_InitProfile(0);
	elseif (msg == "1") then
		NA_InitProfile(1);
	elseif (msg == "2") then
		NA_InitProfile(2);
	elseif (msg == "mykey") then
		SetBinding("q","ACTIONBUTTON11");
		SetBinding("e","ACTIONBUTTON12");
		SetBinding("r","ACTIONBUTTON10");
		SetBinding("f","ACTIONBUTTON9");
		SetBinding("BACKSPACE","TOGGLEAUTORUN");
		SetBinding("g","TOGGLEAUTORUN");
		SetBinding("BUTTON4","NONE");
		SetBinding("CTRL-M","NONE");
		SetBinding("CTRL-S","NONE");
		SetBinding("A","STRAFELEFT");
		SetBinding("D","STRAFERIGHT");
		SaveBindings(2);
   else
      W_Log(3,"NextActions commands (/nextactions or /na):");
      W_Log(3,"/na options (/na opt) - Toggle the options window on or off");
      W_Log(3,"/na version (/na ver) - Shows the current version of NextActions.");
   end
end

function NA_OnEvent(event,...)
	if(event == 'UNIT_SPELLCAST_SUCCEEDED')then
		local unit, spellname, spellrank = ...;
		if(unit == 'player')then
			NA_UpdateSpellTime(spellname, spellrank);
		end 
	end

	if(NA_IsRunning ~= nil and NA_IsRunning == true and not NA_DoAction()) then
		NA_ClearAction();
	end
end

function NA_UpdateSpellTime(spellname, spellrank)
	for k in pairs(NA_SpellTimes) do
-- print('NA_UpdateSpellTime===>'..spellname);
		if(NA_ClassInfo[k]['name'] == spellname)then 
			NA_SpellTimes[k] = GetTime();
			return;
		end
	end
end

function NA_DoAction()
	if(UnitIsDead("player") or UnitIsDead("target") or W_IsCasting("player") > 0.9 
		or W_checkBuffs({'NABuff_feed','NABuff_drink'}, "player") 
		or IsMounted() or IsFlying() or UnitInVehicle('player')) then 
		return false; 
	end
	if(UnitName("target") == "艾雷·碎云" and IsMounted()) then 
		Dismount();
		return false; 
	end --下马
	if(NA_MaxDps())then
		UIErrorsFrame:Clear();
		return true;
	end
	return false;
end

function NA_MaxDps()
	if(NA_CurrClass == "MAGE") then 
		return NA_MageDps();
	elseif(NA_CurrClass == "DRUID") then
		return NA_DruidDps();
	elseif(NA_CurrClass == "DEATHKNIGHT") then
		return NA_DKDps();
	elseif(NA_CurrClass == "HUNTER") then
		return NA_HunterDps();
	elseif(NA_CurrClass == "PALADIN") then
		return NA_PaladinDps();
	else
		W_Log(4, "不能支持此职业!");
	end
	NA_PreviousSpell = nil;
	return false;
end

function NA_TestMaxDPS(no)
	local tmpNA_IsTest = NA_IsTest;
	local tmpNA_LogLevel = NA_LogLevel;

	NA_IsTest = true;
	NA_LogLevel = 3;
	NA_InitProfile(no);
	W_Log(1, NA_MaxDps());

	NA_IsTest = tmpNA_IsTest;
	NA_LogLevel = tmpNA_LogLevel;
end


function NA_SpellInfoType(spellID)
	if(spellID == nil)then
		return -1;
	elseif(strlen(spellID) > 7 and strsub(spellID,0,7) == 'NAItem_')then
		return 2;
	elseif(strlen(spellID) > 8 and strsub(spellID,0,8) == 'NAMacro_')then
		return 3;
	elseif(strlen(spellID) > 7 and strsub(spellID,0,7) == 'NABuff_')then
		return 3;
	end
	return 1;
end

function NA_getSpellInfo(spellID)
	return NA_ClassInfo[spellID];
end
