function getNA6Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '130735','51271','47568','49020','77575','49184','45462','49143','45477','47541','61999','49998','48707','48792','119975','57330','49576'
    };
  elseif(no == 1)then
    return {
      '114866','47568','49028','56222','45477','47541','49576','77575','45462','50842','165394','49998','49222','48982','55233','48743'
    };
  elseif(no == 2)then
    return {
      '130735','51271','47568','49143','49184','45462','49020','123693','77575'
    };
  
  end
  return {};
end

function getNA6Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Frost';
  elseif(no == 1)then
    return 'Blood';
  elseif(no == 2)then
    return 'Frost';
  
  end
  return '';
end

function NA6Dps()
  W_Log(1,"死亡骑士 dps");
  local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
	local hasBoneshield = not(NA_ProfileNo == 1) or W_HasBuff(NA_Player, 49222, true);  --白骨之盾
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
					or NA_Fire(NA_ProfileNo == 0 and needHP, '49998', NA_Target) --灵界打击
					or NA_Fire(NA_ProfileNo == 0 and needHP, '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_ProfileNo == 0 and needHP, '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_ProfileNo == 0 and needHP, '119975', NA_Player) --符能转换
					or NA_Fire(NA_ProfileNo == 1 and needHP, '48982', NA_Player) --符文分流
					or NA_Fire(NA_ProfileNo == 1 and needHP, '55233', NA_Player) --吸血鬼之血

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Two-Handed Frost
        local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
				local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
				local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
				local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '130735', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '49020', NA_Target) --湮没
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '77575', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(W_StarCount(1)>1 or W_StarCount(2)>1 or W_StarCount(3)>1 or W_StarCount(4)>1, '49020', NA_Target) --湮没
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasFreezingFog or hasRime, '45477', NA_Target) --冰冷触摸
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '47541', NA_Target) --凋零缠绕
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '49020', NA_Target) --湮没

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '130735', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '77575', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(hasFreezingFog or hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_StarCount(3)>1 or W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '49020', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '45462', NA_Target) --暗影打击

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Blood
        local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);  --血之疫病
				local hasCrimsonScourge = W_HasBuff(NA_Player, 81141, true);    --赤色天灾
				local notTanking = not NA_IsSolo and not W_isTanking();
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '114866', NA_Target) --灵魂收割
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '49028', NA_Target) --符文刃舞
					or NA_Fire(notTanking, '56222', NA_Target) --黑暗命令
					or NA_Fire(notTanking, '45477', NA_Target) --冰冷触摸
					or NA_Fire(notTanking and W_PowerLevel(NA_Player)>0.6, '47541', NA_Target) --凋零缠绕
					or NA_Fire(notTanking and W_HPlevel(NA_Target)>0.3, '49576', NA_Target) --死亡之握
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '77575', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '45477', NA_Target) --冰冷触摸
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(hasCrimsonScourge, '50842', NA_Target) --血液沸腾
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '165394', NA_Target) --符文打击
					or NA_Fire(retainFrostFever or retainBloodPlague, '50842', NA_Target) --血液沸腾
					or NA_Fire(W_HPlevel(NA_Player) < 0.8, '49998', NA_Target) --灵界打击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '47541', NA_Target) --凋零缠绕
					or NA_Fire(not hasBoneshield, '49222', NA_Player) --白骨之盾

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '114866', NA_Target) --灵魂收割
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '49028', NA_Target) --符文刃舞
					or NA_Fire(notTanking, '56222', NA_Target) --黑暗命令
					or NA_Fire(notTanking, '45477', NA_Target) --冰冷触摸
					or NA_Fire(notTanking and W_PowerLevel(NA_Player)>0.6, '47541', NA_Target) --凋零缠绕
					or NA_Fire(notTanking and W_HPlevel(NA_Target)>0.3, '49576', NA_Target) --死亡之握
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '77575', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '45477', NA_Target) --冰冷触摸
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(hasCrimsonScourge, '50842', NA_Target) --血液沸腾
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '165394', NA_Target) --符文打击
					or NA_Fire(retainFrostFever or retainBloodPlague, '50842', NA_Target) --血液沸腾
					or NA_Fire(W_HPlevel(NA_Player) < 0.8, '49998', NA_Target) --灵界打击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '47541', NA_Target) --凋零缠绕
					or NA_Fire(not hasBoneshield, '49222', NA_Player) --白骨之盾

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Dual-Wield Frost
        local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
				local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
				local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
				local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '130735', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(hasKillingMachine or W_PowerLevel(NA_Player) > 0.88, '49143', NA_Target) --冰霜打击
					or NA_Fire(W_StarCount(3)>1 and W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.76, '49143', NA_Target) --冰霜打击
					or NA_Fire((W_StarCount(1)>0 or W_StarCount(2)>0 or W_StarCount(3)>0 or W_StarCount(4)>0) and hasKillingMachine, '49020', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.40, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '123693', NA_Target) --吸血瘟疫

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '130735', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '77575', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '45462', NA_Target) --暗影打击
					or NA_Fire(hasFreezingFog or hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_StarCount(3)>1 or W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '49020', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '45462', NA_Target) --暗影打击

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then

      if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(not W_HasBuff(NA_Player, 57330, true), '57330', NA_Player) --寒冬号角
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player) < 0.7, '119975', NA_Player) --符能转换
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '45477', NA_Target) --冰冷触摸
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '49576', NA_Target) --死亡之握
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '47541', NA_Target) --凋零缠绕
					or NA_Fire(not hasBoneshield, '49222', NA_Player) --白骨之盾
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player) < 0.7, '48743', NA_Player) --天灾契约
    
    )then return true; end
  end
  return false;
end
