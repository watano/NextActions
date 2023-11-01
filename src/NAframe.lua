-- Author      : watano
-- Create Date : 8/16/2009 7:36:35 PM

function NA_Main_Frame_OnLoad()
  this:RegisterEvent("COMBAT_LOG_EVENT");
  this:RegisterEvent("CURRENT_SPELL_CAST_CHANGED");
  this:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED");
  this:RegisterEvent("PLAYER_TARGET_CHANGED");
  this:RegisterEvent("SPELLS_CHANGED");
  this:RegisterEvent("SPELL_UPDATE_COOLDOWN");
  this:RegisterEvent("SPELL_UPDATE_USABLE");
  this:RegisterEvent("UNIT_AURA");
  this:RegisterEvent("UNIT_AURASTATE");
  this:RegisterEvent("UNIT_SPELLCAST_DELAYED");
  this:RegisterEvent("UNIT_SPELLCAST_FAILED");
  this:RegisterEvent("UNIT_SPELLCAST_FAILED_QUIET");
  this:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
  this:RegisterEvent("UNIT_SPELLCAST_SENT");
  this:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
  this:RegisterEvent("ADDON_LOADED");
  this:RegisterEvent("COMBAT_TEXT_UPDATE");
  this:RegisterEvent("PLAYER_DEAD");
  this:RegisterEvent("PLAYER_ENTERING_WORLD");
  this:RegisterEvent("PLAYER_LOGIN");

  W_Log(3,"NA_OnLoad...");
  NA_init();
  this:SetBackdrop({
    bgFile = "Interface\\Addons\\NextActions\\white16x16",
    edgeFile = "Interface\\Addons\\NextActions\\white16x16",
    tile = true, tileSize = 0, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 }
  });
  this:SetBackdropColor(0,0,0,1);
  this:Show();
  W_Log(3,"NA_OnLoad...end");
end

function NA_Option_Frame_OnLoad()
  local top = -8;
  local left = 5;
  --enable profile
  W_Log(3,"NA_Option_Frame_OnLoad...start");
  local frameProfile = W_createNCBtn("cbtnNA_Profile", NA_ProfileSize, this,"P:", top, left);

  for i=0,NA_ProfileSize-1 do
    local btnProfile = getglobal("cbtnNA_Profile"..i);
    btnProfile:SetScript("OnClick",
      function(self, button, down)
        NA_Option_Frame_Update();
      end
    );
    W_SetTooltip(btnProfile, NA_ProfileNames[i], NA_ProfileDescriptions[i]);
  end
  NA_Option_Frame_Update();
  top = top - frameProfile:GetHeight();

  local frameFlag = W_createNCBtn("cbtnNA_Flag",3,this,"F:", top, left);
  getglobal("cbtnNA_Flag"..0):SetScript("OnClick",
    function(self, button, down)
      NA_IsAOE = this:GetChecked();
      if(NA_IsAOE)then
        W_Log(3, "AOE mode enable!");
      end
    end
  );
  W_SetTooltip(getglobal("cbtnNA_Flag"..0), "AOE", "A怪模式");

  getglobal("cbtnNA_Flag"..1):SetScript("OnClick",
    function(self, button, down)
      NA_IsMaxDps = this:GetChecked();
      if(NA_IsMaxDps)then
        W_Log(3, "MAX DPS enable!");
      end
    end
  );
  W_SetTooltip(getglobal("cbtnNA_Flag"..1), "Max DPS", "最大化输出,使用长CD技能");

  getglobal("cbtnNA_Flag"..2):SetScript("OnClick",
    function(self, button, down)
      NA_IsSolo = this:GetChecked();
      if(NA_IsSolo)then
        W_Log(3, "SOLO mode enable!");
      end
    end
  );
  W_SetTooltip(getglobal("cbtnNA_Flag"..2), "SOLO", "单刷模式,使用短CD技能,自动开怪,不嘲讽");
  --top = top - frameFlag:GetHeight();

  local spellLabel = this:CreateFontString("NA_SpellLabel","OVERLAY","GameFontNormal");
  spellLabel:SetText("");
  spellLabel:SetTextColor(1,1,1,1);
  spellLabel:SetPoint("BOTTOMLEFT",frameFlag, "BOTTOMLEFT", 0, -18);
  spellLabel:SetHeight(20);
  spellLabel:SetWidth(100);

  W_UpdateLabelText('NA_SpellLabel', "....");

  this:SetHeight(top*-1+40);
  this:SetWidth(110);
  this:Show();
 W_Log(3,"NA_Option_Frame_OnLoad...end");
end

function NA_Option_Frame_Update()
  NA_ProfileNo = -1;
  for i=0,NA_ProfileSize-1 do
    local cbtnProfile = getglobal("cbtnNA_Profile"..i);
    if(NA_ProfileNo == -1 and cbtnProfile:GetChecked())then
      NA_ProfileNo = i;
      NA_InitProfile(i);
      NA_IsRunning = false;
      NA_Toggle();
    else
      cbtnProfile:SetChecked(false);
    end
  end
  if(NA_ProfileNo == -1)then
    NA_IsRunning = true;
    NA_Toggle();
  end
end

function NA_frame_set_color_hex(fname, hex)
  if (fname ~= nil and hex ~= nil) then
    local rhex, ghex, bhex = string.sub(hex, 3, 4), string.sub(hex, 5, 6), string.sub(hex, 7, 8);
    local frame = getglobal(fname);
    W_Log(1,"NA_frame_set_color_hex=>"..tonumber(rhex, 16)/255 .."--".. tonumber(ghex, 16)/255 .."--".. tonumber(bhex, 16)/255);
    frame:SetBackdropColor(tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255, 1);
  end
end

NA_PreVar = 0;
function NA_ShowVars(v1)
  W_Log(1, "NA_ShowVars=>" ..v1 .."--"..NAParseValue2Color(v1));
  if(NA_PreVar == v1)then
    return;
  else
    NA_PreVar = v1;
    if(not NA_IsTest) then
      NA_frame_set_color_hex("NA_Main_Frame", NAParseValue2Color(v1));
    --NA_frame_set_color_hex("NA_Option_Frame", NAParseValue2Color(v1));
    end
  end
end

function NAParseColor2Value(color)
  local rhex, ghex, bhex = string.sub(color, 3,3), string.sub(color, 5,5), string.sub(color, 7,7);
  return tonumber(rhex .. ghex .. bhex);
end

function NAParseValue2Color(value)
  local g,s,b=0,0,0;
  return "0x" .. b .. '8' .. s .. '8' .. g .. '8';
end

--========================================================================================
--~================================以下為基礎函數.========================================
--========================================================================================
------------------------------------------------------------------------------------------
--延迟函数
------------------------------------------------------------------------------------------
function BigFoot_DelayCall(BigFootfunc, BigFootdelay, ...) 
     if ( not BigFootFrame.callroutine ) then
         BigFootFrame.callroutine = {} 
     end 
     local BigFootDelayCall = {} 
     BigFootDelayCall["func"] = BigFootfunc 
     BigFootDelayCall["delay"] = BigFootdelay 
     BigFootDelayCall["lastUpdate"] = 0 
     for t = 1, arg.n, 1 do 
         BigFootDelayCall["arg"..t] = arg[t] 
     end 
     table.insert(BigFootFrame.callroutine, BigFootDelayCall) 
end
function BigFoot_OnUpdate(elapsed) 
     if (BigFootFrame.callroutine) then  
         for k, v in BigFootFrame.callroutine do 
              v["lastUpdate"] = v["lastUpdate"] + elapsed 
              if ( v["lastUpdate"] > v["delay"] ) then 
                   if (type(v["func"]) == "string") then 
                        local BigFootfunc = getglobal(v["func"]) 
                        BigFootfunc(v["arg1"], v["arg2"], v["arg3"], v["arg4"], v["arg5"], v["arg6"], v["arg7"], v["arg8"], v["arg9"]) 
                   else 
                        v["func"](v["arg1"], v["arg2"], v["arg3"], v["arg4"], v["arg5"], v["arg6"], v["arg7"], v["arg8"], v["arg9"]) 
                   end 
                   table.remove(BigFootFrame.callroutine, k) 
              end 
         end 
     end
end
-- /script NA_ShowVars(2);


-- /script NA_ShowVars(2);
