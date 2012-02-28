--- 冰法 
--todo 自利 联盟徽记 召唤水元素 深度冻结 达图尔的变形魔棒 恢复
--0:name, 2:rank, 3:icon, 4:cost, 5:isFunnel, 6:powerType, 7:castTime, 8:minRange, 9:maxRange, 51:spell1/buff2/item3/marco4, 52:buff/debuff
NA_MageInfo={
	[38697]={[0]="寒冰箭",			[51]=1},
	[27079]={[0]="火焰冲击",		[51]=1},
	[30455]={[0]="冰枪术",			[51]=1},
	[27074]={[0]="灼烧",				[51]=1},
	[38692]={[0]="火球术",			[51]=1},
	[ 1953]={[0]="闪现术",			[51]=1},
	[27088]={[0]="冰霜新星",		[51]=1},
	[27087]={[0]="冰锥术",			[51]=1},
	[27080]={[0]="魔爆术",			[51]=1},
	[ 2139]={[0]="法术反制",		[51]=1},
	[12826]={[0]="变形术",			[51]=1},
	[  475]={[0]="解除诅咒",		[51]=1},
	[30449]={[0]="法术偷取",		[51]=1},
	[   66]={[0]="隐形术",			[51]=1},
	[27126]={[0]="奥术智慧",		[51]=1},
	[33944]={[0]="魔法抑制",		[51]=1},
	[30482]={[0]="熔岩护甲",		[51]=1,	[52]=1},
	[27124]={[0]="冰甲术",			[51]=1},
	[27125]={[0]="法师护甲",		[51]=1},
	[27131]={[0]="法力护盾",		[51]=1},
	[12051]={[0]="唤醒",				[51]=1,	[52]=1},
	[33946]={[0]="魔法增效",		[51]=1},
	[27127]={[0]="奥术光辉",		[51]=1},
	[32796]={[0]="防护冰霜结界",	[51]=1},
	[27128]={[0]="防护火焰结界",	[51]=1},
	[27101]={[0]="制造法力宝石",	[51]=1},
	[27134]={[0]="寒冰护体",		[51]=1},
	[45438]={[0]="寒冰屏障",		[51]=1},
	[44549]={[0]="思维冷却",		[51]=1},
	[11958]={[0]="急速冷却",		[51]=1},
	[30451]={[0]="奥术冲击",		[51]=1,	[52]=2},
	[44780]={[0]="奥术弹幕",		[51]=1},
	[38704]={[0]="奥术飞弹",		[51]=1},
	[12042]={[0]="奥术强化",		[51]=1,	[52]=1},
	[12043]={[0]="气定神闲",		[51]=1,	[52]=1},
	
	[99999]={[0]="火球！",			[51]=2,	[52]=1},
	[99998]={[0]="寒冰指",			[51]=2,	[52]=1},
	[99997]={[0]="深度冻结",		[51]=2,	[52]=1},
	[99996]={[0]="深冬寒",			[51]=2,	[52]=1},
	[99995]={[0]="霜冻新星",		[51]=2,	[52]=1},
	[99994]={[0]="愤怒圣印",		[51]=2,	[52]=1},
	[99993]={[0]="邪甲术",			[51]=2,	[52]=1},
	[99992]={[0]="基鲁的胜利之歌",[51]=2,	[52]=1},
	[ 2209]={[0]="飞弹速射",		[51]=2,	[52]=1},
	[99991]={[0]="熊怪形态",		[51]=2,	[52]=1},	
	[100000]={[0]="进食",			[51]=2,	[52]=1},
	[100001]={[0]="喝水",			[51]=2,	[52]=1},

	[100010]={[0]="法力刚玉",		[51]=3},
	[100011]={[0]="达图尔的变形魔棒",[51]=3},
	[100101]={[0]="妖术之头",		[51]=3,	[52]=1},
};

NA_MageActions={	
	[0]={27101,27131,38697,27079,30455,27074,38692,27087,45438,30449,27126,33944,30482,27125,27134,12051,100010,100101}, --冰法
	[1]={27101,27131,30451,44780,38704,38697,27079,30455,27074,38692,27087,45438,30449,27126,33944,30482,27125,27134,12051,12042,12043,27128,100010,100101}, --奥法	
};

function NA_MageDps()
	--解除诅咒
	local zuzhou = {};
	if((UnitExists("target") ~= 1 or W_TargetCanAttack()) and NA_Cast4DeBuffs(zuzhou, 475, "player"))then 
		return true; 
	elseif(UnitExists("target") == 1 and not W_TargetCanAttack() and NA_Cast4DeBuffs(zuzhou, 475, "target"))then
		return true; 
	end

	if(W_IsInCombat())then
		--保命施法
		if(W_HPlevel("player") < 0.3) then
			if(W_HPlevel("player") < 0.1 and NA_FireSpell(45438, "player"))then 
				return true;
			end --寒冰屏障

			if(NA_Cast4NoBuffs({27134}, 27134, "player")	--寒冰护体
				or NA_Cast4NoBuffs({27131}, 27131, "player")--法力护盾
			)then return true; end
		end

		--防护火焰结界
		if(NA_Cast4DeBuffs({"火焰之花", "燃烧", "烈焰触摸", "烈焰灼热"}, 27128, "player"))then 
			return true; 
		end

		if(W_TargetCanAttack()) then
			-- 法术偷取 ->愤怒圣印 邪甲术
			if(not W_checkBuffs({99994,99993}, "player") and W_checkBuffs({99994,99993}, "target")
				and NA_FireSpell(30449, "target")) then return true; end

			-- 法力刚玉/唤醒
			if(W_PowerLevel("player") < 0.70 and NA_FireSpell(100010, "player"))then return true; end --法力刚玉
			if(W_PowerLevel("player") < 0.05 and W_IsUsableSpell(12051, "player"))then 
				W_Log(5,"唤醒");
			end --唤醒

			--------------------------------------------------------------------------------------------
			-- attack
			if(NA_ProfileNo == 0)then
	--			if(NA_targetSpell({99999}, 38692, "player")) then return true; end	--火球! -> 火球术
	--			if(NA_targetSpell({99998}, 30455, "player")) then return true; end	--寒冰指 -> 冰枪术
	--			if(NA_targetSpell({99997}, 30455, "player")) then return true; end	--深度冻结 -> 冰枪术

	--			if(NA_FireSpell(27079, "target")) then return true; end --火焰冲击
--				if(W_HP("target") < 310 and NA_FireSpell(30455, "target")) then return true; end	--冰枪术
--				if(W_HP("target") < 710 and NA_FireSpell(27074, "target")) then return true; end	--灼烧
--				if(W_HP("target") < 900 and NA_FireSpell(30455, "target")) then return true; end	--冰枪术
				--target 距离<9.9 码 -> 冰锥术
	--			if(CheckInteractDistance("target", 3) and NA_FireSpell(27087, "target")) then return true; end
			elseif(NA_ProfileNo == 1)then
				if(NA_FireSpell(12043, "player"))then return true; end --气定神闲

				if(NA_Cast4NoBuffs({12043}, 12042, "player"))then return true; end --没有 气定神闲 就 奥术强化
				
				if(W_PowerLevel("player")	> 0.5	and NA_Cast4NoBuffs({100101, 12043}, 100101,	"player"))then return true; end	--妖术之头

				if(UnitInBattleground("player") ~= nil --战场
					or UnitIsPlayer("target") ~= false --敌对玩家
					or (UnitHealthMax("target") ~= 1 and UnitLevel("target") == -1 and UnitHealthMax("target") < 40000) --骷髅级boss
					or (UnitHealthMax("target") ~= 1 and UnitLevel("target") ~= -1 and UnitHealthMax("target") < 7000) --普通怪
				)then
					if(NA_FireSpell(44780, "target")) then return true; end	--奥术弹幕
					if(NA_FireSpell(27079, "target")) then return true; end	--火焰冲击
					if(NA_FireSpell(38704, "target")) then return true; end	--奥术飞弹
				else
					if(W_BuffCount(30451, "player")<2 and NA_FireSpell(30451, "target"))then --奥术冲击
						return true; 
					end

					if(W_BuffCount(30451, "player")==2 and NA_FireSpell(30451, "target"))then --奥术冲击
						return true; 
					end
					if(NA_FireSpell(38704, "target")) then return true; end	--奥术飞弹
				end
				if(NA_FireSpell(44780, "target")) then return true; end	--奥术弹幕
				if(NA_FireSpell(27079, "target")) then return true; end	--火焰冲击
				if(NA_FireSpell(38704, "target")) then return true; end	--奥术飞弹
			end
		end
	else
		if(UnitExists("target") ~= 1 or (UnitName("target") ~= UnitName("player")) and (
			NA_Cast4NoBuffs({27126,27127,99992}, 27126, "player")	--奥术智慧,  奥术光辉, 基鲁的胜利之歌
			or NA_Cast4NoBuffs({33944}, 33944, "player")--魔法抑制
			or NA_Cast4NoBuffs({99993,30482,27125,27124}, 30482, "player")--邪甲术,熔岩护甲,法师护甲,冰甲术 ->熔岩护甲
			-- or NA_Cast4NoBuffs({99991}, 100011, "player")--达图尔的变形魔棒
			or NA_Cast4NoBuffs({27134}, 27134, "player")--寒冰护体
			-- or NA_Cast4NoBuffs({27131}, 27131, "player")--法力护盾
		))then return true; end

		--制造法力宝石
		if(W_PowerLevel("player") > 0.8 and GetItemCount(NA_ClassInfo[100010][0]) < 1)then
			if(NA_FireSpell(27101, "player")) then return true; end -- 制造法力宝石
		end

		--start attack
		if(W_TargetCanAttack() and NA_ProfileNo == 0)then
			-- if(NA_FireSpell(38697, "target")) then return true; end -- 寒冰箭
		elseif(W_TargetCanAttack() and NA_ProfileNo == 1)then
			if(NA_FireSpell(30451, "target")) then return true; end -- 奥术冲击
		end
		return false;
	end
	return false;
end
