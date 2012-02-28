--0:name, 2:rank, 3:icon, 4:cost, 5:isFunnel, 6:powerType, 7:castTime, 8:minRange, 9:maxRange, 51:spell1/buff2/item3/marco4, 52:buff/debuff, 53:maxid

function getNA_PaladinSpells()
	return {
		['Avengers Shield']={['ids']=31935},
		['Crusader Strike']={['ids']=35395},
		['Hammer of Justice']={['ids']=853},-- Stuns the target for 6 sec.
		['Hand of Reckoning']={['ids']=62124},
		['Holy Light']={['ids']=635},
		['Judgement']={['ids']=20271},
		['Word of Glory']={['ids']=85673},
		['Lay on Hands']={['ids']=633},
		['Flash of Light']={['ids']=19750},
		['Consecration']={['ids']=26573},
		['Holy Wrath']={['ids']=2812},
		['Templars Verdict']={['ids']=85256},
		['Divine Storm']={['ids']=53385},
		['Exorcism']={['ids']=879},
		['Divine Protection']={['ids']=498},
		['Hand of Protection']={['ids']=1022},
		['Hammer of Wrath']={['ids']=24275},
		['Cleanse']={['ids']=4987},
		['Ardent Defender']={['ids']=31850},
		['Shield of the Righteous']={['ids']=53600},
		['Hammer of the Righteous']={['ids']=53595},
		['Zealotry']={['ids']=85696,['buff']=1},
		['Devotion Aura']={['ids']=465,['buff']=1},
		['MarkOftheWild']={['ids']=1126,['buff']=1},
		['The Art of War']={['ids']=53486,['buff']=1},
		['Righteous Fury']={['ids']=25780,['buff']=1},
		['Avenging Wrath']={['ids']=31884,['buff']=1},
		['Hand of Light']={['ids']=90174,['buff']=1},
		['Inquisition']={['ids']=84963,['buff']=1},
		['Divine Plea']={['ids']=54428,['buff']=1},
		['Blessing of Kings']={['ids']=20217,['buff']=1},
		['Blessing of Might']={['ids']=19740,['buff']=1},
		['Seal of Insight']={['ids']=20165,['buff']=1},
		['Seal of Righteousness']={['ids']=20154,['buff']=1},
		['Seal of Truth']={['ids']=31801,['buff']=1}
	};
end

function getNA_PaladinActions(no)
	local actions = {'Crusader Strike','Judgement','Word of Glory','Flash of Light','Lay on Hands','Consecration','Holy Wrath','Exorcism','Divine Protection','Blessing of Might','Blessing of Kings','Hammer of Wrath','Cleanse','Avenging Wrath','Divine Plea'};
	if(no == 1)then
		return NA_ArrayAppend(actions,{'Templars Verdict','Divine Storm','Seal of Truth','Zealotry'});
	elseif(no ==0)then
		return NA_ArrayAppend(actions,{'Avengers Shield','Hand of Reckoning','Hammer of the Righteous','Seal of Insight','Shield of the Righteous','Ardent Defender','Righteous Fury'});
	elseif(no ==2)then
		return NA_ArrayAppend(actions,{});
	end
	return {};
end

function NA_PaladinDps()
	if(W_IsInCombat())then
		-- 保命施法
		if(false 
			or NA_Fire(W_HPlevel("player") < 0.8, 'Word of Glory', "player") 
			or NA_Fire(NA_IsSolo and W_HPlevel("player") < 0.5, 'Flash of Light', "player") 
			or NA_Fire(W_HPlevel("player") < 0.5, 'Divine Protection', "player") 
			or NA_Fire(W_HPlevel("player") < 0.4, 'Ardent Defender', "player") 
			or NA_Fire(W_HPlevel("player") < 0.3, 'Lay on Hands', "player") 
		)then 
			return true;
		end

		if(W_TargetCanAttack()) then
			-- attack
			if(NA_ProfileNo == 0)then
				if(false
					or NA_Fire(not NA_IsSolo and not W_isTanking(), 'Hand of Reckoning', "target") --清算
					or NA_Fire(not NA_IsSolo and not W_isTanking(), 'Avengers Shield', "target")
					or NA_Fire(not NA_IsSolo and not W_isTanking(), 'Judgement', "target")
					or NA_Fire(not NA_IsSolo and not W_isTanking(), 'Holy Wrath', "target")
					or NA_Fire((NA_IsSolo or NA_IsMaxDps) and W_HPlevel("target") > 0.9, 'Avenging Wrath', "player")
					or NA_Fire(W_HPlevel("target") < 0.2 or W_BuffCount('Avenging Wrath', "player", true)>0, 'Hammer of Wrath', "target")
					or NA_Fire(NA_IsAOE, 'Avengers Shield', "target")
					or NA_Fire(NA_IsAOE, 'Consecration', "target")
					or NA_Fire(NA_IsAOE, 'Hammer of the Righteous', "target")
					or NA_Fire(NA_IsAOE, 'Holy Wrath', "target")
					or NA_Fire(true, 'Inquisition', "target")
					or NA_Fire(not NA_IsMaxDps, 'Shield of the Righteous', "target")
					or NA_Fire(NA_IsMaxDps and UnitPower("player", 9)==3, 'Shield of the Righteous', "target")
					or NA_Fire(true, 'Avengers Shield', "target")
					or NA_Fire(true, 'Judgement', "target")
					or NA_Fire(true, 'Crusader Strike', "target")
				)then return true; end
			elseif(NA_ProfileNo == 1)then
				if(false -- 优先保持审讯，然后依次是愤怒之锤、驱邪、三星裁决、十字军打击、在1星或2星时触发圣光之手并使用裁决、审判、神圣愤怒、奉献
					or NA_Fire((NA_IsSolo or NA_IsMaxDps) and W_HPlevel("target") > 0.9, 'Avenging Wrath', "player")
					or NA_Fire(NA_IsAOE, 'Consecration', "target")
					or NA_Fire(NA_IsAOE, 'Holy Wrath', "target")
					or NA_Fire(NA_IsAOE, 'Divine Storm', "target")
					or NA_Fire(true, 'Inquisition', "target")
					or NA_Fire(W_HPlevel("target") < 0.2 or W_BuffCount('Avenging Wrath', "player", true)>0, 'Hammer of Wrath', "target")
					or NA_Fire(W_BuffCount('The Art of War', "player", true)>0, 'Exorcism', "target")
					or NA_Fire(W_BuffCount('Hand of Light', "player", true)>0, 'Templars Verdict', "target")
					or NA_Fire(W_BuffCount('Hand of Light', "player", true)>0, 'Judgement', "target")
					or NA_Fire(W_BuffCount('Hand of Light', "player", true)>0, 'Holy Wrath', "target")
					or NA_Fire(NA_IsMaxDps and UnitPower("player", 9)==3, 'Zealotry', "target")
					or NA_Fire(not NA_IsMaxDps, 'Templars Verdict', "target")
					or NA_Fire(NA_IsMaxDps and UnitPower("player", 9)==3, 'Templars Verdict', "target")
					or NA_Fire(true, 'Crusader Strike', "target")
					or NA_Fire(true, 'Judgement', "target")
				)then return true; end
			elseif(NA_ProfileNo == 2)then
				if(false
				)then return true; end
			end
		elseif(UnitCanAssist("player", "target") and UnitIsPlayer("target"))then
			if(NA_ProfileNo == 0)then
				if(false 
					or NA_Fire(W_checkDeBuffs("target", "Poison"), 'Cleanse', "target")
					or NA_Fire(W_checkDeBuffs("target", "Disease"), 'Cleanse', "target")
					or NA_Fire(W_HPlevel("target") < 0.8, 'Flash of Light', "target")
--					or NA_Fire(W_HPlevel("target") < 0.1 and UnitName("target") ~= UnitName("player"), 'Hand of Protection', "target")
				)then 
					return true;
				end
			end
			return false;
		end
	else
		if((W_BuffCount('Seal of Insight', "player", true)<1 and 
				W_BuffCount('Seal of Righteousness', "player", true)<1 and
				W_BuffCount('Seal of Truth', "player", true)<1) 
			and (false
			or NA_Fire(NA_ProfileNo == 0, 'Seal of Insight', "player")
			or NA_Fire(NA_ProfileNo == 1, 'Seal of Truth', "player")
			))then return true; end

		if(false 
			or (NA_ProfileNo == 0 and NA_Cast4NoBuffs({'MarkOftheWild','Blessing of Might','Blessing of Kings'}, 'Blessing of Kings', "player"))
			or NA_Cast4NoBuffs({'Blessing of Might','Blessing of Kings'}, 'Blessing of Might', "player")
			or NA_Fire(NA_ProfileNo == 0 and W_BuffCount('Righteous Fury', "player", true) <= 0, 'Righteous Fury', "player")
			or NA_Fire(W_PowerLevel('player')<0.3, 'Divine Plea', "player")
		)then return true; end
		--start attack
		if(not W_TargetIsBoss() and W_TargetCanAttack())then 
			if(false
			or NA_Fire(NA_ProfileNo == 0, 'Avengers Shield', "target") 
			or NA_Fire(NA_ProfileNo == 1, 'Judgement', "target")
			)then return true; end
		end
	end
	return false;
end