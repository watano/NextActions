function getNA9Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'172','603','686','1122','1454','1949','6353','18540','30146','89751','103958','103964','104025','104316','105174','108508','109773','111898','113861','115831','124916','137587','152108','157695','NA_ChagetTarget','755','104773','29858','689','6789','I5512'};
  elseif(no == 1)then
    return {'348','691','1122','17877','17962','18540','29722','104232','108503','108508','108683','109773','111897','113858','116858','137587','152108','NA_ChagetTarget','114635','I5512'};
  elseif(no == 2)then
    return {'172','691','980','1122','1454','18540','30108','48181','74434','103103','108503','108508','109773','111897','113860','137587','152108','NA_ChagetTarget','755','689','6789','I5512'};
  end
  return {};
end

NA9ProfileNames = {[0]='Demonology',[1]='Destruction',[2]='Affliction',};

function NA9Dps()
  W_Log(1,"术士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Demonology
        
        if(false
					or NA_Fire(W_HPlevel(NA_Pet) < 0.35 and not UnitIsDead(NA_Pet) and W_HPlevel(NA_Player)>0.5, '755', NA_Pet) --生命通道
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '104773', NA_Player) --不灭决心
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '29858', NA_Target) --灵魂碎裂
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '689', NA_Target) --吸取生命
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.5, '6789', NA_Target) --死亡缠绕
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.5, '689', NA_Target) --吸取生命
					or NA_Fire(W_PowerLevel(NA_Player) < 0.2 and W_HPlevel(NA_Player)>0.5, '1454', NA_Player) --生命分流
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Destruction
        
        if(false
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '114635', NA_Player) --灰烬转换
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Affliction
        
        if(false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.2, '755', NA_Pet) --生命通道
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_checkHP(0), '6789', NA_Target) --死亡缠绕
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Demonology
        local isDemonform = W_HasBuff(NA_Player, 103958, true);  --恶魔变形
				local moltencore = W_BuffCount(NA_Player, 122355, true); --熔火之心
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Destruction
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Affliction
        local count980 = W_BuffCount(NA_Target, -980, true); --痛楚
				local retain146739 = W_RetainBuff(NA_Target, -146739, true); --腐蚀术
				local retain30108 = W_RetainBuff(NA_Target, -30108, true); --痛苦无常
				local retain48181 = W_RetainBuff(NA_Target, -48181, true); --鬼影缠身
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Demonology
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Destruction
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Affliction
        
				
        if(false

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Demonology
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '109773', NA_Player) --黑暗意图
					or NA_Fire(W_TargetCanAttack(), '686', NA_Target) --暗影箭

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Destruction
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '109773', NA_Player) --黑暗意图
					or NA_Fire(W_TargetCanAttack(), '348', NA_Target) --献祭

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Affliction
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '109773', NA_Player) --黑暗意图
					or NA_Fire(W_TargetCanAttack(), '980', NA_Target) --痛楚

      )then return true; end
    end
  end
  return false;
end
