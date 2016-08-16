function getNA1Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {};
  elseif(no == 1)then
    return {'184364','97462','5308','1719','118000','184367','85288','23881','190411','100','57755'};
  elseif(no == 2)then
    return {};
  end
  return {};
end

NA1ProfileNames = {[0]='防战',[1]='狂暴战',[2]='武器战',};
NA1ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:2313333--属性:急速>暴击>精通/全能',[2]='天赋:--属性:',};

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
        local has215570 =  W_HasBuff(NA_Player, 215570, true); --摧枯拉朽
				local in5308 = W_HPlevel(NA_Target)<0.2; --斩杀阶段
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_IsSolo and NA_checkHP(2), '184364', NA_Player) --狂怒回复
					or NA_Fire(NA_IsSolo and NA_checkHP(0), '97462', NA_Player) --命令怒吼
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(true, '1719', NA_Player) --战吼
					or NA_Fire(true, '118000', NA_Player) --巨龙怒吼
					or NA_Fire(in5308 and W_PowerLevel(NA_Player) > 0.85, '184367', NA_Target) --暴怒
					or NA_Fire(in5308, '85288', NA_Target) --怒击
					or NA_Fire(in5308, '23881', NA_Target) --嗜血
					or NA_Fire(true, '184367', NA_Target) --暴怒
					or NA_Fire(has215570, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '85288', NA_Target) --怒击
					or NA_Fire(NA_IsSolo and not NA_checkHP(1), '23881', NA_Target) --嗜血
					or NA_Fire(true, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

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
