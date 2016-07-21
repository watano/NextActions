function getNA1Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {};
  elseif(no == 1)then
    return {'5308','23881','85288','184367','190411','205545','118000','46968','107570','100130','100','57755'};
  elseif(no == 2)then
    return {};
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

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false

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
				local hascklx =  W_HasBuff(NA_Player, 6673, true); --摧枯拉朽
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(true, '23881', NA_Target) --嗜血
					or NA_Fire(true, '85288', NA_Target) --怒击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.85, '184367', NA_Target) --暴怒
					or NA_Fire(W_PowerLevel(NA_Player) < 0.85 and hascklx, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '205545', NA_Target) --奥丁之怒
					or NA_Fire(NA_isUsableTalentSpell(7,3), '118000', NA_Target) --巨龙怒吼
					or NA_Fire(NA_isUsableTalentSpell(2,1), '46968', NA_Target) --震荡波
					or NA_Fire(NA_isUsableTalentSpell(2,2), '107570', NA_Target) --风暴之锤
					or NA_Fire(true, '100130', NA_Target) --狂暴挥砍
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(true, '23881', NA_Target) --嗜血
					or NA_Fire(true, '85288', NA_Target) --怒击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.85, '184367', NA_Target) --暴怒
					or NA_Fire(W_PowerLevel(NA_Player) < 0.85 and hascklx, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '205545', NA_Target) --奥丁之怒
					or NA_Fire(NA_isUsableTalentSpell(7,3), '118000', NA_Target) --巨龙怒吼
					or NA_Fire(NA_isUsableTalentSpell(2,1), '46968', NA_Target) --震荡波
					or NA_Fire(NA_isUsableTalentSpell(2,2), '107570', NA_Target) --风暴之锤
					or NA_Fire(true, '100130', NA_Target) --狂暴挥砍
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        
				
        
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

        )then return true; end
      elseif(NA_ProfileNo == 1)then --狂暴战
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --防战
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false

      )then return true; end
    end
  end
  return false;
end
