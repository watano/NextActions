--0:name, 2:rank, 3:icon, 4:cost, 5:isFunnel, 6:powerType, 7:castTime, 8:minRange, 9:maxRange, 51:spell1/buff2/item3/marco4, 52:buff/debuff, 53:maxid

function getNA_DKSpells()
	return {
--		['Raise Ally']={['ids']=61999},
--		['Chains of Ice']={['ids']=45524},
--		['Outbreak']={['ids']=49013},
--		['Improved Blood Presence']={['ids']=50365},
--		['Dirge']={['ids']=49223},
--		['Blood-Caked Blade']={['ids']=49219},
--		['Ravenous Dead']={['ids']=48965},
--		['Night Of the Dead']={['ids']=55620},
--		['Might Of Mograine']={['ids']=49023},
--		['Threat Of Thassarian']={['ids']=65661},
--		['Runic Power Mastery']={['ids']=49455},
--		['Tundra Stalker']={['ids']=49202},
--		['Toughness']={['ids']=49042},
--		['Rune Of the Fallen Crusader']={['ids']=53344},
--		['Bloody Strikes']={['ids']=48977},
--		['Anti-Magic Zone']={['ids']=51052},
--		['Rune Of Cinderglacier']={['ids']=53341},
--		['Deathand Decay']={['ids']=43265},
--		['Abomination SMight']={['ids']=53137},
--		['Blood Gorged']={['ids']=61154},
--		['Blood Presence']={['ids']=48266},
--		['Scent Of Blood']={['ids']=49004},
--		['Crypt Fever']={['ids']=49032},
--		['Dark Conviction']={['ids']=48987},
--		['BladeBarrier']={['ids']=49182},
--		['Sigil']={['ids']=52665},
--		['Mark Of Blood']={['ids']=49005},
--		['Desecration']={['ids']=55666},
--		['Will Of the Necropolis']={['ids']=49189},
--		['Anticipation']={['ids']=55129},
--		['Impurity']={['ids']=49220},
--		['One-Handed Axes']={['ids']=196},
--		['Rune Of Lichbane']={['ids']=53331},
--		['Frigid Dreadplate']={['ids']=49186},
--		['Sudden Doom']={['ids']=49018},
--		['Improved Rune Tap']={['ids']=48985},
--		['Anti-Magic Shell']={['ids']=48707},
--		['Merciless Combat']={['ids']=49024},
--		['Cloth']={['ids']=9078},
--		['Death Rune Mastery']={['ids']=49467},
--		['Mail']={['ids']=8737},
--		['Hungering Cold']={['ids']=49203},
--		['Veteran Of the Third War']={['ids']=49006},
--		['Improved Unholy Presence']={['ids']=50391},
--		['Ona Pale Horse']={['ids']=49146},
--		['Epidemic']={['ids']=49036},
--		['Virulence']={['ids']=48962},
--		['IcyTalons']={['ids']=50880},
--		['Chill Of the Grave']={['ids']=49149},
--		['Unholy Command']={['ids']=49588},
--		['Death Pact']={['ids']=48743},
--		['Rage Of Rivendare']={['ids']=50117},
--		['Ghoul Frenzy']={['ids']=63560},
--		['Killing Machine']={['ids']=51123},
--		['Nerves Of Cold Steel']={['ids']=49226},
--		['Bladed Armor']={['ids']=48978},
--		['Unholy Presence']={['ids']=48265},
--		['Unholy Blight']={['ids']=49194},
--		['Runeforging']={['ids']=53428},
--		['Army Of the Dead']={['ids']=42650},
--		['Chilblains']={['ids']=50040},
--		['Death Gate']={['ids']=50977},
--		['Strangulate']={['ids']=47476},
--		['BloodOftheNorth']={['ids']=54637},
--		['Lichborne']={['ids']=49039},
--		['ViciousStrikes']={['ids']=51745},
--		['RuneOfSpellbreaking']={['ids']=54447},
--		['PathOfFrost']={['ids']=3714},
--		['RuneOftheNerubianCarapace']={['ids']=70164},
--		['Bloodworms']={['ids']=49027},
--		['SpellDeflection']={['ids']=49145},
--		['Leather']={['ids']=9077},
--		['RuneOfRazorice']={['ids']=53343},
--		['ForcefulDeflection']={['ids']=49410},
--		['CorpseExplosion']={['ids']=49158},
--		['GuileOfGorefiend']={['ids']=50187},
--		['RuneOfSwordbreaking']={['ids']=54446},
--		['Butchery']={['ids']=48979},
--		['ImprovedFrostPresence']={['ids']=50384},
--		['RuneOfSpellshattering']={['ids']=53342},
--		['Deathchill']={['ids']=49796},
--		['BloodyVengeance']={['ids']=48988},
--		['Subversion']={['ids']=48997},
--		['MagicSuppression']={['ids']=49224},
--		['IcyReach']={['ids']=55061},
--		['Desolation']={['ids']=66799},
--		['ImprovedIcyTalons']={['ids']=55610},
--		['MasterOfGhouls']={['ids']=52143},
--		['Annihilation']={['ids']=51468},
--		['FrostPresence']={['ids']=48263},
--		['Glacier Rot']={['ids']=49471},
--		['BlackIce']={['ids']=49140},
--		['Morbidity']={['ids']=48963},
--		['Rune Of Swordshattering']={['ids']=53323},
--		['Ebon Plaguebringer']={['ids']=51099},
--		['Wandering Plague']={['ids']=49217},
--		['Necrosis']={['ids']=51459},
--		['Mind Freeze']={['ids']=47528},
--		['Rune Of the Stoneskin Gargoyle']={['ids']=62158},
--		['Acclimation']={['ids']=49200},
--		['Endless Winter']={['ids']=49657},

		['Raise Dead']={['ids']=46584},
		['Hysteria']={['ids']=49016},
		['Empower Rune Weapon']={['ids']=47568},
		['Dancing Rune Weapon']={['ids']=49028},
		['Dark Command']={['ids']=56222},
		['Summon Gargoyle']={['ids']=49206},
		['Unbreakable Armor']={['ids']=51271},
		['Blood Tap']={['ids']=45529},
		['Rune Tap']={['ids']=48982},
		['Vampiric Blood']={['ids']=55233},
		['Icebound Fortitude']={['ids']=48792},--冰錮堅韌
		['Pestilence']={['ids']=50842},
		['Blood Boil']={['ids']=48721},
		['Death Grip']={['ids']=49576},
		['Death Coil']={['ids']=47541},
		['Howling Blast']={['ids']=49184},--凜風衝擊
		['Obliterate']={['ids']=49020},--滅寂
		['Blood Strike']={['ids']=45902},
		['Rune Strike']={['ids']=56815},
		['Scourge Strike']={['ids']=55090},--天灾打击
		['Death Strike']={['ids']=49998},
		['Improved Death Strike']={['ids']=81138},
		['Frost Strike']={['ids']=49143},--冰霜打擊
		['Festering Strike']={['ids']=85948},--膿瘡潰擊
		['Plague Strike']={['ids']=45462},
		['Pillar of Frost']={['ids']=51271,['buff']=1}, --冰霜之柱
		['Bone Shield']={['ids']=49222,['buff']=1},
		['Killing Machine']={['ids']=51128,['buff']=1},
		['Battle Shout']={['ids']=6673,['buff']=1},--战士/战斗怒吼 
		['Horn Of Winter']={['ids']=57330,['buff']=1},
		['Freezing Fog']={['ids']=59052,['buff']=1},--Rime buff
		['Frost Fever']={['ids']=59921,['buff']=2},
		['Icy Touch']={['ids']=45477,['buff']=2},
		['Blood Plague']={['ids']=59879,['buff']=2}
	};
end

function getNA_DKActions(no)
	local actions = {'Raise Dead','Icy Touch','Plague Strike','Death Strike','Blood Strike','Rune Strike','Obliterate','Death Coil','Death Grip','Horn Of Winter','Blood Boil','Pestilence','Icebound Fortitude','Vampiric Blood','Empower Rune Weapon'};
	if(no == 1)then
--		return NA_ArrayAppend(actions,{'Howling Blast','Festering Strike','Blood Tap','Unbreakable Armor'});
		return NA_ArrayAppend(actions,{'Bone Shield','Summon Gargoyle'});
	elseif(no ==0)then
		return NA_ArrayAppend(actions,{'Bone Shield','Dark Command','Rune Tap','Dancing Rune Weapon'});
	elseif(no ==2)then
		return NA_ArrayAppend(actions,{'Blood Tap','Howling Blast','Frost Strike','Pillar of Frost'});
	end
	return {};
end

function NA_DKDps()
	if(W_IsInCombat())then
		-- 保命施法
		if(false 
			or NA_Fire(W_HPlevel("player") < 0.2 or NA_IsSolo, 'Vampiric Blood', "player")
			or NA_Fire(W_HPlevel("player") < 0.5 or NA_IsSolo, 'Rune Tap', "player")
			or NA_Fire(W_HPlevel("player") < 0.45 or NA_IsSolo, 'Icebound Fortitude', "player")
			or NA_Fire(W_HPlevel("player") < 0.8 or NA_IsSolo, 'Bone Shield', "player")
		)then 
			return true;
		end

		if(W_TargetCanAttack()) then
			-- 保命施法
			if(false 
				or NA_Fire(W_HPlevel("player") < 0.5 or NA_IsSolo, 'Death Strike', "target")
			)then return true; end
			-- attack
			if(NA_ProfileNo == 0)then
				if(false
					or NA_Fire(true, 'Bone Shield', "player")
					or NA_Fire(not NA_IsMaxDps and not W_isTanking(), 'Dark Command', "target")
					or NA_Fire(not NA_IsMaxDps and not W_isTanking() and W_PowerLevel('player')>0.6, 'Death Coil', "target")
					or NA_Fire(not NA_IsMaxDps and not W_isTanking(), 'Icy Touch', "target")
					or NA_Fire(not NA_IsMaxDps and not W_isTanking(), 'Blood Boil', "target")
					or NA_Fire(not NA_IsMaxDps and not W_isTanking() and W_HPlevel("target")>0.5 , 'Death Grip', "target")
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Pestilence', "target"))
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Blood Boil', "target"))
					or NA_Fire(true, 'Rune Strike', "target")
					or NA_Cast4NoBuffs({'Frost Fever'}, 'Icy Touch', "target")
					or NA_Cast4NoBuffs({'Blood Plague'}, 'Plague Strike', "target")
					or NA_Fire(true, 'Death Strike', "target")
					or NA_Fire(NA_IsMaxDps, 'Dancing Rune Weapon', "target")
					or NA_Fire(NA_IsMaxDps, 'Raise Dead', "player")
					or NA_Fire(W_PowerLevel('player') > 0.6, 'Death Coil', "target")
					or NA_Fire(true, 'Blood Strike', "target")
				)then return true; end
			elseif(NA_ProfileNo == 1)then
				if(false
--			--邪恶死亡骑士4.0.1
--单体循环
--　　疾病 > 食尸鬼变身 > 天谴打击(前提是2个邪恶符文或者所有的死亡符文都已经冷却完成 > 溃烂打击(如果2对冰血符文都已经冷却完成 >
--　　死缠(末日骤临触发，100符能或者使用任何技能都会造成符能溢出，或者符文腐化没有在触发状态 > 天谴打击 > 溃烂打击 > 死缠 > 吹箫。
--　　具体还请继续参照羽毛的符文系统详解，DK的所有输出都是基于这个新的符文系统，所以不要妄想在不理解符文系统的前提下理解这个优先级系统......
--群体循环
--　　疾病 > 食尸鬼变身 > 死亡凋零 >天谴打击(前提是2个邪恶符文或者所有的死亡符文都已经冷却完成 > 血沸+冰触 如果2对冰血符文都已经冷却完 >  死缠(末日骤临触发，100符能或者使用任何技能都会造成符能溢出，或者符文腐化没有在触发状态 > 天谴打击 > 血沸+冰触 > 死缠 > 吹箫。
--　　血沸+冰触，在用3只以上的怪物的时候血沸+冰触是>溃烂打击的。
--　　AOE用冰脸>邪脸
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Pestilence', "target"))
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Blood Boil', "target"))
					or NA_Fire(true, 'Rune Strike', "target")
					or NA_Cast4NoBuffs({'Frost Fever'}, 'Icy Touch', "target")
					or NA_Cast4NoBuffs({'Blood Plague'}, 'Plague Strike', "target")
					or NA_Fire(true, 'Death Strike', "target")
					or NA_Fire(W_PowerLevel('player') > 0.6, 'Death Coil', "target")
					or NA_Fire(true, 'Blood Strike', "target")

					or (NA_Fire(NA_IsAOE, 'Blood Boil', "target"))
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Pestilence', "target"))
					or NA_Cast4NoBuffs({'Blood Plague'}, 'Plague Strike', "target")
					or NA_Cast4NoBuffs({'Frost Fever'}, 'Icy Touch', "target")
					or NA_Fire(not NA_IsAOE, 'Blood Strike', "target")
--					or NA_Fire(true, 'Scourge Strike', "target")
					or NA_Fire(W_PowerLevel('player') >= 0.6, 'Death Coil', "target")
					or (not NA_IsMaxDps and NA_Cast4NoBuffs({'Horn Of Winter','Battle Shout'}, 'Horn Of Winter', "player"))
					or NA_Fire(NA_IsMaxDps, 'Summon Gargoyle', "target")
				)then return true; end
			elseif(NA_ProfileNo == 2)then
				if(false
--			--双持冰 'Icy Touch','Plague Strike','Death Strike','Blood Strike','Rune Strike','Obliterate','Death Coil','Death Grip','Horn Of Winter','Blood Boil','Pestilence','Icebound Fortitude','Vampiric Blood',
--	起手凛风、瘟疫打击、血魄打击、血魄打击、灭寂，血魄转化+冰霜之柱，开饰品，强力符文武器，灭寂灭寂灭寂冰霜打击冰霜打击冰霜打击。
-- 优先顺序依然是保持疾病>高符能(≥100)时冰霜打击>灭寂>冰霜打击>(用来血转死的)血魄打击>免费的凛风冲击。
					or NA_Fire(NA_IsMaxDps, 'Blood Tap', "player")
					or NA_Fire(NA_IsMaxDps, 'Pillar of Frost', "player")
					or NA_Fire(NA_IsMaxDps, 'Empower Rune Weapon', "player")
					or NA_Fire(NA_IsMaxDps, 'Raise Dead', "player")
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Pestilence', "target"))
					or (NA_Fire(NA_IsAOE and W_BuffCount('Frost Fever','target', true) > 0 and W_BuffCount('Blood Plague','target', true) > 0, 'Blood Boil', "target"))
					or NA_Fire(W_BuffCount('Frost Fever','target', false) < 1, 'Howling Blast', "target")
					or NA_Fire(W_BuffCount('Blood Plague','target', false) < 1, 'Plague Strike', "target")
					or NA_Fire(W_BuffCount('Killing Machine','player', true) > 0, 'Obliterate', "target")
					or NA_Fire(W_PowerLevel('player') >= 1, 'Frost Strike', "target")
					or NA_Fire(true, 'Obliterate', "target")
					or NA_Fire(true, 'Frost Strike', "target")
					or NA_Fire(true, 'Blood Strike', "target")
					or NA_Fire(W_BuffCount('Freezing Fog','player', true) > 0, 'Howling Blast', "target")
					or NA_Cast4NoBuffs({'Horn Of Winter'}, 'Horn Of Winter', "player")
				)then return true; end
			end
		elseif(UnitCanAssist("player", "target") and UnitIsPlayer("target"))then
			if(NA_ProfileNo == 0)then

			end
			return false;
		end
	else
		if(false 
			or NA_Cast4NoBuffs({'Horn Of Winter','Battle Shout'}, 'Horn Of Winter', "player")
			or NA_Cast4NoBuffs({'Bone Shield'}, 'Bone Shield', "player")
		)then return true; end
		--start attack
		if(not W_TargetIsBoss() and W_TargetCanAttack())then 
			if(NA_Fire(true, 'Icy Touch', "target") or NA_Fire(true, 'Death Grip', "target"))then return true; end
		end
	end
	return false;
end