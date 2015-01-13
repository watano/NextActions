function getNA8Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'120','1449','1459','1953','2139','5143','11958','12042','12043','12051','30451','44425','55342','80353','108839','108843','114923','116011','152087','153626','157980','45438','11426','2136'};
  elseif(no == 1)then
    return {'10','116','1459','1953','2139','12472','30455','31687','44614','55342','80353','84714','108839','108843','112948','116011','135029','152087','153595','157997','45438','11426','120'};
  elseif(no == 2)then
    return {'133','1459','1953','2120','2139','2948','11129','11366','11958','31661','44457','55342','80353','108839','108843','108853','116011','152087','153561','157981'};
  end
  return {};
end

NA8ProfileNames = {[0]='Arcane',[1]='Frost',[2]='Fire',};

function NA8Dps()
  W_Log(1,"法师 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
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

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Arcane
        local countArcaneCharge = W_BuffCount(NA_Player, -36032); --奥术充能
				local countArcaneMissiles = W_BuffCount(NA_Player, 79683); --奥术飞弹
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player) < 0.2, '45438', NA_Player) --寒冰屏障
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '11426', NA_Player) --寒冰护体
					or NA_Fire(NA_IsMaxDps and countArcaneMissiles>1, '5143', NA_Target) --奥术飞弹
					or NA_Fire(countArcaneMissiles>0, '5143', NA_Target) --奥术飞弹
					or NA_Fire(NA_IsMaxDps and W_PowerLevel(NA_Player)>0.9, '30451', NA_Target) --奥术冲击
					or NA_Fire(NA_IsMaxDps and countArcaneMissiles>0, '5143', NA_Target) --奥术飞弹
					or NA_Fire(NA_IsMaxDps and W_BuffTime(NA_Player, -36032, true)<3, '30451', NA_Target) --奥术冲击
					or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '2136', NA_Target) --火焰冲击
					or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '44425', NA_Target) --奥术弹幕

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '120', NA_Target) --冰锥术

          or NA_fireByOvale()
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
					or NA_Fire(counthlzh>0, '44614', NA_Target) --霜火之箭
					or NA_Fire(true, '84714', NA_Target) --寒冰宝珠
					or NA_Fire(not hbzd, '112948', NA_Target) --寒冰炸弹
					or NA_Fire(true, '108839', NA_Player) --浮冰
					or NA_Fire(true, '116', NA_Target) --寒冰箭

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(not NA_IsMaxDps and NA_IsSolo, '120', NA_Target) --冰锥术
					or NA_Fire(true, '84714', NA_Target) --寒冰宝珠

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Fire
        local hasfb = W_RetainBuff(NA_Player, 108839, true); --浮冰
				local hasrs = W_RetainBuff(NA_Target, -11129, true); --燃烧
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not hasfb, '108839', NA_Player) --浮冰
					or NA_Fire(W_BuffTime(NA_Player,116011)<5, '116011', NA_Player) --能量符文
					or NA_Fire(true, '152087', NA_Target) --幻灵晶体

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
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
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Arcane
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '1459', NA_Player) --奥术光辉
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '2136', NA_Target) --火焰冲击
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '44425', NA_Target) --奥术弹幕

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Frost
      
      if(false
					or NA_Fire(UnitHealth(NA_Pet)<=0, '31687', NA_Player) --召唤水元素
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '116', NA_Target) --寒冰箭
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '1459', NA_Player) --奥术光辉

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Fire
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,4))==0, '1459', NA_Player) --奥术光辉

      )then return true; end
    end
  end
  return false;
end
