function getNA1Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'71','78','100','469','871','1160','2565','5308','6343','6544','6552','6572','6673','12292','12975','18499','20243','23922','34428','46924','46968','55694','57755','103840','107570','107574','112048','118000','152277','114029','3411','114030','64382','156321'};
  elseif(no == 1)then
    return {'100','469','1680','1719','2457','5308','6544','6552','6673','12292','18499','23881','46924','46968','57755','85288','100130','103840','107570','107574','118000','152277','176289','114029','3411','114030','64382','34428'};
  elseif(no == 2)then
    return {'100','469','772','1464','1680','1719','2457','6544','6552','6673','12292','12294','12328','46924','46968','57755','103840','107570','107574','118000','152277','163201','167105','176289','114029','3411','114030','64382','34428'};
  end
  return {};
end

NA1ProfileNames = {[0]='防战',[1]='狂暴战',[2]='武器战',};

function NA1Dps()
  W_Log(1,"战士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --防战
      
      if(false
					or NA_Fire(W_RetainBuff(NA_Target, 642, true) or W_RetainBuff(NA_Target, 45438, true), '64382', NA_Target) --碎裂投掷
					or NA_Fire(W_HPlevel(NA_Player)<0.8, '112048', NA_Player) --盾牌屏障
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '12975', NA_Player) --破釜沉舟
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '1160', NA_Player) --挫志怒吼
					or NA_Fire(W_HPlevel(NA_Player)<0.7, '34428', NA_Player) --乘胜追击
					or NA_Fire(W_HPlevel(NA_Player)<0.5, '55694', NA_Player) --狂怒回复
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false
					or NA_Fire(W_RetainBuff(NA_Target, 642, true) or W_RetainBuff(NA_Target, 45438, true), '64382', NA_Target) --碎裂投掷
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false
					or NA_Fire(W_RetainBuff(NA_Target, 642, true) or W_RetainBuff(NA_Target, 45438, true), '64382', NA_Target) --碎裂投掷
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.2, '103840', NA_Player) --胜利在望

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防战
        local dpgd = W_RetainBuff(NA_Player, 132404, true);   --盾牌格挡
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --狂暴战
        local hascs = W_RetainBuff(NA_Player, 29725, true);   --猝死
				local hasjn = W_RetainBuff(NA_Player, 13046, true);   --激怒
				
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        local hassl = W_RetainBuff(NA_Target, -772, true);   --撕裂
				local hasjrdj = W_RetainBuff(NA_Target, -167105, true);   --巨人打击
				local hascs = W_RetainBuff(NA_Player, 29725, true);   --猝死
				
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防战
        
				
        if(false
					or NA_Fire(NA_isUsableTalentSpell(5,2), '114029', NA_Target) --捍卫
					or NA_Fire(not NA_isUsableTalentSpell(5,2), '3411', NA_Target) --援护
					or NA_Fire(NA_isUsableTalentSpell(5,3), '114030', NA_Target) --警戒

        )then return true; end
      elseif(NA_ProfileNo == 1)then --狂暴战
        
				
        if(false
					or NA_Fire(NA_isUsableTalentSpell(5,2), '114029', NA_Target) --捍卫
					or NA_Fire(not NA_isUsableTalentSpell(5,2), '3411', NA_Target) --援护
					or NA_Fire(NA_isUsableTalentSpell(5,3), '114030', NA_Target) --警戒

        )then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        
				
        if(false
					or NA_Fire(NA_isUsableTalentSpell(5,2), '114029', NA_Target) --捍卫
					or NA_Fire(not NA_isUsableTalentSpell(5,2), '3411', NA_Target) --援护
					or NA_Fire(NA_isUsableTalentSpell(5,3), '114030', NA_Target) --警戒

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --防战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '156321', NA_Target) --盾牌冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 6673, true), '6673', NA_Player) --战斗怒吼

      )then return true; end
    end
  end
  return false;
end
