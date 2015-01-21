function getNA7Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'324','403','421','2825','2894','3599','8042','8050','16166','16188','32182','51490','51505','57994','61882','79206','114074','117014','152255','152256','165339','165462','NA_ChagetTarget','370','108270','108271','2062','8004','I5512'};
  elseif(no == 1)then
    return {'324','403','421','1535','2825','2894','3599','8050','8056','8190','16166','16188','17364','32182','51533','57994','60103','73680','115356','117014','152255','152256','165341','NA_ChagetTarget','370','108270','108271','2062','8004','I5512'};
  elseif(no == 2)then
    return {'370','117014','NA_ChagetTarget','77130','16188','8004','16166','5394','974','52127','73685','61295','165344','1064','77472','108280','152256','157153','108281','79206','108270','108271','2062','I5512','2645'};
  end
  return {};
end

NA7ProfileNames = {[0]='Elemental',[1]='Enhancement',[2]='Restoration',};

function NA7Dps()
  W_Log(1,"萨满 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Elemental
      
      if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '370', NA_Target) --净化术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,2), '108270', NA_Player) --石壁图腾
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,3), '108271', NA_Player) --星界转移
					or NA_Fire(NA_checkHP(1), '2062', NA_Player) --土元素图腾
					or NA_Fire(NA_checkHP(1), '8004', NA_Player) --治疗之涌
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Enhancement
      
      if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '370', NA_Target) --净化术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,2), '108270', NA_Player) --石壁图腾
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,3), '108271', NA_Player) --星界转移
					or NA_Fire(NA_checkHP(1), '2062', NA_Player) --土元素图腾
					or NA_Fire(NA_checkHP(1), '8004', NA_Player) --治疗之涌
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,2), '108270', NA_Player) --石壁图腾
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,3), '108271', NA_Player) --星界转移
					or NA_Fire(NA_checkHP(1), '2062', NA_Player) --土元素图腾
					or NA_Fire(NA_checkHP(1), '8004', NA_Player) --治疗之涌
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
      
    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Elemental
        local lyzj = W_RetainBuff(NA_Target, -8050, true);   --烈焰震击
				local sdzd = W_BuffCount(NA_Player, 324);   --闪电之盾
				local sdzd2 = W_RetainBuff(NA_Player, 324, true);   --元素闪电之盾
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Enhancement
        local sdzd2 = W_BuffCount(NA_Player, 324);   --闪电之盾
				local xwwq = W_BuffCount(NA_Player, 51530);   --漩涡武器
				--local yssf = W_RetainBuff(NA_Player, 51530，true);   --元素释放
				--local lyzj = W_RetainBuff(NA_Target, -8050，true);   --烈焰震击dot
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '370', NA_Target) --净化术
					or NA_Fire(NA_isUsableTalentSpell(6,3), '117014', NA_Target) --元素冲击
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Elemental
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Enhancement
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        local ddzd = W_RetainBuff(NA_Target, 974, true);   --大地之盾
				local szhd = W_RetainBuff(NA_Player, 52127, true);   --水之护盾
				local hasjl = W_RetainBuff(NA_Target, 61295, true);   --激流
				local hascxby = W_RetainBuff(NA_Player, 51564, true);   --潮汐奔涌
				local hassmsf = W_RetainBuff(NA_Player, 73685, true);   --生命释放
				local hasxzxj = W_RetainBuff(NA_Player, 16188, true);   --先祖迅捷
				
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==4, '77130', NA_Target) --净化灵魂
					or NA_Fire(NA_isUsableTalentSpell(4,2) and not hasxzxj and W_HPlevel(NA_Target)<0.6, '16188', NA_Player) --先祖迅捷
					or NA_Fire(hasxzxj and W_HPlevel(NA_Target)<0.6, '8004', NA_Target) --治疗之涌
					or NA_Fire(NA_isUsableTalentSpell(4,1) and W_HPlevel(NA_Target)<0.5, '16166', NA_Player) --元素掌握
					or NA_Fire(true, '5394', NA_Player) --治疗之泉图腾
					or NA_Fire(NA_CheckRoles(NA_Target)==1 and not ddzd, '974', NA_Target) --大地之盾
					or NA_Fire(not szhd, '52127', NA_Player) --水之护盾
					or NA_Fire(not hassmsf and W_HPlevel(NA_Target)<0.8, '73685', NA_Player) --生命释放
					or NA_Fire(not hasjl and W_HPlevel(NA_Target)<1, '61295', NA_Target) --激流
					or NA_Fire(NA_CountLowPlayers(NA_Player,0.7,400)>=4, '165344', NA_Player) --升腾
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.9,900)>=4 and hasjl, '1064', NA_Target) --治疗链
					or NA_Fire(hascxby and W_HPlevel(NA_Target)<0.9 and W_HPlevel(NA_Target)>0.6, '77472', NA_Target) --治疗波
					or NA_Fire(hascxby and W_HPlevel(NA_Target)<0.6, '8004', NA_Target) --治疗之涌
					or NA_Fire(NA_CountLowPlayers(NA_Player,0.8,1600)>=4, '108280', NA_Player) --治疗之潮图腾
					or NA_Fire(NA_isUsableTalentSpell(7,2) and NA_CountLowPlayers(NA_Player,0.8,225)>=4, '152256', NA_Player) --风暴元素图腾
					or NA_Fire(NA_isUsableTalentSpell(7,1), '157153', NA_Player) --暴雨图腾
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_CountLowPlayers(NA_Player,0.8,225)>=2, '108281', NA_Player) --先祖指引
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_HPlevel(NA_Target)>0.6, '77472', NA_Target) --治疗波
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '79206', NA_Player) --灵魂行者的恩赐
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.9,900)>=2, '1064', NA_Target) --治疗链
					or NA_Fire(W_HPlevel(NA_Target)<0.6, '8004', NA_Target) --治疗之涌
					or NA_Fire(W_HPlevel(NA_Target)>=0.9 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

        )then return true; end
      end
    elseif(NA_IsSolo)then --solo时切换目标
      return NA_ChagetTarget();      
    end
  else  --不在战斗中  
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Elemental
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Enhancement
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 2645, true), '2645', NA_Player) --幽魂之狼
					or NA_Fire(not hasjl and W_HPlevel(NA_Target)<1, '61295', NA_Target) --激流

      )then return true; end
    end
  end
  return false;
end
