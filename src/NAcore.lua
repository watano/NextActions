-- Author      : watano
-- Create Date : 8/16/2009 7:40:50 PM
NA_IsRunning = false;
NA_IsTest = false;
NA_LogLevel = 3; -- 1 - 5
NA_CurrClass = "DEATHKNIGHT";
NA_ProfileNo = 0;
NA_ProfileSize = 3;
NA_Actions = nil;
NA_ClassInfo = nil;
NA_PreviousSpell = nil;
NA_IsAOE = false;
NA_IsMaxDps = false;
NA_IsSolo = false;
NA_SpellTimes = {};
NA_ProfileNames = {};
NA_ProfileDescriptions = {};


function NA_init()
  if(NA_Config == nil)then
    NA_Config = {NA_ProfileNo=0, NA_MyUI=false};
  end
  W_SetBinding(0, "NA_Toggle", 3);

  NA_InitProfile(NA_Config.NA_ProfileNo);

  SLASH_NEXTACTIONS1 = "/nextactions"
  SLASH_NEXTACTIONS2 = "/na"
  SlashCmdList["NEXTACTIONS"] = NA_SlashHandler;
end

function NA_initClassData(className, profileNo)
  NA_ProfileName = '';
  NA_ProfileSize = 3;
  if(className == "WARRIOR") then
    NA_Actions = getNA1Actions(profileNo);
    NA_ProfileName = NA1ProfileNames[profileNo];
    NA_MaxDps = NA1Dps;
    NA_ProfileNames = NA1ProfileNames;
    NA_ProfileDescriptions = NA1ProfileDescriptions;
  elseif(className == "PALADIN") then
    NA_Actions = getNA2Actions(profileNo);
    NA_ProfileName = NA2ProfileNames[profileNo];
    NA_MaxDps = NA2Dps;
    NA_ProfileNames = NA2ProfileNames;
    NA_ProfileDescriptions = NA2ProfileDescriptions;
  elseif(className == "HUNTER") then
    NA_Actions = getNA3Actions(profileNo);
    NA_ProfileName = NA3ProfileNames[profileNo];
    NA_MaxDps = NA3Dps;
    NA_ProfileNames = NA3ProfileNames;
    NA_ProfileDescriptions = NA3ProfileDescriptions;
  elseif(className == "ROGUE") then
    NA_Actions = getNA4Actions(profileNo);
    NA_ProfileName = NA4ProfileNames[profileNo];
    NA_MaxDps = NA4Dps;
    NA_ProfileNames = NA4ProfileNames;
    NA_ProfileDescriptions = NA4ProfileDescriptions;
  elseif(className == "PRIEST") then
    NA_Actions = getNA5Actions(profileNo);
    NA_ProfileName = NA5ProfileNames[profileNo];
    NA_MaxDps = NA5Dps;
    NA_ProfileNames = NA5ProfileNames;
    NA_ProfileDescriptions = NA5ProfileDescriptions;
  elseif(className == "DEATHKNIGHT") then
    NA_Actions = getNA6Actions(profileNo);
    NA_ProfileName = NA6ProfileNames[profileNo];
    NA_MaxDps = NA6Dps;
    NA_ProfileNames = NA6ProfileNames;
    NA_ProfileDescriptions = NA6ProfileDescriptions;
  elseif(className == "SHAMAN") then
    NA_Actions = getNA7Actions(profileNo);
    NA_ProfileName = NA7ProfileNames[profileNo];
    NA_MaxDps = NA7Dps;
    NA_ProfileNames = NA7ProfileNames;
    NA_ProfileDescriptions = NA7ProfileDescriptions;
  elseif(className == "MAGE") then
    NA_Actions = getNA8Actions(profileNo);
    NA_ProfileName = NA8ProfileNames[profileNo];
    NA_MaxDps = NA8Dps;
    NA_ProfileNames = NA8ProfileNames;
    NA_ProfileDescriptions = NA8ProfileDescriptions;
  elseif(className == "WARLOCK") then
    NA_Actions = getNA9Actions(profileNo);
    NA_ProfileName = NA9ProfileNames[profileNo];
    NA_MaxDps = NA9Dps;
    NA_ProfileNames = NA9ProfileNames;
    NA_ProfileDescriptions = NA9ProfileDescriptions;
  elseif(className == "MONK") then
    NA_Actions = getNA10Actions(profileNo);
    NA_ProfileName = NA10ProfileNames[profileNo];
    NA_MaxDps = NA10Dps;
    NA_ProfileNames = NA10ProfileNames;
    NA_ProfileDescriptions = NA10ProfileDescriptions;
  elseif(className == "DRUID") then
    NA_Actions = getNA11Actions(profileNo);
    NA_ProfileName = NA11ProfileNames[profileNo];
    NA_MaxDps = NA11Dps;
    NA_ProfileNames = NA11ProfileNames;
    NA_ProfileDescriptions = NA11ProfileDescriptions;
    NA_ProfileSize = 4;
  elseif(className == "DEMONHUNTER") then
    NA_Actions = getNA12Actions(profileNo);
    NA_ProfileName = NA12ProfileNames[profileNo];
    NA_MaxDps = NA12Dps;
    NA_ProfileNames = NA12ProfileNames;
    NA_ProfileDescriptions = NA12ProfileDescriptions;
    NA_ProfileSize = 2;
  else
    W_Log(4, "不能支持此职业!");
    return nil;
  end
  if(NA_ProfileName ~= nil)then
    W_Log(3, "NA_ProfileName="..profileNo..'--'..NA_ProfileName);
  end
  return {};
end

function NA_InitProfile(no)
  NA_ProfileNo = no;
  if(NA_ProfileNo < 0 or NA_ProfileNo > NA_ProfileSize) then NA_ProfileNo = 0; end

  W_Log(3, "NA_InitProfile:"..NA_ProfileNo);
  local playerClass, englishClass = UnitClass(NA_Player);
  NA_CurrClass = englishClass;

  if(NA_initClassData(NA_CurrClass, NA_ProfileNo) == nil) then
    return;
  end

  if(NA_Actions == nil) then
    W_Log(3, "不能支持此配置!");
    return;
  end
  BigFoot_DelayCall(NA_InitClass,5);
  NA_Config.NA_ProfileNo = NA_ProfileNo;
end

function NA_InitClass()
  NA_ClassInfo = {}, {};
  --51:spell1/buff2/item3/marco4, 52:buff/debuff
  W_Log(2, "init NA_ClassInfo");
  W_Log(2, "init NA_Actions");

  local no=0;
  for k,v in pairs(NA_Actions) do
    if(v ~= nil)then
      local spellInfoType = NA_SpellInfoType(v);
      no = no + 1;
      if(spellInfoType == 1) then
        local name, rank, icon, castTime, minRange, maxRange;
        name, rank = GetSpellName(tonumber(v), BOOKTYPE_SPELL);
       W_Log(3,"NA_InitClass: "..name);
        if(name == nil) then
          W_Log(3,"GetSpellInfo error: ".. k);
        else
          NA_ClassInfo[v] = {};
          NA_ClassInfo[v]['spellID'] = tonumber(v);
          NA_ClassInfo[v]['name'] = name;
          NA_ClassInfo[v]['rank'] = rank;
          W_Log(1,"NA_ClassInfo["..k.."]: ".. name);
          NA_ClassInfo[v]['keyNo'] = no;
          W_SetBinding(no, NA_ClassInfo[v].name, 1);
        end
      elseif(spellInfoType == 2)then --Item
        local name = strsub(v,1,strlen(v))
        NA_ClassInfo[v] = {};
        NA_ClassInfo[v]['spellID'] = name;
        NA_ClassInfo[v]['keyNo'] = no;
        W_SetBinding(no, name, 2);
      elseif(spellInfoType == 3)then --Macro
        local name = strsub(v,1,strlen(v))
        NA_ClassInfo[v] = {};
        NA_ClassInfo[v]['spellID'] = name;
        NA_ClassInfo[v]['keyNo'] = no;
        W_SetBinding(no, name, 3);
      elseif(spellInfoType == 4)then --Function
      else
        W_Log(4,"unkonw action: ".. v);
      end
    end
  end

  W_Log(3, W_toString(NA_ClassInfo))
  if(not W_IsInCombat())then
    SaveBindings(2);
  end

  W_Log(2, "NA_InitClass ok!");
end

function NA_Toggle()
  if(NA_IsRunning) then
    NA_IsRunning = false;
    NA_ClearAction();
    W_Log(2,"NextActions stop for "..NA_ProfileNo);
  else
    NA_IsRunning = true;
    W_Log(2,"NextActions start "..NA_ProfileNo);
  end
  return NA_IsRunning;
end

function NA_MyUI()
  --隐藏主界面的菜单边框装饰物
  MainMenuBarLeftEndCap:Hide();
  MainMenuBarRightEndCap:Hide();
  MainMenuBar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0);

  --头像上收到的伤害取消
  local p=PlayerHitIndicator;p.Show=p.Hide;p:Hide()
  --local p=PetHitIndicator;p.Show=p.Hide;p:Hide()

  --血条显示K
  --hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", HealthBarText);

  NA_Config.NA_MyUI = true;
end

function NA_SlashHandler(msg)
  msg = string.lower(msg);
  if (msg == "options" or msg == "opt") then
    W_Log(4, "TODO options dialog!");
  elseif (msg == "version" or msg == "ver") then
    W_Log(3,"NextActions version: 6.0.3");
  elseif (msg == "toggle") then
    NA_Toggle();
  elseif (msg == "0") then
    NA_InitProfile(0);
  elseif (msg == "1") then
    NA_InitProfile(1);
  elseif (msg == "2") then
    NA_InitProfile(2);
  elseif (msg == "myui") then
    NA_MyUI();
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
    --W_Log(3,"/na options (/na opt) - Toggle the options window on or off");
    W_Log(3,"/na version (/na ver) - Shows the current version of NextActions.");
  end
end

function NA_OnEvent(event,...)
  W_Log(3,"NA_OnEvent start");
  if(event == 'UNIT_SPELLCAST_SUCCEEDED')then
    local unit, spellname, spellrank = '...';
    if(unit == NA_Player)then
      NA_UpdateSpellTime(spellname, spellrank);
    end
  end
  if(event == "ADDON_LOADED")then
    if(not W_IsInCombat() and NA_Config.NA_MyUI == true)then
      NA_MyUI();
    end
  end

  if(NA_IsRunning ~= nil and NA_IsRunning == true and not NA_DoAction()) then
    NA_ClearAction();
  end
  W_Log(3,"NA_OnEvent end");
end

function NA_UpdateSpellTime(spellname, spellrank)
  for k in pairs(NA_SpellTimes) do
    -- print('NA_UpdateSpellTime===>'..spellname);
    if(NA_ClassInfo[k] ~= nil and NA_ClassInfo[k]['name'] == spellname)then
      NA_SpellTimes[k] = GetTime();
      return;
    end
  end
end

function NA_DoAction()
  if(UnitIsDead(NA_Player) or W_IsCasting(NA_Player) > 0.9
    or W_HasBuff(NA_Player, 1133) or W_HasBuff(NA_Player, 1131) or SpellIsTargeting()
    or (IsMounted() and not W_HasBuff(NA_Player, 165803)) or IsFlying()
    or (UnitInVehicle(NA_Player) and UnitExists(NA_Pet) == 1 and strfind(UnitName(NA_Pet), '训练中') == nil)) then
    W_Log(1,"busy.....");
    return false;
  end

  if(NA_MaxDps())then
    UIErrorsFrame:Clear();
    return true;
  end
  return false;
end

function NA_SpellInfoType(spellID)
  if(spellID == nil)then
    return -1;
  elseif(strlen(spellID) > 1 and strsub(spellID,0,1) == 'I')then --Item
    return 2;
  elseif(strlen(spellID) > 1 and strsub(spellID,0,1) == 'M')then --Macro
    return 3;
  elseif(strlen(spellID) > 3 and strsub(spellID,0,3) == 'NA_')then --Function
    return 4;
  end
  return 1;
end

function NA_getSpellInfo(spellID)
  return NA_ClassInfo[spellID];
end