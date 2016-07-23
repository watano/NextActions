function getNA6Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'51271','194913','196770','47568','49998','49020','49184','49143','49576','61999','48707','48792'};
  elseif(no == 1)then
    return {'56222','49998','49028','50842','195292','43265','206930','195182','61999','48707','55233','219809','49576','194844'};
  elseif(no == 2)then
    return {'61999'};
  end
  return {};
end

NA6ProfileNames = {[0]='Two-Handed Frost',[1]='Blood',[2]='Unholy',};

function NA6Dps()
  W_Log(1,"死亡骑士 dps");
  
	local countBoneshield = W_BuffCount(NA_Player, 195181);  --白骨之盾
	local haswyzq=W_HasBuff(NA_Player, 49039, true);  --巫妖之躯
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Two-Handed Frost
      
      if(false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Blood
      
      if(false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '55233', NA_Player) --吸血鬼之血
					or NA_Fire(countBoneshield > 5, '219809', NA_Player) --墓石

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Unholy
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Two-Handed Frost
        local ff = W_RetainBuff(NA_Target, -155159, true) or W_RetainBuff(NA_Target, -55095, true); --死疽/冰霜疫病
				local ds = W_HasBuff(NA_Player, 101568, true);  --黑暗援助
				local hasRime = W_HasBuff(NA_Player, 59052, true);   --白霜
				local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '51271', NA_Target) --冰霜之柱
					or NA_Fire(true, '194913', NA_Player) --冰川突进
					or NA_Fire(true, '196770', NA_Target) --冷酷严冬
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_checkHP(2) or ds, '49998', NA_Target) --灵界打击
					or NA_Fire(hasKillingMachine or ff, '49020', NA_Target) --湮灭
					or NA_Fire(hasRime or not ff, '49184', NA_Target) --凛风冲击
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(NA_IsSolo, '49576', NA_Target) --死亡之握

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Blood
        local dp = W_RetainBuff(NA_Target, -155159, true) or W_RetainBuff(NA_Target, -55078, true); --死疽/血之疫病
				local hasCrimsonScourge = W_HasBuff(NA_Player, 81141, true);    --赤色天灾
				local kwdl = W_HasBuff(NA_Player, 81141, true);  --枯萎凋零
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(notTanking, '56222', NA_Target) --黑暗命令
					or NA_Fire(NA_checkHP(3) or W_PowerLevel(NA_Player)>0.8, '49998', NA_Target) --灵界打击
					or NA_Fire(NA_IsMaxDps, '49028', NA_Target) --符文刃舞
					or NA_Fire(not dp, '50842', NA_Target) --血液沸腾
					or NA_Fire(not dp, '195292', NA_Target) --死神的抚摩
					or NA_Fire(hasCrimsonScourge, '43265', NA_Nil) --枯萎凋零
					or NA_Fire(kwdl, '206930', NA_Target) --心脏打击
					or NA_Fire(countBoneshield<10, '195182', NA_Target) --骨髓分裂
					or NA_Fire(true, '206930', NA_Target) --心脏打击

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Unholy
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Two-Handed Frost
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Blood
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Unholy
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Two-Handed Frost
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '49143', NA_Target) --冰霜打击
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '49576', NA_Target) --死亡之握

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Blood
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '206930', NA_Target) --心脏打击
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '49576', NA_Target) --死亡之握
					or NA_Fire(countBoneshield < 1, '194844', NA_Player) --白骨风暴
					or NA_Fire(countBoneshield > 5, '219809', NA_Player) --墓石

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Unholy
      
      if(false

      )then return true; end
    end
  end
  return false;
end
