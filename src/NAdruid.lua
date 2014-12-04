function getNA11Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'770','80313','106839','6795','6807','106832','33745','22568','106952','33917','102401','2782','102351','62606','22812','108292','774','61336','22842','1126'};
  elseif(no == 1)then
    return {'5185','1079','22568','1822','106832','5221','770','106839','52610','5217','2782','61336','1126'};
  elseif(no == 2)then
    return {'132158','5185','102342','88423','18562','774','48438','33763','8936','145205','124974','22812','1126'};
  elseif(no == 3)then
    return {'78674','78675','112071','102560','8921','5176','2912','2782','22812','1126'};
  end
  return {};
end

NA11ProfileNames = {[0]='Bear',[1]='Cat',[2]='Restoration',[3]='Balance',''};

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
  local inBear = W_HasBuff(NA_Player, 5487, true);
	local inCat = W_HasBuff(NA_Player, 768, true);
	local yxhc = W_HasBuff(NA_Player, 108293, true);
	
	
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Bear
        
        if(false
					or NA_Fire(NA_checkHP(2), '102351', NA_Player) --塞纳里奥结界
					or NA_Fire(NA_checkHP(2), '62606', NA_Player) --野蛮防御
					or NA_Fire(NA_checkHP(1), '22812', NA_Player) --树皮术
					or NA_Fire(NA_checkHP(1), '108292', NA_Player) --野性之心
					or NA_Fire(NA_checkHP(1) and yxhc, '774', NA_Player) --回春术
					or NA_Fire(NA_checkHP(0), '61336', NA_Player) --生存本能
					or NA_Fire(NA_checkHP(0), '22842', NA_Player) --狂暴回复

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
					or NA_Fire(not NA_IsSolo and not W_HasBuff(NA_Target, -770, true), '770', NA_Target) --精灵之火
					or NA_Fire(inbear and countLacerate>2 and (not hasFs or W_BuffTime(NA_Player, 80313, true)<4), '80313', NA_Target) --80313
					or NA_Fire(inbear and NA_SpellInterrupt(NA_Target), '106839', NA_Target) --迎头痛击
					or NA_Fire(inBear and notTanking, '6795', NA_Target) --低吼
					or NA_Fire(inBear and W_RetainBuff(NA_Player, 135286, true), '6807', NA_Target) --重殴
					or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
					or NA_Fire(inBear and countLacerate < 3, '33745', NA_Target) --割伤
					or NA_Fire(inBear and W_RetainBuff(NA_Target, -33745, true), '33745', NA_Target) --割伤
					or NA_Fire(inCat and UnitPower(NA_Player,4) > 4, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(true, '106952', NA_Player) --狂暴
					or NA_Fire(true, '33917', NA_Target) --裂伤
					or NA_Fire(true, '102401', NA_Target) --野性冲锋

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(inBear and notTanking, '6795', NA_Target) --低吼
					or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
					or NA_Fire(true, '33917', NA_Target) --裂伤
					or NA_Fire(true, '102401', NA_Target) --野性冲锋

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Cat
        local hasympx = W_RetainBuff(NA_Player, 52610, true);   --野蛮咆哮
				local hasgl = W_RetainBuff(NA_Target, -1079, true);   --割裂
				local haslszdxj = W_RetainBuff(NA_Player, 16974, true);   --掠食者的迅捷
				local hasxxzj = W_RetainBuff(NA_Player, 155672, true);   --血腥爪击
				local hasqxyz = W_RetainBuff(NA_Player, 16864, true);   --清晰预兆
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(haslszdxj, '5185', NA_Player) --治疗之触
					or NA_Fire(UnitPower(NA_Player,4) == 5 and hasxxzj and W_BuffTime(NA_Target,-1079) < 4 or not hasgl, '1079', NA_Target) --割裂
					or NA_Fire(UnitPower(NA_Player,4) == 5 and W_BuffTime(NA_Target,-1079) > 6 and W_BuffTime(NA_Player,52610) > 6 and hasxxzj, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(hasxxzj, '1822', NA_Target) --斜掠
					or NA_Fire(hasxxzj and hasqxyz, '106832', NA_Target) --痛击
					or NA_Fire(hasxxzj, '5221', NA_Target) --撕碎
					or NA_Fire(not NA_IsSolo and not W_HasBuff(NA_Target, -770, true), '770', NA_Target) --精灵之火
					or NA_Fire(NA_SpellInterrupt(NA_Target), '106839', NA_Target) --迎头痛击
					or NA_Fire(not hasympx or W_BuffTime(NA_Player,52610) < 4, '52610', NA_Player) --野蛮咆哮
					or NA_Fire(true, '5217', NA_Player) --猛虎之怒
					or NA_Fire(W_HPlevel(NA_Target)<0.25 and W_BuffTime(NA_Target,-1079) < 4, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(UnitPower(NA_Player,4) == 5 and W_BuffTime(NA_Target,-1079) < 4 or not hasgl, '1079', NA_Target) --割裂
					or NA_Fire(true, '1822', NA_Target) --斜掠
					or NA_Fire(UnitPower(NA_Player,4) == 5 and W_BuffTime(NA_Target,-1079) > 6 and W_BuffTime(NA_Player,52610) > 6, '22568', NA_Target) --凶猛撕咬
					or NA_Fire(true, '5221', NA_Target) --撕碎

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Restoration
        
				
        
        if(not NA_IsAOE and (false

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
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(rgzx and UnitPower(NA_Player,8) > 20, '78674', NA_Target) --星涌术
					or NA_Fire(ygzx and UnitPower(NA_Player,8) < -40, '78674', NA_Target) --星涌术
					or NA_Fire(NA_GetSpellCharges(78674)==2 and W_GetSpellCooldown(78674)<6 or NA_GetSpellCharges(78674)==3, '78674', NA_Target) --星涌术
					or NA_Fire(NA_SpellInterrupt(NA_Target), '78675', NA_Target) --日光术
					or NA_Fire(UnitPower(NA_Player,8) > 40, '112071', NA_Player) --超凡之盟
					or NA_Fire(UnitPower(NA_Player,8) > 0, '102560', NA_Player) --化身：艾露恩之眷
					or NA_Fire(W_BuffTime(NA_Target,-164815) < 7 or rzd, '8921', NA_Target) --8921
					or NA_Fire(yzd or W_BuffTime(NA_Target,-164812) < 4 or cfzm and W_BuffTime(NA_Player,112071) <= 2, '8921', NA_Target) --月火术
					or NA_Fire(UnitPower(NA_Player,8) >= 0, '5176', NA_Target) --愤怒
					or NA_Fire(UnitPower(NA_Player,8) <= 0, '2912', NA_Target) --星火术

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
				local xsxz = W_BuffCount(NA_Player, 144871);   --修缮贤哲
				
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.6, '132158', NA_Player) --自然迅捷
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and zrxj, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.4, '102342', NA_Target) --铁木树皮
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==3 or NA_CheckDebuff(NA_Target)==4, '88423', NA_Target) --自然之愈
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and xsxz==5, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and (hcs or yh), '18562', NA_Target) --迅捷治愈
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and (not hcs or W_BuffTime(NA_Target,774))<4, '774', NA_Target) --回春术
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and not yxcz, '48438', NA_Target) --野性成长
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and not smzf, '33763', NA_Target) --生命绽放
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and qxyz, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and jnsf, '8936', NA_Target) --愈合
					or NA_Fire(W_HPlevel(NA_Target)<0.7 and (hcs or yh), '145205', NA_Target) --野性蘑菇
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and smzf, '5185', NA_Target) --治疗之触
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '124974', NA_Player) --自然的守护
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '5185', NA_Target) --治疗之触

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
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '102401', NA_Target) --野性冲锋

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Cat
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Balance
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记

      )then return true; end
    end
  end
  return false;
end
