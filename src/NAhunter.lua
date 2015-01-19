function getNA3Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'982','2643','3044','13813','19574','34026','53351','77767','82692','109259','117050','120360','120679','121818','131894','147362','152245','162536','162537','34477','19263','136','19801','I5512','5118'};
  elseif(no == 1)then
    return {'982','2643','3045','13813','19434','53209','53351','56641','109259','117050','120360','120679','121818','131894','147362','162536','162537','163485','34477','19263','136','19801','I5512','5118'};
  elseif(no == 2)then
    return {'982','2643','3044','3674','13813','53301','77767','82939','109259','117050','120360','120679','121818','131894','147362','152245','162536','162537','34477','136','19801','I5512','5118'};
  end
  return {};
end

NA3ProfileNames = {[0]='Beastmaster',[1]='Marksman',[2]='Survival',};

function NA3Dps()
  W_Log(1,"猎人 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
        if(false
					or NA_Fire(NA_SpellInterrupt(NA_Target), '147362', NA_Target) --反制射击
					or NA_Fire(NA_checkHP(1), '19263', NA_Player) --威慑
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(NA_IsSolo and NA_CheckBuff(NA_Target)~=0, '19801', NA_Target) --宁神射击
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
        if(false
					or NA_Fire(NA_SpellInterrupt(NA_Target), '147362', NA_Target) --反制射击
					or NA_Fire(NA_checkHP(1), '19263', NA_Player) --威慑
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(NA_IsSolo and NA_CheckBuff(NA_Target)~=0, '19801', NA_Target) --宁神射击
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
        if(false
					or NA_Fire(NA_SpellInterrupt(NA_Target), '147362', NA_Target) --反制射击
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(NA_IsSolo and NA_CheckBuff(NA_Target)~=0, '19801', NA_Target) --宁神射击
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '34477', NA_Target) --误导

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '34477', NA_Target) --误导

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '34477', NA_Target) --误导

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Beastmaster
      
      if(false
					or NA_Fire(W_HPlevel(NA_Pet) < 0.9 and not UnitIsDead(NA_Pet) and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(not NA_IsMaxDps and not W_HasBuff(NA_Player, 5118, true) and not W_HasBuff(NA_Player, 13159, true), '5118', NA_Player) --猎豹守护
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '3044', NA_Target) --奥术射击

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Marksman
      
      if(false
					or NA_Fire(W_HPlevel(NA_Pet) < 0.9 and not UnitIsDead(NA_Pet) and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(not NA_IsMaxDps and not W_HasBuff(NA_Player, 5118, true) and not W_HasBuff(NA_Player, 13159, true), '5118', NA_Player) --猎豹守护

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Survival
      
      if(false
					or NA_Fire(not NA_IsMaxDps and not W_HasBuff(NA_Player, 5118, true) and not W_HasBuff(NA_Player, 13159, true), '5118', NA_Player) --猎豹守护
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '3044', NA_Target) --奥术射击

      )then return true; end
    end
  end
  return false;
end
