function getNA1Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '355','5308','6572','78','23922','20243','156321','100','57755','107570','114029','34428','112048','12975','871','1160','6673'
    };
  elseif(no == 1)then
    return {
      '5308','23881','107570','100130','85288','34428','100','57755','46924','1680'
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
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.8, '112048', NA_Player) --盾牌屏障
					or NA_Fire(NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.2, '12975', NA_Player) --破釜沉舟
					or NA_Fire(NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.1, '1160', NA_Player) --挫志怒吼

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Protection
        local notTanking = not NA_IsSolo and not W_isTanking();
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
					or NA_Fire(true, '78', NA_Target) --英勇打击
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '156321', NA_Target) --盾牌冲锋
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '156321', NA_Target) --盾牌冲锋
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Fury
        
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(W_PowerLevel(NA_Player) < 0.7, '23881', NA_Target) --嗜血
					or NA_Fire(NA_IsMaxDps, '107570', NA_Target) --风暴之锤
					or NA_Fire(W_HasBuff(NA_Player, 46916, true), '100130', NA_Target) --狂风打击
					or NA_Fire(W_HPlevel(NA_Target)>0.2 and W_HasBuff(NA_Player, 131116, true), '85288', NA_Target) --怒击
					or NA_Fire(W_HasBuff(NA_Player, 32216, true), '34428', NA_Target) --乘胜追击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.4, '85288', NA_Target) --怒击
					or NA_Fire(true, '100130', NA_Target) --狂风打击
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo, '107570', NA_Target) --风暴之锤

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(NA_IsMaxDps, '46924', NA_Target) --剑刃风暴
					or NA_Fire(true, '1680', NA_Target) --旋风斩
					or NA_Fire(W_PowerLevel(NA_Player) < 0.7, '23881', NA_Target) --嗜血
					or NA_Fire(true, '100130', NA_Target) --狂风打击
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Arms
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
					or NA_Fire(not NA_IsSolo, '114029', NA_Target) --捍卫
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and NA_ProfileNo == 0 and W_TargetCanAttack(), '156321', NA_Target) --盾牌冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼
    
    )then return true; end
  end
  return false;
end
