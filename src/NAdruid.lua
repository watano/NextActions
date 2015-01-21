function getNA11Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'774','1126','5185','5211','5487','6807','22570','22812','22842','33745','33917','50334','62606','77758','80313','102351','102401','102558','106839','108238','108293','124974','132469','155835','NA_ChagetTarget','2782','61336','99','2908','106952','I5512'};
  elseif(no == 1)then
    return {'768','1079','1126','1822','1850','5185','5211','5215','5217','5221','22568','22570','52610','102280','102401','102543','102703','106785','106830','106839','106951','132469','155625','NA_ChagetTarget','2782','61336','2908','99','I5512'};
  elseif(no == 2)then
    return {'5176','2908','NA_ChagetTarget','132158','5185','8936','102342','124974','88423','18562','145205','774','48438','33763','145518','22812','I5512','1126'};
  elseif(no == 3)then
    return {'1126','2912','5176','8921','24858','33831','48505','78674','93402','102560','112071','152221','NA_ChagetTarget','2782','22812','2908','I5512'};
  end
  return {};
end

NA11ProfileNames = {[0]='Bear',[1]='Cat',[2]='Restoration',[3]='Balance',};

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
  local notTanking = not W_isTanking();
	local inBear = W_FormInfo(1);
	local yxhc = W_HasBuff(NA_Player, 108293, true);
	
	local inCat = W_FormInfo(2);
	
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Bear
      
      if(false
					or NA_Fire(not inBear, '5487', NA_Player) --熊形态
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(inBear and NA_isUsableTalentSpell(5,1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 22812, true), '62606', NA_Player) --野蛮防御
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '2908', NA_Target) --安抚
					or NA_Fire(NA_CheckDebuff(NA_Player)==3 or NA_CheckDebuff(NA_Player)==4, '2782', NA_Player) --净化腐蚀
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 155835, true), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 62606, true) and not W_RetainBuff(NA_Player, 22812, true) and NA_isUsableTalentSpell(7,3), '155835', NA_Player) --鬃毛倒竖
					or NA_Fire(W_BuffTime(NA_Player,80313)>10, '106952', NA_Player) --狂暴
					or NA_Fire(NA_checkHP(2) and UnitPower(NA_Player,1)>=80, '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(2,3), '102351', NA_Player) --塞纳里奥结界
					or NA_Fire(NA_checkHP(0) and NA_isUsableTalentSpell(2,2), '108238', NA_Player) --新生
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,1), '108293', NA_Player) --野性之心
					or NA_Fire(yxhc and W_BuffTime(NA_Player, 774, true)<=3.6, '774', NA_Player) --回春术
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,3), '124974', NA_Player) --自然的守护
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,2) and W_RetainBuff(NA_Player, 158501, true), '5185', NA_Player) --治疗之触
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Cat
      
      if(false
					or NA_Fire(not inCat, '768', NA_Player) --猎豹形态
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(inCat and NA_isUsableTalentSpell(1,3), '102401', NA_Target) --野性冲锋
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '2908', NA_Target) --安抚
					or NA_Fire(NA_CheckDebuff(NA_Player)==3 or NA_CheckDebuff(NA_Player)==4, '2782', NA_Player) --净化腐蚀
					or NA_Fire(inCat and NA_SpellInterrupt(NA_Target) and NA_isUsableTalentSpell(5,1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '2908', NA_Target) --安抚
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
      
    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Bear
        local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
				local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
				local hasFs = W_RetainBuff(NA_Player, 158792, true);   --粉碎buff
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Cat
        local hasympx = W_RetainBuff(NA_Player, 174544, true);   --野蛮咆哮
				local hasgl = W_RetainBuff(NA_Target, -1079, true);   --割裂
				local haslszdxj = W_RetainBuff(NA_Player, 16974, true);   --掠食者的迅捷
				local hasxxzj = W_RetainBuff(NA_Player, 155672, true);   --血腥爪击
				local hasqxyz = W_RetainBuff(NA_Player, 16864, true);   --清晰预兆
				
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_isUsableTalentSpell(7,2), '5176', NA_Target) --愤怒
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '2908', NA_Target) --安抚
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        local yhsdot = W_RetainBuff(NA_Target, -164812, true);   --月火术dot
				local yysdot = W_RetainBuff(NA_Target, -164815, true);   --阳炎术dot
				local yzd = W_RetainBuff(NA_Player, 171743, true);   --月之巅
				local rzd = W_RetainBuff(NA_player, 171744, true);   --日之巅
				local ygzx = W_RetainBuff(NA_Player, 164545, true);   --日光增效
				local rgzx = W_RetainBuff(NA_player, 164547, true);   --月光增效
				local cfzm = W_RetainBuff(NA_player, 112071, true);   --超凡之盟
				local inBird = W_FormInfo(4);
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Bear
        
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '2782', NA_Target) --净化腐蚀

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Cat
        
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '2782', NA_Target) --净化腐蚀

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        local hcs = W_RetainBuff(NA_Target, 774, true);   --回春术
				local yh = W_RetainBuff(NA_Target, 8936, true);   --愈合
				local smzf = W_RetainBuff(NA_Target, 33763, true);   --生命绽放
				local yxcz = W_RetainBuff(NA_Target, 48438, true);   --野性成长
				local zrxj = W_RetainBuff(NA_Player, 132158, true);   --自然迅捷
				local jnsf = W_RetainBuff(NA_Player, 16870, true);   --节能施法
				local qxyz = W_RetainBuff(NA_Player, 113043, true);   --清晰预兆
				
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and W_GetSpellCooldown(132158)==0, '132158', NA_Player) --自然迅捷
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj and NA_CheckRoles(NA_Target)~=1, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj and NA_CheckRoles(NA_Target)==1, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '102342', NA_Target) --铁木树皮
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and NA_isUsableTalentSpell(6,3), '124974', NA_Player) --自然的守护
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '88423', NA_Target) --自然之愈
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and (hcs or yh), '18562', NA_Target) --迅捷治愈
					or NA_Fire(W_GetSpellRemain(145205,30)<=10 and NA_CountLowPlayers(NA_Target,0.9,100)>=3, '145205', NA_Target) --野性蘑菇
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and qxyz, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and jnsf, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and hcs and not W_RetainBuff(NA_Target, 155777, true), '774', NA_Target) --回春术
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and smzf, '5185', NA_Target) --治疗之触
					or NA_Fire(W_RetainBuff(NA_Player, 158478, true) and NA_CountLowPlayers(NA_Target,0.9,900)>=5, '48438', NA_Target) --野性成长
					or NA_Fire(NA_CheckRoles(NA_Target)==1 and W_HPlevel(NA_Target)<1 and not smzf, '33763', NA_Target) --生命绽放
					or NA_Fire(hcs and NA_CountLowPlayers(NA_Target,0.6,3600)>=3, '145518', NA_Target) --源生
					or NA_Fire(W_HPlevel(NA_Target)<0.6, '5185', NA_Target) --治疗之触
					or NA_Fire(not yxcz and NA_CountLowPlayers(NA_Target,0.9,900)>=5, '48438', NA_Target) --野性成长
					or NA_Fire(W_HPlevel(NA_Target)<1 and not hcs, '774', NA_Target) --回春术
					or NA_Fire(W_HPlevel(NA_Target)>=0.9 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

        )then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '2782', NA_Target) --净化腐蚀

        )then return true; end
      end
    elseif(NA_IsSolo)then --solo时切换目标
      return NA_ChagetTarget();      
    end
  else  --不在战斗中  
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Bear
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '1126', NA_Player) --野性印记
					or NA_Fire(W_TargetCanAttack(), '102401', NA_Target) --野性冲锋

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Cat
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '1126', NA_Player) --野性印记
					or NA_Fire(not W_HasBuff(NA_Player, 5215, true), '5215', NA_Player) --潜行

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '1126', NA_Player) --野性印记
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and (not hcs or W_BuffTime(NA_Target,774)<4), '774', NA_Player) --回春术

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '1126', NA_Player) --野性印记
					or NA_Fire(W_TargetCanAttack(), '8921', NA_Target) --月火术

      )then return true; end
    end
  end
  return false;
end
