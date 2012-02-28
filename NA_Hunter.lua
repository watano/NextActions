--0:name, 2:rank, 3:icon, 4:cost, 5:isFunnel, 6:powerType, 7:castTime, 8:minRange, 9:maxRange, 51:spell1/buff2/item3/marco4, 52:buff/debuff
NA_HunterInfo={
	[	 75]={[0]="自动射击",	[51]= 1},
	[19801]={[0]="宁神射击",	[51]= 1},
	[ 5116]={[0]="震荡射击",	[51]= 1},
	[20736]={[0]="扰乱射击",	[51]= 1},
	[27019]={[0]="奥术射击",	[51]= 1},
	[27021]={[0]="多重射击",	[51]= 1},
	[34120]={[0]="稳固射击",	[51]= 1},
	[53209]={[0]="奇美拉射击",	[51]= 1},
	[34490]={[0]="沉默射击",	[51]= 1,		[52]=2},
	[27065]={[0]="瞄准射击",	[51]= 1,		[52]=2},
	[ 3034]={[0]="蝰蛇钉刺",	[51]= 1,		[52]=2},
	[ 3043]={[0]="毒蝎钉刺",	[51]= 1,		[52]=2},
	[27016]={[0]="毒蛇钉刺",	[51]= 1,		[52]=2},
	[ 5118]={[0]="猎豹守护",	[51]= 1,		[52]=1},
	[13159]={[0]="豹群守护",	[51]= 1,		[52]=1},
	[13161]={[0]="野兽守护",	[51]= 1,		[52]=1},
	[13163]={[0]="灵猴守护",	[51]= 1,		[52]=1},
	[27044]={[0]="雄鹰守护",	[51]= 1,		[52]=1},
	[27045]={[0]="野性守护",	[51]= 1,		[52]=1},
	[34074]={[0]="蝰蛇守护",	[51]= 1,		[52]=1},
	[	781]={[0]="逃脱",			[51]= 1},
	[ 2974]={[0]="摔绊",			[51]= 1},
	[ 5384]={[0]="假死",			[51]= 1},
	[19263]={[0]="威慑",			[51]= 1},
	[27014]={[0]="猛禽一击",	[51]= 1},
	[27022]={[0]="乱射",			[51]= 1},
	[27046]={[0]="治疗宠物",	[51]= 1},
	[34026]={[0]="杀戮命令",	[51]= 1,		[52]=1},
	[34477]={[0]="误导",			[51]= 1},
	[36916]={[0]="猫鼬撕咬",	[51]= 1},
	[14325]={[0]="猎人印记",	[51]= 1,		[52]=2},
	[19506]={[0]="强击光环",	[51]= 1,		[52]=1},
	
	[100000]={[0]="进食",		[51]=2,		[52]=1},
	[100001]={[0]="饮水",		[51]=2,		[52]=1},
	[99992]={[0]="基鲁的胜利之歌",[51]=2,	[52]=1},
	[99991]={[0]="熊怪形态",	[51]=2,		[52]=1},

	[100101]={[0]="狂暴者的召唤",[51]=3,	[52]=1},

	[100201]={[0]="开怪",		[51]=4},
};

NA_HunterActions={	
	[0]={75,27019,34120,53209,34490,27065,27016,13163,27044,34074,34026,27046,14325,19506,100101,100201},	--射击
	[1]={75,27019,34120,53209,34490,27065,27016,13163,27044,34074,34026,27046,14325,19506,100101,100201}, --	
};

NA_CurrSH =	nil;

function	NA_HunterRenewBuffs()
	if(NA_Cast4NoBuffs({19506},	19506, "player"))then return true; end	--强击光环
	return false;
end

function	NA_HunterDps()
	if(W_IsInCombat())then
		-- 保命施法
		if(W_HPlevel("player") < 0.3) then
			if(NA_Cast4NoBuffs({19263}, 19263, "player"))then return true; end	--威慑
			if(CheckInteractDistance("target", 3) and NA_FireSpell(2974, "target"))then return true; end	--摔绊
			--if(CheckInteractDistance("target", 3) and NA_FireSpell(2974, "target"))then return true; end	--冰冻陷阱
			if(CheckInteractDistance("target", 3) and NA_FireSpell(781, "target"))then return true; end	--逃脱
		end

		if(W_TargetCanAttack()) then
			--回蓝
			if(W_PowerLevel("player")	< 0.1 and W_HP("target") > 5000)then 
				if(UnitInBattleground("player") ~= nil or UnitInRaid("player") == nil)then
					--TODO 切换 蝰蛇守护
				else
					local powerType, powerTypeString = UnitPowerType("target");
					if(powerType == 0 and NA_Cast4NoBuffs({3034},	3034, "target", true))	then 
						return	true;	--蝰蛇钉刺
					end
					--TODO 切换 蝰蛇守护
				end
			end

			-- attack
			if(NA_ProfileNo == 0)then
				-- if(W_HP("target") < 5000 and NA_Cast4NoBuffs({14325},	14325, "target")) then	return true; end	--猎人印记
				if(NA_Cast4NoBuffs({34026},	34026, "player"))then return true; end		--杀戮命令
				if(W_PowerLevel("player")	> 0.3	and NA_Cast4NoBuffs({100101, 34074}, 100101,	"player"))then	return true; end	--狂暴者的召唤
				
				if(NA_FireSpell(34490, "target")) then	return true; end -- 沉默射击
				if(NA_FireSpell(53209, "target")) then	return true; end -- 奇美拉射击
				if(NA_FireSpell(27065, "target")) then	return true; end -- 瞄准射击
				if(NA_Cast4NoBuffs({27016, 3034},	27016, "target", true))	then return	true;	end	--毒蛇钉刺
				if(NA_FireSpell(27019, "target")) then	return true; end -- 奥术射击
				if(NA_FireSpell(34120, "target")) then	return true; end -- 稳固射击
			elseif(NA_ProfileNo == 1)then
				if(NA_Cast4NoBuffs({34026},	34026, "player"))then return true; end		--杀戮命令
				if(W_PowerLevel("player")	> 0.3	and NA_Cast4NoBuffs({100101, 34074}, 100101,	"player"))then	return true; end	--狂暴者的召唤
				if(NA_Cast4NoBuffs({27016, 3034},	27016, "target", true))	then return	true;	end	--毒蛇钉刺
				-- 一键宏
				NA_ShowVars(900);
				return true;
			end
		elseif(UnitCanAssist("player", "target") and UnitIsPlayer("target"))then
			if(NA_ProfileNo == 0)then
				--TODO
			elseif(NA_ProfileNo == 1)then
				--TODO
			end			
			return false;
		end
	else
		if(NA_Cast4NoBuffs({19506}, 19506, "player"))then return true; end	--强击光环

		--start attack
		if(W_TargetCanAttack())then
			if(NA_Cast4NoBuffs({14325}, 100201, "target")) then	return true; end	--开怪
		end
		return false;
	end
	return false;
end