function getNA11Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '770','6795','6807','106832','33745','22568','106952','33917','102401','102351','62606','22812','108292','774','61336','22842','124974','1126'
    };
  elseif(no == 1)then
    return {
      
    };
  elseif(no == 2)then
    return {
      
    };
  elseif(no == 3)then
    return {
      '78674','112071','102560','164815','8921','5176','2912'
    };
  
  end
  return {};
end

function getNA11Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Bear';
  elseif(no == 1)then
    return 'Cat';
  elseif(no == 2)then
    return 'Restoration';
  elseif(no == 3)then
    return 'Balance';
  
  end
  return '';
end

function NA11Dps()
  W_Log(1,"德鲁伊 dps");
  local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
	local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
	local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
	local inBear = W_HasBuff(NA_Player, 5487, true);
	local inCat = W_HasBuff(NA_Player, 768, true);
	local yxhc = W_HasBuff(NA_Player, 108293, true);
	
	
	
	
	
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
					or NA_Fire(NA_ProfileNo == 0 and needHP3, '102351', NA_Player) --塞纳里奥结界
					or NA_Fire(NA_ProfileNo == 0 and needHP3, '62606', NA_Player) --野蛮防御
					or NA_Fire(needHP2, '22812', NA_Player) --树皮术
					or NA_Fire(NA_ProfileNo == 0 and needHP2, '108292', NA_Player) --野性之心
					or NA_Fire(NA_ProfileNo == 0 and needHP2 and yxhc, '774', NA_Player) --回春术
					or NA_Fire(NA_ProfileNo == 0 and needHP, '61336', NA_Player) --生存本能
					or NA_Fire(NA_ProfileNo == 0 and needHP, '22842', NA_Player) --狂暴回复
					or NA_Fire(NA_ProfileNo == 2 and needHP2, '124974', NA_Player) --自然的守护

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Bear
        local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
				local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not NA_IsSolo and not W_HasBuff(NA_Target, -770, true), '770', NA_Target) --精灵之火
					or NA_Fire(inBear and notTanking, '6795', NA_Target) --低吼
					or NA_Fire(inBear and W_RetainBuff(NA_Player, 135286, true), '6807', NA_Target) --重殴
					or NA_Fire(inBear and not hasThrash, '106832', NA_Target) --痛击
					or NA_Fire(inBear and countLacerate < 3, '33745', NA_Target) --割伤
					or NA_Fire(inBear and W_RetainBuff(NA_Target, -33745, true), '33745', NA_Target) --割伤
					or NA_Fire(inCat and GetComboPoints("player","target") > 4, '22568', NA_Target) --凶猛撕咬
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
        
				
        
        if(not NA_IsAOE and (false

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
					or NA_Fire(UnitPower(NA_Player,8) > 40, '112071', NA_Player) --超凡之盟
					or NA_Fire(UnitPower(NA_Player,8) > 0, '102560', NA_Player) --化身：艾露恩之眷
					or NA_Fire(W_BuffTime(NA_Target,-164815) < 7 or rzd, '164815', NA_Target) --阳炎术
					or NA_Fire(yzd or W_BuffTime(NA_Target,-164812) < 4 or cfzm and W_BuffTime(NA_Player,112071) <= 2, '8921', NA_Target) --月火术
					or NA_Fire(UnitPower(NA_Player,8) >= 0, '5176', NA_Target) --愤怒
					or NA_Fire(UnitPower(NA_Player,8) <= 0, '2912', NA_Target) --星火术

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then





      if(false
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1126, true), '1126', NA_Player) --野性印记
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '102401', NA_Target) --野性冲锋
    
    )then return true; end
  end
  return false;
end
