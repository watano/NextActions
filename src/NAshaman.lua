function getNA7Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'8050','57994','117012','51505','117014','30823','2894','165462','108281','8004','8042','3599','108285','165339','403','421','79206','108271','108270','2062'};
  elseif(no == 1)then
    return {'324','57994','403','17364','60103','8050','73680','8056','3599','51533','165341','2894'};
  elseif(no == 2)then
    return {'57994','108271','108270','16188','8004','5394','974','52127','73685','61295','1064','77472','165344','79206'};
  end
  return {};
end

NA7ProfileNames = {[0]='Elemental',[1]='Enhancement',[2]='Restoration',''};

function NA7Dps()
  W_Log(1,"萨满 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Elemental
        
        if(false
					or NA_Fire(NA_checkHP(0), '108271', NA_Player) --星界转移
					or NA_Fire(NA_checkHP(1), '108270', NA_Player) --石壁图腾
					or NA_Fire(NA_checkHP(1), '2062', NA_Player) --土元素图腾

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Enhancement
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
        if(false

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Elemental
        local lyzj = W_RetainBuff(NA_Target, -8050, true);   --烈焰震击
				local sdzd = W_BuffCount(NA_Player, 324);   --闪电之盾
				--local qhsf = W_RetainBuff(NA_Player, 222222, true);   --强化释放
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not lyzj or W_BuffTime(NA_Target,-8050)<9, '8050', NA_Target) --烈焰震击
					or NA_Fire(NA_SpellInterrupt(NA_Target), '57994', NA_Target) --风剪
					or NA_Fire(true, '117012', NA_Player) --怒火释放
					or NA_Fire(true, '51505', NA_Target) --熔岩爆裂
					or NA_Fire(true, '117014', NA_Target) --元素冲击
					or NA_Fire(NA_checkHP(1), '30823', NA_Player) --萨满之怒
					or NA_Fire(true, '2894', NA_Player) --火元素图腾
					or NA_Fire(qhsf, '165462', NA_Player) --火焰释放
					or NA_Fire(NA_checkHP(1), '108281', NA_Player) --先祖指引
					or NA_Fire(NA_checkHP(1), '8004', NA_Player) --治疗之涌
					or NA_Fire(sdzd>14 and W_BuffTime(NA_Target,-8050)<6, '8042', NA_Player) --大地震击
					or NA_Fire(W_GetSpellCooldown(2894)<240, '3599', NA_Player) --灼热图腾
					or NA_Fire(W_GetSpellCooldown(2894)<180, '108285', NA_Player) --元素的召唤
					or NA_Fire(true, '165339', NA_Player) --升腾
					or NA_Fire(true, '403', NA_Target) --闪电箭
					or NA_Fire(true, '421', NA_Target) --闪电链
					or NA_Fire(true, '79206', NA_Player) --灵魂行者的恩赐

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Enhancement
        local sdzd2 = W_BuffCount(NA_Player, 324);   --闪电之盾
				local xwwq = W_BuffCount(NA_Player, 51530);   --漩涡武器
				--local yssf = W_RetainBuff(NA_Player, 51530，true);   --元素释放
				--local lyzj = W_RetainBuff(NA_Target, -8050，true);   --烈焰震击dot
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not sdzd, '324', NA_Player) --闪电之盾
					or NA_Fire(NA_SpellInterrupt(NA_Target), '57994', NA_Target) --风剪
					or NA_Fire(xwwq==5, '403', NA_Target) --闪电箭
					or NA_Fire(true, '17364', NA_Target) --风暴打击
					or NA_Fire(true, '60103', NA_Target) --熔岩猛击
					or NA_Fire(yssf and W_BuffTime(NA_Target,-8050)<4, '8050', NA_Target) --烈焰震击
					or NA_Fire(true, '73680', NA_Player) --元素释放
					or NA_Fire(true, '8056', NA_Target) --冰霜震击
					or NA_Fire(W_GetSpellCooldown(2894)<240 or W_GetSpellCooldown(3599)<4, '3599', NA_Player) --灼热图腾
					or NA_Fire(true, '51533', NA_Player) --野性狼魂
					or NA_Fire(true, '165341', NA_Player) --升腾
					or NA_Fire(true, '2894', NA_Player) --火元素图腾

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_SpellInterrupt(NA_Target), '57994', NA_Target) --风剪

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Elemental
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Enhancement
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        local ddzd = W_RetainBuff(NA_Target, -379, true);   --大地之盾
				local szhd = W_RetainBuff(NA_Player, 52127, true);   --水之护盾
				local hasjl = W_RetainBuff(NA_Target, -61295, true);   --激流
				local hascxby = W_RetainBuff(NA_Player, 51564, true);   --潮汐奔涌
				local hassmsf = W_RetainBuff(NA_Player, 73685, true);   --生命释放
				local hasxzxj = W_RetainBuff(NA_Player, 16188, true);   --先祖迅捷
				
				
        if(false
					or NA_Fire(NA_checkHP(0), '108271', NA_Player) --星界转移
					or NA_Fire(NA_checkHP(1), '108270', NA_Player) --石壁图腾
					or NA_Fire(NA_ProfileNo == 2 and not hasxzxj and W_HPlevel(NA_Target)<0.3, '16188', NA_Player) --先祖迅捷
					or NA_Fire(NA_ProfileNo == 2 and hasxzxj and W_HPlevel(NA_Target)<0.3, '8004', NA_Target) --治疗之涌
					or NA_Fire(NA_ProfileNo == 2 and true, '5394', NA_Player) --治疗之泉图腾
					or NA_Fire(NA_ProfileNo == 2 and not ddzd, '974', NA_Target) --大地之盾
					or NA_Fire(NA_ProfileNo == 2 and not szhd, '52127', NA_Player) --水之护盾
					or NA_Fire(NA_ProfileNo == 2 and not hassmsf and W_HPlevel(NA_Target)<0.9, '73685', NA_Player) --生命释放
					or NA_Fire(NA_ProfileNo == 2 and not hasjl and W_HPlevel(NA_Target)<0.9, '61295', NA_Target) --激流
					or NA_Fire(NA_ProfileNo == 2 and hasjl and W_HPlevel(NA_Target)<0.7, '1064', NA_Target) --治疗链
					or NA_Fire(NA_ProfileNo == 2 and hascxby and W_HPlevel(NA_Target)<0.6, '8004', NA_Target) --治疗之涌
					or NA_Fire(NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.9, '77472', NA_Target) --治疗波
					or NA_Fire(NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.6, '165344', NA_Player) --升腾
					or NA_Fire(NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.6, '79206', NA_Player) --灵魂行者的恩赐

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Elemental
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Enhancement
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false

      )then return true; end
    end
  end
  return false;
end
