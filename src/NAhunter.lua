function getNA3Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'982','2643','3044','13813','19574','34026','53351','77767','82692','109259','117050','120360','120679','121818','131894','147362','152245','162536','162537','136','5118'};
  elseif(no == 1)then
    return {'982','2643','3045','13813','19434','53209','53351','56641','109259','117050','120360','120679','121818','131894','147362','162536','162537','163485','109260','136'};
  elseif(no == 2)then
    return {'982','2643','3044','3674','13813','53301','77767','109259','117050','120360','120679','121818','131894','147362','152245','162536','162537','136','19801','5118'};
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

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
        if(false

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0, '19574', NA_Pet) --狂野怒火
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '53351', NA_Target) --夺命射击
					or NA_Fire(W_BuffCount(NA_Player, 19615)>=5, '82692', NA_Target) --集中火力
					or NA_Fire(true, '34026', NA_Target) --杀戮命令
					or NA_Fire(NA_isUsableTalentSpell(4,2), '120679', NA_Target) --凶暴野兽
					or NA_Fire(NA_isUsableTalentSpell(6,3), '120360', NA_Target) --弹幕射击
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_isUsableTalentSpell(6,1), '117050', NA_Target) --飞刃
					or NA_Fire(NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾
					or NA_Fire(NA_IsMaxDps, '109259', NA_Target) --强风射击
					or NA_Fire(true, '3044', NA_Target) --奥术射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0, '19574', NA_Pet) --狂野怒火
					or NA_Fire(W_BuffCount(NA_Player, 19615)>=5, '82692', NA_Target) --集中火力
					or NA_Fire(true, '2643', NA_Target) --多重射击
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '53351', NA_Target) --夺命射击
					or NA_Fire(true, '34026', NA_Target) --杀戮命令
					or NA_Fire(NA_isUsableTalentSpell(4,2), '120679', NA_Target) --凶暴野兽
					or NA_Fire(NA_isUsableTalentSpell(6,3), '120360', NA_Target) --弹幕射击
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_isUsableTalentSpell(6,1), '117050', NA_Target) --飞刃
					or NA_Fire(NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾
					or NA_Fire(NA_IsMaxDps, '109259', NA_Target) --强风射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '53209', NA_Target) --奇美拉射击
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(W_HPlevel(NA_Target) > 0.8 or W_HasBuff(NA_Player, 3045, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(W_HasBuff(NA_Player, 109306, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(NA_isUsableTalentSpell(6,3) and W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true), '120360', NA_Target) --弹幕射击
					or NA_Fire(W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾
					or NA_Fire(true, '56641', NA_Target) --稳固射击
					or NA_Fire(true, '3045', NA_Target) --急速射击

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not W_HasBuff(NA_Player, 13165, true) and not W_HasBuff(NA_Player, 109260, true), '109260', NA_Player) --铁鹰守护
					or NA_Fire(W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_IsMaxDps and NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(NA_IsSolo and NA_CheckBuffStealable(NA_Target), '19801', NA_Target) --宁神射击
					or NA_Fire(W_HasBuff(NA_Player, 168980, true), '53301', NA_Target) --爆炸射击
					or NA_Fire(W_HasBuff(NA_Player, 34720, true), '3044', NA_Target) --奥术射击
					or NA_Fire(true, '3674', NA_Target) --黑箭
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_isUsableTalentSpell(4,2), '120679', NA_Target) --凶暴野兽
					or NA_Fire(not W_HasBuff(NA_Target, -118253, true), '3044', NA_Target) --奥术射击
					or NA_Fire(true, '53301', NA_Target) --爆炸射击
					or NA_Fire(NA_isUsableTalentSpell(6,3), '120360', NA_Target) --弹幕射击
					or NA_Fire(NA_isUsableTalentSpell(6,1), '117050', NA_Target) --飞刃
					or NA_Fire(NA_isUsableTalentSpell(6,2), '109259', NA_Target) --强风射击
					or NA_Fire(NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾
					or NA_Fire(true, '3044', NA_Target) --奥术射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(W_HasBuff(NA_Player, 168980, true), '53301', NA_Target) --爆炸射击
					or NA_Fire(W_HasBuff(NA_Player, 34720, true), '2643', NA_Target) --多重射击
					or NA_Fire(NA_isUsableTalentSpell(6,3), '120360', NA_Target) --弹幕射击
					or NA_Fire(true, '53301', NA_Target) --爆炸射击
					or NA_Fire(true, '3674', NA_Target) --黑箭
					or NA_Fire(true, '13813', NA_Target) --爆炸陷阱
					or NA_Fire(NA_isUsableTalentSpell(5,1), '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_isUsableTalentSpell(4,2), '120679', NA_Target) --凶暴野兽
					or NA_Fire(NA_isUsableTalentSpell(5,3), '121818', NA_Target) --群兽奔腾
					or NA_Fire(true, '2643', NA_Target) --多重射击
					or NA_Fire(NA_isUsableTalentSpell(6,1), '117050', NA_Target) --飞刃
					or NA_Fire(NA_isUsableTalentSpell(6,2), '109259', NA_Target) --强风射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
				
        if(false

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
