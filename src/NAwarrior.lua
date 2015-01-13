function getNA1Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'71','78','100','469','871','1160','2565','5308','6343','6544','6552','6572','6673','12292','12975','18499','20243','23922','34428','46924','46968','55694','57755','103840','107570','107574','112048','118000','152277','355','156321','114029'};
  elseif(no == 1)then
    return {'100','469','1680','1719','2457','5308','6544','6552','6673','12292','18499','23881','46924','46968','57755','85288','100130','103840','107570','107574','118000','152277','176289','34428'};
  elseif(no == 2)then
    return {'100','469','772','1464','1680','1719','2457','6544','6552','6673','12292','12294','12328','46924','46968','57755','103840','107570','107574','118000','152277','163201','167105','176289','34428'};
  end
  return {};
end

NA1ProfileNames = {[0]='Protection',[1]='Fury',[2]='Arms',};

function NA1Dps()
  W_Log(1,"战士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Protection
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Fury
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Arms
        
        if(false

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Protection
        local dpgd = W_RetainBuff(NA_Player, 132404, true);   --盾牌格挡
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player)<0.8, '112048', NA_Player) --盾牌屏障
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '12975', NA_Player) --破釜沉舟
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '1160', NA_Player) --挫志怒吼
					or NA_Fire(W_HPlevel(NA_Player)<0.7, '34428', NA_Player) --乘胜追击
					or NA_Fire(W_HPlevel(NA_Player)<0.5, '55694', NA_Player) --狂怒回复
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '5308', NA_Target) --斩杀
					or NA_Fire(not dpgd, '2565', NA_Player) --盾牌格挡
					or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
					or NA_Fire(true, '78', NA_Target) --英勇打击
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '156321', NA_Target) --盾牌冲锋
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player)<0.8, '112048', NA_Player) --盾牌屏障
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '12975', NA_Player) --破釜沉舟
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '1160', NA_Player) --挫志怒吼
					or NA_Fire(W_HPlevel(NA_Player)<0.7, '34428', NA_Player) --乘胜追击
					or NA_Fire(W_HPlevel(NA_Player)<0.5, '55694', NA_Player) --狂怒回复
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(NA_SpellInterrupt(NA_Target), '6552', NA_Target) --拳击
					or NA_Fire(W_PowerLevel(NA_Player) < 0.5, '6572', NA_Target) --复仇
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(W_BuffCount(NA_Target, -113746, true)<3, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '156321', NA_Target) --盾牌冲锋
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Fury
        local hascs = W_RetainBuff(NA_Player, 29725, true);   --猝死
				local hasjn = W_RetainBuff(NA_Player, 13046, true);   --激怒
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '5308', NA_Target) --斩杀
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

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(NA_SpellInterrupt(NA_Target), '6552', NA_Target) --拳击
					or NA_Fire(NA_IsMaxDps, '46924', NA_Target) --剑刃风暴
					or NA_Fire(true, '1680', NA_Target) --旋风斩
					or NA_Fire(W_PowerLevel(NA_Player) < 0.7, '23881', NA_Target) --嗜血
					or NA_Fire(true, '100130', NA_Target) --狂风打击
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '107570', NA_Target) --风暴之锤

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Arms
        local hassl = W_RetainBuff(NA_Target, -772, true);   --撕裂
				local hasjrdj = W_RetainBuff(NA_Target, -167105, true);   --巨人打击
				local hascs = W_RetainBuff(NA_Player, 29725, true);   --猝死
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Protection
        
				
        if(false
					or NA_Fire(not NA_IsSolo, '114029', NA_Target) --捍卫

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Fury
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Arms
        
				
        if(false

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Protection
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '156321', NA_Target) --盾牌冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Fury
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Arms
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    end
  end
  return false;
end
