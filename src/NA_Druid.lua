function getNA_DruidActions(no)
	if(no == 0)then
		return {'spell_druid_thrash', 'ability_druid_lacerate','ability_druid_mangle2','spell_nature_faeriefire','ability_physical_taunt','ability_racial_cannibalize','spell_nature_stoneclawtotem','spell_nature_regeneration', 'inv_misc_bone_taurenskull_01','ability_bullrush','spell_druid_mightofursoc','ability_druid_enrage'
		};
	elseif(no == 1)then
		return {
		};
	end
	return {};
end

function getNA_DruidTelants(no)
	if(no == 0)then
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

function NA_DruidDps()
	W_Log(1,"Druid dps");
	if(W_IsInCombat())then
		if(W_TargetCanAttack()) then
			-- 保命施法
			if(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5))then
				if(false
					or NA_Fire(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5), 'ability_racial_cannibalize', NA_Player)--野蛮防御
					or NA_Fire(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5), 'spell_nature_stoneclawtotem', NA_Player)--树皮术
					or NA_Fire(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5), 'ability_druid_tigersroar', NA_Player)--生存本能
					or NA_Fire(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5), 'ability_bullrush', NA_Player)--狂暴回复
					or NA_Fire(W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5), 'spell_druid_mightofursoc', NA_Player)--乌索克之力 		
				)then return true; end
				return true;
			end
			local hasThrash = W_RetainBuff(NA_Target, -106832, true);		--痛击dot
			local countLacerate = W_BuffCount(NA_Target, -33745, true);		--割伤dot
			local hasFaeriefire = W_RetainBuff(NA_Target, -770, true);		--精灵之火
			local notTanking = not NA_IsSolo and not W_isTanking();

			-- attack
			if(false
			)then return true; end

			if(NA_ProfileNo == 0)then --守护
				if(not NA_IsAOE and (false
					or NA_Fire(notTanking, 'ability_physical_taunt', NA_Target) --低吼
					or NA_Fire(not hasThrash, 'spell_druid_thrash', NA_Target) --痛击
					or NA_Fire(countLacerate < 3, 'ability_druid_lacerate', NA_Target) --割伤
					or NA_Fire(true, 'ability_druid_mangle2', NA_Target) --裂伤
					or NA_Fire(W_PowerLevel(NA_Player) < 0.1, 'ability_druid_enrage', NA_Player) --激怒
				))then return true; end

				if(NA_IsAOE and (false
					or NA_Fire(notTanking, 'ability_physical_taunt', NA_Target) --低吼
					or NA_Fire(true, 'ability_druid_mangle2', NA_Target) --裂伤
				))then return true; end
			elseif(NA_ProfileNo == 1)then 
			elseif(NA_ProfileNo == 2)then
				if(false
				)then return true; end
			end
		elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
			if(false
			)then return true; end
			return false;
		end
	else
		local hasRegeneration = W_HasBuff(NA_Player, 1126, true);	--野性印记
		if(false
			or NA_Fire(not hasRegeneration, 'spell_nature_regeneration', NA_Player)--野性印记
		)then return true; end
		--start attack野性印记
		if(NA_IsSolo and W_TargetCanAttack())then
			if(false
			or NA_Fire(true, 'inv_misc_bone_taurenskull_01', NA_Target) --迎头痛击
			or NA_Fire(true, 'DeathGrip', NA_Target))then return true; end
		end
	end
	return false;
end