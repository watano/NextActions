function getNA1Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '355','5308','6572','78','23922','20243','100','34428','55694','6673'
    };
  elseif(no == 1)then
    return {
      '5308','23881','100130','85288','34428','100','1680','103840'
    };
  elseif(no == 2)then
    return {
      
    };
  end
  return {};
end

function getNA1Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Protection';
  elseif(no == 1)then
    return 'Fury';
  elseif(no == 2)then
    return 'Arms';
  end
  return '';
end

function NA1Dps()
  W_Log(1,"战士 dps");

  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
    
      if(false
          or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Player)<0.7, '34428', NA_Player) --乘胜追击
or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Player)<0.5, '55694', NA_Player) --狂怒回复
or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望
 )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Protection
      local notTanking = not NA_IsSolo and not W_isTanking();

      
      if(not NA_IsAOE and (false
        or NA_Fire(notTanking, '355', NA_Target) --嘲讽
or NA_Fire(W_HPlevel(NA_Target)<0.2, '5308', NA_Target) --斩杀
or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
or NA_Fire(true, '78', NA_Target) --英勇打击
or NA_Fire(true, '23922', NA_Target) --盾牌猛击
or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
or NA_Fire(true, '100', NA_Target) --冲锋

      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(notTanking, '355', NA_Target) --嘲讽
or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
or NA_Fire(true, '23922', NA_Target) --盾牌猛击
or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
or NA_Fire(true, '100', NA_Target) --冲锋

      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Fury
      
      
      if(not NA_IsAOE and (false
        or NA_Fire(true, '5308', NA_Target) --斩杀
or NA_Fire(true, '23881', NA_Target) --嗜血
or NA_Fire(W_HasBuff(NA_Player, 46916, true), '100130', NA_Target) --狂风打击
or NA_Fire(W_HPlevel(NA_Target)>0.2 and W_HasBuff(NA_Player, 131116, true), '85288', NA_Target) --怒击
or NA_Fire(W_HasBuff(NA_Player, 32216, true), '34428', NA_Target) --乘胜追击
or NA_Fire(true, '100130', NA_Target) --狂风打击
or NA_Fire(W_PowerLevel(NA_Player) > 0.4, '85288', NA_Target) --怒击
or NA_Fire(true, '100', NA_Target) --冲锋

      ))then return true; end

      if(NA_IsAOE and (false
        or NA_Fire(W_HPlevel(NA_Target)<0.2, '5308', NA_Target) --斩杀
or NA_Fire(true, '1680', NA_Target) --旋风斩
or NA_Fire(true, '23881', NA_Target) --嗜血
or NA_Fire(true, '100130', NA_Target) --狂风打击
or NA_Fire(true, '100', NA_Target) --冲锋

      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Arms
      
      
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
      or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼
    )then return true; end
  end
  return false;
end
