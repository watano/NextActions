function getNA11Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'5487','106839','770','132469','99','62606','22812','155835','6807','106952','22842','102351','108238','108293','774','124974','5185','80313','33745','102558','106832','33917','102401','2782','61336','1126'};
  elseif(no == 1)then
    return {'768','102401','1822','106839','132469','2908','99','102703','5217','102543','106952','22568','5185','52610','106832','1079','8921','106785','5221','2782','61336','1126','5215'};
  elseif(no == 2)then
    return {'5176','2908','132158','5185','8936','102342','88423','48438','33763','145205','124974','145518','22812','1126','774'};
  elseif(no == 3)then
    return {'24858','78675','124974','2908','33831','78674','112071','102560','48505','164815','152221','8921','5176','2912','2782','22812','1126'};
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
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Bear
        
        if(false
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Cat
        
        if(false
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
        if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术

        )then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        
        if(false
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Bear
        local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
				local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
				local hasFs = W_RetainBuff(NA_Player, 158792, true);   --粉碎buff
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not inBear, '5487', NA_Player) --熊形态
					or NA_Fire(inBear and NA_SpellInterrupt(NA_Target), '106839', NA_Target) --迎头痛击
					or NA_Fire(inBear and NA_SpellInterrupt(NA_Target) and NA_CheckGlyph(933), '770', NA_Target) --精灵之火
					or NA_Fire(inBear and NA_SpellInterrupt(NA_Target) and NA_isUsableTalentSpell(7,3), '132469', NA_Target) --台风
					or NA_Fire(inBear and NA_SpellInterrupt(NA_Target) and NA_isUsableTalentSpell(5,1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 22812, true), '62606', NA_Player) --野蛮防御
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 155835, true), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(2) and not W_RetainBuff(NA_Player, 62606, true) and not W_RetainBuff(NA_Player, 22812, true) and NA_isUsableTalentSpell(7,3), '155835', NA_Player) --鬃毛倒竖
					or NA_Fire(inBear and W_RetainBuff(NA_Player, 135286, true), '6807', NA_Target) --重殴
					or NA_Fire(W_BuffTime(NA_Player,80313)>10, '106952', NA_Player) --狂暴
					or NA_Fire(NA_checkHP(2) and UnitPower(NA_Player,1)>=80, '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(2,3), '102351', NA_Player) --塞纳里奥结界
					or NA_Fire(NA_checkHP(0) and NA_isUsableTalentSpell(2,2), '108238', NA_Player) --新生
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,1), '108293', NA_Player) --野性之心
					or NA_Fire(yxhc and W_BuffTime(NA_Player, 774, true)<=3.6, '774', NA_Player) --回春术
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,3), '124974', NA_Player) --自然的守护
					or NA_Fire(NA_checkHP(2) and NA_isUsableTalentSpell(6,2) and W_RetainBuff(NA_Player, 158501, true), '5185', NA_Player) --治疗之触
					or NA_Fire(inBear and NA_isUsableTalentSpell(7,2) and (not hasFs or W_BuffTime(NA_Player, 80313)<3.6), '80313', NA_Target) --粉碎
					or NA_Fire(inBear and NA_isUsableTalentSpell(7,2) and W_BuffTime(NA_Player, 80313)<2.5 and not W_RetainBuff(NA_Player, 106952, true), '33745', NA_Target) --割伤
					or NA_Fire(inBear and NA_isUsableTalentSpell(4,2), '102558', NA_Player) --化身：乌索克之子
					or NA_Fire(inBear and not W_RetainBuff(NA_Player, 33745, true), '33745', NA_Target) --割伤
					or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
					or NA_Fire(inBear, '33917', NA_Target) --裂伤
					or NA_Fire(inBear and W_BuffTime(NA_Target, -77758, true)<4.8, '106832', NA_Target) --痛击
					or NA_Fire(inBear, '33745', NA_Target) --割伤
					or NA_Fire(inBear and W_TargetCanAttack(), '102401', NA_Target) --野性冲锋

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Cat
        local hasympx = W_RetainBuff(NA_Player, 174544, true);   --野蛮咆哮
				local hasgl = W_RetainBuff(NA_Target, -1079, true);   --割裂
				local haslszdxj = W_RetainBuff(NA_Player, 16974, true);   --掠食者的迅捷
				local hasxxzj = W_RetainBuff(NA_Player, 155672, true);   --血腥爪击
				local hasqxyz = W_RetainBuff(NA_Player, 16864, true);   --清晰预兆
				
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not inCat, '768', NA_Player) --猎豹形态
					or NA_Fire(inCat and NA_isUsableTalentSpell(1,3), '102401', NA_Target) --野性冲锋
					or NA_Fire(inCat and W_RetainBuff(NA_Player, 5215, true) or W_RetainBuff(NA_Player, 58984, true), '1822', NA_Target) --斜掠
					or NA_Fire(inCat and NA_SpellInterrupt(NA_Target), '106839', NA_Target) --迎头痛击
					or NA_Fire(inCat and NA_SpellInterrupt(NA_Target) and NA_isUsableTalentSpell(7,3), '132469', NA_Target) --台风
					or NA_Fire(NA_CheckEnrage(NA_Target), '2908', NA_Target) --安抚
					or NA_Fire(inCat and NA_SpellInterrupt(NA_Target) and NA_isUsableTalentSpell(5,1), '99', NA_Target) --夺魂咆哮
					or NA_Fire(inCat and NA_isUsableTalentSpell(4,3) and NA_GetSpellCharges(102703)==3, '102703', NA_Player) --自然之力
					or NA_Fire(inCat and (not hasqxyz and UnitPower(NA_Player,3)>=60) or (UnitPowerMax(NA_Player,3)-UnitPower(NA_Player,3))>=80, '5217', NA_Player) --猛虎之怒
					or NA_Fire(inCat and NA_isUsableTalentSpell(4,2) and W_GetSpellCooldown(106952)<10 and UnitPower(NA_Player,3)<=90, '102543', NA_Player) --化身：丛林之王
					or NA_Fire(inCat and W_RetainBuff(NA_Player, 5217, true), '106952', NA_Player) --狂暴
					or NA_Fire(W_RetainBuff(NA_Target, -1079, true) and W_BuffTime(NA_Target,-1079)<3 and W_HPlevel(NA_Target)<0.25, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(NA_isUsableTalentSpell(7,2) and W_RetainBuff(NA_Player, 69369, true) and (UnitPower(NA_Player,4)>=4 or W_BuffTime(NA_Player,16974)<1.5), '5185', NA_Player) --治疗之触
					or NA_Fire(not hasympx or W_BuffTime(NA_Player,174544)<3, '52610', NA_Player) --野蛮咆哮
					or NA_Fire(hasqxyz and W_BuffTime(NA_Target,-106832)<4.5, '106832', NA_Target) --痛击
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,4)==5 and hasqxyz and W_BuffTime(NA_Target,-106832)<4.5, '106832', NA_Target) --痛击
					or NA_Fire(W_BuffTime(NA_Target,-106832)<4.5, '106832', NA_Target) --痛击
					or NA_Fire(UnitPower(NA_Player,4)==5 and W_HPlevel(NA_Target)<0.25 and W_RetainBuff(NA_Target, -1079, true), '22568', NA_Target) --凶猛撕咬
					or NA_Fire(UnitPower(NA_Player,4)==5 and W_BuffTime(NA_Target,-1079)<3, '1079', NA_Target) --割裂
					or NA_Fire(UnitPower(NA_Player,4)==5 and W_BuffTime(NA_Target,-1079)<7.2, '1079', NA_Target) --割裂
					or NA_Fire(UnitPower(NA_Player,4)==5 and (UnitPower(NA_Player,3)<=90 or W_RetainBuff(NA_Player, 106952, true) or W_GetSpellCooldown(5217)<3) and W_BuffTime(NA_Player,174544)<12.6, '52610', NA_Player) --野蛮咆哮
					or NA_Fire(UnitPower(NA_Player,4)==5 and (UnitPower(NA_Player,3)<=90 or W_RetainBuff(NA_Player, 106952, true) or W_GetSpellCooldown(5217)<3), '22568', NA_Target) --凶猛撕咬
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and W_BuffTime(NA_Target,-1822)<3 and UnitPower(NA_Player,4)<5, '1822', NA_Target) --斜掠
					or NA_Fire(NA_isUsableTalentSpell(7,2) and W_BuffTime(NA_Target,-1822)<4.5 and UnitPower(NA_Player,4)<5 and (not haslszdxj or hasxxzj), '1822', NA_Target) --斜掠
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,4)==5 and hasqxyz and W_BuffTime(NA_Target,-106832)<4.5, '106832', NA_Target) --痛击
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,4)==5 and hasqxyz and W_BuffTime(NA_Target,-106832)<4.5, '8921', NA_Target) --月火术
					or NA_Fire(UnitPower(NA_Player,4)<5, '1822', NA_Target) --斜掠
					or NA_Fire(UnitPower(NA_Player,4)<5, '106785', NA_Target) --横扫
					or NA_Fire(UnitPower(NA_Player,4)<5, '5221', NA_Target) --撕碎

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_isUsableTalentSpell(7,2), '5176', NA_Target) --愤怒
					or NA_Fire(NA_CheckEnrage(NA_Target), '2908', NA_Target) --安抚

        ))then return true; end
  
        if(NA_IsAOE and (false

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
					or NA_Fire(not inBird, '24858', NA_Player) --枭兽形态
					or NA_Fire(NA_SpellInterrupt(NA_Target), '78675', NA_Target) --日光术
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.9,30)>3 and NA_isUsableTalentSpell(6,3), '124974', NA_Player) --自然的守护
					or NA_Fire(NA_CheckEnrage(NA_Target), '2908', NA_Target) --安抚
					or NA_Fire(NA_GetSpellCharges(102703)==3 and NA_isUsableTalentSpell(4,3), '33831', NA_Player) --自然之力
					or NA_Fire(not rgzx and UnitPower(NA_Player,8)>20, '78674', NA_Target) --星涌术
					or NA_Fire(not ygzx and UnitPower(NA_Player,8)<-40, '78674', NA_Target) --星涌术
					or NA_Fire((NA_GetSpellCharges(78674)==2 and W_GetSpellCooldown(78674)<6) or NA_GetSpellCharges(78674)==3, '78674', NA_Target) --星涌术
					or NA_Fire(UnitPower(NA_Player,8)>40, '112071', NA_Player) --超凡之盟
					or NA_Fire(UnitPower(NA_Player,8)>0 and NA_isUsableTalentSpell(4,2), '102560', NA_Player) --化身：艾露恩之眷
					or NA_Fire(not W_RetainBuff(NA_player, 50288, true), '48505', NA_Player) --星辰坠落
					or NA_Fire(W_BuffTime(NA_Target,-164815)<7 or rzd, '164815', NA_Target) --阳炎术
					or NA_Fire(W_BuffTime(NA_Target,-152221)<7 and NA_isUsableTalentSpell(7,2), '152221', NA_Target) --星辰耀斑
					or NA_Fire((W_BuffTime(NA_Player,164812)<24 or W_BuffTime(NA_Player,164812)<4 or (cfzm and W_BuffTime(NA_Player,112071)<=2 and W_BuffTime(NA_Player,164812)<24) or not yhsdot) or rzd, '8921', NA_Target) --月火术
					or NA_Fire(UnitPower(NA_Player,8)>=25 and UnitPower(NA_Player,8)<=100, '5176', NA_Target) --愤怒
					or NA_Fire(UnitPower(NA_Player,8)<=25 and UnitPower(NA_Player,8)>=-100, '2912', NA_Target) --星火术

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
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
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '132158', NA_Player) --自然迅捷
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj and NA_CheckRoles(NA_Target)~=1, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and zrxj and NA_CheckRoles(NA_Target)==1, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.5, '102342', NA_Target) --铁木树皮
					or NA_Fire(W_HPlevel(NA_Target)~=1 and W_BuffTime(NA_Player, 77495)<=5 or not W_RetainBuff(NA_Player, 77495, true), '5185', NA_Target) --治疗之触
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '88423', NA_Target) --自然之愈
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,30)>=3 and W_RetainBuff(NA_Player, 158478, true), '48438', NA_Target) --野性成长
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,30)>=3 and not yxcz, '48438', NA_Target) --野性成长
					or NA_Fire(NA_CheckRoles(NA_Target)==1 and W_HPlevel(NA_Target)<0.9 and not smzf, '33763', NA_Target) --生命绽放
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and qxyz, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and jnsf, '8936', NA_Target) --愈合
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,10)>=3 and (hcs or yh), '145205', NA_Target) --野性蘑菇
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and smzf, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and NA_isUsableTalentSpell(6,3), '124974', NA_Player) --自然的守护
					or NA_Fire(W_HPlevel(NA_Target)<0.8, '5185', NA_Target) --治疗之触
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.6,60)>=3 and hcs, '145518', NA_Player) --源生

        )then return true; end
      elseif(NA_ProfileNo == 3)then --Balance
        
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '2782', NA_Target) --净化腐蚀

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Bear
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(W_TargetCanAttack(), '102401', NA_Target) --野性冲锋

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Cat
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(not W_HasBuff(NA_Player, 5215, true), '5215', NA_Player) --潜行

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and (not hcs or W_BuffTime(NA_Target,774)<4), '774', NA_Player) --回春术

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(W_TargetCanAttack(), '8921', NA_Target) --月火术

      )then return true; end
    end
  end
  return false;
end
