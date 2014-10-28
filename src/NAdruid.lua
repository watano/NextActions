function getNA11Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '770','6795','6807','106832','33745','22568','33917','102401','62606','22812','61336','22842','1126'
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

function getNA11Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Bear';
  elseif(no == 1)then
    return 'Cat';
  elseif(no == 2)then
    return 'Restoration';
  end
  return '';
end

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local inBear = W_HasBuff(NA_Player, 5487, true);
local inCat = W_HasBuff(NA_Player, 768, true);

  
  if(W_IsInCombat())then
    if(W_IsDeadTarget()) then
      return NA_ChagetTarget();       
    elseif(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
          or NA_Fire(needHP, '62606', NA_Player) --野蛮防御
or NA_Fire(needHP, '22812', NA_Player) --树皮术
or NA_Fire(needHP, '61336', NA_Player) --生存本能
or NA_Fire(needHP, '22842', NA_Player) --狂暴回复
 )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Bear
            local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
      local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
      local notTanking = not NA_IsSolo and not W_isTanking();

      
      if(not NA_IsAOE and (false
        or NA_Fire(not NA_IsSolo and not W_HasBuff(NA_Target, -770, true), '770', NA_Target) --精灵之火
or NA_Fire(inBear and notTanking, '6795', NA_Target) --低吼
or NA_Fire(inBear and W_RetainBuff(NA_Target, -135601, true), '6807', NA_Target) --重殴
or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
or NA_Fire(inBear and countLacerate < 3, '33745', NA_Target) --割伤
or NA_Fire(inBear and W_RetainBuff(NA_Target, -33745, true), '33745', NA_Target) --割伤
or NA_Fire(inCat and GetComboPoints("player","target") > 4, '22568', NA_Target) --凶猛撕咬
or NA_Fire(true, '33917', NA_Target) --裂伤
or NA_Fire(true, '102401', NA_Target) --野性冲锋

      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(inBear and notTanking, '6795', NA_Target) --低吼
or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
or NA_Fire(true, '33917', NA_Target) --裂伤
or NA_Fire(true, '102401', NA_Target) --野性冲锋

      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Cat
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
              )then return true; end
      return false;
    end
  else
    
    if(false
      or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '102401', NA_Target) --野性冲锋
    )then return true; end
  end
  return false;
end
