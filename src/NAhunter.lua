function getNA3Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '136','982','19574','53351','82692','34026','120679','120360','3044','77767','2643','121818','5118'
    };
  elseif(no == 1)then
    return {
      '53209','131894','19434','120360','121818','56641','3045','109260','136'
    };
  elseif(no == 2)then
    return {
      '109260','136','53301','3674','131894','120679','87935','120360','3044','77767'
    };
  
  end
  return {};
end

function getNA3Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Beastmaster';
  elseif(no == 1)then
    return 'Marksman';
  elseif(no == 2)then
    return 'Survival';
  
  end
  return '';
end

function NA3Dps()
  W_Log(1,"猎人 dps");
  
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Beastmaster
        
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0, '19574', NA_Pet) --狂野怒火
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '53351', NA_Target) --夺命射击
					or NA_Fire(W_BuffCount(NA_Player, 19615)>=5, '82692', NA_Target) --集中火力
					or NA_Fire(true, '34026', NA_Target) --杀戮命令
					or NA_Fire(true, '120679', NA_Target) --凶暴野兽
					or NA_Fire(true, '120360', NA_Target) --弹幕射击
					or NA_Fire(true, '3044', NA_Target) --奥术射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(W_HPlevel(NA_Pet)<=0, '982', NA_Pet) --复活宠物
					or NA_Fire(W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0, '19574', NA_Pet) --狂野怒火
					or NA_Fire(true, '82692', NA_Target) --集中火力
					or NA_Fire(true, '2643', NA_Target) --多重射击
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '53351', NA_Target) --夺命射击
					or NA_Fire(true, '34026', NA_Target) --杀戮命令
					or NA_Fire(true, '120679', NA_Target) --凶暴野兽
					or NA_Fire(true, '120360', NA_Target) --弹幕射击
					or NA_Fire(true, '121818', NA_Target) --群兽奔腾
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Marksman
        
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '53209', NA_Target) --奇美拉射击
					or NA_Fire(true, '131894', NA_Target) --夺命黑鸦
					or NA_Fire(W_HPlevel(NA_Target) > 0.8 or W_HasBuff(NA_Player, 3045, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(W_HasBuff(NA_Player, 109306, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true), '120360', NA_Target) --弹幕射击
					or NA_Fire(W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true), '19434', NA_Target) --瞄准射击
					or NA_Fire(true, '121818', NA_Target) --群兽奔腾
					or NA_Fire(true, '56641', NA_Target) --稳固射击
					or NA_Fire(true, '3045', NA_Target) --急速射击

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not W_HasBuff(NA_Player, 13165, true) and not W_HasBuff(NA_Player, 109260, true), '109260', NA_Player) --铁鹰守护
					or NA_Fire(W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(NA_IsMaxDps, '131894', NA_Target) --夺命黑鸦
					or NA_Fire(NA_IsMaxDps, '121818', NA_Target) --群兽奔腾

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Survival
        
        
        if(not NA_IsAOE and (false
					or NA_Fire(not W_HasBuff(NA_Player, 13165, true) and not W_HasBuff(NA_Player, 109260, true), '109260', NA_Player) --铁鹰守护
					or NA_Fire(W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(true, '53301', NA_Target) --爆炸射击
					or NA_Fire(true, '3674', NA_Target) --黑箭
					or NA_Fire(true, '131894', NA_Target) --夺命黑鸦
					or NA_Fire(true, '120679', NA_Target) --凶暴野兽
					or NA_Fire(true, '87935', NA_Target) --毒蛇钉刺
					or NA_Fire(W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true), '120360', NA_Target) --弹幕射击
					or NA_Fire(true, '3044', NA_Target) --奥术射击
					or NA_Fire(true, '77767', NA_Target) --眼镜蛇射击

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then

      if(false
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(W_HPlevel(NA_Pet) < 0.9 and not UnitIsDead(NA_Pet) and not W_HasBuff(NA_Pet, 136, true), '136', NA_Pet) --治疗宠物
					or NA_Fire(not NA_IsMaxDps and not W_HasBuff(NA_Player, 5118, true) and not W_HasBuff(NA_Player, 13159, true), '5118', NA_Player) --猎豹守护
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '3044', NA_Target) --奥术射击
    
    )then return true; end
  end
  return false;
end
