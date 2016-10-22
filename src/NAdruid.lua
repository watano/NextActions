function getNA11Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'5185','18562','8936','774','99','22812','22842','61336','192081','6795','164812','77758','33917','6807','213764'};
  elseif(no == 1)then
    return {'106951','1079','106832','5217','22568','164812','1822','5221','213764','61336','5185','5215','106839'};
  elseif(no == 2)then
    return {'8921','93402','197626','197628','5176','22812','208253','102342','197721','740','18562','774','48438','8936','5185'};
  elseif(no == 3)then
    return {'108238','22812','8921','93402','194223','202767','194153','78674','190984','191034'};
  end
  return {};
end

NA11ProfileNames = {[0]='熊德',[1]='貓德',[2]='恢复德',[3]='平衡德',};
NA11ProfileDescriptions = {[0]='天赋:3131131--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:精神>急速≥精通>暴击=溅射>全能',[3]='天赋:3123122--属性:急速>精通>暴击=全能',};

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
  local inBear = W_FormInfo(1);
	local notTanking=not NA_IsSolo and not W_isTanking();
	
	local inCat = W_FormInfo(2);
	
	
	local inBird = W_FormInfo(4);
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --熊德
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --貓德
      
      if(false
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 69369, true), '5185', NA_Player) --治疗之触

      )then return true; end
    elseif(NA_ProfileNo == 2)then --恢复德
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 3)then --平衡德
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --熊德
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(0), '5185', NA_Player) --治疗之触
					or NA_Fire(NA_checkHP(0), '18562', NA_Player) --18562
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 8936, true), '8936', NA_Player) --8936
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 774, true), '774', NA_Player) --774
					or NA_Fire(NA_checkHP(1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(1), '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(1), '61336', NA_Player) --生存本能
					or NA_Fire(NA_checkHP(3) and W_BuffCount(NA_Player, 192081, true)<1, '192081', NA_Player) --铁鬃
					or NA_Fire(notTanking, '6795', NA_Target) --低吼
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '164812', NA_Target) --月火术
					or NA_Fire(true, '77758', NA_Player) --77758
					or NA_Fire(W_HasBuff(NA_Player, 93622, true), '33917', NA_Target) --裂伤
					or NA_Fire(UnitPower(NA_Player)>50, '6807', NA_Target) --重殴
					or NA_Fire(true, '33917', NA_Target) --裂伤

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(NA_checkHP(0), '5185', NA_Player) --治疗之触
					or NA_Fire(NA_checkHP(0), '18562', NA_Player) --18562
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 8936, true), '8936', NA_Player) --8936
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 774, true), '774', NA_Player) --774
					or NA_Fire(NA_checkHP(1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(1), '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(3) and W_BuffCount(NA_Player, 192081, true)<1, '192081', NA_Player) --铁鬃
					or NA_Fire(notTanking, '6795', NA_Target) --低吼
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '164812', NA_Target) --月火术
					or NA_Fire(true, '77758', NA_Player) --77758
					or NA_Fire(W_HasBuff(NA_Player, 93622, true), '33917', NA_Target) --裂伤
					or NA_Fire(true, '213764', NA_Nil) --横扫
					or NA_Fire(true, '33917', NA_Target) --裂伤

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --貓德
        local hasgl = W_RetainBuff(NA_Target, -1079, true);   --割裂
				local hasqxyz = W_RetainBuff(NA_Player, 16864, true);   --清晰预兆
				local hasComboPoints = UnitPower(NA_Player,4)>4 or (NA_IsSolo and not NA_IsMaxDps and UnitPower(NA_Player,4)>2)
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_IsMaxDps, '106951', NA_Player) --狂暴
					or NA_Fire(not hasgl and hasComboPoints, '1079', NA_Target) --割裂
					or NA_Fire(hasqxyz, '106832', NA_Target) --痛击
					or NA_Fire(W_PowerLevel(NA_Player)<0.6, '5217', NA_Player) --猛虎之怒
					or NA_Fire(hasComboPoints, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Target, -155625, true), '164812', NA_Target) --月火术
					or NA_Fire(not W_RetainBuff(NA_Target, -5215, true), '1822', NA_Target) --斜掠
					or NA_Fire(true, '5221', NA_Target) --撕碎

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(UnitPower(NA_Player,4)<5, '213764', NA_Target) --横扫
					or NA_Fire(not hasgl and hasComboPoints, '1079', NA_Target) --割裂
					or NA_Fire(hasComboPoints, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Target, -155625, true), '164812', NA_Target) --月火术
					or NA_Fire(not W_RetainBuff(NA_Target, -5215, true), '1822', NA_Target) --斜掠
					or NA_Fire(UnitPower(NA_Player,4)<5 or W_RetainBuff(NA_Player, 58984, true), '5221', NA_Target) --撕碎

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --恢复德
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not W_RetainBuff(NA_Target, -164812, true), '8921', NA_Target) --8921
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(W_FormInfo(4) and not W_HasBuff(NA_Player, 164545, true) and not W_HasBuff(NA_Player, 164547, true), '197626', NA_Target) --197626
					or NA_Fire(W_FormInfo(4) and W_HasBuff(NA_Player, 164547, true), '197628', NA_Target) --197628
					or NA_Fire(true, '5176', NA_Target) --阳炎之怒

        ))then return true; end

        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 3)then --平衡德
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player) < 0.6, '108238', NA_Player) --新生
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '22812', NA_Player) --树皮术
					or NA_Fire(not W_HasBuff(NA_Target, -164812, true), '8921', NA_Target) --8921
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(inBird and NA_IsMaxDps, '194223', NA_Player) --超凡之盟
					or NA_Fire(UnitPower(NA_Player,8)<80, '202767', NA_Target) --新月
					or NA_Fire(inBird and W_HasBuff(NA_Player, 202425, true), '194153', NA_Target) --明月打击
					or NA_Fire(inBird and not W_HasBuff(NA_Player, 164545, true) and not W_HasBuff(NA_Player, 164547, true), '78674', NA_Target) --星涌术
					or NA_Fire(inBird and W_HasBuff(NA_Player, 164545, true), '190984', NA_Target) --阳炎之怒
					or NA_Fire(inBird and W_HasBuff(NA_Player, 164547, true), '194153', NA_Target) --明月打击
					or NA_Fire(true, '190984', NA_Target) --阳炎之怒

        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Player) < 0.6, '108238', NA_Player) --新生
					or NA_Fire(W_HPlevel(NA_Player) < 0.9, '22812', NA_Player) --树皮术
					or NA_Fire(UnitPower(NA_Player,8)<80, '202767', NA_Target) --新月
					or NA_Fire(not W_HasBuff(NA_Target, -164812, true), '8921', NA_Target) --8921
					or NA_Fire(not W_RetainBuff(NA_Target, -164815, true), '93402', NA_Target) --阳炎术
					or NA_Fire(true, '191034', NA_Target) --星辰坠落
					or NA_Fire(inBird, '194153', NA_Target) --明月打击

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
        local hcs = W_RetainBuff(NA_Target, 774, true);   --回春术
				local yh = W_RetainBuff(NA_Target, 8936, true);   --愈合
				local jnsf = W_RetainBuff(NA_Player, 16870, true);   --节能施法
				
				
        if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(W_HPlevel(NA_Target)<0.3, '208253', NA_Target) --加尼尔的精华
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '102342', NA_Target) --铁木树皮
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '197721', NA_Target) --繁盛
					or NA_Fire(NA_IsMaxDps and W_HPlevel(NA_Target)<0.5, '740', NA_Player) --宁静
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '18562', NA_Target) --迅捷治愈
					or NA_Fire(W_HPlevel(NA_Target)<1 and not hcs, '774', NA_Target) --回春术
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '48438', NA_Target) --野性成长
					or NA_Fire(W_HPlevel(NA_Target)<1 and jnsf and not yh, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and not yh, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '5185', NA_Target) --治疗之触

        )then return true; end
      elseif(NA_ProfileNo == 3)then --平衡德
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --熊德
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '164812', NA_Target) --月火术

      )then return true; end
    elseif(NA_ProfileNo == 1)then --貓德
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 5215, true) and W_TargetCanAttack(), '5215', NA_Player) --潜行
					or NA_Fire(true and W_TargetCanAttack(), '106839', NA_Target) --迎头痛击
					or NA_Fire(true and W_TargetCanAttack(), '1822', NA_Target) --斜掠

      )then return true; end
    elseif(NA_ProfileNo == 2)then --恢复德
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 3)then --平衡德
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '93402', NA_Target) --阳炎术
					or NA_Fire(W_TargetCanAttack(), '190984', NA_Target) --阳炎之怒

      )then return true; end
    end
  end
  return false;
end
