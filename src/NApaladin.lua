function getNA2Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'20271'};
  elseif(no == 1)then
    return {'31884','20271','85256','224668','184575','35395','205191','53385','633','642','184662','19750'};
  elseif(no == 2)then
    return {'20271','35395','26573','853','498','642','633','20473','6940','31842','85222','223306','19750','82326'};
  end
  return {};
end

NA2ProfileNames = {[0]='防骑',[1]='惩戒骑',[2]='奶骑',};
NA2ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:1111112--属性:',[2]='天赋:1113122--属性:智力>精通≥暴击>急速>全能',};

function NA2Dps()
  W_Log(1,"圣骑士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --防骑
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --惩戒骑
      
      if(false
					or NA_Fire(NA_checkHP(0), '633', NA_Player) --圣疗术
					or NA_Fire(NA_checkHP(2), '642', NA_Player) --圣盾术
					or NA_Fire(NA_checkHP(2), '184662', NA_Player) --复仇之盾
					or NA_Fire(NA_checkHP(1), '19750', NA_Player) --圣光闪现

      )then return true; end
    elseif(NA_ProfileNo == 2)then --奶骑
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防骑
        local notTanking = not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(true, '20271', NA_Target) --审判

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_IsMaxDps, '31884', NA_Player) --复仇之怒
					or NA_Fire(W_PaladinPower(NA_Player)>4, '20271', NA_Target) --审判
					or NA_Fire(W_PaladinPower(NA_Player)>3, '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(W_PaladinPower(NA_Player)>2, '224668', NA_Target) --征伐
					or NA_Fire(true, '184575', NA_Target) --公正之剑
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(NA_IsSolo, '205191', NA_Player) --以眼还眼

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(W_PaladinPower(NA_Player)>2, '53385', NA_Target) --神圣风暴
					or NA_Fire(NA_IsMaxDps, '31884', NA_Player) --复仇之怒
					or NA_Fire(W_PaladinPower(NA_Player)>4, '20271', NA_Target) --审判
					or NA_Fire(W_PaladinPower(NA_Player)>3, '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(W_PaladinPower(NA_Player)>2, '224668', NA_Target) --征伐
					or NA_Fire(true, '184575', NA_Target) --公正之剑
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(NA_IsSolo, '205191', NA_Player) --以眼还眼

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --奶骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(true, '26573', NA_Nil) --奉献
					or NA_Fire(true, '853', NA_Target) --制裁之锤

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防骑
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --奶骑
        
				
        if(false
					or NA_Fire(NA_checkHP(1), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(0), '642', NA_Player) --圣盾术
					or NA_Fire(W_HPlevel(NA_Target)<0.3, '633', NA_Target) --圣疗术
					or NA_Fire(true, '20473', NA_Target) --神圣震击
					or NA_Fire(W_HPlevel(NA_Target)<0.4 and W_HPlevel(NA_Player)>0.6, '6940', NA_Target) --牺牲祝福
					or NA_Fire(W_HPlevel(NA_Target) < 0.3, '31842', NA_Target) --复仇之怒
					or NA_Fire(W_HPlevel(NA_Target) < 0.8, '85222', NA_Target) --黎明之光
					or NA_Fire(W_HPlevel(NA_Target) < 1, '223306', NA_Target) --赋予信仰
					or NA_Fire(W_HPlevel(NA_Target) < 1, '19750', NA_Target) --圣光闪现
					or NA_Fire(W_HPlevel(NA_Target)<1, '82326', NA_Target) --圣光术

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --防骑
      
      if(false
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判

      )then return true; end
    elseif(NA_ProfileNo == 1)then --惩戒骑
      
      if(false
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判

      )then return true; end
    elseif(NA_ProfileNo == 2)then --奶骑
      
      if(false

      )then return true; end
    end
  end
  return false;
end
