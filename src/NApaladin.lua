function getNA2Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '24275','62124','53600','35395','20271','31935','119072','26573','53595','114163','633','6940','25780','20217'
    };
  elseif(no == 1)then
    return {
      '24275','114165','85256','879','20271','35395','53385','53595','85673','633','20217'
    };
  elseif(no == 2)then
    return {
      '24275','35395','20271','20473','114158','105809','114163','85673','85222','633','498','6940','19750','82327','20217'
    };
  
  end
  return {};
end

function getNA2Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Protection';
  elseif(no == 1)then
    return 'Retribution';
  elseif(no == 2)then
    return 'Holy';
  
  end
  return '';
end

function NA2Dps()
  W_Log(1,"圣骑士 dps");
  local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
	local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
	local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
	
	
	local hastorch_thrown = W_HasBuff(NA_Target, 114163, true);  --永恒之火
	
	
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
					or NA_Fire(W_HPlevel(NA_Player) < 0.85 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9), '114163', NA_Target) --永恒之火
					or NA_Fire(W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2), '633', NA_Player) --圣疗术
					or NA_Fire(needHP2, '633', NA_Target) --圣疗术
					or NA_Fire(needHP2, '6940', NA_Target) --牺牲之手
					or NA_Fire(W_HPlevel(NA_Player) < 0.7 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.8), '85673', NA_Target) --荣耀圣令
					or NA_Fire(W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2), '633', NA_Target) --圣疗术

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Protection
        local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(notTanking, '62124', NA_Target) --清算
					or NA_Fire(true, '53600', NA_Target) --正义盾击
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '31935', NA_Target) --复仇者之盾
					or NA_Fire(true, '119072', NA_Target) --神圣愤怒
					or NA_Fire(true, '26573', NA_Player) --奉献

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(notTanking, '62124', NA_Target) --清算
					or NA_Fire(true, '119072', NA_Target) --神圣愤怒
					or NA_Fire(true, '26573', NA_Player) --奉献
					or NA_Fire(true, '31935', NA_Target) --复仇者之盾
					or NA_Fire(true, '53600', NA_Target) --正义盾击
					or NA_Fire(true, '53595', NA_Target) --正义之锤
					or NA_Fire(true, '20271', NA_Target) --审判

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Retribution
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '24275', NA_Target) --愤怒之锤
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player) < 0.8, '114165', NA_Target) --神圣棱镜
					or NA_Fire(W_PaladinPower(NA_Player)>2, '85256', NA_Player) --圣殿骑士的裁决
					or NA_Fire(true, '879', NA_Target) --驱邪术
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(true, '114165', NA_Target) --神圣棱镜

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player) < 0.8, '114165', NA_Target) --神圣棱镜
					or NA_Fire(W_PaladinPower(NA_Player)>2, '53385', NA_Target) --神圣风暴
					or NA_Fire(true, '53595', NA_Target) --正义之锤
					or NA_Fire(true, '879', NA_Target) --驱邪术
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '114165', NA_Target) --神圣棱镜

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Holy
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '20473', NA_Target) --神圣震击

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '20473', NA_Target) --神圣震击

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then




      if(false
					or NA_Fire(NA_IsMaxDps, '114158', NA_Target) --圣光之锤
					or NA_Fire(NA_IsMaxDps and W_PowerLevel(NA_Player) > 0.3, '105809', NA_Player) --神圣复仇者
					or NA_Fire(not hastorch_thrown and W_PaladinPower(NA_Player)>2, '114163', NA_Target) --永恒之火
					or NA_Fire(not hastorch_thrown and W_PaladinPower(NA_Player)>2, '85673', NA_Target) --荣耀圣令
					or NA_Fire(W_HPlevel(NA_Target) < 1, '20473', NA_Target) --神圣震击
					or NA_Fire(NA_IsAOE and W_HPlevel(NA_Target) < 1 and W_PaladinPower(NA_Player)>2, '85222', NA_Target) --黎明圣光
					or NA_Fire(NA_IsMaxDps and W_HPlevel(NA_Target) < 0.1, '633', NA_Target) --圣疗术
					or NA_Fire(NA_IsMaxDps and W_HPlevel(NA_Target) < 0.3, '498', NA_Target) --圣佑术
					or NA_Fire(NA_IsMaxDps and W_HPlevel(NA_Target) < 0.6 and W_HPlevel(NA_Player)>0.7, '6940', NA_Target) --牺牲之手
					or NA_Fire(not NA_IsAOE and W_HPlevel(NA_Target) < 0.7, '19750', NA_Target) --圣光闪现
					or NA_Fire(NA_IsAOE and W_HPlevel(NA_Target) < 0.7, '82327', NA_Target) --圣光普照
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(NA_ProfileNo == 0 and not NA_IsSolo and not W_HasBuff(NA_Player, 25780, true), '25780', NA_Player) --正义之怒
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true), '20217', NA_Player) --王者祝福
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '20271', NA_Target) --审判
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true), '20217', NA_Player) --王者祝福
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '20271', NA_Target) --审判
					or NA_Fire(NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true), '20217', NA_Player) --王者祝福
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '20271', NA_Target) --审判
    
    )then return true; end
  end
  return false;
end
