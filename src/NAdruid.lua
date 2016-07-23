function getNA11Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'5487','61336','99','野蛮防御','22812','155835','狂暴','22842','塞纳里奥结界','108238','野性之心','回春术','自然的守护','5185','野性印记','102401'};
  elseif(no == 1)then
    return {'106951','野性之心','52610','1079','106832','5217','22568','164812','1822','5221','213764','61336','狂暴回复','5185','野性印记','5215','106839'};
  elseif(no == 2)then
    return {'8921','93402','197626','197628','5176','5185','8936','774','33763','18562','102342','48438','740','22812'};
  elseif(no == 3)then
    return {'8921','93402','202425','194153','78674','190984','164812','191034','22812'};
  end
  return {};
end

NA11ProfileNames = {[0]='熊德',[1]='貓德',[2]='恢复德',[3]='Balance',};
NA11ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:精神>急速≥精通>暴击=溅射>全能',[3]='天赋:--属性:',};

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
  local notTanking = not W_isTanking();
	local inBear = W_FormInfo(1);
	local yxhc = W_HasBuff(NA_Player, 108293, true);
	
	local inCat = W_FormInfo(2);
	
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --熊德
      
      if(false
					or NA_Fire(not inBear, '5487', NA_Player) --熊形态
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(inBear and NA_isUsableTalentSpell(5,1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 22812, true), '野蛮防御', NA_Player) --野蛮防御
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 155835, true), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 62606, true) and not W_RetainBuff(NA_Player, 22812, true) and NA_isUsableTalentSpell(7,3), '155835', NA_Player) --鬃毛倒竖
					or NA_Fire(W_BuffTime(NA_Player,80313)>10, '狂暴', NA_Player) --狂暴
					or NA_Fire(NA_checkHP(2) and UnitPower(NA_Player,1)>=80, '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(2,3), '塞纳里奥结界', NA_Player) --塞纳里奥结界
					or NA_Fire(NA_checkHP(0) and NA_isUsableTalentSpell(2,2), '108238', NA_Player) --新生
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,1), '野性之心', NA_Player) --野性之心
					or NA_Fire(yxhc and W_BuffTime(NA_Player, 774, true)<=3.6, '回春术', NA_Player) --回春术
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,3), '自然的守护', NA_Player) --自然的守护
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,2) and W_RetainBuff(NA_Player, 158501, true), '5185', NA_Player) --治疗之触

      )then return true; end
    elseif(NA_ProfileNo == 1)then --貓德
      
      if(false
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(NA_checkHP(0), '狂暴回复', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 69369, true), '5185', NA_Player) --治疗之触

      )then return true; end
    elseif(NA_ProfileNo == 2)then --恢复德
      
      if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --熊德
        local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
				local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
				local hasFs = W_RetainBuff(NA_Player, 158792, true);   --粉碎buff
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --貓德
        local hasgl = W_RetainBuff(NA_Target, -1079, true);   --割裂
				local hasqxyz = W_RetainBuff(NA_Player, 16864, true);   --清晰预兆
				local hasComboPoints = UnitPower(NA_Player,4)==5 or (NA_IsSolo and not NA_IsMaxDps and UnitPower(NA_Player,4)>2)
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_IsMaxDps, '106951', NA_Player) --狂暴
					or NA_Fire(NA_IsMaxDps, '野性之心', NA_Player) --野性之心
					or NA_Fire(not W_HasBuff(NA_Player, 52610, true), '52610', NA_Target) --野蛮咆哮
					or NA_Fire(not hasgl and hasComboPoints, '1079', NA_Target) --割裂
					or NA_Fire(hasqxyz, '106832', NA_Target) --痛击
					or NA_Fire(W_PowerLevel(NA_Player)<0.6, '5217', NA_Player) --猛虎之怒
					or NA_Fire(hasComboPoints, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Target, -155625, true), '164812', NA_Target) --月火术
					or NA_Fire(not W_RetainBuff(NA_Target, -5215, true), '1822', NA_Target) --斜掠
					or NA_Fire(UnitPower(NA_Player,4)<5 or W_RetainBuff(NA_Player, 58984, true), '5221', NA_Target) --撕碎

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(UnitPower(NA_Player,4)<5, '213764', NA_Target) --横扫
					or NA_Fire(not hasgl and hasComboPoints, '1079', NA_Target) --割裂
					or NA_Fire(hasComboPoints, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Target, -155625, true), '164812', NA_Target) --月火术
					or NA_Fire(not W_RetainBuff(NA_Target, -5215, true), '1822', NA_Target) --斜掠
					or NA_Fire(UnitPower(NA_Player,4)<5 or W_RetainBuff(NA_Player, 58984, true), '5221', NA_Target) --撕碎

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --恢复德
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '8921', NA_Target) --8921
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(W_FormInfo(4) and not W_HasBuff(NA_Player, 164545, true) and not W_HasBuff(NA_Player, 164547, true), '197626', NA_Target) --197626
					or NA_Fire(W_FormInfo(4) and W_HasBuff(NA_Player, 164547, true), '197628', NA_Target) --197628
					or NA_Fire(true, '5176', NA_Target) --阳炎之怒

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        local inBird = W_FormInfo(4);
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '8921', NA_Target) --8921
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(inBird and UnitPower(NA_Player,8)<40, '202425', NA_Player) --艾露恩的战士
					or NA_Fire(inBird and W_HasBuff(NA_Player, 202425, true), '194153', NA_Target) --明月打击
					or NA_Fire(inBird and not W_HasBuff(NA_Player, 164545, true) and not W_HasBuff(NA_Player, 164547, true), '78674', NA_Target) --星涌术
					or NA_Fire(inBird and W_HasBuff(NA_Player, 164547, true), '194153', NA_Target) --明月打击
					or NA_Fire(true, '190984', NA_Target) --阳炎之怒

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '164812', NA_Target) --月火术
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(inBird and UnitPower(NA_Player,8)<60, '202425', NA_Player) --艾露恩的战士
					or NA_Fire(inBird and UnitPower(NA_Player,8)<60, '190984', NA_Target) --阳炎之怒
					or NA_Fire(true, '191034', NA_Target) --星辰坠落

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --熊德
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --貓德
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --恢复德
        local hcs = W_RetainBuff(NA_Target, 774, true) or (NA_isUsableTalentSpell(7,2) and W_BuffCount(NA_Target, 774, true)<2);   --回春术 萌芽
				local yh = W_RetainBuff(NA_Target, 8936, true);   --愈合
				local smzf = W_RetainBuff(NA_Target, 33763, true);   --生命绽放
				local zrxj = W_RetainBuff(NA_Player, 132158, true);   --自然迅捷
				local jnsf = W_RetainBuff(NA_Player, 16870, true);   --节能施法s
				
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<1 and jnsf and not yh, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<1 and not hcs, '774', NA_Target) --回春术
					or NA_Fire(W_HPlevel(NA_Target)<1 and not smzf, '33763', NA_Target) --生命绽放
					or NA_Fire(W_HPlevel(NA_Target)<1 and not yh, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and (hcs or yh), '18562', NA_Target) --迅捷治愈
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '102342', NA_Target) --铁木树皮
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '48438', NA_Target) --野性成长
					or NA_Fire(NA_IsMaxDps and W_HPlevel(NA_Target)<0.5, '740', NA_Player) --宁静

        )then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --熊德
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '野性印记', NA_Player) --野性印记
					or NA_Fire(W_TargetCanAttack(), '102401', NA_Target) --野性冲锋

      )then return true; end
    elseif(NA_ProfileNo == 1)then --貓德
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '野性印记', NA_Player) --野性印记
					or NA_Fire(not W_HasBuff(NA_Player, 5215, true) and W_TargetCanAttack(), '5215', NA_Player) --潜行
					or NA_Fire(true and W_TargetCanAttack(), '106839', NA_Target) --迎头痛击
					or NA_Fire(true and W_TargetCanAttack(), '1822', NA_Target) --斜掠

      )then return true; end
    elseif(NA_ProfileNo == 2)then --恢复德
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(W_TargetCanAttack(), '190984', NA_Target) --阳炎之怒

      )then return true; end
    end
  end
  return false;
end
