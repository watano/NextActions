function getNA5Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      
    };
  elseif(no == 1)then
    return {
      
    };
  elseif(no == 2)then
    return {
      
    };
  
  end
  return {};
end

function getNA5Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Assassination';
  elseif(no == 1)then
    return 'Combat';
  elseif(no == 2)then
    return 'Subtlety';
  
  end
  return '';
end

function NA5Dps()
  W_Log(1,"牧师 dps");
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
or NA_Fire(needHP2, '15286', NA_Player) --吸血鬼的拥抱
or NA_Fire(needHP, '47585', NA_Player) --消散
or NA_Fire(needHP, '586', NA_Player) --渐隐术
or NA_Fire(needHP2, '19236', NA_Player) --绝望祷言
or NA_Fire(needHP2, '17', NA_Player) --真言术：盾
      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Assassination
local ayst = W_RetainBuff(NA_Target, -589, true);   --暗言术：痛
local xxgzc = W_RetainBuff(NA_Target, -34914, true);   --吸血鬼之触
local countShadowOrbs = UnitPower(NA_Player, SPELL_POWER_SHADOW_ORBS)  --暗影宝珠
        
        if(not NA_IsAOE and (false
or NA_Fire(true, '8092', NA_Target) --心灵震爆
or NA_Fire(not ayst, '589', NA_Target) --暗言术：痛
or NA_Fire(not xxgzc, '34914', NA_Target) --吸血鬼之触
or NA_Fire(true, '32379', NA_Target) --暗言术：灭
or NA_Fire(true, '123040', NA_Target) --摧心魔
or NA_Fire(countShadowOrbs == 3, '2944', NA_Target) --噬灵疫病
or NA_Fire(true, '120644', NA_Target) --光晕
or NA_Fire(true, '15407', NA_Target) --暗影鞭笞

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Combat
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
    
    )then return true; end
  end
  return false;
end
