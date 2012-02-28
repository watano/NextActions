--0:name, 2:rank, 3:icon, 4:cost, 5:isFunnel, 6:powerType, 7:castTime, 8:minRange, 9:maxRange, 51:spell1/buff2/item3/marco4, 52:buff/debuff, 53:maxid

function getNA_DruidSpells()
	return {
		['CatForm']={['ids']=768},
		['Cyclone']={['ids']=33786},
		['Dash']={['ids']=1850},
		['Rip']={['ids']=1079},
		['Maul']={['ids']=6807},
		['Hibernate']={['ids']=2637},
		['FeralCharge-Bear']={['ids']=16979},
		['Claw']={['ids']=1082},
		['Swipe_Bear']={['ids']=779},
		['SootheAnimal']={['ids']=2908},
		['AquaticForm']={['ids']=1066},
		['RemoveCorruption']={['ids']=2782},
		['Bash']={['ids']=5211},
		['SwiftFlightForm']={['ids']=40120},
		['Tranquility']={['ids']=740},
		['Cower']={['ids']=8998},
		['Ravage']={['ids']=6785},
		['EntanglingRoots']={['ids']=339},
		['Teleport:Moonglade']={['ids']=18960},
		['HealingTouch']={['ids']=5185},
		['Revive']={['ids']=50769},
		['SavageDefense']={['ids']=62600},
		['MoonkinForm']={['ids']=24858},
		['Swipe_Cat']={['ids']=62078},
		['Nourish']={['ids']=50464},
		['Typhoon']={['ids']=50516},
		['FlightForm']={['ids']=33943},
		['Rebirth']={['ids']=20484},
		['TrackHumanoids']={['ids']=5225},
		['Growl']={['ids']=6795},
		['Hurricane']={['ids']=16914},
		['Shred']={['ids']=5221},
		['BearForm']={['ids']=5487},
		['Pounce']={['ids']=9005},
		['Starfall']={['ids']=50288},
		['FerociousBite']={['ids']=22568},
		['FelineGrace']={['ids']=20719},
		['Maim']={['ids']=22570},
		['Swiftmend']={['ids']=18562},
		['SurvivalInstincts']={['ids']=61336},
		['Thrash']={['ids']=77758},

		['Pulverize']={['ids']=80951,['buff']=1},
		['TravelForm']={['ids']=783,['buff']=1},
		['Prowl']={['ids']=5215,['buff']=1},
		['Starfire']={['ids']=2912,['buff']=1},
		['FrenziedRegeneration']={['ids']=22842,['buff']=1},
		['MarkOftheWild']={['ids']=1126,['buff']=1},
		['Thorns']={['ids']=467,['buff']=1},
		['Innervate']={['ids']=29166,['buff']=1},
		['Lifebloom']={['ids']=33763,['buff']=1},
		['FeralCharge-Cat']={['ids']=49376,['buff']=1},
		['TigerSFury']={['ids']=5217,['buff']=1},
		['SavageRoar']={['ids']=52610,['buff']=1},
		['Regrowth']={['ids']=8936,['buff']=1},
		['Barkskin']={['ids']=22812,['buff']=1},
		['Enrage']={['ids']=5229,['buff']=1},
		['TreeOfLife']={['ids']=5420,['buff']=1},
		['NatureSGrasp']={['ids']=16689,['buff']=1},
		['WildGrowth']={['ids']=48438,['buff']=1},
		['Wrath']={['ids']=5176,['buff']=1},
		['Rejuvenation']={['ids']=774,['buff']=1},
		['Berserk']={['ids']=50334,['buff']=1},
		['Eclipse_Lunar']={['ids']=48518,['buff']=1},
		['Eclipse_Solar']={['ids']=48517,['buff']=1},
		['Clearcasting']={['ids']=16870,['buff']=1},

		['Mangle_Bear']={['ids']=33878,['buff']=2},
		['FaerieFire_Feral']={['ids']=16857,['buff']=2},
		['Mangle_Cat']={['ids']=33876,['buff']=2},
		['DemoralizingRoar']={['ids']=99,['buff']=2},
		['ChallengingRoar']={['ids']=5209,['buff']=2},
		['FaerieFire']={['ids']=770,['buff']=2},
		['Moonfire']={['ids']=8921,['buff']=2},
		['Rake']={['ids']=1822,['buff']=2},
		['Lacerate']={['ids']=33745,['buff']=2},
		['InsectSwarm']={['ids']=5570,['buff']=2},
	};
end

function getNA_DruidActions(no)
	local actions = {'Barkskin','HealingTouch'};
	if(no==2)then --奶德
		return NA_ArrayAppend(actions,{'Moonfire','Starfire','Wrath','InsectSwarm',
		'RemoveCorruption','NatureSGrasp','Innervate','Regrowth',
		'Rejuvenation','Lifebloom','WildGrowth','Nourish','Swiftmend','FaerieFire'}); --平衡
	elseif(no==0)then
		return NA_ArrayAppend(actions,{'Berserk','FaerieFire_Feral',
		'Rake','TigerSFury','FerociousBite','Mangle_Cat','FeralCharge-Cat','Swipe_Cat','SavageRoar','Rip','Pulverize','SurvivalInstincts',
		'Growl','ChallengingRoar','Swipe_Bear','Lacerate','Mangle_Bear','FrenziedRegeneration','Maul','DemoralizingRoar','FeralCharge-Bear','Thrash'
		}); --熊/貓
	elseif(no==1)then
		return NA_ArrayAppend(actions,{'FaerieFire_Feral','Berserk',
		'Rake','TigerSFury','FerociousBite','Mangle_Cat','FeralCharge-Cat','Swipe_Cat','SavageRoar','Rip'
		}); --貓
	end
	return {};
end

function NA_DruidDps()
	if(W_IsInCombat())then
		-- 保命施法
		if(false 
			or NA_Fire(NA_IsSolo and W_HPlevel("player") < 0.8, 'Barkskin', "player") 
			or NA_Fire(NA_IsSolo and W_HPlevel("player") < 0.3 and GetShapeshiftForm() == 1 and W_PowerLevel('player') > 0.3, 'FrenziedRegeneration', "player") --狂暴恢復
			or NA_Fire(NA_IsSolo and W_HPlevel("player") < 0.1 and (GetShapeshiftForm() == 1 or GetShapeshiftForm() == 3), 'SurvivalInstincts', "player") 
		)then 
			return true;
		end

		if(W_TargetCanAttack()) then
			-- attack
			if(NA_ProfileNo == 0 or NA_ProfileNo == 1)then
				if(false
					or (GetShapeshiftForm() == 1 and NA_Fire(true, 'FeralCharge-Bear', "target"))
					or (GetShapeshiftForm() == 3 and NA_Fire(true, 'FeralCharge-Cat', "target"))
				)then 
					return true; 
				end
				if(GetShapeshiftForm() == 1)then--熊
						if(false
							or NA_Fire(not NA_IsSolo and not W_isTanking(), 'Growl', "target") --低吼
							or NA_Fire(not NA_IsSolo and not W_isTanking(), 'ChallengingRoar', "target") --挑戰咆哮
							or NA_Fire(not NA_IsSolo and W_BuffCount('DemoralizingRoar', "target", true) < 1, 'DemoralizingRoar', "target")--挫志咆哮
							or NA_Fire(NA_IsAOE, 'Swipe_Bear', "target")
							or NA_Fire(NA_IsAOE, 'Thrash', "player")
							or NA_Fire(not NA_IsSolo and NA_IsMaxDps and W_BuffCount('FaerieFire', "target", true) < 1, 'FaerieFire_Feral', "target")
							or NA_Fire(W_BuffCount('Lacerate', "target", true)>0 and W_BuffCount('Pulverize', "player", true)<1, 'Pulverize', "target")
							or NA_Fire(W_BuffCount('Pulverize', "player", true) > 0, 'Berserk', "player")
							or NA_Fire(not NA_IsSolo and W_PowerLevel("player") >= 0.9, 'Maul', "target") --槌擊
							or NA_KeepBuff('Lacerate', "target", true, 1)
							or NA_Fire(true, 'Mangle_Bear', "target")
							or NA_KeepBuff('Lacerate', "target", true, 3)
						)then 
							return true;
						end
				elseif(GetShapeshiftForm() == 3)then--猫
					if(NA_Fire(not NA_IsSolo and NA_IsMaxDps and W_BuffCount('FaerieFire', "target", true) < 1, 'FaerieFire_Feral', "target")
						or NA_Fire(NA_IsAOE, 'Swipe_Cat', "target")
						or NA_Fire(NA_IsMaxDps and GetComboPoints("player","target") > 3, 'FerociousBite', "player")
						or NA_Fire(NA_IsMaxDps, 'TigerSFury', "player")
						or NA_Fire(NA_IsMaxDps, 'Berserk', "player")
						or NA_Fire(W_BuffCount('SavageRoar', "player", true) < 1 and GetComboPoints("player","target") > 2, 'SavageRoar', "target")
						or NA_Fire(W_BuffCount('Rake', "target", true) < 1, 'Rake', "target")
						or NA_Fire(W_BuffCount('Mangle_Cat', "target", true, "Ability_Druid_Mangle2") < 1, 'Mangle_Cat', "target")
						or NA_Fire(GetComboPoints("player","target") > 4, 'Rip', "target")
						or NA_Fire(true, 'Mangle_Cat', "target")
					)then 
						return true;
					end
				end
			elseif(NA_ProfileNo == 2 and NA_IsSolo)then --平衡德/奶德
				if(false
					or NA_Fire(not NA_IsMaxDps and W_BuffCount('FaerieFire', "target", true) < 1, 'FaerieFire', "target")
					or NA_Fire(W_BuffCount('Eclipse_Solar', "player", true) > 0, 'Wrath', "target") --月蚀1-> 愤怒
					or NA_Fire(W_BuffCount('Eclipse_Lunar', "player", true) > 0, 'Starfire', "target") --月蚀2-> 星火术
					or NA_Fire(W_HP("target") < 1000, 'Moonfire', "target")
					or NA_Cast4NoBuffs({'InsectSwarm'}, 'InsectSwarm', "target")
					or NA_Cast4NoBuffs({'Moonfire'}, 'Moonfire', "target")
					or NA_Fire(true, 'Wrath', "target")
				)then
					return true;
				end
			end
		elseif(UnitCanAssist("player", "target") and UnitIsPlayer("target"))then
				if(false 
					or NA_Fire(W_PowerLevel("player") < 0.6 and UnitName("target") == UnitName("player"), 'Innervate', "player") --激活
					-- or NA_Fire(W_HPlevel("target") < 0.5, 'Swiftmend','target')
					or NA_Fire(W_checkDeBuffs("target", "Poison"), 'RemoveCorruption', "target")
					or NA_Fire(W_checkDeBuffs("target", "Curse"), 'RemoveCorruption', "target")
					or NA_Fire(W_BuffCount('Clearcasting', "player", true)>0 and W_HPlevel("target") < 0.3, 'Regrowth', "target")--愈合
					or NA_Fire(W_BuffCount('Clearcasting', "player", true)>0 and W_HPlevel("target") < 0.9, 'HealingTouch', "target")--治療之觸
					or NA_Fire(GetShapeshiftForm() == 5 and W_BuffCount('Lifebloom', "target", true)<3, 'Lifebloom', "target")--树形态
					or NA_Fire(W_BuffCount('Rejuvenation', "target", true)<1 and W_BuffCount('Lifebloom', "target", true)>0, 'Rejuvenation', "target")--回春
					or NA_Fire(W_BuffCount('Lifebloom', "target", true)>0 and W_BuffCount('Lifebloom', "target", true)<3, 'Lifebloom', "target")--野性之花
					or NA_Fire(W_HPlevel("target") < 0.3, 'Regrowth', "target")--愈合
					or NA_Fire(W_HPlevel("target") < 0.5 and W_BuffCount('Rejuvenation', "target", true)<1, 'Rejuvenation', "target")--回春
					or NA_Fire(W_HPlevel("target") < 0.5 and W_HPlevel("target") > 0.3, 'HealingTouch', "target")--治療之觸
					or NA_Fire(W_HPlevel("target") < 0.8 and W_HPlevel("target") > 0.5, 'Nourish', "target")--滋補術
--					or NA_Cast4NoBuffs({'WildGrowth'}, 'WildGrowth', "target")--野性生长
--					or NA_Cast4NoBuffs({'Rejuvenation'}, 'Rejuvenation', "target")--回春
--					or NA_Cast4NoBuffs({'Lifebloom'}, 'Lifebloom', "target")--野性之花
--					or NA_Fire(W_HPlevel("target") < 0.9 and (W_BuffCount('Rejuvenation', "player", true)>0 or W_BuffCount('Regrowth', "player", true)>0), 'Swiftmend', "target")--迅愈
--					or NA_Fire(NA_IsMaxDps, 'Rejuvenation', "target")
--					or NA_Fire(NA_IsMaxDps and W_HPlevel("target") < 0.8, 'HealingTouch', "target")--愈合
--					or NA_Fire(not NA_IsMaxDps and W_HPlevel("target") < 0.7, 'Nourish', "target")--滋补
--					or NA_Fire(W_HPlevel("target") < 0.8 and W_BuffCount('Lifebloom', "target", true)<3, 'Lifebloom', "target")
				)then 
					return true;
				end
			return false;
		end
	else
--		if(UnitCanAssist("player", "target") and UnitIsPlayer("target")
--			and (NA_Cast4NoBuffs({'MarkOftheWild'}, 'MarkOftheWild', "target", true) 
--				or NA_Cast4NoBuffs({'Thorns'}, 'Thorns', "target", true))) then 
--			return true;
--		end

		if(UnitName("target") == UnitName("player") and NA_Fire(W_HPlevel("target") < 0.80, 'HealingTouch', "target")) then --治疗之触
			return true;
		end

		--start attack
		if(W_TargetCanAttack() and NA_IsSolo)then 
			if(GetShapeshiftForm() == 1 or GetShapeshiftForm() == 3)then
				if(NA_Cast4NoBuffs({'FaerieFire'}, 'FaerieFire_Feral', "target") 
					or (GetShapeshiftForm() == 1 and NA_Fire(true, 'FeralCharge-Bear', "target"))
					or (GetShapeshiftForm() == 3 and NA_Fire(true, 'FeralCharge-Cat', "target"))
				)then 
					return true; 
				end
				if(GetShapeshiftForm() == 3 and W_checkBuffs({'Prowl'}, "player", true))then
					-- if(NA_Fire(true, 'Pounce', "target"))then return true; end
				end
			else
				if(NA_Fire(true, 'Wrath', "target"))then return true; end
			end
		end
	end
	return false;
end