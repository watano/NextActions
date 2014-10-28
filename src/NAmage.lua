function getNA8Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '45438','11426','5143','30451','2136','44425','120','1459','6117'
    };
  elseif(no == 1)then
    return {
      '45438','11426','12472','55342','44614','2136','116','120','84714','31687'
    };
  elseif(no == 2)then
    return {
      '84714'
    };
  end
  return {};
end

function getNA8Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Arcane';
  elseif(no == 1)then
    return 'Frost';
  elseif(no == 2)then
    return 'Frost';
  end
  return '';
end

function NA8Dps()
  W_Log(1,"法师 dps");

  
  if(W_IsInCombat())then
    if(W_IsDeadTarget()) then
      return NA_ChagetTarget();       
    elseif(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
           )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Arcane
              local countArcaneCharge = W_BuffCount(NA_Player, -36032); --奥术充能
        local countArcaneMissiles = W_BuffCount(NA_Player, 79683); --奥术飞弹

      
      if(not NA_IsAOE and (false
        or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体
or NA_Fire(NA_IsMaxDps and countArcaneMissiles>1, '5143', NA_Target) --奥术飞弹
or NA_Fire(countArcaneMissiles>0, '5143', NA_Target) --奥术飞弹
or NA_Fire(NA_IsMaxDps and W_PowerLevel(NA_Player)>0.9, '30451', NA_Target) --奥术冲击
or NA_Fire(NA_IsMaxDps and countArcaneMissiles>0, '5143', NA_Target) --奥术飞弹
or NA_Fire(NA_IsMaxDps and W_BuffTime(NA_Player, -36032, true)<3, '30451', NA_Target) --奥术冲击
or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '2136', NA_Target) --火焰冲击
or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '44425', NA_Target) --奥术弹幕

      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '120', NA_Target) --冰锥术

      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Frost
              local counthbz = W_BuffCount(NA_Player, 44544); --寒冰指
        local counthlzh = W_BuffCount(NA_Player, 57761); --冰冷智慧

      
      if(not NA_IsAOE and (false
        or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体
or NA_Fire(NA_IsMaxDps, '12472', NA_Player) --冰冷血脉
or NA_Fire(NA_IsMaxDps, '55342', NA_Player) --镜像
or NA_Fire(counthlzh>0, '44614', NA_Target) --霜火之箭
or NA_Fire(NA_IsSolo, '2136', NA_Target) --火焰冲击
or NA_Fire(true, '116', NA_Target) --寒冰箭

      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '120', NA_Target) --冰锥术
or NA_Fire(true, '84714', NA_Target) --寒冰宝珠

      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Frost
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(true, '84714', NA_Target) --寒冰宝珠

      ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
              )then return true; end
      return false;
    end
  else
    
    if(false
      or NA_Fire(not W_HasBuff(NA_Player, 1459, true), '1459', NA_Player) --奥术光辉
or NA_Fire(not W_HasBuff(NA_Player, 6117, true), '6117', NA_Player) --法师护甲
or NA_Fire(NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack(), '2136', NA_Target) --火焰冲击
or NA_Fire(NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack(), '44425', NA_Target) --奥术弹幕
or NA_Fire(UnitHealth(NA_Pet)<=0, '31687', NA_Player) --召唤水元素
or NA_Fire(NA_ProfileNo == 1 and NA_IsSolo and W_TargetCanAttack(), '116', NA_Target) --寒冰箭
    )then return true; end
  end
  return false;
end
