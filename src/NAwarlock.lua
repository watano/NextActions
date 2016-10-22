function getNA9Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'689','1454','755','18540','603','686','104316','193396','105174','1122','193440'};
  elseif(no == 1)then
    return {'689','1454','755','80240','17962','116858','29722','348','152108','5740'};
  elseif(no == 2)then
    return {'689','18540','980','172','30108','27243','1122'};
  end
  return {};
end

NA9ProfileNames = {[0]='恶魔术',[1]='毁灭术',[2]='痛苦术',};
NA9ProfileDescriptions = {[0]='天赋:--属性:精通>急速>暴击>全能',[1]='天赋:--属性:',[2]='天赋:2212213--属性:',};

function NA9Dps()
  W_Log(1,"术士 dps");
  
	local has117828=W_HasBuff(NA_Player, 117828, true)
	local countSoulShards=UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)
	
	local count980 = W_BuffCount(NA_Target, -980, true); --痛楚
	local retain146739 = true or NA_isUsableTalentSpell(2,2) or W_RetainBuff(NA_Target, -146739, true); --腐蚀术
	local retain30108 = W_RetainBuff(NA_Target, -30108, true); --痛苦无常
	local retain27243 = W_RetainBuff(NA_Target, -27243, true); -- 腐蚀之种
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
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
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --恶魔术
        local has196606 = W_HasBuff(NA_Player, 196606, true);  --暗影箭
				local has193396 = W_HasBuff(NA_Pet, 193396, true);  --恶魔增效
				local retain603 = W_RetainBuff(NA_Target, -603, true)  --末日之手
				local countPower = UnitPower(NA_Player, SPELL_POWER_SOUL_SHARDS) --灵魂碎片
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(1), '689', NA_Target) --吸取生命
					or NA_Fire(W_PowerLevel(NA_Player)<0.5 and W_HPlevel(NA_Player)>0.5, '1454', NA_Player) --生命分流
					or NA_Fire(W_HPlevel(NA_Player)>0.8 and W_HPlevel(NA_Pet)<0.5, '755', NA_Player) --生命通道
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(not retain603, '603', NA_Target) --末日降临
					or NA_Fire(has196606, '686', NA_Target) --暗影箭
					or NA_Fire(true, '104316', NA_Target) --召唤恐惧猎犬
					or NA_Fire(not has193396, '193396', NA_Nil) --恶魔增效
					or NA_Fire(countPower>3, '105174', NA_Target) --古尔丹之手
					or NA_Fire(true, '686', NA_Target) --暗影箭

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_IsMaxDps, '1122', NA_Player) --召唤地狱火
					or NA_Fire(not retain603, '603', NA_Target) --末日降临
					or NA_Fire(has196606, '686', NA_Target) --暗影箭
					or NA_Fire(true, '104316', NA_Target) --召唤恐惧猎犬
					or NA_Fire(NA_IsMaxDps and not has193396, '193396', NA_Nil) --恶魔增效
					or NA_Fire(true, '193440', NA_Target) --恶魔之怒
					or NA_Fire(true, '686', NA_Target) --暗影箭

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --毁灭术
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(1), '689', NA_Target) --吸取生命
					or NA_Fire(W_PowerLevel(NA_Player)<0.5 and W_HPlevel(NA_Player)>0.5, '1454', NA_Player) --生命分流
					or NA_Fire(W_HPlevel(NA_Player)>0.8 and W_HPlevel(NA_Pet)<0.5, '755', NA_Player) --生命通道
					or NA_Fire(countSoulShards>3, '80240', NA_Target) --浩劫
					or NA_Fire(not has117828, '17962', NA_Target) --燃烧
					or NA_Fire(true, '116858', NA_Target) --混乱之箭
					or NA_Fire(has117828, '29722', NA_Target) --烧尽
					or NA_Fire(true, '348', NA_Target) --献祭

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(1), '689', NA_Target) --吸取生命
					or NA_Fire(W_PowerLevel(NA_Player)<0.5 and W_HPlevel(NA_Player)>0.5, '1454', NA_Player) --生命分流
					or NA_Fire(W_HPlevel(NA_Player)>0.8 and W_HPlevel(NA_Pet)<0.5, '755', NA_Player) --生命通道
					or NA_Fire(countSoulShards>3, '80240', NA_Target) --浩劫
					or NA_Fire(not has117828, '17962', NA_Target) --燃烧
					or NA_Fire(true, '152108', NA_player) --大灾变
					or NA_Fire(true, '5740', NA_player) --火焰之雨
					or NA_Fire(countSoulShards<3, '348', NA_Target) --献祭
					or NA_Fire(true, '29722', NA_Target) --烧尽

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --痛苦术
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_IsMaxDps, '18540', NA_Player) --召唤末日守卫
					or NA_Fire(NA_IsSolo and count980<0, '980', NA_Target) --痛楚
					or NA_Fire(NA_IsSolo and not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(not W_RetainBuff(NA_Target, -980, true) or (NA_IsSolo and count980 < 10) or count980 < 20, '980', NA_Target) --痛楚
					or NA_Fire(not retain30108, '30108', NA_Target) --痛苦无常
					or NA_Fire(not retain27243, '27243', NA_Target) --腐蚀之种
					or NA_Fire(not retain146739, '172', NA_Target) --腐蚀术

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(0), '689', NA_Target) --吸取生命
					or NA_Fire(NA_IsMaxDps, '1122', NA_Player) --召唤地狱火
					or NA_Fire(NA_IsSolo and count980<0, '980', NA_Target) --痛楚
					or NA_Fire(NA_IsSolo and not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(not retain27243, '27243', NA_Target) --腐蚀之种
					or NA_Fire(not retain146739, '172', NA_Target) --腐蚀术
					or NA_Fire(NA_checkHP(2), '689', NA_Target) --吸取生命

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
					or NA_Fire(W_TargetCanAttack(), '686', NA_Target) --暗影箭

      )then return true; end
    elseif(NA_ProfileNo == 1)then --毁灭术
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '17962', NA_Target) --燃烧
					or NA_Fire(W_TargetCanAttack(), '348', NA_Target) --献祭

      )then return true; end
    elseif(NA_ProfileNo == 2)then --痛苦术
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '980', NA_Target) --痛楚

      )then return true; end
    end
  end
  return false;
end
