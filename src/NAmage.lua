function getNA8Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'45438','11426','12042','114923','5143','44425','30451'};
  elseif(no == 1)then
    return {'45438','11426','12472','30455','55342','84714','112948','108839','116','120','30449','31687'};
  elseif(no == 2)then
    return {'108839','116011','30449'};
  end
  return {};
end

NA8ProfileNames = {[0]='Arcane',[1]='Frost',[2]='Fire',};
NA8ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:',};

function NA8Dps()
  W_Log(1,"法师 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Arcane
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Frost
      
      if(false
					or NA_Fire(NA_hasStealableBuff(NA_Target), '30449', NA_Target) --法术吸取
					or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Fire
      
      if(false
					or NA_Fire(NA_hasStealableBuff(NA_Target), '30449', NA_Target) --法术吸取

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Arcane
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体
					or NA_Fire(W_HPlevel(NA_Target) > 0.9, '12042', NA_Player) --奥术强化
					or NA_Fire(not W_HasBuff(NA_Target, -114923, true), '114923', NA_Target) --虚空风暴
					or NA_Fire(true, '5143', NA_Target) --奥术飞弹
					or NA_Fire(true, '44425', NA_Target) --奥术弹幕
					or NA_Fire(true, '30451', NA_Target) --奥术冲击

        ))then return true; end

        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Frost
        local counthbz = W_BuffCount(NA_Player, 44544); --寒冰指
				local counthlzh = W_BuffCount(NA_Player, 57761); --冰冷智慧
				local hbzd = W_RetainBuff(NA_Target, -112948, true); --寒冰炸弹
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体
					or NA_Fire(NA_IsMaxDps, '12472', NA_Player) --冰冷血脉
					or NA_Fire(counthbz>0, '30455', NA_Target) --冰枪术
					or NA_Fire(NA_IsMaxDps, '55342', NA_Player) --镜像
					or NA_Fire(true, '84714', NA_Target) --寒冰宝珠
					or NA_Fire(not hbzd, '112948', NA_Target) --寒冰炸弹
					or NA_Fire(true, '108839', NA_Player) --浮冰
					or NA_Fire(true, '116', NA_Target) --寒冰箭

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '120', NA_Target) --冰锥术
					or NA_Fire(true, '84714', NA_Target) --寒冰宝珠

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Fire
        local hasfb = W_RetainBuff(NA_Player, 108839, true); --浮冰
				local hasrs = W_RetainBuff(NA_Target, -11129, true); --燃烧
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not hasfb, '108839', NA_Player) --浮冰
					or NA_Fire(W_BuffTime(NA_Player,116011)<5, '116011', NA_Player) --能量符文

        ))then return true; end

        if(NA_IsAOE and (false

        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Arcane
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Frost
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Fire
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Arcane
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '44425', NA_Target) --奥术弹幕

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Frost
      
      if(false
					or NA_Fire(UnitHealth(NA_Pet)<=0, '31687', NA_Player) --召唤水元素
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '116', NA_Target) --寒冰箭

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Fire
      
      if(false

      )then return true; end
    end
  end
  return false;
end
