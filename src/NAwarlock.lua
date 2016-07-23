function getNA9Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'105174','腐蚀术','黑暗灵魂：学识','119898','18540','恶魔变形','686','灵魂之火','1122','地狱烈焰','755','104773','灵魂碎裂','689','6789','1454','黑暗意图'};
  elseif(no == 1)then
    return {'黑暗灵魂：易爆','119898','18540','17877','80240','116858','348','17962','29722','灰烬转换','6789','黑暗再生','黑暗意图'};
  elseif(no == 2)then
    return {'755','689','6789','18540','灵魂燃烧','48181','172','198590','黑暗灵魂：哀难','980','30108','1122','灵魂交换','27243','黑暗意图'};
  end
  return {};
end

NA9ProfileNames = {[0]='恶魔术',[1]='毁灭术',[2]='痛苦术',};
NA9ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:',};

function NA9Dps()
  W_Log(1,"术士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --恶魔术
      
      if(false
					or NA_Fire(W_HPlevel(NA_Pet) < 0.35 and not UnitIsDead(NA_Pet) and W_HPlevel(NA_Player)>0.5, '755', NA_Pet) --生命通道
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '104773', NA_Player) --不灭决心
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '灵魂碎裂', NA_Target) --灵魂碎裂
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '689', NA_Target) --吸取生命
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.5, '6789', NA_Target) --死亡缠绕
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player)<0.5, '689', NA_Target) --吸取生命
					or NA_Fire(W_PowerLevel(NA_Player) < 0.2 and W_HPlevel(NA_Player)>0.5, '1454', NA_Player) --生命分流

      )then return true; end
    elseif(NA_ProfileNo == 1)then --毁灭术
      
      if(false
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '灰烬转换', NA_Player) --灰烬转换
					or NA_Fire(W_HPlevel(NA_Player)<0.9, '6789', NA_Target) --死亡缠绕
					or NA_Fire(W_HPlevel(NA_Player)<0.9, '黑暗再生', NA_Target) --黑暗再生

      )then return true; end
    elseif(NA_ProfileNo == 2)then --痛苦术
      
      if(false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.2, '755', NA_Pet) --生命通道
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_checkHP(0), '6789', NA_Target) --死亡缠绕

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --恶魔术
        local isDemonform = W_HasBuff(NA_Player, 103958, true);  --恶魔变形
				local moltencore = W_BuffCount(NA_Player, 122355, true); --熔火之心
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '105174', NA_Target) --古尔丹之手
					or NA_Fire(not isDemonform and not W_RetainBuff(NA_Target, -146739, true), '腐蚀术', NA_Target) --腐蚀术
					or NA_Fire(true, '黑暗灵魂：学识', NA_Player) --黑暗灵魂：学识
					or NA_Fire(W_GetSpellCooldown(119915)<=0 or W_GetSpellCooldown(119914)<=0, '119898', NA_Target) --恶魔掌控
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(not isDemonform and not W_RetainBuff(NA_Target, -603, true), '恶魔变形', NA_Player) --恶魔变形
					or NA_Fire(not isDemonform and UnitPower(NA_Player, SPELL_POWER_DEMONIC_FURY)>=1000, '恶魔变形', NA_Player) --恶魔变形
					or NA_Fire(isDemonform and not W_RetainBuff(NA_Target, -603, true), '腐蚀术', NA_Target) --腐蚀术
					or NA_Fire(isDemonform, '686', NA_Target) --暗影箭
					or NA_Fire(moltencore>0, '灵魂之火', NA_Target) --灵魂之火
					or NA_Fire(true, '686', NA_Target) --暗影箭

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(true, '105174', NA_Target) --古尔丹之手
					or NA_Fire(not isDemonform and not W_RetainBuff(NA_Target, -146739, true), '腐蚀术', NA_Target) --腐蚀术
					or NA_Fire(NA_IsMaxDps, '黑暗灵魂：学识', NA_Player) --黑暗灵魂：学识
					or NA_Fire(NA_IsMaxDps, '1122', NA_Player) --召唤地狱火
					or NA_Fire(NA_IsMaxDps and W_GetSpellCooldown(119914)<=0, '119898', NA_Target) --恶魔掌控
					or NA_Fire(not isDemonform and UnitPower(NA_Player, SPELL_POWER_DEMONIC_FURY)>=1000, '恶魔变形', NA_Player) --恶魔变形
					or NA_Fire(isDemonform and not W_RetainBuff(NA_Target, -603, true), '腐蚀术', NA_Target) --腐蚀术
					or NA_Fire(moltencore>0, '灵魂之火', NA_Target) --灵魂之火
					or NA_Fire(true, '地狱烈焰', NA_Target) --地狱烈焰

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --毁灭术
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '黑暗灵魂：易爆', NA_Player) --黑暗灵魂：易爆
					or NA_Fire(UnitName(NA_Pet)=='菲兹托克' and W_GetSpellCooldown(119899)<=0, '119898', NA_Target) --恶魔掌控
					or NA_Fire(UnitName(NA_Pet)=='克丽欧拉' and W_GetSpellCooldown(115770)<=0, '119898', NA_Target) --恶魔掌控
					or NA_Fire(UnitName(NA_Pet)=='科尔拉克' and W_GetSpellCooldown(115781)<=0, '119898', NA_Target) --恶魔掌控
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(W_HPlevel(NA_Target)<0.2 and UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>0, '17877', NA_Target) --暗影灼烧
					or NA_Fire(UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>3, '80240', NA_Target) --浩劫
					or NA_Fire(GetUnitSpeed(NA_Player)<1 and (W_HasBuff(NA_Player, 80240, true) or UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>3), '116858', NA_Target) --混乱之箭
					or NA_Fire(NA_IsSolo and GetUnitSpeed(NA_Player)<1 and UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>1, '116858', NA_Target) --混乱之箭
					or NA_Fire(GetUnitSpeed(NA_Player)<1 and not W_RetainBuff(NA_Target, -348, true), '348', NA_Target) --献祭
					or NA_Fire(true, '17962', NA_Target) --燃烧
					or NA_Fire(true, '29722', NA_Target) --烧尽

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(W_HasBuff(NA_Player, 108683, true), '17962', NA_Target) --燃烧
					or NA_Fire(true, '29722', NA_Target) --烧尽

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --痛苦术
        local count980 = W_BuffCount(NA_Target, -980, true); --痛楚
				local retain146739 = W_RetainBuff(NA_Target, -146739, true); --腐蚀术
				local retain30108 = W_RetainBuff(NA_Target, -30108, true); --痛苦无常
				local retain48181 = W_RetainBuff(NA_Target, -48181, true); --鬼影缠身
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.2, '755', NA_Pet) --生命通道
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_checkHP(0), '6789', NA_Target) --死亡缠绕
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(NA_IsMaxDps, '灵魂燃烧', NA_Player) --灵魂燃烧
					or NA_Fire(not retain48181, '48181', NA_Target) --鬼影缠身
					or NA_Fire(NA_IsSolo and not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '198590', NA_Target) --吸取灵魂
					or NA_Fire(W_HasBuff(NA_Player, 74434, true), '689', NA_Target) --吸取生命
					or NA_Fire(W_HasBuff(NA_Player, 17941, true), '48181', NA_Target) --鬼影缠身
					or NA_Fire(not W_HasBuff(NA_Player, 113860, true), '黑暗灵魂：哀难', NA_Player) --黑暗灵魂：哀难
					or NA_Fire(count980<10 or not W_RetainBuff(NA_Target, -980, true), '980', NA_Target) --痛楚
					or NA_Fire(not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(not retain30108, '30108', NA_Target) --痛苦无常
					or NA_Fire(not W_RetainBuff(NA_Target, -48181, true) and UnitPower(NA_Player, SPELL_POWER_SOUL_SHARDS)>0, '48181', NA_Target) --鬼影缠身
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '198590', NA_Target) --吸取灵魂
					or NA_Fire(true, '30108', NA_Target) --痛苦无常

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.2, '755', NA_Pet) --生命通道
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_checkHP(0), '6789', NA_Target) --死亡缠绕
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(NA_IsMaxDps, '1122', NA_Player) --召唤地狱火
					or NA_Fire(NA_IsMaxDps, '灵魂燃烧', NA_Player) --灵魂燃烧
					or NA_Fire(count980<5 and W_HasBuff(NA_Player, 86211, true), '灵魂交换', NA_Target) --灵魂交换
					or NA_Fire(not W_HasBuff(NA_Player, 113860, true), '黑暗灵魂：哀难', NA_Player) --黑暗灵魂：哀难
					or NA_Fire(not W_RetainBuff(NA_Target, -27243, true), '27243', NA_Target) --腐蚀之种
					or NA_Fire(count980<10, '980', NA_Target) --痛楚
					or NA_Fire(not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(not retain30108, '30108', NA_Target) --痛苦无常
					or NA_Fire(not W_RetainBuff(NA_Target, -48181, true) and UnitPower(NA_Player, SPELL_POWER_SOUL_SHARDS)>0, '48181', NA_Target) --鬼影缠身
					or NA_Fire(not W_RetainBuff(NA_Target, -27243, true), '27243', NA_Target) --腐蚀之种
					or NA_Fire(W_HPlevel(NA_Target)<0.2, '198590', NA_Target) --吸取灵魂

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --恶魔术
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --毁灭术
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --痛苦术
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --恶魔术
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '黑暗意图', NA_Player) --黑暗意图
					or NA_Fire(W_TargetCanAttack(), '686', NA_Target) --暗影箭

      )then return true; end
    elseif(NA_ProfileNo == 1)then --毁灭术
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '黑暗意图', NA_Player) --黑暗意图
					or NA_Fire(W_TargetCanAttack(), '348', NA_Target) --献祭

      )then return true; end
    elseif(NA_ProfileNo == 2)then --痛苦术
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '黑暗意图', NA_Player) --黑暗意图
					or NA_Fire(NA_ProfileNo == 2 and NA_IsSolo and W_TargetCanAttack(), '980', NA_Target) --痛楚

      )then return true; end
    end
  end
  return false;
end
