local listSpell = {}, {}
local listItem = {},{}

function initAllInfo(unitClass, unitLevel, telants)

if unitClass=="WARRIOR" then --1--战士
	if(unitLevel>=1)then listSpell["ability_throw"] = 122475; end   --投掷--向一个敌方目标投掷一把匕首。
	if(unitLevel>=1)then listSpell["ability_rogue_ambush"] = 78; end   --英勇打击--一次攻击，立即造成110%的武器伤害外加549点伤害（如果装备了单手武器，则造成154%的武器伤害外加769点伤害）。<br/><br/>适合在怒气值过剩时使用。
	if(unitLevel>=1)then listSpell["ability_warrior_offensivestance"] = 2457; end   --战斗姿态--攻击型的战斗姿态。<br/><br/>普通近战攻击产生的怒气值提高。
	if(unitLevel>=3)then listSpell["ability_warrior_charge"] = 100; end   --冲锋--向一名敌人冲锋，使其昏迷，持续1.50秒。产生20点怒气值。
	if(unitLevel>=5)then listSpell["ability_warrior_devastate"] = 34428; end   --乘胜追击--立即攻击目标，造成1,278点伤害，并为你恢复最大生命值的20%。<br/><br/>只能在杀死一个可为你提供经验值或荣誉值的敌人后的20秒内使用。
	if(unitLevel>=7)then listSpell["inv_sword_48"] = 5308; end   --斩杀--尝试解决掉一个受伤的敌人，对其造成7,031点物理伤害。只能对生命值低于20%的敌人使用。
	if(unitLevel>=9)then listSpell["ability_warrior_defensivestance"] = 71; end   --防御姿态--坦克战斗姿态。<br/><br/>受到的伤害降低25%。<br/>显著提高产生的威胁值。<br/>处于战斗中时，每3秒产生1点怒气值。
	if(unitLevel>=12)then listSpell["spell_nature_reincarnation"] = 355; end   --嘲讽--嘲讽目标，使其向你发起攻击，但是对已经在攻击你的目标无效。
	if(unitLevel>=16)then listSpell["ability_warrior_sunder"] = 7386; end   --破甲攻击--击碎目标的护甲，对其造成破甲效果。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_warrior_sunder.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">破甲</span><br/>使目标的护甲值降低4%，持续30秒。该效果最多可叠加3次。
	if(unitLevel>=20)then listSpell["spell_nature_thunderclap"] = 6343; end   --雷霆一击--冲击8码范围内的敌人，造成338点伤害，并使其受到虚弱打击的影响。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=22)then listSpell["inv_axe_66"] = 57755; end   --英勇投掷--将你的武器掷向敌人，造成50%的武器伤害。
	if(unitLevel>=24)then listSpell["inv_gauntlets_04"] = 6552; end   --拳击--击打目标，打断其正在施放的法术，并使其在4秒内不能施放该系法术。
	if(unitLevel>=28)then listSpell["ability_warrior_disarm"] = 676; end   --缴械--缴械敌人的武器和护盾，持续8秒。被缴械后，目标造成的伤害大大降低。
	if(unitLevel>=34)then listSpell["ability_racial_avatar"] = 2458; end   --狂暴姿态--鲁莽的战斗姿态。<br/><br/>普通近战攻击产生一些怒气值，受到的伤害产生一些怒气值。
	if(unitLevel>=36)then listSpell["ability_shockwave"] = 1715; end   --断筋--使敌人残废，移动速度降低50%，持续15秒。
	if(unitLevel>=42)then listSpell["ability_warrior_battleshout"] = 6673; end   --战斗怒吼--100码范围内的所有小队和团队成员的攻击强度提高10%。持续5分钟。<br/><br/>产生20点怒气值。
	if(unitLevel>=44)then listSpell["ability_warrior_cleave"] = 845; end   --顺劈斩--横扫攻击，对目标及其附近的一个额外目标造成82%的武器伤害（如果装备了单手武器则造成115%的武器伤害）。<br/><br/>适合在怒气值过剩时使用。
	if(unitLevel>=48)then listSpell["ability_warrior_shieldwall"] = 871; end   --盾墙--受到的所有伤害降低40%，持续12秒。
	if(unitLevel>=52)then listSpell["ability_golemthunderclap"] = 5246; end   --破胆怒吼--使目标敌人因恐惧而畏缩，并使8码范围内最多5个敌人因恐惧而逃跑。持续8秒。
	if(unitLevel>=54)then listSpell["spell_nature_ancestralguardian"] = 18499; end   --狂暴之怒--你被激怒，产生10点怒气值，并使你的物理伤害提高10%，持续6秒。<br/><br/>在狂暴之怒持续时间内还会移除并免疫恐惧、闷棍和瘫痪效果。
	if(unitLevel>=62)then listSpell["ability_criticalstrike"] = 1719; end   --鲁莽--使你的特殊攻击造成爆击的几率额外提高30%。持续12秒。
	if(unitLevel>=66)then listSpell["ability_warrior_shieldreflection"] = 23920; end   --法术反射--举起你的盾牌，反射下一个对你施放的法术。持续5秒。
	if(unitLevel>=68)then listSpell["ability_warrior_rallyingcry"] = 469; end   --命令怒吼--附近100码范围内所有小队和团队成员的耐力提高10%。持续5分钟。<br/><br/>产生20点怒气值。
	if(unitLevel>=72)then listSpell["ability_warrior_victoryrush"] = 3411; end   --援护--高速跑向一名小队或团队成员，并且在随后的10秒内，只要目标仍然处于你周围10码范围内，你将代替目标承受下一次近战或远程攻击。
	if(unitLevel>=74)then listSpell["ability_warrior_shatteringthrow"] = 64382; end   --碎裂投掷--将你的武器掷向敌人，造成41点伤害，并使目标的护甲值降低20%，持续10秒，或移除所有无敌效果。
	if(unitLevel>=83)then listSpell["ability_toughness"] = 97462; end   --集结呐喊--暂时使你和30码内的所有小队或团队成员获得20%的最大生命值，持续10秒。效果结束后，这些生命值将会被扣除。
	if(unitLevel>=85)then listSpell["ability_heroicleap"] = 6544; end   --英勇飞跃--朝目标区域腾空跃起，同时以毁灭性的力量重击地面，对8码范围内的所有敌人造成30点物理伤害。
	if(unitLevel>=87)then listSpell["mocking_banner"] = 114192; end   --挑战战旗--在30码范围内投掷一面战旗，强迫战旗周围15码范围内的所有敌人攻击战士，持续6秒。战旗持续30秒。<br/><br/>你可以援护你的战旗。
	if(unitLevel>=87)then listSpell["demoralizing_banner"] = 114203; end   --挫志战旗--在30码范围内投掷一面战旗，使战旗周围30码范围内所有敌人造成的伤害降低10%。持续15秒。<br/><br/>你可以援护你的战旗。
	if(unitLevel>=87)then listSpell["warrior_skullbanner"] = 114207; end   --颅骨战旗--在身边投掷一面战旗，使战旗周围40码范围内的小队或团队成员的爆击伤害提高20%。持续10秒。<br/><br/>你可以援护你的战旗。
	--武器--bg-warrior-arms
	if(telants == "Arms")then
	if(unitLevel>=10)then listSpell["ability_warrior_savageblow"] = 12294; end   --致死打击--一次残忍的突袭，对目标造成175%点武器伤害外加2,693点伤害，并对目标造成致死之伤的效果。<br/><br/>产生10点怒气值。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_criticalstrike.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">致死之伤</span><br/>重伤目标，使其受到的所有治疗效果降低，持续10秒。
	if(unitLevel>=18)then listSpell["ability_warrior_decisivestrike"] = 1464; end   --猛击--猛击敌人，对其造成220%的武器伤害外加2,193点伤害。
	if(unitLevel>=26)then listSpell["ability_whirlwind"] = 1680; end   --旋风斩--像旋风一般挥舞你手中的武器攻击8码内的所有敌人，对每一个敌人都造成85%的武器伤害。
	if(unitLevel>=30)then listSpell["ability_meleedamage"] = 7384; end   --压制--立刻压制敌人，造成105%的武器伤害。无法被格档、躲闪或招架。压制造成爆击的几率提高60%。<br/><br/>血之气息可以激活压制。
	if(unitLevel>=56)then listSpell["ability_warrior_challange"] = 118038; end   --剑在人在--使你的招架几率提高100%，并使你受到的伤害降低20%，持续8秒。
	if(unitLevel>=60)then listSpell["ability_rogue_slicedice"] = 12328; end   --横扫攻击--你的近战攻击可以额外攻击附近的一个敌人。持续10秒。
	if(unitLevel>=81)then listSpell["ability_warrior_colossussmash"] = 86346; end   --巨人打击--一次倾尽全力的打击，造成175%的武器伤害外加3,882点伤害并削弱其防御，允许你的攻击无视其100%的护甲，持续6秒，并在目标身上造成物理易伤效果。对玩家的无视护甲效果降低。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_deathknight_brittlebones.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">物理易伤</span><br/>削弱一名敌方目标的体质，使其受到的物理伤害提高4%，持续30秒。
	end
	--狂怒--bg-warrior-fury
	if(telants == "Fury")then
	if(unitLevel>=10)then listSpell["spell_nature_bloodlust"] = 23881; end   --嗜血--立即攻击目标，用你的主手武器对其造成90%的武器伤害外加1,121点伤害，并使你恢复1%的生命值。嗜血造成爆击的几率为正常几率的两倍。<br/><br/>产生10点怒气值。
	if(unitLevel>=18)then listSpell["spell_warrior_wildstrike"] = 100130; end   --狂风打击--使用你的副手武器进行迅疾的打击，对目标造成230%的武器伤害外加1,003点伤害，并对目标造成致死之伤的效果。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_criticalstrike.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">致死之伤</span><br/>重伤目标，使其受到的所有治疗效果降低，持续10秒。
	if(unitLevel>=26)then listSpell["ability_whirlwind"] = 1680; end   --旋风斩--像旋风一般挥舞你手中的武器攻击8码内的所有敌人，对每一个敌人都造成85%的武器伤害。
	if(unitLevel>=30)then listSpell["warrior_wild_strike"] = 85288; end   --怒击--一次强力打击，用两把近战武器造成190%武器伤害。<br/><br/>只有在激怒状态下才能使用。<br/><br/>仅限2次。
	if(unitLevel>=56)then listSpell["ability_warrior_challange"] = 118038; end   --剑在人在--使你的招架几率提高100%，并使你受到的伤害降低20%，持续8秒。
	if(unitLevel>=81)then listSpell["ability_warrior_colossussmash"] = 86346; end   --巨人打击--一次倾尽全力的打击，造成175%的武器伤害外加3,882点伤害并削弱其防御，允许你的攻击无视其100%的护甲，持续6秒，并在目标身上造成物理易伤效果。对玩家的无视护甲效果降低。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_deathknight_brittlebones.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">物理易伤</span><br/>削弱一名敌方目标的体质，使其受到的物理伤害提高4%，持续30秒。
	end
	--防护--bg-warrior-protection
	if(telants == "Protection")then
	if(unitLevel>=10)then listSpell["inv_shield_05"] = 23922; end   --盾牌猛击--用你的盾牌猛击目标，造成13,756点到14,456点伤害。<br/><br/>在防御姿态下产生20点怒气值。
	if(unitLevel>=18)then listSpell["ability_defend"] = 2565; end   --盾牌格挡--举起你的盾牌，格挡每一次对你发动的近战攻击，持续6秒。这些格挡可以是精确格挡。
	if(unitLevel>=26)then listSpell["inv_sword_11"] = 20243; end   --毁灭打击--造成220%的武器伤害外加3,647点伤害，并击碎目标的护甲，对其造成破甲效果。<br/><br/>代替破甲攻击。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_warrior_sunder.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">破甲</span><br/>使目标护甲降低4%，持续30秒。效果最多可叠加3次。
	if(unitLevel>=30)then listSpell["ability_warrior_revenge"] = 6572; end   --复仇--立即反击一名和额外两名其他敌人，造成9,383点伤害。一次成功躲闪或招架后会重置复仇的冷却时间。<br/><br/>在防御姿态下产生15点怒气值。
	if(unitLevel>=38)then listSpell["spell_holy_ashestoashes"] = 12975; end   --破釜沉舟--使当前生命值和最大生命值分别提高30%，持续20秒。
	if(unitLevel>=56)then listSpell["ability_warrior_warcry"] = 1160; end   --挫志怒吼--挫锐10码范围内的所有敌人，使其对你造成的伤害降低20%，持续10秒。
	if(unitLevel>=81)then listSpell["inv_shield_07"] = 112048; end   --盾牌屏障--举起你的盾牌，在接下来的6秒内吸收95点伤害。<br/><br/>最多消耗60点怒气值以提高吸收的伤害。攻击强度越高，吸收的伤害越多。
	end
	-------------------------talent-------------------------
	if(unitLevel>=30)then listSpell["ability_warrior_focusedrage"] = 55694; end   --狂怒回复--立即为你恢复总生命值的5%，并在5秒内额外恢复5%的生命值。<br/><br/>可在昏迷时使用。<br/><br/>如果在激怒状态下使用则效果加倍。
	if(unitLevel>=30)then listSpell["spell_impending_victory"] = 103840; end   --胜利在望--立即攻击目标，造成1,278点伤害，并为你恢复15%的最大生命值。<br/><br/>杀死一个可为你提供经验值或荣誉值的敌人将重置胜利在望的冷却时间，并使你的下一个胜利在望为你恢复20%的最大生命值。<br/><br/>代替乘胜追击。
	if(unitLevel>=45)then listSpell["ability_bullrush"] = 107566; end   --错愕怒吼--使20码范围内被诱捕的所有敌人定身，在5秒内无法移动。受到伤害可能会打断该效果。
	if(unitLevel>=45)then listSpell["spell_shadow_deathscream"] = 12323; end   --刺耳怒吼--诱捕15码范围内的所有敌人，使其移动速度降低50%，持续15秒。
	if(unitLevel>=45)then listSpell["warrior_disruptingshout"] = 102060; end   --瓦解怒吼--打断10码范围内的所有施法，并使受影响的目标在4秒内无法施放该系法术。
	if(unitLevel>=60)then listSpell["ability_warrior_bladestorm"] = 46924; end   --剑刃风暴--你变成一股具有毁灭性力量的旋风风暴，打击8码范围内的所有目标，每1秒造成120%的武器伤害，持续6秒。<br/><br/>在剑刃风暴中，你可以持续躲闪、格挡和招架，并免疫移动限制效果和一切使你的角色不受控制的效果。但是，你只能使用怒吼技能。
	if(unitLevel>=60)then listSpell["ability_warrior_shockwave"] = 46968; end   --震荡波--向你前方的锥形区域释放一道强大的能量波，造成43点伤害，并使10码范围内的所有敌方目标昏迷4秒。<br/><br/>对3个或更多目标造成伤害时，会使得下一次震荡波的冷却时间缩短20秒。
	if(unitLevel>=60)then listSpell["ability_warrior_dragonroar"] = 118000; end   --巨龙怒吼--凶猛地咆哮，对8码范围内的所有敌人造成206点伤害，将其击退的同时将其击倒，持续0.50秒。巨龙怒吼总能造成爆击，并忽略目标身上的所有护甲。
	if(unitLevel>=75)then listSpell["ability_warrior_shieldbreak"] = 114028; end   --群体反射--反射下一个对你和20码内所有的小队及团队成员施放的法术，持续5秒。
	if(unitLevel>=75)then listSpell["ability_warrior_safeguard"] = 114029; end   --捍卫--高速跑向一名小队或团队成员，移除你身上的所有移动限制效果，拦截对其进行的下一次近战或远程攻击并使其受到的伤害降低20%，持续6秒。<br/><br/>代替援护。
	if(unitLevel>=75)then listSpell["ability_warrior_vigilance"] = 114030; end   --警戒--使你专注于保护小队或团队中的一个友方目标，将其所受伤害的30%转移给你，持续12秒。<br/><br/>警戒持续期间，你的嘲讽没有冷却时间。
	if(unitLevel>=90)then listSpell["warrior_talent_icon_avatar"] = 107574; end   --天神下凡--你变身成一个势不可挡的巨人，持续24秒。解除所有诱捕和定身效果，并提高20%的伤害。
	if(unitLevel>=90)then listSpell["ability_warrior_bloodbath"] = 12292; end   --浴血奋战--在接下的12秒内，你的近战特殊攻击将使受害者流血并额外造成30%的伤害，持续6秒。流血时，目标的移动速度降低50%。
	if(unitLevel>=90)then listSpell["warrior_talent_icon_stormbolt"] = 107570; end   --风暴之锤--将你的武器掷向一个敌人，造成125%的武器伤害，并使其昏迷3秒。对永久免疫昏迷效果的目标额外造成375%的武器伤害。
end
if unitClass=="PALADIN" then --2--圣骑士
	if(unitLevel>=1)then listSpell["spell_holy_crusaderstrike"] = 35395; end   --十字军打击--瞬发攻击，造成125%的武器伤害外加791点伤害。
	if(unitLevel>=3)then listSpell["spell_holy_sealofblood"] = 105361; end   --命令圣印--圣光充满你的全身，使你的近战攻击可额外造成10%的神圣伤害。
	if(unitLevel>=5)then listSpell["spell_holy_righteousfury"] = 20271; end   --审判--释放一个圣印的能量，造成744点神圣伤害。
	if(unitLevel>=7)then listSpell["spell_holy_sealofmight"] = 853; end   --制裁之锤--使目标昏迷6秒。
	if(unitLevel>=9)then listSpell["inv_helmet_96"] = 85673; end   --荣耀圣令--消耗最多3层神圣能量来为一个友方目标治疗，每层效果恢复5,629点生命值。
	if(unitLevel>=12)then listSpell["spell_holy_sealoffury"] = 25780; end   --正义之怒--激活时将提高你所产生的威胁值，使你成为一个更有效的坦克。
	if(unitLevel>=13)then listSpell["spell_holy_resurrection"] = 7328; end   --救赎--复活一个死去的玩家，复活后该玩家拥有35%的生命值和法力值。无法在战斗中使用。
	if(unitLevel>=14)then listSpell["spell_holy_flashheal"] = 19750; end   --圣光闪现--一次快速但消耗法力值较高的治疗，为盟友目标恢复12,816点生命值。
	if(unitLevel>=15)then listSpell["spell_holy_unyieldingfaith"] = 62124; end   --清算--嘲讽目标，使其攻击你，但是对已经在攻击你的目标无效。
	if(unitLevel>=16)then listSpell["spell_holy_layonhands"] = 633; end   --圣疗术--治疗一个友方目标，数值相当于你的最大生命值。<br/><br/>无法对有自律效果的目标使用。造成自律效果，持续1分钟。
	if(unitLevel>=18)then listSpell["spell_holy_divineshield"] = 642; end   --圣盾术--你对所有的伤害和法术攻击免疫，持续8秒，但造成的伤害降低50%。<br/><br/>无法对有自律效果的目标使用。造成自律效果，持续1分钟。
	if(unitLevel>=20)then listSpell["spell_nature_swiftness"] = 73629; end   --召唤主教的雷象--召唤主教的雷象坐骑。
	if(unitLevel>=20)then listSpell["spell_nature_swiftness"] = 13819; end   --召唤战马--召唤一匹战马作为你的坐骑。
	if(unitLevel>=20)then listSpell["spell_nature_swiftness"] = 34769; end   --召唤萨拉斯战马--召唤一匹萨拉斯战马作为你的坐骑。
	if(unitLevel>=20)then listSpell["spell_holy_purify"] = 4987; end   --清洁术--净化一个友方目标，移除所有中毒和疾病效果。
	if(unitLevel>=20)then listSpell["ability_mount_kodo_03"] = 69820; end   --召唤烈日行者科多兽--召唤一头烈日行者科多兽。
	if(unitLevel>=24)then listSpell["spell_holy_sealofvengeance"] = 31801; end   --真理圣印--圣光充满你的全身，使你的近战攻击可额外造成相当于12%武器伤害的神圣伤害，并对目标造成谴罚效果。<br/><br/>代替命令圣印。<br/><br/><span style="color: #ffffff;">谴罚</span><br/><br/>15秒内额外造成625点神圣伤害，最多可叠加5次。
	if(unitLevel>=26)then listSpell["spell_holy_divineprotection"] = 498; end   --圣佑术--受到的法术伤害降低40%。持续10秒。
	if(unitLevel>=30)then listSpell["spell_magic_greaterblessingofkings"] = 20217; end   --王者祝福--为友方目标施加祝福，使其力量、敏捷和智力提高5%。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会获得此效果。每个圣骑士在同一时间只能为目标施加一种祝福。
	if(unitLevel>=32)then listSpell["spell_holy_healingaura"] = 20165; end   --洞察圣印--圣光充满你的全身，使你的施法速度提高10%，治疗法术的治疗效果提高5%，并使你的近战攻击有一定几率为你恢复37点生命值，并恢复4%的基础法力值。
	if(unitLevel>=36)then listSpell["spell_holy_rebuke"] = 96231; end   --责难--打断施法并使该系法术在4秒内无法施放。
	if(unitLevel>=38)then listSpell["spell_paladin_hammerofwrath"] = 24275; end   --愤怒之锤--掷出一把魔法之锤击打敌人，造成2,140点神圣伤害。只能对生命值不高于20%的敌人使用。
	if(unitLevel>=40)then listSpell["ability_mount_charger"] = 34767; end   --召唤萨拉斯军马--召唤一匹萨拉斯军马作为你的坐骑。
	if(unitLevel>=40)then listSpell["ability_mount_charger"] = 73630; end   --召唤大主教的雷象--召唤一头大主教的雷象。
	if(unitLevel>=40)then listSpell["ability_mount_kodosunwalkerelite"] = 69826; end   --召唤巨型烈日行者科多兽--召唤一头巨型烈日行者科多兽。
	if(unitLevel>=40)then listSpell["ability_mount_charger"] = 23214; end   --召唤军马--召唤一匹军马作为你的坐骑。
	if(unitLevel>=42)then listSpell["spell_holy_righteousnessaura"] = 20154; end   --正义圣印--圣光充满你的全身，使你的近战攻击可对8码范围内的所有目标造成9%的武器伤害。
	if(unitLevel>=46)then listSpell["ability_paladin_turnevil"] = 10326; end   --超度邪恶--圣光的力量强迫一个亡灵、畸变怪或恶魔目标逃跑，最多持续40秒。一次只能超度一个目标。
	if(unitLevel>=48)then listSpell["spell_holy_sealofprotection"] = 1022; end   --保护之手--为小队或团队成员施加圣手，使其免疫所有物理攻击，持续10秒，但在此期间，不能攻击或使用物理技能。每个圣骑士在同一时间只能为目标施加一种圣手效果，同类型圣手效果不能重叠。<br/><br/>无法对有自律效果的目标使用。造成自律效果，持续1分钟。
	if(unitLevel>=52)then listSpell["spell_holy_sealofvalor"] = 1044; end   --自由之手--为友方目标施加自由之手，使其免疫任何移动限制效果，持续6秒。每个圣骑士在同一时间内只能给目标施加一种圣手效果，同类型的圣手效果不能重叠。
	if(unitLevel>=60)then listSpell["spell_holy_auramastery"] = 31821; end   --虔诚光环--鼓舞40码范围内的所有小队和团队成员，使其免疫沉默和打断效果，并使其受到的所有魔法伤害降低20%。持续6秒。
	if(unitLevel>=66)then listSpell["spell_holy_sealofsalvation"] = 1038; end   --拯救之手--为小队或团队成员施加圣手，暂时为其移除所有的威胁值，持续10秒。每个圣骑士在同一时间只能为目标施加一种圣手效果。
	if(unitLevel>=72)then listSpell["spell_holy_avenginewrath"] = 31884; end   --复仇之怒--造成的所有伤害和治疗量提高20%，持续20秒。
	if(unitLevel>=80)then listSpell["spell_holy_sealofsacrifice"] = 6940; end   --牺牲之手--为小队或团队成员施加圣手，将所受伤害的30%转移给圣骑士，持续12秒或直到其转移了全部的生命值。每个圣骑士在同一时间只能为玩家施加一种圣手效果。
	if(unitLevel>=81)then listSpell["spell_holy_greaterblessingofkings"] = 19740; end   --力量祝福--为友方目标施加祝福，使其精通提高3,000点。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会获得此效果。每个圣骑士在同一时间只能为玩家施加一种祝福。
	if(unitLevel>=87)then listSpell["ability_paladin_blindinglight"] = 115750; end   --盲目之光--向四面八方发出耀眼的光芒，使10码范围内的敌人暂时失明，并使其迷惑地乱转，持续6秒。
	--神圣--bg-paladin-holy
	if(telants == "Holy")then
	if(unitLevel>=10)then listSpell["spell_holy_searinglight"] = 20473; end   --神圣震击--以神圣能量冲击目标，对一个敌人造成1,681点神圣伤害，或者为一个盟友目标恢复9,544点生命值，并获得一层神圣能量。<br/><br/>神圣震击有25%的额外几率造成爆击。
	if(unitLevel>=20)then listSpell["spell_holy_purifyingpower"] = 2812; end   --谴责--射出一支圣光之箭冲击敌人，造成3,711点神圣伤害，并使目标在接下来的4秒内无法造成爆击效果。
	if(unitLevel>=28)then listSpell["spell_paladin_divinecircle"] = 82327; end   --圣光普照--向一个友方目标注入发散的能量，为该目标恢复5,790点生命值，并为其周围10码范围内的所有盟友恢复生命值，数值相当于目标恢复生命值的50%。获得一层神圣能量。<br/><br/>如果治疗效果区域内的玩家目标超过6个，治疗效果将会降低。
	if(unitLevel>=34)then listSpell["spell_holy_holybolt"] = 635; end   --圣光术--治疗友方目标，为其恢复9,014点生命值。
	if(unitLevel>=39)then listSpell["ability_paladin_beaconoflight"] = 53563; end   --圣光道标--目标变成圣光道标，照耀60码范围内的所有小队和团队成员。<br/><br/>一次只能指定一个目标成为圣光道标。<br/><br/><span style="color: #ffffff;">圣光道标</span><br/>你施放的圣光术也会令圣光道标受到治疗，数值相当于该次治疗量的100%。你的圣光普照、黎明之光、圣光之锤和神圣棱镜也会令圣光道标受到治疗，数值相当于该次治疗量的15%。其他所有治疗技能都能令圣光道标受到相当于该次治疗量50%的治疗。
	if(unitLevel>=46)then listSpell["spell_holy_aspiration"] = 54428; end   --神圣恳求--你在9秒内回复12%的总法力值，但你的治疗法术的治疗量降低50%。
	if(unitLevel>=54)then listSpell["spell_holy_surgeoflight"] = 82326; end   --神圣之光--一次强大的治疗，为友方目标回复17,095点生命值。适合治疗严重伤害。
	if(unitLevel>=62)then listSpell["spell_holy_divineillumination"] = 31842; end   --神恩术--使你的法术急速提高20%，法术爆击几率提高20%，持续20秒。
	if(unitLevel>=70)then listSpell["spell_paladin_lightofdawn"] = 85222; end   --黎明圣光--消耗最多3层神圣能量，发出一道治疗能量波，对30码范围内最多6名受伤最重的小队或团队成员进行治疗，每层神圣能量将使其恢复1,748点生命值。
	if(unitLevel>=75)then listSpell["spell_holy_heroism"] = 86669; end   --远古列王守卫--召唤一个远古列王守卫来协助你治疗，持续30秒。<br/><br/>远古列王守卫将治疗你随后5个单体治疗法术的目标和附近其他友方目标，其治疗量相当于你造成的治疗效果的10%。守卫每次进行治疗时，你的急速提高10%。
	end
	--防护--bg-paladin-protection
	if(telants == "Protection")then
	if(unitLevel>=10)then listSpell["spell_holy_avengersshield"] = 31935; end   --复仇者之盾--将你的盾牌扔向敌人，对其造成6,837点神圣伤害，打断其施法并使其沉默3秒，然后跳转攻击附近的目标。<br/><br/>最多可攻击3个目标。
	if(unitLevel>=20)then listSpell["ability_paladin_hammeroftherighteous"] = 53595; end   --正义之锤--锤击当前目标，对其造成20%的武器伤害，并形成一道光波，冲击8码范围内的所有目标，造成35%的神圣武器伤害，并使其受到虚弱打击效果的影响。获得一层神圣能量。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=20)then listSpell["spell_holy_weaponmastery"] = 119072; end   --神圣愤怒--向四面八方射出能量箭，对10码范围内的所有敌人造成170点神圣伤害，并使所有恶魔和亡灵昏迷，持续3秒。
	if(unitLevel>=34)then listSpell["spell_holy_innerfire"] = 26573; end   --奉献--将圣洁的能量灌入你脚下的土地，在9秒内对进入该区域的敌人造成8,271点神圣伤害。
	if(unitLevel>=40)then listSpell["ability_paladin_shieldofvengeance"] = 53600; end   --正义盾击--立即用你的盾牌猛击目标，造成871点神圣伤害，并使你受到的物理伤害降低30%，持续3秒。同时触发荣耀堡垒效果。<br/><br/><span style="color: #ffffff;">荣耀堡垒</span><br/>当对自己进行治疗时，你的荣耀圣令所造成的治疗量提高10%，最多可叠加5次。
	if(unitLevel>=70)then listSpell["spell_holy_ardentdefender"] = 31850; end   --炽热防御者--你承受的所有伤害降低20%，持续10秒。而且当炽热防御者被激活时，下一次原本会杀死你的攻击反而会治疗你，治疗量等于你生命值上限的15%。
	if(unitLevel>=75)then listSpell["spell_holy_heroism"] = 86659; end   --远古列王守卫--召唤一个远古列王守卫来保护你，持续12秒。<br/><br/>远古列王守卫使你受到的伤害降低50%。
	end
	--惩戒--bg-paladin-retribution
	if(telants == "Retribution")then
	if(unitLevel>=10)then listSpell["spell_paladin_templarsverdict"] = 85256; end   --圣殿骑士的裁决--一次强大的武器打击，消耗3层神圣能量，造成275%的武器伤害外加额外的628点伤害。
	if(unitLevel>=20)then listSpell["ability_paladin_hammeroftherighteous"] = 53595; end   --正义之锤--锤击当前目标，对其造成20%的武器伤害，并形成一道光波，冲击8码范围内的所有目标，造成35%的神圣武器伤害，并使其受到虚弱打击效果的影响。获得一层神圣能量。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=34)then listSpell["ability_paladin_divinestorm"] = 53385; end   --神圣风暴--范围攻击，消耗3层神圣能量，对8码范围内的所有敌人造成相当于100%武器伤害的神圣伤害。
	if(unitLevel>=46)then listSpell["spell_holy_excorcism_02"] = 879; end   --驱邪术--尝试使用圣光冲击驱逐目标身上的邪恶。造成6,998点神圣伤害，并产生一层神圣能量。
	if(unitLevel>=54)then listSpell["spell_holy_holyguidance"] = 121783; end   --超脱--释放你的精神，解除一个移动限制效果。
	if(unitLevel>=70)then listSpell["spell_holy_sealofwrath"] = 20164; end   --公正圣印--圣光充满你的全身，使你的近战攻击会额外造成20%的神圣伤害，并降低目标50%的移动速度，持续8秒。
	if(unitLevel>=75)then listSpell["spell_holy_heroism"] = 86698; end   --远古列王守卫--召唤一个远古列王守卫来帮你治疗伤害，持续30秒。<br/><br/>远古列王守卫会攻击当前敌人。你的攻击和守卫的攻击都会令你的身体注入远古能量，你的守卫离开时，将释放为远古之怒。
	if(unitLevel>=81)then listSpell["spell_paladin_inquisition"] = 84963; end   --异端裁决--消耗最多3层神圣能量，使你造成的神圣伤害提高30%，产生爆击的几率提高10%。每层神圣能量产生的效果持续时间为10秒。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["ability_paladin_speedoflight"] = 85499; end   --圣光之速--你的移动速度提高70%，持续8秒。
	if(unitLevel>=30)then listSpell["spell_holy_fistofjustice"] = 105593; end   --制裁之拳--使目标昏迷6秒。<br/><br/>代替制裁之锤。
	if(unitLevel>=30)then listSpell["spell_holy_prayerofhealing"] = 20066; end   --忏悔--使敌方目标进入冥想状态，瘫痪最多1分钟。除谴罚外的任何伤害都会唤醒目标。可以对恶魔、龙类、巨人、人型生物和亡灵使用。
	if(unitLevel>=45)then listSpell["inv_torch_thrown"] = 114163; end   --永恒之火--消耗最多3层神圣能量，对一个友方目标施加神圣之火，为其恢复5,629点生命值，并在随后的30秒内每3秒额外恢复519点生命值。消耗的层数越多，治疗效果越好。如果对圣骑士施放，则持续治疗效果提高100%。<br/><br/>代替荣耀圣令。
	if(unitLevel>=45)then listSpell["ability_paladin_blessedmending"] = 20925; end   --圣洁护盾--用一层圣光之盾保护目标，持续30秒。护盾每6秒最多可为其吸收562点伤害。<br/><br/>同一时间内只能对一个目标激活该效果。
	if(unitLevel>=60)then listSpell["spell_holy_sealofwisdom"] = 114039; end   --纯净之手--为友方目标施加圣手，使其受到的伤害降低10%，周期性伤害降低70%，持续6秒。每个圣骑士在同一时间内只能给玩家施加一种圣手效果。
	if(unitLevel>=75)then listSpell["ability_paladin_holyavenger"] = 105809; end   --神圣复仇者--产生神圣能量的技能将额外造成30%的伤害或治疗效果，并且每次都产生3层神圣能量，持续18秒。
	if(unitLevel>=90)then listSpell["spell_paladin_holyprism"] = 114165; end   --神圣棱镜--向目标发射一束圣光，将其变成神圣能量的棱镜。<br/><br/>如果敌人变成棱镜，则会受到16,404点神圣伤害，并使附近15码范围内的5个盟友恢复11,060点生命值。<br/><br/>如果盟友变成棱镜，则会恢复16,404点生命值，并使附近15码范围内的5个敌人受到11,060点神圣伤害。
	if(unitLevel>=90)then listSpell["spell_paladin_lightshammer"] = 114158; end   --圣光之锤--将一柄圣光灌注之锤掷向大地，用弧形圣光冲击10码的区域，持续14秒。<br/><br/><span style="color: #ffffff;">弧形圣光</span><br/>对敌人造成3,690点神圣伤害，并使其移动速度降低50%，持续2秒。同时每2秒为盟友恢复3,690点生命值。
	if(unitLevel>=90)then listSpell["spell_paladin_executionsentence"] = 114157; end   --处决宣判--一个巨锤从天上徐徐落下，在10秒内造成14,099点神圣伤害。该伤害在开始时较慢，但速度会随着时间而提高，效果结束时立即造成巨大伤害。<br/><br/><span style="color: #ffffff;">怜悯治疗</span><br/>如果用于友方目标，落下的巨锤会在10秒内为目标恢复14,099点生命值。该治疗在开始时较慢，但速度会随着时间而提高，在效果结束时达到顶点，恢复大量生命值。
end
if unitClass=="HUNTER" then --3--猎人
	if(unitLevel>=1)then listSpell["ability_whirlwind"] = 75; end   --自动射击--自动射击目标，直到被取消。
	if(unitLevel>=1)then listSpell["ability_hunter_beastsoothe"] = 982; end   --复活宠物--复活你的宠物，并为其恢复100%的基础生命值。
	if(unitLevel>=1)then listSpell["arcane_shot"] = 3044; end   --奥术射击--立即射击，造成100%的武器伤害，外加2,306点奥术伤害。
	if(unitLevel>=1)then listSpell["ability_hunter_beastcall"] = 883; end   --召唤宠物 1--召唤你的第一个宠物。
	if(unitLevel>=3)then listSpell["ability_hunter_steadyshot"] = 56641; end   --稳固射击--一次稳固的射击，对目标造成60%的武器伤害外加额外的1,436点伤害。产生14点集中值。<br/><br/>可在移动时使用。
	if(unitLevel>=8)then listSpell["spell_frost_stun"] = 5116; end   --震荡射击--使目标眩晕，移动速度降低50%，持续6秒。
	if(unitLevel>=10)then listSpell["ability_physical_taunt"] = 1462; end   --野兽知识--收集目标野兽的相关资料。信息栏里会显示出该野兽的伤害、生命值、护甲值和魔法抗性，以及它通常吃的食物。另外，野兽知识还会告诉你目标野兽是否可以被驯服，以及它被驯服后具备何种能力。
	if(unitLevel>=10)then listSpell["ability_hunter_beasttaming"] = 1515; end   --驯服野兽--尝试驯服一只野兽，使其成为你的宠物。一旦你因为任何原因而失去了它的注意力，则驯服过程失败。
	if(unitLevel>=10)then listSpell["serpent_sting"] = 1978; end   --毒蛇钉刺--在15秒内造成16,245点自然伤害。
	if(unitLevel>=10)then listSpell["spell_nature_spiritwolf"] = 2641; end   --解散宠物--暂时解散你的宠物。之后你可以重新召唤它。
	if(unitLevel>=11)then listSpell["ability_hunter_beasttraining"] = 6991; end   --喂养宠物--使用指定的食物为你的宠物喂食，为其恢复50%的总生命值。无法在战斗中使用。
	if(unitLevel>=12)then listSpell["spell_nature_ravenform"] = 13165; end   --雄鹰守护--猎人获得雄鹰守护，使远程攻击强度提高25%。只能在同一时间激活一种守护。
	if(unitLevel>=14)then listSpell["ability_rogue_feint"] = 781; end   --逃脱--你尝试脱离战斗，向后方跳跃。只能在战斗中使用。
	if(unitLevel>=14)then listSpell["ability_hunter_snipershot"] = 1130; end   --猎人印记--给目标加上猎人印记，使所有攻击者对该目标造成的远程伤害都提高5%。被施加印记的目标无法摆脱猎人的追踪。<br/><br/>奥术射击、奇美拉射击、杀戮命令和爆炸射击会自动施加猎人印记。<br/><br/>持续5分钟。
	if(unitLevel>=15)then listSpell["ability_golemstormbolt"] = 19503; end   --驱散射击--短程射击，造成50%的武器伤害并使目标迷惑4秒。任何伤害都会解除该效果。使用之后结束你的攻击。
	if(unitLevel>=16)then listSpell["ability_hunter_mendpet"] = 136; end   --治疗宠物--在10秒内治疗你的宠物，数值相当于其最大生命值的25%。
	if(unitLevel>=16)then listSpell["ability_hunter_eagleeye"] = 6197; end   --鹰眼术--增长猎人的视距。只能在户外使用。持续1分钟。
	if(unitLevel>=18)then listSpell["ability_hunter_beastcall"] = 83242; end   --召唤宠物 2--召唤你的第二个宠物。
	if(unitLevel>=22)then listSpell["inv_ammo_arrow_03"] = 147362; end   --反制射击--
	if(unitLevel>=24)then listSpell["ability_mount_jungletiger"] = 5118; end   --猎豹守护--猎人获得猎豹守护，移动速度提高30%。如果猎人被击中，她会眩晕4秒。同一时间内只能激活一种守护。
	if(unitLevel>=24)then listSpell["multi_shot"] = 2643; end   --多重射击--连续射出弹药，对你当前目标及8码内的所有敌人造成60%的武器伤害。
	if(unitLevel>=28)then listSpell["spell_frost_chainsofice"] = 1499; end   --冰冻陷阱--在地面上放置一个冰霜陷阱，它会冻结第一个接近它的敌人，使其在最多1分钟内无法行动。任何伤害都会取消冰冻效果。同一时间内冰冻陷阱只能困住一个目标。陷阱会持续存在1分钟。
	if(unitLevel>=32)then listSpell["ability_rogue_feigndeath"] = 5384; end   --假死--装死，可能使敌人忽略你。持续最多6分钟。
	if(unitLevel>=35)then listSpell["spell_nature_drowsy"] = 19801; end   --宁神射击--尝试从一个敌方目标身上移除1个激怒效果和1个魔法效果。
	if(unitLevel>=35)then listSpell["kill_shot"] = 53351; end   --杀戮射击--你试图杀死受伤的目标，对其发动远程攻击，造成420%的武器伤害。只能对生命值不高于20%的敌人施放杀戮射击。<br/><br/>如果杀戮射击未能杀死目标，该技能的冷却时间将立即重置，但每6秒只能重置一次。
	if(unitLevel>=36)then listSpell["ability_druid_cower"] = 1513; end   --恐吓野兽--恐吓一头野兽，使其因恐慌而逃跑，最多持续20秒。任何伤害都有可能打断这个效果。每个猎人在同一时间内只能恐吓一头野兽。
	if(unitLevel>=38)then listSpell["spell_fire_flare"] = 1543; end   --照明弹--使指定位置半径10码区域内的所有潜行和隐形的敌人暴露，持续20秒。
	if(unitLevel>=38)then listSpell["explosive_trap"] = 13813; end   --爆炸陷阱--在地面上放置一个火焰陷阱，当敌人接近时会爆炸，并造成250.50点火焰伤害，同时在接下来的20秒内燃烧10码范围内的所有敌人，额外造成350点火焰伤害。陷阱会持续存在1分钟。
	if(unitLevel>=40)then listSpell["ability_hunter_potentvenom"] = 82654; end   --蜘蛛毒刺--有毒的射击，降低目标受到的所有治疗效果，持续30秒。
	if(unitLevel>=42)then listSpell["ability_hunter_beastcall"] = 83243; end   --召唤宠物 3--召唤你的第三个宠物。
	if(unitLevel>=46)then listSpell["spell_hunter_icetrap"] = 13809; end   --冰霜陷阱--放置一个冰霜陷阱，在敌人接近时会制造一片光滑的冰面，持续30秒。所有在陷阱周围半径10码范围内的敌人的移动速度都会降低50%。陷阱会存在1分钟。
	if(unitLevel>=48)then listSpell["ability_hunter_traplauncher"] = 77769; end   --陷阱发射器--激活后，可以将陷阱发射到40码范围内的指定地点。持续直到主动取消。
	if(unitLevel>=52)then listSpell["spell_arcane_blink"] = 20736; end   --扰乱射击--吸引目标攻击你，但是对已经在攻击你的目标无效。持续6秒。
	if(unitLevel>=54)then listSpell["rapid_fire"] = 3045; end   --急速射击--远程急速提高40%，持续15秒。
	if(unitLevel>=56)then listSpell["ability_mount_whitetiger"] = 13159; end   --豹群守护--40码范围内的小队和团队成员均获得豹群守护的效果，移动速度提高30%。如果你在该守护效果影响下被击中，将会眩晕4秒。同一时间内只能激活一种守护。
	if(unitLevel>=62)then listSpell["ability_hunter_beastcall"] = 83244; end   --召唤宠物 4--召唤你的第四个宠物。
	if(unitLevel>=66)then listSpell["ability_hunter_snaketrap"] = 34600; end   --毒蛇陷阱--在地面上放置一个自然陷阱，当第一个敌人接近时，陷阱会释放数条毒蛇攻击敌人。毒蛇将在15秒后死去。陷阱会持续存在1分钟。
	if(unitLevel>=74)then listSpell["ability_hunter_masterscall"] = 53271; end   --主人的召唤--你的宠物尝试移除自己和目标身上的所有定身和移动限制效果，并使自己和目标在4秒内免疫所有此类效果。
	if(unitLevel>=76)then listSpell["ability_hunter_misdirection"] = 34477; end   --误导--你的下一次伤害性攻击和接下来4秒内的所有行动产生的威胁值都将转移到当前选中的小队或团队成员身上。转移的威胁值是暂时性的，将在30秒后被移除。
	if(unitLevel>=78)then listSpell["ability_whirlwind"] = 19263; end   --威慑--激活之后，使你能偏转近战攻击、远程攻击和法术，并使你受到的所有伤害降低30%。当威慑处于激活状态时，你无法攻击，持续5秒。
	if(unitLevel>=82)then listSpell["ability_hunter_beastcall"] = 83245; end   --召唤宠物 5--召唤你的第五个宠物。
	if(unitLevel>=85)then listSpell["ability_hunter_displacement"] = 51753; end   --伪装--你进行伪装，遁入周围的环境中，使你和你的宠物无法成为远程攻击的目标。同时使敌人能够发现你的距离缩短并在静止时处于潜行状态。<br/><br/>你可以在伪装状态下布置陷阱，但如果你或你的宠物对敌人造成伤害，就会解除该效果。如果在战斗中使用，持续6秒。在非战斗状态下使用，持续1分钟。
	if(unitLevel>=87)then listSpell["stampede"] = 121818; end   --群兽奔腾--召唤你所有的宠物与当前目标作战，持续20秒。以这种方式召唤出来的宠物的伤害值相当于其普通伤害的25%。
	--野兽控制--bg-hunter-beastmaster
	if(telants == "Beastmaster")then
	if(unitLevel>=10)then listSpell["kill_command"] = 34026; end   --杀戮命令--发出杀戮命令，使你的宠物立即对其目标造成1,047点伤害，并施加猎人印记效果。<br/><br/>宠物必须距离目标25码之内才能施放杀戮命令。
	if(unitLevel>=32)then listSpell["focus_fire"] = 82692; end   --集中火力--消耗你宠物的狂乱效果，每消耗一层狂乱效果，你的宠物会回复6点集中值，你的远程急速提高6%。持续20秒。
	if(unitLevel>=40)then listSpell["bestial_wrath"] = 19574; end   --狂野怒火--使你的宠物进入狂怒状态，其造成的伤害提高20%，持续10秒，并驱散所有导致你的宠物不受控制的效果。
	if(unitLevel>=81)then listSpell["cobra_shot"] = 77767; end   --眼镜蛇射击--以自然伤害的形式造成70%的武器伤害，并将目标身上毒蛇钉刺的持续时间延长6秒。产生14点集中值。<br/><br/>无法在移动中使用。
	end
	--射击--bg-hunter-marksman
	if(telants == "Marksman")then
	if(unitLevel>=10)then listSpell["inv_spear_07"] = 19434; end   --瞄准射击--一次强力的瞄准射击，造成350%的远程武器伤害加上额外的9,597点伤害。
	if(unitLevel>=30)then listSpell["ability_theblackarrow"] = 34490; end   --沉默射击--一次射击，使目标沉默3秒，并打断其正在施放的法术。
	if(unitLevel>=60)then listSpell["ability_hunter_chimerashot2"] = 53209; end   --奇美拉射击--立即射击，造成265%的远程武器自然伤害外加4,129点伤害，刷新你的毒蛇钉刺的持续时间，并为你恢复5%的生命总值。施加猎人印记效果。
	end
	--生存--bg-hunter-survival
	if(telants == "Survival")then
	if(unitLevel>=10)then listSpell["ability_hunter_explosiveshot"] = 53301; end   --爆炸射击--将爆炸性弹药射入敌方目标体内，立即造成384点火焰伤害，并在2秒内每秒造成一次伤害。施加猎人印记效果。
	if(unitLevel>=50)then listSpell["spell_shadow_painspike"] = 3674; end   --黑箭--向目标发射一支黑箭，在20秒内造成1,640点伤害。黑箭与其他火焰陷阱共享冷却时间。
	if(unitLevel>=81)then listSpell["cobra_shot"] = 77767; end   --眼镜蛇射击--以自然伤害的形式造成70%的武器伤害，并将目标身上毒蛇钉刺的持续时间延长6秒。产生14点集中值。<br/><br/>无法在移动中使用。
	end
	-------------------------talent-------------------------
	if(unitLevel>=30)then listSpell["spell_shaman_bindelemental"] = 109248; end   --束缚射击--射出一枚魔法箭矢，束缚敌人及箭矢落地点5码范围内的其他任何敌人，持续10秒。<br/><br/>如果目标远离箭矢落地点5码，他们将昏迷5秒（PVP则昏迷3秒），并且免疫束缚射击的效果，持续10秒。
	if(unitLevel>=30)then listSpell["inv_spear_02"] = 19386; end   --翼龙钉刺--钉刺目标，使其沉睡30秒。任何伤害都会取消沉睡效果。每个猎人在同一时间内只能对一个目标使用一种钉刺。
	if(unitLevel>=30)then listSpell["ability_devour"] = 19577; end   --胁迫--命令你的宠物胁迫目标，使其昏迷3秒。
	if(unitLevel>=45)then listSpell["ability_hunter_onewithnature"] = 109304; end   --意气风发--立即为你恢复最大生命值的30%，为你的宠物恢复最大生命值的100%。
	if(unitLevel>=45)then listSpell["spell_hunter_aspectoftheironhawk"] = 109260; end   --铁鹰守护--猎人获得铁鹰守护，使远程攻击强度提高25%，并使受到的所有伤害降低15%。猎人只能在同一时间激活一种守护。<br/><br/>取代雄鹰守护。
	if(unitLevel>=60)then listSpell["fervor"] = 82726; end   --热情--你和你的宠物立刻回复50点集中值，并在10秒内额外获得50点集中值。
	if(unitLevel>=60)then listSpell["dire_beast"] = 120679; end   --凶暴野兽--召唤一只强大的野兽来攻击你的目标，持续15秒。这只野兽每次造成伤害都会使你获得5点集中值。
	if(unitLevel>=75)then listSpell["a_murder_of_crows"] = 131894; end   --夺命黑鸦--召唤一群乌鸦，在随后的30秒内攻击你的目标。如果用于生命值低于20%的目标，冷却时间将会降低至60秒。
	if(unitLevel>=75)then listSpell["lynx_rush"] = 120697; end   --山猫冲锋--你的宠物迅速地在目标间来回冲锋，在4秒内攻击9次。每次攻击都会在15秒内对目标造成340点流血伤害，最多可叠加9次。<br/><br/>宠物必须在距目标10码的范围内才能施放山猫冲锋。
	if(unitLevel>=90)then listSpell["glaive_toss"] = 117050; end   --飞刃--你向一个目标抛掷两枚飞刃，每枚飞刃对每个被击中的敌人造成883.50点伤害，并使其移动速度降低30%，持续3秒。主要目标每次都会承受打击造成的4倍伤害。<br/><br/>飞刃会返回你手中，并在返回时再次诱捕途经目标并造成伤害。
	if(unitLevel>=90)then listSpell["powershot"] = 109259; end   --强风射击--你奋力射出强劲的一击，对目标造成600%的武器伤害，并对你和目标之间的所有敌人造成300%的武器伤害。<br/><br/>被强风射击击中的敌人同时也会被击退。
	if(unitLevel>=90)then listSpell["barrage"] = 120360; end   --弹幕射击--向前方快速地射出大量弹药，持续3秒，对敌方目标总共造成640%的武器伤害，并对你面前的每个敌方目标平均造成320%的武器伤害。<br/><br/>可在移动时使用。
end
if unitClass=="ROGUE" then --4--盗贼
	if(unitLevel>=1)then listSpell["ability_throw"] = 121733; end   --投掷--向一个敌方目标投掷一把匕首。
	if(unitLevel>=1)then listSpell["spell_shadow_ritualofsacrifice"] = 1752; end   --影袭--对目标造成322点伤害再加上145%的额外普通武器伤害。
	if(unitLevel>=3)then listSpell["ability_rogue_eviscerate"] = 2098; end   --刺骨--终结技，根据连击点数决定造成的伤害：<br/>   1点：1,359-2,097 点伤害<br/>   2点：2,348-3,086点伤害<br/>   3点：3,337-4,075 点伤害<br/>   4点：4,326-5,064 点伤害<br/>   5点：5,315-6,053 点伤害
	if(unitLevel>=5)then listSpell["ability_stealth"] = 1784; end   --潜行--使你进入潜行状态，悄悄地接近敌人而不被发现。持续到取消为止。
	if(unitLevel>=6)then listSpell["ability_rogue_ambush"] = 8676; end   --伏击--伏击目标，对其造成325%的武器伤害外加2,025点额外伤害（如果装备匕首，则变为470%的武器伤害外加2,930点额外伤害）。必须在潜行状态下从目标背后发动。奖励2个连击点数。
	if(unitLevel>=8)then listSpell["spell_shadow_shadowward"] = 5277; end   --闪避--你的躲闪几率提高50%，持续15秒。
	if(unitLevel>=10)then listSpell["ability_rogue_dualweild"] = 2823; end   --致命药膏--使用致命毒药给一件武器浸毒，效果持续1小时。每次攻击都有30%的几率使敌人中毒，并使其在12秒内受到3,040点自然伤害。随后产生的毒药效果将立即造成396.50点自然伤害。
	if(unitLevel>=12)then listSpell["ability_sap"] = 6770; end   --闷棍--使目标瘫痪最多1分钟，只能在潜行时使用，且只能作用于非作战状态下的人型生物、野兽、恶魔和龙类。任何对目标造成伤害的行为都会使其苏醒，每个潜行者同一时间内只能对一个目标使用闷棍。
	if(unitLevel>=14)then listSpell["ability_rogue_slicedice"] = 5171; end   --切割--终结技，消耗附近目标身上的连击点数，使你近战攻击速度提高40%。根据连击点数决定持续时间：<br/>   1点：12秒<br/>   2点：18秒<br/>   3点：24秒<br/>   4点：30秒<br/>   5点：36秒
	if(unitLevel>=15)then listSpell["inv_misc_bag_11"] = 921; end   --搜索--收集目标携带的物品。
	if(unitLevel>=16)then listSpell["ability_rogue_recuperate"] = 73651; end   --恢复--终结技，消耗附近所有目标身上的连击点数，使你每3秒恢复最大生命值的3%。根据连击点数决定持续时间：<br/>   1点：6秒<br/>   2点：12秒<br/>   3点：18秒<br/>   4点：24秒<br/>   5点：30秒
	if(unitLevel>=18)then listSpell["ability_kick"] = 1766; end   --脚踢--快速用脚踢目标，打断其正在施放的法术，使其在5秒内无法施放该系的法术。
	if(unitLevel>=20)then listSpell["ability_poisonsting"] = 3408; end   --减速药膏--使用非致命毒药给一件武器浸毒，效果持续1小时。每次攻击都有50%的几率使敌人中毒，使其移动速度降低50%，持续12秒。
	if(unitLevel>=22)then listSpell["ability_gouge"] = 1776; end   --凿击--凿击敌方目标的眼睛，令其瘫痪4秒。必须在目标面对着你的时候发动。任何伤害都会令目标立即醒来。
	if(unitLevel>=24)then listSpell["spell_nature_moonkey"] = 1804; end   --开锁--可以打开需要开锁技能达到450点的锁住的箱子和门。
	if(unitLevel>=26)then listSpell["ability_rogue_sprint"] = 2983; end   --疾跑--使你的移动速度提高70%，持续8秒。不会取消潜行状态。
	if(unitLevel>=28)then listSpell["spell_nature_nullifydisease"] = 5761; end   --麻痹药膏--使用非致命毒药给一件武器浸毒，效果持续1小时。每次攻击都有50%的几率使敌人中毒，使其思维变得模糊，施法速度降低50%（使玩家目标的施法速度降低25%），持续10秒。
	if(unitLevel>=28)then listSpell["ability_rogue_distract"] = 1725; end   --扰乱--投掷物体吸引附近所有怪物的注意力，持续10秒。不会取消潜行状态。
	if(unitLevel>=30)then listSpell["inv_misc_herb_16"] = 8679; end   --致伤药膏--使用致命毒药给一件武器浸毒，效果持续1小时。每次攻击都有30%的几率令敌人中毒，立即对其造成526.50点自然伤害，并使其受到的所有治疗效果降低，持续15秒。
	if(unitLevel>=30)then listSpell["ability_cheapshot"] = 1833; end   --偷袭--使目标昏迷4秒，必须在潜行状态下使用。奖励2点连击点数。
	if(unitLevel>=34)then listSpell["ability_vanish"] = 1856; end   --消失--使你消失并进入强化潜行模式，持续3秒。消失后的最初3秒内，受到的伤害和有害效果都不会取消潜行。同时解除一切移动限制效果。
	if(unitLevel>=36)then listSpell["ability_warrior_riposte"] = 8647; end   --破甲--削弱目标的防御，使其受到破甲效果的影响。奖励1个连击点数。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_warrior_sunder.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">破甲</span><br/>使目标的护甲值降低4%，持续30秒。最多可叠加3次。
	if(unitLevel>=38)then listSpell["spell_shadow_mindsteal"] = 2094; end   --致盲--使目标暂时失明并四处游荡，最多持续1分钟。对其造成的任何伤害都会解除此效果。不会取消潜行状态。
	if(unitLevel>=40)then listSpell["ability_rogue_kidneyshot"] = 408; end   --肾击--终结技，使目标昏迷。根据连击点数的数量决定效果持续时间：<br/>   1点：2秒<br/>   2点：3秒<br/>   3点：4秒<br/>   4点：5秒<br/>   5点：6秒
	if(unitLevel>=44)then listSpell["ability_rogue_feint"] = 1966; end   --佯攻--做出闪避动作，使你在5秒内因范围攻击而受到的伤害降低50%。
	if(unitLevel>=46)then listSpell["ability_rogue_rupture"] = 1943; end   --割裂--终结技，使目标在一段时间内受到持续的伤害，根据攻击强度决定伤害总值。根据连击点数决定持续时间：<br/>   1点：8秒内1,057点伤害<br/>   2点：12秒内1,783点伤害<br/>   3点：16秒内2,638点伤害<br/>   4点：20秒内3,621点伤害<br/>   5点：24秒内4,734点伤害
	if(unitLevel>=48)then listSpell["ability_rogue_garrote"] = 703; end   --锁喉--对敌人施放锁喉，使其沉默3秒，并在18秒内对其造成909点伤害，该伤害会受到攻击强度的加成影响。必须在潜行状态下使用。奖励1个连击点数。
	if(unitLevel>=52)then listSpell["ability_rogue_dismantle"] = 51722; end   --拆卸--卸除敌人的武器，使其无法使用任何武器或盾牌，持续8秒。
	if(unitLevel>=56)then listSpell["spell_shadow_grimward"] = 1842; end   --解除陷阱--解除一道敌方的陷阱。
	if(unitLevel>=58)then listSpell["spell_shadow_nethercloak"] = 31224; end   --暗影斗篷--立即移除自身所有负面法术效果，使你对所有魔法攻击和负面效果暂时免疫，并且抵抗所有法术，持续5秒。不能移除可以阻止你使用暗影斗篷技能的魔法效果。
	if(unitLevel>=66)then listSpell["ability_rogue_fanofknives"] = 51723; end   --刀扇--立即飞速旋转，向周围10码范围内的所有目标掷出无数利刃，造成1,253点物理伤害。该攻击有一定几率使你武器上涂抹的药膏按其正常触发几率造成效果。如果击中你的当前连击目标，则奖励1个连击点数。
	if(unitLevel>=68)then listSpell["ability_rogue_preparation"] = 14185; end   --伺机待发--激活后，该技能会立即结束你的疾跑、消失、闪避和拆卸技能的冷却时间。
	if(unitLevel>=72)then listSpell["ability_rogue_envelopingshadows"] = 114842; end   --暗遁--极大地提高潜行效果，持续6秒。
	if(unitLevel>=74)then listSpell["inv_throwingknife_04"] = 5938; end   --毒刃--使用副手武器攻击敌人要害，造成25%的武器伤害，驱散目标身上的一个激怒效果，并使其受到浓缩非致命毒药的影响。<br/><br/>不同的非致命毒药施放效果请参见相应的药膏浓缩效果说明。
	if(unitLevel>=76)then listSpell["ability_rogue_shroudofconcealment"] = 114018; end   --潜伏帷幕--用阴影披风笼罩20码范围内的小队和团队成员，使其在15秒内不被肉眼所察觉。
	if(unitLevel>=78)then listSpell["ability_rogue_tricksofthetrade"] = 57934; end   --嫁祸诀窍--你的下次攻击和接下来6秒内的所有行动产生的威胁值都将转移到当前选中的团队或小队目标队友身上，并使其在此期间造成的所有伤害提高15%。转移的威胁值是暂时性的，效果将在30秒后被移除。
	if(unitLevel>=81)then listSpell["ability_rogue_redirect"] = 73981; end   --转嫁--将现有连击点数全都转移到当前敌方目标身上。需要有效的连击点数。
	if(unitLevel>=83)then listSpell["inv_knife_1h_cataclysm_c_05"] = 121411; end   --猩红风暴--终结技，消耗附近任意目标身上的连击点数来挥砍8码范围内所有敌人的肉体。造成物理伤害，导致受害者流血，并在12秒内受到相当于初始伤害240%的额外伤害：<br/>   1点：1,187点伤害<br/>   2点：1,782点伤害<br/>   3点：2,376点伤害<br/>   4点：2,971点伤害<br/>   5点：3,565点伤害
	if(unitLevel>=85)then listSpell["ability_rogue_smoke"] = 76577; end   --烟雾弹--在潜行者周围8码范围内制造一片浓密的烟雾，持续5秒。敌人无法穿透烟雾瞄准目标。站在烟雾中的盟友受到的伤害降低20%。
	if(unitLevel>=87)then listSpell["inv_knife_1h_grimbatolraid_d_03"] = 121471; end   --暗影之刃--吸收周围的暗影来强化你的武器，使你的自动攻击能造成纯暗影伤害，使用能产生连击点数的技能时还可额外产生一个连击点数，持续12秒。
	--刺杀--bg-rogue-assassination
	if(telants == "Assassination")then
	if(unitLevel>=10)then listSpell["ability_rogue_shadowstrikes"] = 1329; end   --毁伤--立即用两把武器进行攻击，造成200%的武器伤害外加每把武器446点伤害。奖励2个连击点数。
	if(unitLevel>=20)then listSpell["ability_rogue_disembowel"] = 32645; end   --毒伤--终结技，立即对目标造成自然伤害，数值取决于目标身上的连击点数。施放毒伤后，你对目标施加药膏效果的几率提高15%，持续1秒，且每个连击点数可使其延长1秒。<br/>   1点：486点伤害<br/>   2点：973点伤害<br/>   3点：1,459点伤害<br/>   4点：1,945点伤害<br/>   5点：2,431点伤害<br/><br/>代替刺骨。
	if(unitLevel>=40)then listSpell["ability_backstab"] = 111240; end   --斩击--一次邪恶的攻击，对生命值低于35%的目标使用，造成460%的武器伤害外加2,576点伤害。主手必须装备一把匕首。奖励1个连击点数。<br/><br/>代替影袭。
	if(unitLevel>=80)then listSpell["ability_rogue_deadliness"] = 79140; end   --仇杀--给一名敌人加上死亡标记，使你对其所造成的所有伤害提高30%，同时使你对目标的动向了如指掌，无视其诸如潜行和隐身等藏匿效果。持续20秒。
	end
	--战斗--bg-rogue-combat
	if(telants == "Combat")then
	if(unitLevel>=10)then listSpell["ability_warrior_punishingblow"] = 13877; end   --剑刃乱舞--激活时，你的攻击可对附近最多4个额外目标造成相当于普通攻击40%的伤害，但能量的恢复速度降低20%。持续直到取消为止。
	if(unitLevel>=20)then listSpell["inv_sword_97"] = 84617; end   --要害打击--瞬发攻击，对目标造成125%的武器伤害，并暴露其弱点，使你的攻击性终结技对其产生的效果提高35%，并使你的影袭有20%的几率额外产生一个连击点数，持续24秒。奖励1个连击点数。
	if(unitLevel>=40)then listSpell["spell_shadow_shadowworddominate"] = 13750; end   --冲动--使你的能量值回复速度提高100%，近战攻击速度提高20%，持续15秒。
	if(unitLevel>=80)then listSpell["ability_rogue_murderspree"] = 51690; end   --杀戮盛筵--在10码内的多个敌方目标之间快速移动，每0.50秒使用两把武器攻击一个敌人，总共进行7次攻击，且在此期间造成的所有伤害提高50%。可以多次攻击同一个目标。无法攻击隐形或潜行的目标。
	end
	--敏锐--bg-rogue-subtlety
	if(telants == "Subtlety")then
	if(unitLevel>=10)then listSpell["spell_shadow_lifedrain"] = 16511; end   --出血--瞬发攻击，造成140%的武器伤害（如果装备匕首，则造成（203%的武器伤害），造成大出血，在接下来的24秒内额外造成相当于该次直接伤害50%的伤害。奖励1个连击点数。<br/><br/>代替影袭。
	if(unitLevel>=30)then listSpell["spell_shadow_possession"] = 14183; end   --预谋--使用此技能后，为你的当前目标增加2个连击点数。你必须在18秒内消耗掉这些点数，或者为其增加新的连击点数，否则它们就会消失。
	if(unitLevel>=40)then listSpell["ability_backstab"] = 53; end   --背刺--背刺目标，对其造成275%的武器伤害外加1,053点伤害，必须在目标背后发动，你的主手中必须有一把匕首。奖励1个连击点数。
	if(unitLevel>=80)then listSpell["ability_rogue_shadowdance"] = 51713; end   --暗影之舞--进入暗影之舞状态，持续8秒，可以施放各种原本需要潜行状态的技能。在暗影之舞状态下，伏击消耗的能量降低20点。
	end
	-------------------------talent-------------------------
	if(unitLevel>=30)then listSpell["inv_throwingknife_06"] = 26679; end   --致命投掷--终结技，使目标的移动速度降低50%，持续6秒。若攻击时有3个连击点，则还可打断目标正在施放的法术，并使其在短时间内无法施放同系法术。<br/>造成的伤害：<br/>   1点：275-809点伤害<br/>   2点：282-816点伤害<br/>   3点：289-823点伤害<br/>   4点：295-829点伤害<br/>   5点：302-836点伤害
	if(unitLevel>=30)then listSpell["ability_rogue_combatreadiness"] = 74001; end   --备战就绪--使你进入高度戒备状态，更有效地偏转敌人的武器攻击。每层效果可以使被击中后受到的伤害降低10%，效果可叠加5层。<br/><br/>持续20秒，但如果在10秒内没有受到任何武器攻击，则此状态将终止。
	if(unitLevel>=45)then listSpell["rogue_leeching_poison"] = 108211; end   --吸血药膏--使用非致命毒药给一件武器浸毒，效果持续1小时。你的近战攻击有50%的几率让目标中毒，持续10秒。你随后对中毒目标的武器攻击将为你恢复生命值，数值相当于伤害量的10%。
	if(unitLevel>=60)then listSpell["ability_rogue_shadowstep"] = 36554; end   --暗影步--使你穿过暗影，出现在一个目标的身后。在随后的2秒内你的移动速度提高70%。
	if(unitLevel>=60)then listSpell["rogue_burstofspeed"] = 108212; end   --速度爆发--移动速度提高70%，持续4秒，并移除所有减速效果。不会取消潜行状态。
	if(unitLevel>=75)then listSpell["rogue_paralytic_poison"] = 108215; end   --瘫痪药膏--使用非致命毒药给一件武器浸毒，效果持续1小时。每次攻击都有20%的几率使敌人中毒，持续15秒。同一个目标身上的效果最多可叠加5次，叠加到第五层后，目标将昏迷4秒。
	if(unitLevel>=90)then listSpell["inv_throwingknife_07"] = 114014; end   --飞镖投掷--一次远程攻击，对敌方目标造成2,527点物理伤害。如果敌人距离10码以外，则你的自动攻击将被射程为30码的远程飞镖所替代，最多持续10秒。飞镖浸有致命毒药效果。奖励1个连击点数。<br/><br/>替代投掷。
	if(unitLevel>=90)then listSpell["achievement_bg_killingblow_berserker"] = 137619; end   --死亡标记--标记目标，立即产生5个连击点数。如果目标在1分钟内死亡，则死亡标记的冷却时间将被重置。
end
if unitClass=="PRIEST" then --5--牧师
	if(unitLevel>=1)then listSpell["spell_holy_holysmite"] = 585; end   --惩击--惩击一名敌人，造成2,521点神圣伤害。
	if(unitLevel>=3)then listSpell["spell_shadow_shadowwordpain"] = 589; end   --暗言术：痛--黑暗的咒语，立即造成678点暗影伤害，并在18秒内额外造成4,068点暗影伤害。
	if(unitLevel>=5)then listSpell["spell_holy_powerwordshield"] = 17; end   --真言术：盾--抽取一名友方目标的灵魂力量来为其制造一个护盾，可吸收19,777点伤害。持续15秒。只要护盾存在，施法就不会被伤害打断。目标在被加上护盾之后的15秒内无法再被加上护盾。
	if(unitLevel>=7)then listSpell["spell_holy_flashheal"] = 2061; end   --快速治疗--为一个友方目标恢复13,886点生命值。
	if(unitLevel>=9)then listSpell["spell_holy_innerfire"] = 588; end   --心灵之火--圣洁的能量充满施法者的体内，因装备而获得的护甲值提高60%，并且法术强度提高10%。
	if(unitLevel>=12)then listSpell["spell_shadow_psychicscream"] = 8122; end   --心灵尖啸--施法者发出心灵尖啸，使8码范围内的5个敌人逃跑，持续8秒。对目标造成的任何伤害都可能解除这个效果。
	if(unitLevel>=18)then listSpell["spell_holy_resurrection"] = 2006; end   --复活术--复活一个死去的玩家，复活后该玩家拥有35%的生命值和法力值。无法在战斗中施放。
	if(unitLevel>=22)then listSpell["spell_holy_wordfortitude"] = 21562; end   --真言术：韧--为目标注入活力，使其耐力提高10%，持续1小时。<br/><br/>如果目标在你的小队或团队中，则全体小队或团队成员都会获得此效果。
	if(unitLevel>=24)then listSpell["spell_magic_lesserinvisibilty"] = 586; end   --渐隐术--渐渐消失，暂时移除你对所有敌人的威胁值，持续10秒。
	if(unitLevel>=26)then listSpell["spell_holy_renew"] = 139; end   --恢复--治疗目标，每3秒恢复2,191点生命值，持续12秒。
	if(unitLevel>=26)then listSpell["spell_nature_nullifydisease"] = 528; end   --驱散魔法--驱散敌方目标身上的魔法，移除1个增益魔法效果。
	if(unitLevel>=32)then listSpell["spell_nature_slow"] = 9484; end   --束缚亡灵--束缚敌对亡灵单位，最多持续50秒。被束缚的亡灵无法移动、攻击或施法。任何对其造成伤害的行为都将解除束缚。一个牧师在同一时间内只能束缚一个目标。
	if(unitLevel>=34)then listSpell["spell_holy_layonhands"] = 1706; end   --漂浮术--让队伍或团队中的友方目标可以漂起，悬浮于地面几尺之上。漂浮时，目标会逐渐下落并且可以越过水面。任何伤害都会中断漂浮效果。持续10分钟。
	if(unitLevel>=42)then listSpell["spell_holy_mindvision"] = 2096; end   --心灵视界--使施法者通过目标的眼睛观察世界，持续1分钟。如果目标位于另一个副本或者另外一块大陆，则无法起作用。
	if(unitLevel>=42)then listSpell["spell_shadow_shadowfiend"] = 34433; end   --暗影魔--制造一个暗影魔攻击目标。暗影魔攻击目标时，施法者会获得3%的法力值。持续12秒。
	if(unitLevel>=46)then listSpell["spell_shadow_demonicfortitude"] = 32379; end   --暗言术：灭--黑暗的咒语，对目标造成2,534点暗影伤害。只能对生命值低于20%的敌人使用。
	if(unitLevel>=48)then listSpell["spell_holy_blindingheal"] = 32546; end   --联结治疗--为一个友方目标和施法者恢复10,130点生命值。
	if(unitLevel>=54)then listSpell["spell_holy_excorcism"] = 6346; end   --防护恐惧结界--使友方目标获得抵抗恐惧的结界。下一次对该目标施放的恐惧效果会失败并消耗结界。结界持续3分钟。
	if(unitLevel>=66)then listSpell["spell_holy_symbolofhope"] = 64901; end   --希望圣歌--你吟唱一首希望的圣歌，帮陷入绝望的队友们重振斗志。在8秒内，每2秒为周围法力值最低的3个小队或团队成员恢复2%的法力值，并使他们的法力值上限提高15%，持续8秒。最多恢复12次法力值。牧师必须引导此法术。
	if(unitLevel>=68)then listSpell["spell_holy_prayerofmendingtga"] = 33076; end   --愈合祷言--向目标施加一个法术，在该目标下一次受到伤害时为其恢复6,025点生命值。这个治疗效果发生之后，愈合祷言会转移到20码范围内的小队或团队成员身上。最多可转移5次，每次转移后在目标身上持续30秒。<br/><br/>同一时间内只能向一个目标施放愈合祷言。
	if(unitLevel>=72)then listSpell["spell_arcane_massdispel"] = 32375; end   --群体驱散--驱散半径15码范围内的魔法，从每个友方目标身上移除全部的有害法术，并从每个敌方目标身上移除1个有益法术。最多可影响10个友方和10个敌方目标。
	if(unitLevel>=76)then listSpell["spell_shadow_mindshear"] = 48045; end   --精神灼烧--在目标周围制造一次暗影魔法能量的爆炸，对其周围半径10码范围内的所有敌人每1秒造成371.50点暗影伤害，持续5秒。
	if(unitLevel>=80)then listSpell["priest_icon_innewill"] = 73413; end   --心灵意志--圣洁的能量充满施法者的体内，使你的瞬发法术所消耗的法力值减少15%，并使你的移动速度提高10%。<br/><br/>你在同一时间内只能激活心灵意志或心灵之火中的一种。
	if(unitLevel>=84)then listSpell["priest_spell_leapoffaith_a"] = 73325; end   --信仰飞跃--你抓住友方小队或团队目标的灵魂，使其立即移动到你面前。
	--戒律--bg-priest-discipline
	if(telants == "Discipline")then
	if(unitLevel>=10)then listSpell["spell_holy_penance"] = 47540; end   --苦修--向目标发射一道神圣光辉，对一名敌人造成1,290点神圣伤害，或立即治疗一名盟友8,875点生命值，每1秒为其恢复一次生命值，持续2秒。
	if(unitLevel>=18)then listSpell["spell_holy_searinglight"] = 14914; end   --神圣之火--神圣的烈焰吞噬敌人，对其造成1,343点神圣伤害，并在7秒内造成441点额外的神圣伤害。
	if(unitLevel>=22)then listSpell["spell_holy_dispelmagic"] = 527; end   --纯净术--驱散目标身上的有害效果，移除所有魔法和疾病效果。
	if(unitLevel>=28)then listSpell["ability_shaman_astralshift"] = 109964; end   --灵魂护壳--在接下来的15秒内，你的治疗术，快速治疗，强效治疗术以及治疗祷言将不再产生治疗，但会制造吸收护盾，持续15秒。
	if(unitLevel>=28)then listSpell["spell_holy_lesserheal"] = 2050; end   --治疗术--为你的目标恢复10,836点生命值。
	if(unitLevel>=34)then listSpell["spell_holy_greaterheal"] = 2060; end   --强效治疗术--施法速度缓慢的法术，为单一目标恢复23,135点生命值。
	if(unitLevel>=36)then listSpell["spell_frost_windwalkon"] = 89485; end   --心灵专注--你的下一个快速治疗、强效治疗术或治疗祷言消耗的法力值降低25%，爆击几率提高100%。<br/><br/>此外，你将免疫沉默、打断和驱散效果，持续5秒。
	if(unitLevel>=46)then listSpell["spell_holy_prayerofhealing02"] = 596; end   --治疗祷言--强大的祷言，为30码范围内的所有友方目标的小队成员恢复8,844点生命值。
	if(unitLevel>=50)then listSpell["ability_priest_archangel"] = 81700; end   --天使长--消耗你的福音传播，每消耗一层福音传播将使你的治疗效果提高5%，持续18秒。
	if(unitLevel>=58)then listSpell["spell_holy_painsupression"] = 33206; end   --痛苦压制--立刻使一个友方目标的威胁值降低5%，并使其受到的所有伤害降低40%，持续8秒。昏迷时可施放。
	if(unitLevel>=70)then listSpell["spell_holy_powerwordbarrier"] = 62618; end   --真言术：障--在指定区域召唤一道神圣的屏障，使屏障内的友方目标受到的所有伤害降低25%。处于屏障中的角色的施法不会因受到伤害而被打断。屏障持续10秒。
	if(unitLevel>=87)then listSpell["spell_priest_voidshift"] = 108968; end   --虚空转移--你与当前小队或团队的目标成员交换生命值百分比。若你或目标其中一方的生命值百分比低于25%，其生命值将恢复至与该百分比等同的数值。
	end
	--神圣--bg-priest-holy
	if(telants == "Holy")then
	if(unitLevel>=10)then listSpell["spell_holy_chastise"] = 88625; end   --圣言术：罚--惩罚目标，造成778.50点神圣伤害，并使其迷惑，持续3秒。
	if(unitLevel>=18)then listSpell["spell_holy_searinglight"] = 14914; end   --神圣之火--神圣的烈焰吞噬敌人，对其造成1,343点神圣伤害，并在7秒内造成441点额外的神圣伤害。
	if(unitLevel>=22)then listSpell["spell_holy_dispelmagic"] = 527; end   --纯净术--驱散目标身上的有害效果，移除所有魔法和疾病效果。
	if(unitLevel>=28)then listSpell["spell_holy_lesserheal"] = 2050; end   --治疗术--为你的目标恢复10,836点生命值。
	if(unitLevel>=34)then listSpell["spell_holy_greaterheal"] = 2060; end   --强效治疗术--施法速度缓慢的法术，为单一目标恢复23,135点生命值。
	if(unitLevel>=36)then listSpell["spell_holy_summonlightwell"] = 126135; end   --光明之泉--制造一个光明圣泉。光明圣泉每1秒会为生命值低于50%的所有小队和团队成员恢复17,514点生命值，持续6秒。当目标受到数值相当于你最大生命值的30%的伤害时则会解除这个效果。光明圣泉持续3分钟或直到使用了15次。
	if(unitLevel>=46)then listSpell["spell_holy_prayerofhealing02"] = 596; end   --治疗祷言--强大的祷言，为30码范围内的所有友方目标的小队成员恢复8,844点生命值。
	if(unitLevel>=50)then listSpell["spell_holy_circleofrenewal"] = 34861; end   --治疗之环--为目标及目标周围30码范围内最多5个小队或团队成员恢复4,928点生命值。优先治疗受伤最严重的团队成员。
	if(unitLevel>=56)then listSpell["priest_icon_chakra_red"] = 81209; end   --脉轮：罚--你的暗影和神圣法术造成的伤害提高50%，使惩击获得10%的几率重置圣言术：罚的冷却时间，使惩击和神圣之火消耗的法力值降低90%，并将你的圣言术法术恢复为圣言术：罚。<br/><br/><span style="color: #ffffff;">圣言术：罚</span><br/>惩罚目标，造成778.50点神圣伤害，并使其迷惑，持续3秒。冷却时间30秒。
	if(unitLevel>=56)then listSpell["priest_icon_chakra_blue"] = 81206; end   --脉轮：佑--你的群体治疗法术治疗效果提高25%，你的治疗之环法术的冷却时间缩短2秒，并将你的圣言术：罚转换成圣言术：佑。<br/><br/><span style="color: #ffffff;">圣言术：佑</span><br/>神圣之光笼罩大地，使被笼罩的目标每2秒恢复514.50点生命值，持续30秒。同一时间内只能激活一个圣言术：佑效果。冷却时间40秒。
	if(unitLevel>=56)then listSpell["priest_icon_chakra"] = 81208; end   --脉轮：静--使你的单体治疗法术的治疗效果提高25%，同时刷新目标身上恢复效果的持续时间，并将你的圣言术：罚转换成圣言术：静。<br/><br/><span style="color: #ffffff;">圣言术：静</span><br/>立即为目标恢复13,685点生命值，并使你在6秒内对该目标施放治疗法术的爆击几率提高25%。冷却时间15秒。
	if(unitLevel>=70)then listSpell["spell_holy_guardianspirit"] = 47788; end   --守护之魂--召唤一个守护之魂来看护友方目标。守护之魂使目标受到的治疗效果提高60%，同时通过自我牺牲防止目标死去。这种牺牲将终止效果，但是会为目标恢复50%的最大生命值。持续10秒。昏迷时可施放。
	if(unitLevel>=78)then listSpell["spell_holy_divinehymn"] = 64843; end   --神圣赞美诗--为40码范围内生命值最低的5个或12个（25人团队中）小队或团队目标每2秒恢复8,275点生命值，持续8秒。并使其受到的治疗效果提高10%，持续8秒。牧师必须不断引导能量以维持法术。
	if(unitLevel>=87)then listSpell["spell_priest_voidshift"] = 108968; end   --虚空转移--你与当前小队或团队的目标成员交换生命值百分比。若你或目标其中一方的生命值百分比低于25%，其生命值将恢复至与该百分比等同的数值。
	end
	--暗影--bg-priest-shadow
	if(telants == "Shadow")then
	if(unitLevel>=10)then listSpell["spell_shadow_siphonmana"] = 15407; end   --精神鞭笞--用暗影能量突击目标的心灵，在3秒内造成3,429点暗影伤害，并且使其移动速度降低50%。
	if(unitLevel>=21)then listSpell["spell_shadow_unholyfrenzy"] = 8092; end   --心灵震爆--冲击目标，造成3,124点暗影伤害，并产生1层暗影宝珠效果。
	if(unitLevel>=21)then listSpell["spell_shadow_devouringplague"] = 2944; end   --噬灵疫病--消耗施法者所有的暗影宝珠来造成1,790点暗影伤害，并且每1秒造成额外的299点暗影伤害，持续6秒，并在造成周期性伤害的同时为施法者恢复1%的最大生命值。<br/><br/>造成的伤害和治疗与所消耗的暗影宝珠的数量成正比。
	if(unitLevel>=24)then listSpell["spell_shadow_shadowform"] = 15473; end   --暗影形态--进入暗影形态，使你的暗影伤害提高25%，受到的所有伤害降低15%，并使附近所有友方目标的法术急速提高5%。但是在这种形态下，你不能施放神圣系的法术。
	if(unitLevel>=28)then listSpell["spell_holy_stoicism"] = 34914; end   --吸血鬼之触--在15秒内造成635点暗影伤害。吸血鬼之触每造成一次伤害都可以为施法者回复最大法力值的2%。
	if(unitLevel>=44)then listSpell["spell_priest_mindspike"] = 73510; end   --心灵尖刺--冲击目标，造成1,583点暗影冰霜伤害，但是同时将消除你在目标身上的暗影持续伤害效果。
	if(unitLevel>=52)then listSpell["ability_priest_silence"] = 15487; end   --沉默--使目标沉默，在5秒内不能施法。还可中断非玩家类敌人的法术施放，持续3秒。
	if(unitLevel>=60)then listSpell["spell_shadow_dispersion"] = 47585; end   --消散--你进入纯粹的暗影能量形态，受到的所有伤害降低90%。你不能攻击或施法，但是可以每1秒回复6%的法力值，持续6秒。<br/><br/>可以在昏迷、恐惧或沉默状态下施放消散，施放之后解除所有诱捕和移动限制效果，并在消散持续期间免疫这些效果。
	if(unitLevel>=74)then listSpell["spell_shadow_psychichorrors"] = 64044; end   --心灵惊骇--消耗所有暗影宝珠效果恐吓目标，使其在惊骇中颤抖1秒，每消耗一层暗影宝珠效果，颤抖时间增加1秒，并使其丢下武器和护盾，持续8秒。
	if(unitLevel>=78)then listSpell["spell_shadow_unsummonbuilding"] = 15286; end   --吸血鬼的拥抱--一股暗影能量充满你的全身，在你的任何单体暗影法术造成伤害后，将对你和你的盟友进行治疗，数值相当于伤害值的50%，治疗效果由所有人平分。持续15秒。
	if(unitLevel>=87)then listSpell["spell_priest_voidshift"] = 142723; end   --虚空转移--你与当前小队或团队的目标成员交换生命值百分比。若你或目标其中一方的生命值百分比低于25%，其生命值将恢复至与该百分比等同的数值。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["spell_priest_voidtendrils"] = 108920; end   --虚空触须--召唤地下的暗影触须，使施法者8码范围内的最多5个敌方目标定身，持续20秒。杀死触须会取消该效果。
	if(unitLevel>=15)then listSpell["spell_priest_psyfiend"] = 108921; end   --灵能魔--召唤一个灵能魔站在原地，持续10秒。灵能魔每2秒对附近20码范围内的一个敌人施放心灵恐惧，优先对正在攻击牧师的敌人施放。<br/><br/>心灵恐惧使敌人逃跑，持续30秒。对目标造成的任何伤害都可能解除这个效果。
	if(unitLevel>=15)then listSpell["spell_shadow_shadowworddominate"] = 605; end   --统御意志--控制一个等级最高为93的生物，持续30秒。对机械生物无效。
	if(unitLevel>=30)then listSpell["ability_priest_angelicfeather"] = 121536; end   --天堂之羽--将一片羽毛放在目标位置。走过羽毛的盟友，移动速度提高60%，持续6秒。<br/><br/>一次只能放置3根羽毛。每10秒可额外叠加一层。
	if(unitLevel>=45)then listSpell["spell_shadow_soulleech_3"] = 123040; end   --摧心魔--制造一个摧心魔攻击目标。摧心魔攻击时施法者会获得1.46%的法力值，持续15秒。<br/><br/>替代暗影魔。
	if(unitLevel>=60)then listSpell["spell_holy_testoffaith"] = 19236; end   --绝望祷言--立即为施法者恢复30%的生命值。
	if(unitLevel>=60)then listSpell["spell_priest_spectralguise"] = 112833; end   --幽灵伪装--你灵魂出窍，化为暗影遁入黑暗之中，并将你的肉身留在原地。你的灵魂以暗影状态潜行，但仍然处于战斗状态。持续6秒，或直到你的肉身受到3次直接攻击为止。
	if(unitLevel>=75)then listSpell["spell_holy_powerinfusion"] = 10060; end   --能量灌注--能量灌注牧师全身，使其施法速度提高20%，所有伤害提高5%，并且所有法术的消耗降低20%，持续20秒。
	if(unitLevel>=90)then listSpell["ability_priest_cascade"] = 121135; end   --瀑流--向目标发射神圣箭，其能量随着发射距离的增加而增加，最多对一个敌人造成12,821点伤害，或最多为一个盟友恢复12,821点生命值。<br/><br/>该效果可以在盟友和盟友之间或敌人和敌人之间弹射。每次弹射，每道箭便会分裂成2道，并总是优先影响最远的目标，每个目标只能受到1次影响。瀑流最多可弹射3次。
	if(unitLevel>=90)then listSpell["spell_priest_divinestar"] = 110744; end   --神圣之星--向前方发射一颗神圣之星，推进24码。对其路径上4码范围内的所有敌人造成4,802点神圣伤害，并为所有盟友恢复8,003点生命值。<br/><br/>到达目的地后，神圣之星将返回你身边，同时也会对路径上的所有目标造成伤害或治疗。
	if(unitLevel>=90)then listSpell["ability_priest_halo"] = 120517; end   --光晕--在你周围制造一个快速膨胀并不断增强的神圣能量之环，最多膨胀至30码处。对敌人最多造成20,580点神圣伤害，为盟友最多恢复34,301点生命值，在25码时达到最大效果。
end
if unitClass=="DEATHKNIGHT" then --6--死亡骑士
	if(unitLevel>=55)then listSpell["spell_deathknight_deathstrike"] = 45902; end   --鲜血打击--立即攻击敌人，造成40%的武器伤害外加377点伤害。你施加于目标身上的每个疾病效果还可以使伤害额外提高12.5%。
	if(unitLevel>=55)then listSpell["spell_shadow_deathcoil"] = 47541; end   --凋零缠绕--释放邪恶的能量，对一个敌对目标造成1,162点暗影伤害，或者为一个友方亡灵目标恢复4,068点生命值。
	if(unitLevel>=55)then listSpell["spell_deathknight_strangulate"] = 49576; end   --死亡之握--运用笼罩万物的邪恶能量，将目标拉到死亡骑士面前来，并强制敌人攻击死亡骑士，持续3秒。
	if(unitLevel>=55)then listSpell["spell_deathknight_frostpresence"] = 48266; end   --冰霜灵气--你通过冰霜获得强化，产生的符文能量提高20%，并使你在受到无法控制角色的效果时，受影响时间缩短20%。<br/><br/>同一时间内只能激活一种灵气，切换新的灵气会消耗所有现存符文能量。
	if(unitLevel>=55)then listSpell["spell_deathknight_icetouch"] = 45477; end   --冰冷触摸--对目标造成601点冰霜伤害并使其感染冰霜疫病，该疫病造成持续性的冰霜伤害，持续30秒。
	if(unitLevel>=55)then listSpell["plague_strike"] = 45462; end   --暗影打击--一次恶毒的攻击，对目标造成100%的武器伤害外加466点伤害，并使目标感染会造成持续性暗影伤害的血之疫病。
	if(unitLevel>=56)then listSpell["pestilence"] = 50842; end   --传染--将目标身上的血之疫病和冰霜疫病效果传染给其周围半径10码范围内的所有敌人。
	if(unitLevel>=56)then listSpell["spell_shadow_animatedead"] = 46584; end   --亡者复生--召唤一个食尸鬼为你作战。你一次最多只能召唤一个食尸鬼。持续1分钟。
	if(unitLevel>=56)then listSpell["spell_deathknight_bloodboil"] = 48721; end   --血液沸腾--使10码范围内所有敌人的血液沸腾，造成3,865点暗影伤害。对受到血之疫病或冰霜疫病影响的目标额外造成50%的伤害。
	if(unitLevel>=56)then listSpell["spell_deathknight_butcher2"] = 49998; end   --灵界打击--将黑暗之力集中于一次攻击中，对敌人造成185%的武器伤害外加923点伤害，并为你恢复生命值，数值相当于前5秒内受到的非玩家伤害总量的20%（至少相当于你最大生命值的7%）。这一攻击无法被招架。
	if(unitLevel>=57)then listSpell["spell_deathknight_mindfreeze"] = 47528; end   --心灵冰冻--以极寒的能量攻击目标的心智，打断目标施法，并且使该系法术在4秒内无法施放。
	if(unitLevel>=57)then listSpell["spell_deathknight_bloodpresence"] = 48263; end   --鲜血灵气--你获得鲜血灵气效果，耐力提高25%，基础护甲值提高55%，受到的伤害降低10%。产生的威胁值也显著提高。<br/><br/>同一时间内只能激活一种灵气，切换新的灵气会消耗所有现存符文能量。
	if(unitLevel>=58)then listSpell["spell_shadow_soulleech_3"] = 47476; end   --绞袭--暗影触须勒紧敌人的脖子，使他们沉默5秒。还可中断非玩家类敌人的法术施放，持续3秒。
	if(unitLevel>=58)then listSpell["spell_frost_chainsofice"] = 45524; end   --寒冰锁链--使用冰冷的锁链束缚目标，使其移动速度降低60%，持续8秒。同时使目标感染冰霜疫病。
	if(unitLevel>=60)then listSpell["death_and_decay"] = 43265; end   --枯萎凋零--腐蚀死亡骑士指定的区域，每秒对该区域内的所有目标造成55点暗影伤害持续10秒。
	if(unitLevel>=62)then listSpell["spell_deathknight_iceboundfortitude"] = 48792; end   --冰封之韧--死亡骑士冻结自己的血液，对昏迷效果免疫，受到的所有伤害降低20%，持续12秒。
	if(unitLevel>=64)then listSpell["spell_deathknight_unholypresence"] = 48265; end   --邪恶灵气--你的体内充满了邪恶怒火，攻击速度和符文回复速度提高10%，移动速度提高15%。<br/><br/>同一时间内只能激活一种灵气，切换新的灵气会消耗所有的现存符文能量。
	if(unitLevel>=65)then listSpell["horn_of_winter"] = 57330; end   --寒冬号角--死亡骑士吹响寒冬号角，产生10点符文能量，并使100码范围内的所有小队或团队成员的攻击强度提高10%。持续5分钟。
	if(unitLevel>=66)then listSpell["spell_deathknight_pathoffrost"] = 3714; end   --冰霜之路--你的冰冷光环在你脚下制造一片寒冰，使你所在小队或团队50码内的成员可以在水上行走，持续10分钟。可以在骑乘状态下使用，但受到攻击或任何伤害都会取消这个效果。
	if(unitLevel>=68)then listSpell["spell_shadow_antimagicshell"] = 48707; end   --反魔法护罩--使死亡骑士被一层反魔法护盾围绕，吸收有害法术造成的伤害的75%（最多吸收相当于死亡骑士生命值50%的伤害量），并免疫对死亡骑士施加的有害魔法效果。吸收的伤害将产生符文能量。持续5秒。
	if(unitLevel>=69)then listSpell["inv_misc_bone_skull_01"] = 111673; end   --控制亡灵--控制目标亡灵生物，迫使其听从你的命令。在被控制的状态下，该亡灵爪牙的攻击间隔延长30%，施法速度降低20%。最多持续5分钟。
	if(unitLevel>=72)then listSpell["spell_shadow_deadofnight"] = 61999; end   --复活盟友--将黑暗的能量注入一个已死的目标体内，重聚其灵魂和肉体，使其以60%的生命值和20%的法力值重新投入战斗。
	if(unitLevel>=76)then listSpell["empower_rune_weapon"] = 47568; end   --符文武器增效--强化你的符文武器，立即激活所有类型的符文，并产生25点符文能量值。
	if(unitLevel>=80)then listSpell["spell_deathknight_armyofthedead"] = 42650; end   --亡者大军--召唤一支食尸鬼军团为死亡骑士作战，持续40秒。这些食尸鬼会在该区域横冲直撞，嘲讽和攻击一切可针对的目标。在引导亡者大军的技能时，死亡骑士受到的伤害降低，其百分比数值相当于她的躲闪与招架几率之和。
	if(unitLevel>=81)then listSpell["outbreak"] = 77575; end   --爆发--立刻对目标敌人施放血之疫病和冰霜疫病。
	if(unitLevel>=83)then listSpell["inv_axe_96"] = 73975; end   --死疽打击--凶残的袭击对目标造成150%的武器伤害，使其受到的下一次治疗被吸收57点，并使目标的思维变得模糊，施法速度降低50%(玩家目标为25%)。持续10秒。
	if(unitLevel>=85)then listSpell["spell_holy_consumemagic"] = 77606; end   --黑暗模拟--使用黑暗结界笼罩一名敌人，持续8秒。当敌人施放一个需要消耗法力值的技能时，死亡骑士也能释放出一个完全相同的魔法。对非玩家目标使用时，只对部分有害法术有效。
	--鲜血--bg-deathknight-blood
	if(telants == "Blood")then
	if(unitLevel>=58)then listSpell["spell_nature_shamanrage"] = 56222; end   --黑暗命令--命令目标攻击你，但是对已经在攻击你的目标无效。
	if(unitLevel>=60)then listSpell["inv_weapon_shortblade_40"] = 55050; end   --心脏打击--立即攻击目标及其附近最多2个额外敌人，对主要目标造成105%的武器伤害外加572点伤害，对每个额外敌人造成的伤害依次递减50%。你施加于目标身上的每个疾病效果会额外造成15%的伤害。
	if(unitLevel>=64)then listSpell["spell_deathknight_runetap"] = 48982; end   --符文分流--将1枚鲜血符文转化为你的生命值上限的10%。
	if(unitLevel>=65)then listSpell["spell_deathknight_darkconviction"] = 56815; end   --符文打击--打击目标，对其造成200%的武器伤害。此攻击无法被躲闪、格挡或招架。
	if(unitLevel>=74)then listSpell["inv_sword_07"] = 49028; end   --符文刃舞--召唤第二把符文武器独立战斗，进行与死亡骑士相同的攻击动作，持续12秒。符文武器还会协助主人进行防御，当其被激活时，主人的招架几率提高20%。
	if(unitLevel>=76)then listSpell["spell_shadow_lifedrain"] = 55233; end   --吸血鬼之血--使死亡骑士暂时获得15%的生命总值并使你从治疗法术和效果获得的治疗量提高25%，持续10秒。在效果解除之后，这些生命值会被扣除。
	if(unitLevel>=78)then listSpell["ability_deathknight_boneshield"] = 49222; end   --白骨之盾--用旋转的白骨屏障围绕在你周围。护盾开始时有6层效果，每次伤害性攻击会消耗掉一层效果。只要护盾效果还存在，你受到的伤害就会降低20%，持续5分钟。
	if(unitLevel>=87)then listSpell["soul_reaper:Blood"] = 114866; end   --灵魂收割--攻击一名敌人，造成100%的武器伤害，并使其受到灵魂收割效果的影响。5秒后，如果该目标的生命值低于35%，则该效果将额外造成49,909点暗影伤害。如果敌人在效果触发前死亡，则会提高死亡骑士50%的急速，持续5秒。
	end
	--冰霜--bg-deathknight-frost
	if(telants == "Frost")then
	if(unitLevel>=55)then listSpell["frost_strike"] = 49143; end   --冰霜打击--立即攻击敌人，造成相当于105%武器伤害的冰霜伤害。
	if(unitLevel>=55)then listSpell["howling_blast"] = 49184; end   --凛风冲击--以刺骨的寒风冲击目标，对敌人造成628点冰霜伤害，并对10码范围内的其他敌人造成314点冰霜伤害，令所有目标感染冰霜疫病。
	if(unitLevel>=58)then listSpell["obliterate"] = 49020; end   --湮没--野蛮的瞬发攻击，造成230%的武器伤害。你施加于目标身上的每一个疾病效果还可以使该伤害总量提高12.5%。
	if(unitLevel>=68)then listSpell["ability_deathknight_pillaroffrost"] = 51271; end   --冰霜之柱--召唤冰霜之力，使死亡骑士的力量提高20%。厚重的冰晶覆盖在死亡骑士的身体上，使其免疫外力移动效果例如击退。持续20秒。
	if(unitLevel>=87)then listSpell["soul_reaper:Frost"] = 130735; end   --灵魂收割--攻击一名敌人，造成100%的武器伤害，并使其受到灵魂收割效果的影响。5秒后，如果该目标的生命值低于35%，则该效果将额外造成49,909点暗影伤害。如果敌人在效果触发前死亡，则会提高死亡骑士50%的急速，持续5秒。
	end
	--邪恶--bg-deathknight-unholy
	if(telants == "Unholy")then
	if(unitLevel>=58)then listSpell["spell_deathknight_scourgestrike"] = 55090; end   --天灾打击--邪恶的攻击，对目标造成相当于165%武器伤害的物理伤害，外加985点伤害，你施加于目标身上的每个疾病效果还可以使此伤害总量提高25%（算作暗影伤害）。
	if(unitLevel>=62)then listSpell["spell_deathknight_festering_strike"] = 85948; end   --脓疮打击--一次瞬发攻击，造成175%的武器伤害及945点额外伤害，并使你的目标身上的血之疫病、冰霜疫病和寒冰锁链效果的持续时间延长最多6秒。
	if(unitLevel>=66)then listSpell["spell_shadow_unholyfrenzy"] = 49016; end   --邪恶狂热--使一名小队或团队成员陷入嗜杀的狂暴，持续30秒，目标的近战和远程攻击急速提高20%，但每3秒失去相当于其最大生命值2%的生命值。
	if(unitLevel>=70)then listSpell["achievement_boss_festergutrotface"] = 63560; end   --黑暗突变--消耗食尸鬼身上的5层暗影灌注效果，使其变成一个强大的亡灵巨兽，持续30秒。激活此变形效果后，食尸鬼的技能将得到增强，并且会产生新的效果。
	if(unitLevel>=74)then listSpell["ability_deathknight_summongargoyle"] = 49206; end   --召唤石像鬼--一只石像鬼飞入战场并轰击目标，对其造成受死亡骑士攻击强度影响的瘟疫伤害。石像鬼持续存在30秒。
	if(unitLevel>=87)then listSpell["soul_reaper:Unholy"] = 130736; end   --灵魂收割--攻击一名敌人，造成100%的武器伤害，并使其受到灵魂收割效果的影响。5秒后，如果该目标的生命值低于35%，则该效果将额外造成49,909点暗影伤害。如果敌人在效果触发前死亡，则会提高死亡骑士50%的急速，持续5秒。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["plague_leech"] = 123693; end   --吸血瘟疫--从一个敌人体内抽取疾病效果，消耗目标身上的血之疫病和冰霜疫病，随机将一枚完全耗尽的符文激活为死亡符文。
	if(unitLevel>=15)then listSpell["unholy_blight"] = 115989; end   --邪恶虫群--邪恶的虫群围绕在死亡骑士周围，持续10秒，每1秒蛰刺10码范围内所有敌人，使其感染血之疫病和冰霜疫病。
	if(unitLevel>=30)then listSpell["spell_shadow_raisedead"] = 49039; end   --巫妖之躯--吸取邪恶能量变成一个亡灵，持续10秒。在亡灵状态下，你对魅惑、恐惧和催眠效果免疫，并能受到凋零缠绕的治疗。
	if(unitLevel>=30)then listSpell["spell_deathknight_antimagiczone"] = 51052; end   --反魔法领域--制造一个大型的静态反魔法领域，使所有身处该领域中的小队或团队成员受到的法术伤害降低75%。反魔法领域持续10秒，或在吸收至少136,800点法术伤害之后消失。
	if(unitLevel>=45)then listSpell["spell_shadow_demonicempathy"] = 96268; end   --死亡脚步--你的移动速度提高10%，并且移动限制效果不会让你的移动速度降低到正常移动速度的70%以下。<br/><br/>激活后，你的移动速度提高30%，并且不会被降低到正常移动速度的100%以下，持续6秒。
	if(unitLevel>=45)then listSpell["ability_deathknight_asphixiate"] = 108194; end   --窒息--将敌对目标拉离地面，以黑暗的能量掐住他们的咽喉，使其昏迷5秒。如果目标免疫昏迷效果，将产生沉默效果。<br/><br/>代替绞袭。
	if(unitLevel>=60)then listSpell["spell_shadow_deathpact"] = 48743; end   --天灾契约--从一个亡灵爪牙身上吸取生命，为死亡骑士恢复她最大生命值的50%，并使该爪牙承受相当于它最大生命值50%的伤害。
	if(unitLevel>=60)then listSpell["ability_deathknight_deathsiphon"] = 108196; end   --死亡虹吸--对一名敌人造成7,497点暗影冰霜伤害，所造成伤害的150%会转化为死亡骑士的生命值。
	if(unitLevel>=60)then listSpell["ability_deathknight_deathsiphon2"] = 119975; end   --符能转换--持续将符文能量转化为生命值，每1秒恢复最大生命值的3%。当符能转换处于激活状态时，消耗符文只能触发基础符文能量回复。该效果将一直持续，直到解除该效果或符文能量耗尽为止。
	if(unitLevel>=75)then listSpell["blood_tap"] = 45529; end   --活力分流--每当凋零缠绕、冰霜打击或符文打击造成伤害时，会产生2层鲜血充能，最多可产生12层。活力分流将消耗5层鲜血充能效果，随机将一枚耗尽的符文激活为死亡符文。
	if(unitLevel>=90)then listSpell["ability_deathknight_aoedeathgrip"] = 108199; end   --血魔之握--阴影触须缠绕目标（敌方或者友方）0码范围内的所有敌人，并把他们拉向目标所在位置。
	if(unitLevel>=90)then listSpell["ability_deathknight_remorselesswinters2"] = 108200; end   --冷酷严冬--在死亡骑士周围形成一道刺骨的旋风，持续8秒，每1秒冲击8码范围内的敌人一次。每次冲击都会使目标的移动速度降低15%，持续3秒，最多可叠加5次。累计到第五层时，敌人将昏迷6秒。
	if(unitLevel>=90)then listSpell["ability_deathknight_desecratedground"] = 108201; end   --邪恶之地--腐蚀死亡骑士脚下半径8码范围内的区域，持续10秒。站在该腐蚀区域内时，死亡骑士免疫所有导致角色不受控制的效果。激活时，该技能会立即解除这类效果。
end
if unitClass=="SHAMAN" then --7--萨满
	if(unitLevel>=1)then listSpell["spell_nature_lightning"] = 403; end   --闪电箭--向目标射出闪电箭，对其造成1,409点自然伤害。可以在移动中施放。
	if(unitLevel>=3)then listSpell["spell_shaman_primalstrike"] = 73899; end   --根源打击--一次瞬发武器打击，造成736点额外的伤害。
	if(unitLevel>=6)then listSpell["spell_nature_earthshock"] = 8042; end   --大地震击--立即以震荡性的力量攻击目标，对其造成2,250点自然伤害，并使其受到虚弱打击的影响。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=7)then listSpell["spell_nature_healingway"] = 8004; end   --治疗之涌--治疗友方目标，恢复12,731点生命值。
	if(unitLevel>=8)then listSpell["spell_nature_lightningshield"] = 324; end   --闪电之盾--施法者被反馈闪电屏障环绕。当施法者受到法术、近战或远程攻击时，攻击者会受到703点自然伤害。这个效果每数秒只能触发一次。持续1小时。<br/><br/>在同一时间内只能激活一种元素护盾。
	if(unitLevel>=10)then listSpell["spell_shaman_unleashweapon_flame"] = 8024; end   --火舌武器--为萨满祭司的武器注入火焰的力量，使其造成的魔法伤害提高7%。每次击中敌人后会额外造成112到345点火焰伤害，具体数值取决于武器的攻击速度。越慢的武器所附加的火焰伤害越高。持续60分钟。
	if(unitLevel>=12)then listSpell["spell_nature_purge"] = 370; end   --净化术--净化敌方目标，移除1个有益魔法效果。
	if(unitLevel>=12)then listSpell["spell_fire_flameshock"] = 8050; end   --烈焰震击--立刻使用火焰烧灼目标，对其造成1,170点火焰伤害，并在随后的30秒内造成总计3,300点火焰伤害。
	if(unitLevel>=14)then listSpell["spell_nature_regenerate"] = 2008; end   --先祖之魂--使灵魂返回躯体，让已死的目标复活，并恢复35%的生命值和法力值。无法在战斗中施放。
	if(unitLevel>=15)then listSpell["spell_nature_spiritwolf"] = 2645; end   --幽魂之狼--将萨满祭司变成一头幽魂之狼，移动速度提高30%。
	if(unitLevel>=16)then listSpell["spell_nature_cyclone"] = 57994; end   --风剪--以强风的冲击干扰目标的专注，打断其正在施放的法术并使其在3秒内无法施放该系的法术。同时降低你的威胁值，减少这名敌人对你的攻击意愿。
	if(unitLevel>=16)then listSpell["spell_fire_searingtotem"] = 3599; end   --灼热图腾--在施法者身边召唤一个5点生命值的火焰图腾，持续1分钟。该图腾会不断攻击25码范围内的一个敌人，造成90.50点火焰伤害。
	if(unitLevel>=18)then listSpell["ability_shaman_cleansespirit"] = 51886; end   --净化灵魂--移除一个友方目标身上所有诅咒效果。
	if(unitLevel>=20)then listSpell["ability_shaman_watershield"] = 52127; end   --水之护盾--施法者被水球环绕，每5秒获得2,138点法力值。每当施法者受到法术、近战或远程攻击时，护盾会产生2,928点法力值。这个效果每3秒只能触发一次。持续1小时。<br/><br/>同一时间内只能激活一种元素护盾。
	if(unitLevel>=22)then listSpell["spell_frost_frostshock"] = 8056; end   --冰霜震击--立即用冰霜冲击一名敌人，造成1,344点冰霜伤害并使其移动速度降低50%。减速效果持续8秒。制造大量的威胁值。
	if(unitLevel>=24)then listSpell["spell_frost_windwalkon"] = 546; end   --水上行走--使友方目标可以在水面或类似的表面上行走，持续10分钟。受到任何伤害都会解除水上行走效果。
	if(unitLevel>=26)then listSpell["spell_nature_strengthofearthtotem02"] = 2484; end   --地缚图腾--在施法者身边召唤一个5点生命值的大地图腾，持续20秒。该图腾可降低10码范围内敌人的移动速度。
	if(unitLevel>=28)then listSpell["spell_nature_chainlightning"] = 421; end   --闪电链--向敌人射出一支闪电箭，对其造成1,198点自然伤害，随后这支闪电箭会继续跳转攻击附近其他敌人。最多可攻击3个目标。
	if(unitLevel>=30)then listSpell["inv_spear_04"] = 5394; end   --治疗之泉图腾--在施法者身边召唤一个5点生命值的水图腾，持续15秒。该图腾每2秒会为40码范围内受伤最严重的小队或团队成员恢复83点生命值。
	if(unitLevel>=30)then listSpell["spell_shaman_totemrecall"] = 36936; end   --图腾召回--将你的图腾送回大地中，每个因收回而被摧毁的图腾都可以为你返还召唤该图腾所需法力值的25%。
	if(unitLevel>=34)then listSpell["spell_nature_astralrecal"] = 556; end   --星界传送--令施法者穿越扭曲虚空，回到北郡山谷。与不同地区的旅店老板谈话可以改变你的家所在的位置。
	if(unitLevel>=36)then listSpell["spell_nature_farsight"] = 6196; end   --视界术--将施法者的视点切换到目标区域。持续1分钟。只能在户外使用。
	if(unitLevel>=36)then listSpell["spell_fire_selfdestruct"] = 8190; end   --熔岩图腾--在施法者身边召唤一个5点生命值的火焰图腾，持续1分钟。该图腾每2秒对8码范围内的生物造成311点火焰伤害。
	if(unitLevel>=38)then listSpell["spell_nature_groundingtotem"] = 8177; end   --根基图腾--在施法者身边召唤一个5点生命值的空气图腾，持续15秒。该图腾会为附近的队友吸收一个有害法术，并摧毁图腾。对范围效果的法术无效。
	if(unitLevel>=44)then listSpell["spell_nature_healingwavegreater"] = 1064; end   --治疗链--为友方目标回复7,718点生命值，然后转而治疗附近的目标。如果对小队或团队成员施法，则治疗链只会继续治疗该小队或团队中的其他成员。治疗链每跳跃一次，治疗效果降低30%。总共可治疗4个目标。
	if(unitLevel>=46)then listSpell["spell_shaman_unleashweapon_frost"] = 8033; end   --冰封武器--为萨满祭司的武器注入冰霜的力量。每次击中敌人后会额外造成698点冰霜伤害，并使其移动速度降低50%，持续8秒。持续60分钟。
	if(unitLevel>=54)then listSpell["spell_nature_tremortotem"] = 8143; end   --战栗图腾--在施法者身边召唤一个5点生命值的大地图腾，持续6秒。该图腾会震动附近的地面，移除30码范围内所有小队和团队成员的恐惧、魅惑和睡眠效果。当施法者受到这些效果影响时，仍可以召唤该图腾。
	if(unitLevel>=58)then listSpell["spell_nature_earthelemental_totem"] = 2062; end   --土元素图腾--在施法者身边召唤一个生命值为154,755点的大地图腾，它可以召唤出强力土元素来保护施法者及其盟友，持续1分钟。
	if(unitLevel>=60)then listSpell["spell_nature_giftofthewaterspirit"] = 73920; end   --治疗之雨--召唤治疗之雨，覆盖萨满祭司指定的区域，为区域中的盟友每2秒恢复2,648点生命值，持续10秒。如果治疗区域内的玩家超过6个，治疗效果将会降低。
	if(unitLevel>=63)then listSpell["spell_nature_brilliance"] = 108269; end   --电能图腾--在施法者身边召唤一个5点生命值的空气图腾。该图腾从周围的空气中吸收电能，5秒后爆炸，使8码范围内的所有敌人昏迷，持续5秒。
	if(unitLevel>=65)then listSpell["ability_shaman_healingtide"] = 108280; end   --治疗之潮图腾--在施法者身边召唤一个拥有施法者10%生命值的水图腾，持续10秒。治疗之潮图腾每2秒作用一次，为40码范围内5名受伤最严重的小队或团队成员恢复5,023点生命值。
	if(unitLevel>=66)then listSpell["spell_fire_elemental_totem"] = 2894; end   --火元素图腾--在施法者身边召唤一个生命值为154,755点的火焰图腾，它可以召唤一个大型火元素攻击敌人。持续1分钟。
	if(unitLevel>=70)then listSpell["spell_nature_bloodlust"] = 2825; end   --嗜血--使所有小队及团队成员的近战、远程攻击及法术急速提高30%，持续40秒。<br/><br/>受到该效果影响的盟友将变得心满意足，在10分钟内无法再受到嗜血或时间扭曲效果的影响。
	if(unitLevel>=70)then listSpell["ability_shaman_heroism"] = 32182; end   --英勇--使所有小队及团队成员的近战、远程攻击及法术急速提高30%，持续40秒。<br/><br/>受到该效果影响的盟友将变得疲惫，在10分钟内无法再受到英勇或时间扭曲效果的影响。
	if(unitLevel>=72)then listSpell["spell_shaman_bindelemental"] = 76780; end   --束缚元素--束缚敌对元素生物，最多持续50秒。被束缚的单位无法移动、攻击或施法。任何伤害都会使目标解除束缚。同一时间内只能束缚一个目标。
	if(unitLevel>=75)then listSpell["spell_shaman_unleashweapon_earth"] = 8017; end   --石化武器--为萨满祭司的武器注入大地的愤怒，使其产生的所有威胁提高30%，受到的伤害降低5%。持续60分钟。
	if(unitLevel>=75)then listSpell["spell_shaman_hex"] = 51514; end   --妖术--将敌人变成一只青蛙，使其不能攻击或施法，持续1分钟。任何伤害都有可能打断妖术效果。你在同一时间内只能对一个目标使用妖术，且只能对人型生物和野兽使用。
	if(unitLevel>=78)then listSpell["ability_shaman_tranquilmindtotem"] = 120668; end   --风暴之鞭图腾--在施法者身边召唤一个5点生命值的空气图腾，持续10秒。该图腾用闪电强化40码范围内的盟友。被强化后，盟友的法术和攻击会触发电能冲击，对他们的目标造成额外的自然伤害。
	if(unitLevel>=81)then listSpell["spell_shaman_improvedstormstrike"] = 73680; end   --元素释放--集中释放附加在萨满祭司武器中的元素力量，具体效果取决于附加的武器附魔类型。<br/><br/>不同的元素释放效果请参见对应的武器附魔法术说明。
	if(unitLevel>=85)then listSpell["spell_shaman_spiritwalkersgrace"] = 79206; end   --灵魂行者的恩赐--召唤灵魂指引，让萨满能够在施放非瞬发的萨满法术时移动。此法术可以在施放其它法术时施放。效果持续15秒。
	if(unitLevel>=87)then listSpell["spell_fire_elementaldevastation"] = 114049; end   --升腾--萨满的体内充斥着强大的元素能量，获得将其实体形态转化为一种原始的元素能量形态的技能，持续15秒。<br/><br/><span style="color: #ffffff;">元素：</span> <br/>处于火焰升腾者形态时，熔岩爆裂没有冷却时间，闪电链被强化为熔岩弹射。<br/><br/><span style="color: #ffffff;">增强：</span> <br/>处于空气升腾者形态时，自动攻击和风暴打击造成纯自然伤害，攻击距离为30码。<br/><br/><span style="color: #ffffff;">恢复：</span> <br/>处于水之升腾者形态时，造成的所有治疗效果都会被复制，并由附近的所有盟友平均分摊。
	--元素--bg-shaman-elemental
	if(telants == "Elemental")then
	if(unitLevel>=10)then listSpell["spell_shaman_thunderstorm"] = 51490; end   --雷霆风暴--你召唤一道闪电，为自己充能，并对附近10码范围内的敌人造成伤害。为你回复15%的法力值，并对附近的所有敌人造成1,923点自然伤害，使其移动速度降低40%，持续5秒，并将其击退20码。该法术可以在昏迷状态下使用。
	if(unitLevel>=34)then listSpell["spell_shaman_lavaburst"] = 51505; end   --熔岩爆裂--向目标投掷熔岩，造成1,412点火焰伤害。熔岩爆裂总是造成爆击。如果目标身上有烈焰震击效果，则熔岩爆裂会额外造成50%伤害。
	if(unitLevel>=60)then listSpell["spell_shaman_earthquake"] = 61882; end   --地震术--你使目标区域的地面开始震动并破裂，每1秒对半径8码范围内的敌人造成382点物理伤害，有10%的几率击倒受到影响的目标，持续10秒。
	if(unitLevel>=65)then listSpell["spell_nature_shamanrage"] = 30823; end   --萨满之怒--使你受到的所有伤害降低30%并使你的技能、图腾以及攻击性法术不消耗法力值，持续15秒。该法术可以在昏迷状态下使用。
	end
	--增强--bg-shaman-enhancement
	if(telants == "Enhancement")then
	if(unitLevel>=10)then listSpell["ability_shaman_lavalash"] = 60103; end   --熔岩猛击--你将岩浆的能量注入你的副手武器，立即对一个敌方目标造成300%的副手武器伤害，并使其身上的烈焰震击效果扩散到12码范围内最多四个敌人身上。如果你的副手武器附加了火舌效果，该伤害将会提高40%。
	if(unitLevel>=26)then listSpell["ability_shaman_stormstrike"] = 17364; end   --风暴打击--立即使用两把武器攻击一名敌人，对其造成450%的武器伤害，并使你的闪电箭、闪电链、闪电之盾和大地震击法术对其造成爆击的几率额外提高25%，持续15秒。
	if(unitLevel>=30)then listSpell["spell_shaman_unleashweapon_wind"] = 8232; end   --风怒武器--为萨满祭司的武器注入风的能量。每次击中敌人后有20%的几率令你获得额外的3次近战攻击机会，并且在这几次攻击中的攻击强度提高8,550点。持续60分钟。
	if(unitLevel>=44)then listSpell["spell_shaman_firenova"] = 1535; end   --火焰新星--点燃受你的烈焰震击法术影响的目标，使其向周围10码内的其他敌人释放出一道火焰波，造成905.50点火焰伤害。
	if(unitLevel>=60)then listSpell["spell_shaman_feralspirit"] = 51533; end   --野性狼魂--召唤2只幽灵狼为萨满祭司作战，持续30秒。幽灵狼免疫移动限制效果，并且它们的攻击可以为自己和主人恢复生命值，数值相当于伤害量的150%。
	if(unitLevel>=60)then listSpell["ability_tracking"] = 58875; end   --幽魂步--移除所有的移动限制效果，并使你的移动速度提高60%，持续15秒。
	if(unitLevel>=65)then listSpell["spell_nature_shamanrage"] = 30823; end   --萨满之怒--使你受到的所有伤害降低30%并使你的技能、图腾以及攻击性法术不消耗法力值，持续15秒。该法术可以在昏迷状态下使用。
	end
	--恢复--bg-shaman-restoration
	if(telants == "Restoration")then
	if(unitLevel>=10)then listSpell["spell_nature_riptide"] = 61295; end   --激流--治疗一个盟友目标，为其恢复3,798点生命值，并在18秒内恢复额外的10,764点生命值。如果你施放治疗链的主要目标受到你激流效果的影响，则治疗效果提高25%。
	if(unitLevel>=18)then listSpell["ability_shaman_cleansespirit"] = 77130; end   --净化灵魂--移除一个友方目标身上所有诅咒和魔法效果。
	if(unitLevel>=20)then listSpell["spell_nature_magicimmunity"] = 331; end   --治疗波--治疗友方目标，恢复8,485点生命值。
	if(unitLevel>=26)then listSpell["spell_nature_skinofearth"] = 974; end   --大地之盾--以大地之盾保护目标，使萨满对该目标施放的治疗法术效果提高20%，并使其可以在受到攻击后恢复2,067点生命值。共9层。持续10分钟。该效果每数秒只能触发一次。<br/><br/>同一时间内只能给一个目标施放大地之盾，且同一时间内只能有一种元素护盾在同一目标身上生效。
	if(unitLevel>=30)then listSpell["spell_shaman_unleashweapon_life"] = 51730; end   --大地生命武器--为萨满祭司的武器注入大地的生命能量，使其法术治疗效果提高2,873点，且每次治疗都有最高20%的几率在目标身上触发大地生命效果，在12秒内额外恢复4,452点生命值。使用单体直接治疗法术对生命值低于最大生命值35%的目标进行治疗时，总能触发此效果。持续60分钟。
	if(unitLevel>=34)then listSpell["spell_shaman_lavaburst"] = 51505; end   --熔岩爆裂--向目标投掷熔岩，造成1,412点火焰伤害。熔岩爆裂总是造成爆击。如果目标身上有烈焰震击效果，则熔岩爆裂会额外造成50%伤害。
	if(unitLevel>=56)then listSpell["spell_frost_summonwaterelemental"] = 16190; end   --法力之潮图腾--在施法者身边召唤一个拥有施法者10%生命值的水图腾，持续16秒。在图腾附近40码范围内的小队或团队成员会获得施法者200%的精神（不包括短时间内的精神加成）。
	if(unitLevel>=60)then listSpell["spell_nature_healingwavelesser"] = 77472; end   --强效治疗波--治疗友方目标，恢复15,438点生命值。
	if(unitLevel>=70)then listSpell["spell_shaman_spiritlink"] = 98008; end   --灵魂链接图腾--在施法者身边召唤一个5点生命值的空气图腾，持续6秒。该图腾使10码范围内的所有小队或团队成员受到的伤害降低10%。受影响的所有玩家每隔1秒会重新分配生命值，从而使每个玩家保持相同比例的最大生命值。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["ability_shaman_stonebulwark"] = 108270; end   --石壁图腾--在施法者身边召唤一个拥有施法者10%生命值的大地图腾，持续30秒。该图腾使施法者获得一层护盾，吸收491点伤害，持续10秒，并使之后每5秒最多可额外吸收164点伤害。
	if(unitLevel>=15)then listSpell["ability_shaman_astralshift"] = 108271; end   --星界转移--将一部分身体转移，进入元素位面以寻求庇护，受到的伤害降低40%，持续6秒。
	if(unitLevel>=30)then listSpell["spell_nature_stranglevines"] = 51485; end   --陷地图腾--在施法者身边召唤一个5点生命值的大地图腾，持续20秒。该图腾每2秒作用一次，使10码范围内的所有敌人被根须诱捕，限制其移动，持续5秒。被该图腾定身过一次的敌人不再受到诱捕效果的影响，但移动速度降低50%。<br/><br/>替代地缚图腾。
	if(unitLevel>=30)then listSpell["ability_shaman_windwalktotem"] = 108273; end   --风行图腾--在施法者身边召唤一个5点生命值的空气图腾，持续6秒。该图腾使附近40码范围内的团队成员免疫任何移动限制效果。
	if(unitLevel>=45)then listSpell["ability_shaman_multitotemactivation"] = 108285; end   --元素的召唤--激活之后，立即使所有基础冷却时间小于3分钟的图腾结束冷却。
	if(unitLevel>=45)then listSpell["ability_shaman_totemrelocation"] = 108287; end   --图腾投掷--将你所放置的图腾迁移到指定位置。
	if(unitLevel>=60)then listSpell["spell_nature_wispheal"] = 16166; end   --元素掌握--召唤元素之力，使你在20秒内急速提高30%。
	if(unitLevel>=60)then listSpell["spell_shaman_elementaloath"] = 16188; end   --先祖迅捷--你的下一个基础施法时间低于10秒的自然法术变为瞬发法术。<br/><br/><span style="color: #ffffff;">被动：</span><br/>法术急速提高5%，近战急速提高10%。
	if(unitLevel>=75)then listSpell["ability_shaman_ancestralguidance"] = 108281; end   --先祖指引--当你在接下来的10秒内造成直接伤害或进行治疗时，伤害值的40%或治疗量的60%将被用以恢复附近最多3位受伤小队或团队成员的生命值。
	if(unitLevel>=90)then listSpell["shaman_talent_elementalblast"] = 117014; end   --元素冲击--引导元素的原始力量攻击敌方目标，造成5,119点元素伤害，并使施法者的敏捷、爆击、急速或精通提高3,500点，持续8秒。
end
if unitClass=="MAGE" then --8--法师
	if(unitLevel>=1)then listSpell["ability_mage_frostfirebolt"] = 44614; end   --霜火之箭--向敌人发射霜火之箭，造成1,841点霜火伤害，并使其移动速度降低40%，持续8秒。
	if(unitLevel>=3)then listSpell["spell_frost_frostnova"] = 122; end   --冰霜新星--冲击施法者12码范围内的所有敌人，造成587.50点冰霜伤害并将其冻结在原地，最多持续8秒。任何伤害都可能打断该效果。
	if(unitLevel>=5)then listSpell["spell_fire_fireball"] = 2136; end   --火焰冲击--冲击敌人，造成1,200点火焰伤害。
	if(unitLevel>=7)then listSpell["spell_arcane_blink"] = 1953; end   --闪现术--将施法者传送至前方20码距离处，路线上有障碍物则会停止。同时还会解除施法者受到的束缚和昏迷效果。
	if(unitLevel>=8)then listSpell["spell_frost_iceshock"] = 2139; end   --法术反制--反制敌人施放的法术，使其在6秒内无法施放任何该系法术。
	if(unitLevel>=14)then listSpell["spell_nature_polymorph"] = 118; end   --变形术--将敌人变成绵羊，使其在周围到处闲逛，最多持续50秒。<br/><br/>在这个过程中，绵羊无法攻击或施法，但会以极快的速度恢复生命值。任何伤害都会使目标恢复正常状态。<br/><br/>同一时间内只能将一个目标变形。只能对野兽、人型生物和小动物施放。
	if(unitLevel>=18)then listSpell["spell_nature_wispsplode"] = 1449; end   --魔爆术--制造一次以施法者为中心的奥术魔法爆炸，对10码范围内的所有目标造成605.50点奥术伤害。
	if(unitLevel>=22)then listSpell["spell_frost_frostblast"] = 30455; end   --冰枪术--对一个敌方目标造成306.50点冰霜伤害。<br/><br/>冰枪对被冻结的目标造成四倍伤害。
	if(unitLevel>=26)then listSpell["spell_frost_frost"] = 45438; end   --寒冰屏障--你被一道寒冰屏障所笼罩，在10秒内不会受到任何物理和法术伤害，但是在这期间你也无法攻击、移动或施法。<br/><br/>同时也会引发低温效果，在30秒内不能再次施放寒冰屏障。
	if(unitLevel>=28)then listSpell["spell_frost_glacier"] = 120; end   --冰锥术--使施法者面前一个锥形区域内的目标受到456点冰霜伤害，并且移动速度降低60%，持续6秒。
	if(unitLevel>=29)then listSpell["spell_nature_removecurse"] = 475; end   --解除诅咒--从一个友方目标身上移除所有诅咒。
	if(unitLevel>=32)then listSpell["spell_magic_featherfall"] = 130; end   --缓落术--使友方队伍或团队中的目标的下落速度降低，持续30秒。
	if(unitLevel>=34)then listSpell["ability_mage_moltenarmor"] = 30482; end   --熔岩护甲--你的法术爆击几率提高5%。<br/><br/>受到的所有物理伤害降低6%。<br/><br/><span style="color: #ffffff;">护甲术</span><br/>法师在同一时间内只能激活一种护甲术。
	if(unitLevel>=38)then listSpell["spell_mage_conjuredmanapudding"] = 42955; end   --造餐术--制作魔法食物，以供法师及其盟友食用。<br/><br/><span style="color: #ffffff;">魔法制造的物品</span><br/>魔法制造的物品在持有者退出游戏超过15分钟之后消失。
	if(unitLevel>=40)then listSpell["spell_nature_purge"] = 12051; end   --唤醒--你立即恢复总法力值的15%并在6秒内额外恢复总法力值的45%。
	if(unitLevel>=44)then listSpell["spell_fire_selfdestruct"] = 2120; end   --烈焰风暴--召唤一根火柱，燃烧区域内的所有敌人，在8秒内造成571.50点火焰伤害外加596点火焰伤害。
	if(unitLevel>=47)then listSpell["inv_misc_gem_sapphire_02"] = 759; end   --制造法力宝石--制造一颗法力宝石，用于立即回复45,000点法力值，最多可使用3次。<br/><br/><span style="color: #ffffff;">魔法制造的物品</span><br/>魔法制造的物品在持有者退出游戏超过15分钟之后消失。
	if(unitLevel>=49)then listSpell["spell_magic_lesserinvisibilty"] = 55342; end   --镜像--召唤3个施法者的镜像，施放法术并攻击法师的敌人。持续30秒。
	if(unitLevel>=52)then listSpell["spell_frost_icestorm"] = 10; end   --暴风雪--目标区域骤然落下寒冰碎片，在8秒内造成3,240点冰霜伤害，并使敌人的移动速度降低50%。
	if(unitLevel>=54)then listSpell["spell_frost_frostarmor02"] = 7302; end   --霜甲术--使你的法术急速提高7%。<br/><br/>如果敌人攻击施法者，则其移动速度降低30%，持续5秒。<br/><br/><span style="color: #ffffff;">护甲术</span><br/>法师在同一时间内只能激活一种护甲术。
	if(unitLevel>=56)then listSpell["ability_mage_invisibility"] = 66; end   --隐形术--使施法者在3秒内进入隐形状态，每秒降低一定的威胁值。隐形时你无法成为敌人的目标。持续20秒。<br/><br/>如果你做出任何动作，这个效果就会消失。
	if(unitLevel>=58)then listSpell["spell_holy_magicalsentry"] = 1459; end   --奥术光辉--为目标注入智慧的能量，使其法术强度提高10%，爆击几率提高5%，持续1小时。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会获得此效果。
	if(unitLevel>=64)then listSpell["spell_arcane_arcane02"] = 30449; end   --法术吸取--从目标身上吸取一个增益魔法效果。该效果最多持续2分钟。
	if(unitLevel>=66)then listSpell["ability_mage_deepfreeze"] = 44572; end   --深度冻结--使目标昏迷5秒。只能对已被冻结的目标使用。
	if(unitLevel>=72)then listSpell["spell_arcane_massdispel"] = 43987; end   --召唤餐桌--召唤一个餐桌。团队成员可以点击餐桌获取魔法食物。<br/><br/>餐桌在3分钟后或被使用50次后消失。
	if(unitLevel>=75)then listSpell["ability_mage_missilebarrage"] = 125430; end   --秘法炸弹--基于你天赋的选择施放强大的周期性伤害效果。
	if(unitLevel>=80)then listSpell["spell_magearmor"] = 6117; end   --法师护甲--使你的精通提高3,000点。<br/><br/>对你施放的所有伤害性魔法效果的持续时间缩短25%。<br/><br/><span style="color: #ffffff;">护甲术</span><br/>法师在同一时间内只能激活一种护甲术。
	if(unitLevel>=84)then listSpell["ability_mage_timewarp"] = 80353; end   --时间扭曲--扭曲时间的流动，使所有小队及团队成员的近战、远程攻击及法术急速提高30%，持续40秒。<br/><br/>受到该效果影响的盟友时空将会错乱，在10分钟内无法再受到嗜血、英勇或时间扭曲效果的影响。
	if(unitLevel>=87)then listSpell["spell_mage_altertime"] = 108978; end   --操控时间--操控时间，使施法者第二次施法时或在6秒后回到当前位置，并使生命值、法力值、增益效果和减益效果回到当前状态。<br/><br/>如果施法者在6秒内死亡或者移动距离太远，这个法术就会失效。
	--奥术--bg-mage-arcane
	if(telants == "Arcane")then
	if(unitLevel>=10)then listSpell["spell_arcane_blast"] = 30451; end   --奥术冲击--向目标施放一道能量波，造成954.50点奥术伤害。产生一层奥术充能。<br/><br/>每层奥术充能使奥术冲击的伤害提高50%，消耗的法力值提高150%。
	if(unitLevel>=12)then listSpell["ability_mage_arcanebarrage"] = 44425; end   --奥术弹幕--向敌方目标发射多股奥术能量，对其造成1,228点奥术伤害。消耗所有奥术充能效果。<br/><br/>每层奥术充能效果可使奥术弹幕的伤害提高50%，并使其能额外命中1个周围的目标，造成50%的伤害。
	if(unitLevel>=24)then listSpell["spell_nature_starfall"] = 5143; end   --奥术飞弹--在2秒内向敌人射出五波奥术飞弹，每波对其造成273点奥术伤害。产生一层奥术充能效果。<br/><br/>每层奥术充能效果使奥术飞弹的伤害提高50%。<br/><br/>你每次施放伤害性法术时，都有一定几率激活奥术飞弹。最多可获得2层效果。
	if(unitLevel>=36)then listSpell["spell_nature_slow"] = 31589; end   --减速--使目标的移动速度降低50%，施法时间延长50%（玩家目标的施法时间延长25%）。持续15秒。同一时间只能对一个目标使用减速。
	if(unitLevel>=62)then listSpell["spell_nature_lightning"] = 12042; end   --奥术强化--激活之后，你的法术会造成20%的额外伤害，施放伤害性法术所消耗的法力值提高10%。这个效果可以持续15秒。
	end
	--火焰--bg-mage-fire
	if(telants == "Fire")then
	if(unitLevel>=10)then listSpell["spell_fire_fireball02"] = 11366; end   --炎爆术--发射一枚巨大的火焰投石，造成2,431点火焰伤害，并在18秒内额外造成2,652点火焰伤害。<br/><br/>当你的连续两个直接单体火焰伤害法术造成爆击时，你的下一个炎爆术变为瞬发，不消耗法力值，并造成25%的额外伤害。
	if(unitLevel>=12)then listSpell["spell_fire_flamebolt"] = 133; end   --火球术--发射一枚火球，造成1,841点火焰伤害。
	if(unitLevel>=24)then listSpell["spell_mage_infernoblast"] = 108853; end   --炼狱冲击--冲击敌人，造成736.50点火焰伤害，且必定产生爆击。击中后，会将任意一个炎爆术、点燃和燃烧的效果扩散到10码范围内最多3个敌方目标的身上。<br/><br/>代替火焰冲击。
	if(unitLevel>=48)then listSpell["spell_fire_soulburn"] = 2948; end   --灼烧--灼烧敌人，对其造成1,172点火焰伤害。可以在移动中施放。
	if(unitLevel>=62)then listSpell["inv_misc_head_dragon_01"] = 31661; end   --龙息术--使施法者面前锥形区域内的所有目标受到2,087点火焰伤害，并陷入迷惑状态，持续4秒。<br/><br/>任何直接造成伤害的攻击都会使目标恢复正常。
	if(unitLevel>=77)then listSpell["spell_fire_sealoffire"] = 11129; end   --燃烧--立即对目标造成1,228点火焰伤害，并使其昏迷3秒。<br/><br/>如果目标当前正受到点燃的影响，则会造成额外的伤害，数值相当于点燃每隔1秒跳一次的一半伤害，持续10秒。<br/><br/>施法时，会重置炼狱冲击技能的冷却时间。
	end
	--冰霜--bg-mage-frost
	if(telants == "Frost")then
	if(unitLevel>=10)then listSpell["spell_frost_summonwaterelemental_2"] = 31687; end   --召唤水元素--召唤一个水元素来为施法者作战。<br/><br/>向水元素施放寒冰箭会为其恢复2,040点生命值。
	if(unitLevel>=12)then listSpell["spell_frost_frostbolt02"] = 116; end   --寒冰箭--向敌人射出一支寒冰箭，造成2,039点冰霜伤害并使其移动速度降低50%，持续15秒。<br/><br/>同时还会使你的寒冰箭、冰枪术和水元素的水箭对目标额外造成5%的伤害，最多可叠加3次。
	if(unitLevel>=36)then listSpell["spell_frost_coldhearted"] = 12472; end   --冰冷血脉--加快你的施法速度，法术急速提高20%，在施法时因受到伤害而承受的施法推迟时间缩短100%。持续20秒。
	if(unitLevel>=62)then listSpell["spell_frost_frozenorb"] = 84714; end   --寒冰宝珠--从法师所在的位置向前施放寒冰宝珠，向附近所有敌方目标发射寒冰箭，造成774.50点冰霜伤害，持续10秒。当寒冰宝珠接触敌方目标之后，法师将获得一层寒冰指效果。<br/><br/>受到寒冰宝珠伤害的目标移动速度降低30%，持续2秒。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["spell_nature_enchantarmor"] = 12043; end   --气定神闲--激活之后，你的下一个施法时间低于10秒的法师法术会变为瞬发法术。<br/><br/>该法术不受公共冷却时间的影响。
	if(unitLevel>=15)then listSpell["spell_fire_burningspeed"] = 108843; end   --炽热疾速--抑制移动减速效果，并使你的移动速度提高150%，持续1.50秒。<br/><br/>该法术可以在施放其他非瞬发法术的过程中施放，并且不受公共冷却时间的影响。
	if(unitLevel>=15)then listSpell["spell_mage_iceflows"] = 108839; end   --浮冰--让你能在移动中施放和引导下2次基础施法时间或引导时间小于4秒的法师法术。该法术可以在施法过程中施放，并且不受公共冷却时间的影响。持续15秒。
	if(unitLevel>=30)then listSpell["spell_mage_temporalshield"] = 115610; end   --时光护盾--将你包裹在时光护盾之中，持续4秒。包裹在护盾中时受到的伤害将在6秒内恢复。该法术可以在昏迷、冰冻、瘫痪、恐惧或睡眠时使用，且该法术不受公共冷却时间的影响。
	if(unitLevel>=30)then listSpell["spell_ice_lament"] = 11426; end   --寒冰护体--立即为你施加魔法护盾，吸收5,197点伤害，持续1分钟。只要护盾存在，你就不会因为受到伤害而延长施法时间。
	if(unitLevel>=45)then listSpell["spell_frost_ringoffrost"] = 113724; end   --冰霜之环--在目标位置处召唤一道冰霜之环。进入环内的敌人将被冻结10秒。冰霜之环持续10秒，10码半径。目标上限为10个。
	if(unitLevel>=45)then listSpell["spell_frost_frostward"] = 111264; end   --寒冰结界--向一个友方目标施放寒冰结界。敌人攻击该目标时，10码范围内的所有敌人将被冻结在原地，持续5秒。寒冰结界可生效1次。持续30秒。
	if(unitLevel>=45)then listSpell["ability_mage_frostjaw"] = 102051; end   --冰霜之颌--将目标沉默并冻结在原地，持续8秒。对玩家目标的持续时间缩短一半。对目标造成的任何伤害都可能解除这个效果。
	if(unitLevel>=60)then listSpell["ability_mage_greaterinvisibility"] = 110959; end   --强化隐形术--使施法者立刻隐形，降低所有仇恨，并移除两个持续性伤害效果。隐形时，你不能成为敌人的目标。持续20秒。如果你做出任何动作，隐形效果就会被解除。<br/><br/>隐形时和隐形效果消失后的3秒之内，受到的伤害降低90%。<br/><br/>代替隐形术。
	if(unitLevel>=60)then listSpell["spell_frost_wizardmark"] = 11958; end   --急速冷却--激活之后，该法术会结束你的寒冰屏障、冰霜新星和冰锥术的冷却时间，并为你恢复30%的最大生命值。<br/><br/>该法术可以在昏迷、冰冻、瘫痪、恐惧或睡眠状态下使用，且不受公共冷却时间的影响。
	if(unitLevel>=75)then listSpell["spell_mage_nethertempest"] = 114923; end   --虚空风暴--向目标施放虚空风暴，在12秒内造成4,452点奥术伤害。虚空风暴每次造成伤害后，还会随机对10码范围内的一个目标额外造成伤害，数值相当于该次伤害的50%。
	if(unitLevel>=75)then listSpell["ability_mage_livingbomb"] = 44457; end   --活动炸弹--目标成了一个活动炸弹，在12秒内受到4,888点火焰伤害。当效果消失后或目标死亡时会发生爆炸，对目标及其附近10码范围内的所有敌人额外造成489点火焰伤害。最多影响3个目标。<br/><br/>该法术有1秒的公共冷却时间。
	if(unitLevel>=75)then listSpell["spell_mage_frostbomb"] = 112948; end   --寒冰炸弹--将一颗寒冰炸弹放在目标身上。4秒之后，炸弹爆炸，对主要目标造成5,245点冰霜伤害，并对10码范围内的所有其他目标造成2,624点冰霜伤害。所有受影响的目标移动速度降低70%，持续2秒。急速越高，寒冰炸弹的生效和冷却时间就越短。
	if(unitLevel>=90)then listSpell["spell_mage_runeofpower"] = 116011; end   --能量符文--在地上放置一个能量符文，持续1分钟。当站在你的能量符文上时，你的法力值回复速度提高75%，法术伤害提高15%。同一时间内你只能放置2个能量符文。<br/><br/>代替唤醒。
	if(unitLevel>=90)then listSpell["spell_shadow_detectlesserinvisibility"] = 1463; end   --咒术护盾--对你施加一个魔法护盾，在8秒内吸收最多1,228点伤害。被吸收的伤害会转化为法力值，最多转化为你最大法力值的18%。<br/><br/>当这个效果消失时，你的法术造成的伤害会提高最多30%，伤害提高的幅度根据护盾吸收的伤害量而定，持续15秒。<br/><br/><span style="color: #ffffff;">被动：</span><br/>法术造成的伤害提高6%，法力值回复速度提高65%。该效果在咒术护盾冷却时不可用。
end
if unitClass=="WARLOCK" then --9--术士
	if(unitLevel>=1)then listSpell["spell_shadow_summonimp"] = 688; end   --召唤小鬼--召唤一个小鬼为术士作战。<br/><br/>小鬼施放远程火焰箭，能持续治疗其主人，净化敌对魔法效果。
	if(unitLevel>=1)then listSpell["spell_shadow_shadowbolt"] = 686; end   --暗影箭--向敌人发射一支暗影箭，对其造成1,732点暗影伤害。<br/><br/>产生25点恶魔之怒。
	if(unitLevel>=3)then listSpell["spell_shadow_abominationexplosion"] = 172; end   --腐蚀术--腐蚀目标，在18秒内造成1,692点暗影伤害。<br/><br/>每次造成伤害时产生4点恶魔之怒。
	if(unitLevel>=7)then listSpell["spell_shadow_lifedrain02"] = 689; end   --吸取生命--从目标身上吸取生命，造成419点暗影伤害，并每1秒为施法者恢复2%的总生命值，持续6秒。<br/><br/>每秒产生10点恶魔之怒。
	if(unitLevel>=8)then listSpell["spell_shadow_summonvoidwalker"] = 697; end   --召唤虚空行者--召唤一个虚空行者为术士作战。<br/><br/>虚空行者能经受住大量打击，缴械近战攻击者，对缴械他们的敌人造成暗影伤害，在快要死亡时提高生命值并嘲讽正在攻击其主人的敌人。
	if(unitLevel>=9)then listSpell["warlock_healthstone"] = 6201; end   --制造治疗石--制造一颗治疗石，使用后可立即为你恢复20%的最大生命值。<br/><br/><span style="color: #ffffff;">魔法制造的物品</span><br/>魔法制造的物品在持有者退出游戏超过15分钟之后消失。
	if(unitLevel>=11)then listSpell["spell_shadow_lifedrain"] = 755; end   --生命通道--每1秒消耗你最大生命值的2%，为你召唤的恶魔恢复6%的最大生命值，持续6秒。
	if(unitLevel>=14)then listSpell["spell_shadow_possession"] = 5782; end   --恐惧--恐惧一名敌人，使其逃跑，最多持续20秒。<br/><br/><span style="color: #ffffff;">恐惧限制</span><br/>造成的任何伤害都可能解除恐惧效果。只能对一个目标使用。
	if(unitLevel>=16)then listSpell["spell_shadow_burningspirit"] = 1454; end   --生命分流--回复24,399点法力值。
	if(unitLevel>=17)then listSpell["warlock_curse_weakness"] = 109466; end   --虚弱诅咒--使用恶魔能量束缚目标，使其造成的物理伤害降低10%，并使其所有法术的施放时间延长50%（对玩家目标为25%），持续30秒。<br/><br/>对地下城和团队首领的影响减弱。<br/><br/><span style="color: #ffffff;">诅咒</span><br/>对于每个目标，一个术士只能施加一种诅咒。
	if(unitLevel>=18)then listSpell["spell_shadow_soulgem"] = 20707; end   --灵魂石--对活着的小队或团队成员施放以保存其灵魂，使其可以在死时复活。<br/><br/>如果施放在死去的目标身上，则可以立即复活目标。复活的目标会获得60%的生命值和20%的法力值。
	if(unitLevel>=20)then listSpell["spell_shadow_summonsuccubus"] = 712; end   --召唤魅魔--召唤一个魅魔为术士作战。<br/><br/>魅魔是危险的近战施法者。她们隐形，击退敌人并魅惑人形怪物，阻止他们进行攻击。
	if(unitLevel>=20)then listSpell["spell_nature_swiftness"] = 5784; end   --地狱战马--召唤一匹地狱战马作为你的坐骑。
	if(unitLevel>=22)then listSpell["spell_shadow_evileye"] = 126; end   --基尔罗格之眼--召唤基尔罗格之眼并通过它来观察世界。基尔罗格之眼处于潜行状态，并快速移动，但是非常脆弱。
	if(unitLevel>=24)then listSpell["spell_shadow_demonbreath"] = 5697; end   --无尽呼吸--使目标可以在水下呼吸，持续10分钟。
	if(unitLevel>=29)then listSpell["spell_shadow_summonfelhunter"] = 691; end   --召唤地狱猎犬--召唤一只地狱猎犬为术士作战。<br/><br/>地狱猎犬被魔法吸引，能打断法术施放并通过消耗敌人的增益魔法效果治疗自己。
	if(unitLevel>=30)then listSpell["ability_warlock_howlofterror"] = 5484; end   --恐惧嚎叫--发出嚎叫，使10码范围内的5个敌人因恐惧而逃跑，持续20秒。对目标造成的任何伤害都可能解除恐惧嚎叫。<br/><br/>被伤害性攻击命中后，恐惧嚎叫的冷却时间缩短1秒。
	if(unitLevel>=31)then listSpell["spell_shadow_enslavedemon"] = 1098; end   --奴役恶魔--奴役目标恶魔，迫使其听从你的命令。最多持续5分钟。<br/><br/><span style="color: #ffffff;">奴役</span><br/>在被奴役的状态下，该恶魔的攻击间隔延长30%，施法速度降低20%。
	if(unitLevel>=32)then listSpell["spell_shadow_cripple"] = 710; end   --放逐术--放逐一个敌方的恶魔、畸变怪或元素，最多持续30秒。<br/><br/><span style="color: #ffffff;">被放逐</span><br/>被放逐的目标无法行动，但处于无敌状态。只能对1个目标使用。<br/><br/>再次施放放逐术会解除放逐效果。
	if(unitLevel>=34)then listSpell["spell_fire_twilightfireward"] = 6229; end   --暮光结界--吸收3,766点暗影或神圣伤害，持续30秒。
	if(unitLevel>=40)then listSpell["ability_mount_dreadsteed"] = 23161; end   --恐惧战马--召唤一匹恐惧战马作为你的坐骑。
	if(unitLevel>=42)then listSpell["spell_shadow_twilight"] = 698; end   --召唤仪式--开启一个召唤传送门的仪式。队友可使用该传送门召唤一名小队或团队成员。<br/><br/><span style="color: #ffffff;">恶魔仪式</span><br/>需要施法者和另外2名小队或团队成员来完成。
	if(unitLevel>=49)then listSpell["spell_shadow_summoninfernal"] = 1122; end   --召唤地狱火--从扭曲虚空召唤一颗流星，对其坠落区域内的所有敌人造成1,255点火焰伤害，并使其昏迷2秒。一个地狱火将出现在流星坠地处，并受施法者支配，持续1分钟。<br/><br/>地狱火会造成强大的范围伤害，并攻击坠落点附近的目标。
	if(unitLevel>=51)then listSpell["warlock_curse_shadow"] = 1490; end   --元素诅咒--诅咒目标，使其在5分钟内受到的魔法伤害提高5%。<br/><br/><span style="color: #ffffff;">诅咒</span><br/>对于每个目标，一个术士只能施加一种诅咒。
	if(unitLevel>=56)then listSpell["ability_warlock_demonicempowerment"] = 119898; end   --恶魔掌控--命令你的恶魔施放威力最强大的技能。该法术的具体效果视你当前召唤的宠物而定。<br/><br/>小鬼：<span style="color: #ffffff;">灼疗主人</span><br/>虚空行者：<span style="color: #ffffff;">缴械</span><br/>魅魔：<span style="color: #ffffff;">鞭打</span><br/>地狱猎犬：<span style="color: #ffffff;">法术封锁</span><br/>恶魔卫士：<span style="color: #ffffff;">魔刃风暴</span>
	if(unitLevel>=58)then listSpell["warlock_summon_doomguard"] = 18540; end   --召唤末日守卫--召唤末日守卫攻击目标，持续1分钟。末日守卫将施放厄运箭，直到它离开。
	if(unitLevel>=64)then listSpell["spell_shadow_demonictactics"] = 104773; end   --不灭决心--术士硬化她的皮肤，受到的所有伤害降低40%，并免疫法术打断和沉默效果，持续8秒。
	if(unitLevel>=66)then listSpell["spell_arcane_arcane01"] = 29858; end   --灵魂碎裂--对周围半径50码范围内的所有敌人的威胁值降低90%。
	if(unitLevel>=68)then listSpell["spell_shadow_shadesofdarkness"] = 29893; end   --制造灵魂之井--制造一口灵魂之井。团队成员可以点击灵魂之井以获得一颗治疗石。<br/><br/>灵魂之井持续2分钟。
	if(unitLevel>=76)then listSpell["spell_shadow_demoniccircleteleport"] = 48020; end   --恶魔法阵：传送--将你传送到你的恶魔法阵并移除所有诱捕效果。
	if(unitLevel>=76)then listSpell["spell_shadow_demoniccirclesummon"] = 48018; end   --恶魔法阵：召唤--在你脚下召唤一道恶魔法阵，持续6分钟。你在同一时间内只能激活一道恶魔法阵。
	if(unitLevel>=77)then listSpell["spell_fire_felfirenova"] = 77799; end   --邪焰--对一个敌人造成941.50点暗影烈焰伤害，并使腐蚀术的持续时间延长6秒。<br/><br/>产生15点恶魔之怒。
	if(unitLevel>=82)then listSpell["spell_warlock_focusshadow"] = 109773; end   --黑暗意图--为所有的小队和团队成员注入暗影能量，使其法术强度提高10%，耐力提高10%，持续1小时。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会获得该效果。
	if(unitLevel>=87)then listSpell["spell_warlock_demonicportal_green"] = 111771; end   --恶魔传送门--在两个位置分别召唤一个恶魔传送门。小队成员踏入传送门后将立即被传送到另一个传送门。<br/><br/>每15秒产生一层传送门可使用效果。最多叠加5层。传送门存在15分钟。
	--痛苦--bg-warlock-affliction
	if(telants == "Affliction")then
	if(unitLevel>=10)then listSpell["spell_shadow_unstableaffliction_3"] = 30108; end   --痛苦无常--暗影能量逐渐吞噬目标，在14秒内对其造成2,107点伤害。<br/><br/>如果痛苦无常被驱散，则会对驱散者造成2,408点伤害，并使其沉默4秒。该伤害总能造成爆击。
	if(unitLevel>=19)then listSpell["spell_warlock_soulburn"] = 74434; end   --灵魂燃烧--消耗一块灵魂碎片，释放你的法术所蕴藏的能量。<br/><br/>灵魂燃烧：召唤恶魔的冷却时间为60秒。<br/><br/>受影响的法术：<br/>召唤恶魔<br/>吸取生命<br/>无尽呼吸
	if(unitLevel>=19)then listSpell["spell_shadow_haunting"] = 1120; end   --吸取灵魂--吸取目标的灵魂，每2秒造成487点暗影伤害，并在其造成两次伤害后为一块灵魂碎片充能。如果目标死亡且产生经验值或荣誉值，则会为三块灵魂碎片充能，持续12秒。<br/><br/>当吸取灵魂造成伤害时，如果目标的生命值等于或低于20%，则额外造成100%的伤害，并使你的其他周期性痛苦伤害效果立即造成相当于其普通周期性伤害100%的伤害。
	if(unitLevel>=21)then listSpell["spell_shadow_rainoffire"] = 5740; end   --火焰之雨--召唤火焰之雨，灼烧目标区域中的敌人，在6秒内对其造成2,512点火焰伤害。
	if(unitLevel>=32)then listSpell["spell_shadow_grimward"] = 18223; end   --疲劳诅咒--目标的移动速度降低30%，持续30秒。<br/><br/><span style="color: #ffffff;">诅咒</span><br/>对于每个目标，一个术士只能施加一种诅咒。
	if(unitLevel>=36)then listSpell["spell_shadow_curseofsargeras"] = 980; end   --痛楚--使目标受到越来越深的痛楚，在24秒内最高造成3,960点暗影伤害。<br/><br/>伤害在初期很低，但每造成一次伤害后就将不断提高。
	if(unitLevel>=42)then listSpell["ability_warlock_everlastingaffliction"] = 103103; end   --灾难之握--将目标束缚在暮光中，在4秒内对其造成1,004点暗影伤害。<br/><br/>当灾难之握造成伤害时，你其他的周期性痛苦伤害效果会立即造成50%的普通周期性伤害，每1秒一次。
	if(unitLevel>=60)then listSpell["spell_shadow_seedofdestruction"] = 27243; end   --腐蚀之种--将恶魔之种埋藏于敌方目标体内，在18秒内造成1,578点暗影伤害。<br/><br/>当目标受到施法者总计1,582点伤害或死亡时，恶魔之种将对该目标10码范围内的所有敌人造成1,142点暗影伤害。
	if(unitLevel>=62)then listSpell["ability_warlock_haunt"] = 48181; end   --鬼影缠身--你将鬼魅之魂注入目标体内，造成2,196点暗影伤害，并使你的法术对其造成的所有伤害提高30%，持续8秒。
	if(unitLevel>=79)then listSpell["ability_warlock_soulswap"] = 86121; end   --灵魂交换--你立即造成628点伤害，并移除你施加在目标身上的持续暗影伤害效果。<br/><br/>在随后的20秒内，被你施放灵魂交换：释出的下一个目标将会受到持续暗影伤害影响，并受到628点伤害。<br/><br/>你不能对同一个目标施放灵魂交换。
	if(unitLevel>=84)then listSpell["spell_warlock_demonsoul"] = 113860; end   --黑暗灵魂：哀难--为你的灵魂注入死去敌人的痛苦，使你的法术急速提高30%，持续20秒。
	end
	--恶魔学识--bg-warlock-demonology
	if(telants == "Demonology")then
	if(unitLevel>=10)then listSpell["spell_shadow_demonform"] = 103958; end   --恶魔变形--你暂时变成一个恶魔，造成的伤害提高24.00%。
	if(unitLevel>=12)then listSpell["ability_warstomp"] = 109151; end   --恶魔飞跃--使用恶魔之翼腾空跃起，移动一小段距离。<br/><br/>使用该技能激活恶魔变形。
	if(unitLevel>=13)then listSpell["spell_fire_fireball02"] = 6353; end   --灵魂之火--燃烧敌人的灵魂，造成1,071点火焰伤害。<br/><br/>灵魂之火总能造成爆击。此外，你的爆击几率越高，造成的伤害也就越高。<br/><br/>产生30点恶魔之怒。
	if(unitLevel>=19)then listSpell["ability_warlock_handofguldan"] = 105174; end   --古尔丹之手--召唤一颗从天而降的陨石，对目标及其附近6码范围内的所有敌人造成722点暗影烈焰伤害，并对其附加暗影烈焰效果。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_fire_twilightflamebreath.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">暗影烈焰</span><br/>移动速度降低30%，在6秒内造成1,032点暗影烈焰伤害。每次造成伤害会产生2点恶魔之怒。
	if(unitLevel>=22)then listSpell["spell_fire_incinerate"] = 1949; end   --地狱烈焰--让施法者周围的区域燃起烈焰，每1秒对施法者自己造成263点火焰伤害，对附近的所有敌人造成263点火焰伤害，持续14秒。<br/><br/>每秒产生10点恶魔之怒，外加每个次要目标每秒额外产生3点恶魔之怒。
	if(unitLevel>=42)then listSpell["spell_shadow_summonfelguard"] = 30146; end   --召唤恶魔卫士--召唤一个恶魔卫士为术士作战。<br/><br/>恶魔卫士是强大的近战战士，能对抗多个目标，能进行威力强大的范围攻击，使攻击范围内的一个对手昏迷并使目标受到的治疗效果降低。
	if(unitLevel>=47)then listSpell["ability_warlock_demonicpower"] = 103967; end   --腐臭蜂群--扇动你的翅膀，释放一道暗影巨浪，造成627.50点暗影伤害，击退敌人并打断敌人施法。
	if(unitLevel>=84)then listSpell["spell_warlock_demonsoul"] = 113861; end   --黑暗灵魂：学识--你的灵魂被注入了恶魔知识，使你的精通提高18,000点，持续20秒。
	end
	--毁灭--bg-warlock-destruction
	if(telants == "Destruction")then
	if(unitLevel>=10)then listSpell["spell_fire_fireball"] = 17962; end   --燃烧--目标敌人立即爆炸，造成2,165点火焰伤害。<br/><br/>如果目标受到献祭效果影响，其移动速度降低50%，持续5秒。<br/><br/>产生爆燃灰烬。爆击将使该效果加倍。
	if(unitLevel>=10)then listSpell["spell_fire_burnout"] = 29722; end   --烧尽--对一个敌人造成1,932点火焰伤害。
	if(unitLevel>=12)then listSpell["spell_fire_immolation"] = 348; end   --献祭--灼烧敌人，造成536点火焰伤害，并在接下来的15秒内额外造成2,680点火焰伤害。<br/><br/>代替腐蚀术。
	if(unitLevel>=21)then listSpell["spell_shadow_rainoffire"] = 5740; end   --火焰之雨--召唤火焰之雨，灼烧目标区域中的敌人，在6秒内对其造成2,512点火焰伤害。
	if(unitLevel>=36)then listSpell["ability_warlock_baneofhavoc"] = 80240; end   --浩劫--使术士接下来施放的一发混乱之箭或者三发其他单体法术可以同时攻击该目标。持续15秒。
	if(unitLevel>=42)then listSpell["inv_ember"] = 114635; end   --灰烬转换--为你恢复18.60%的生命值。
	if(unitLevel>=42)then listSpell["ability_warlock_chaosbolt"] = 116858; end   --混乱之箭--释放出一道混乱冲击，造成3,202点暗影伤害。<br/><br/>混乱之箭总能造成爆击。此外，你的爆击几率越高，造成的伤害也就越高。<br/><br/>替代灵魂之火。
	if(unitLevel>=47)then listSpell["spell_shadow_scourgebuild"] = 17877; end   --暗影灼烧--立即冲击目标，造成4,984点暗影伤害。只能对生命值低于20%的敌人使用。<br/><br/>5秒后为你恢复15%的总法力值。如果目标在5秒内死亡，并使你获得经验值或荣誉值，施法者则改为获得一团爆燃灰烬。
	if(unitLevel>=54)then listSpell["ability_warlock_fireandbrimstone"] = 108683; end   --硫磺烈火--你的献祭、烧尽、燃烧和诅咒法术会消耗一团爆燃灰烬，并会攻击到目标附近10码范围内的所有目标，伤害值相当于其普通伤害的43.40%。
	if(unitLevel>=79)then listSpell["ability_mount_fireravengodmount"] = 120451; end   --克索诺斯之焰--克索诺斯之焰使你的上一只恶魔立即复活。
	if(unitLevel>=84)then listSpell["spell_warlock_demonsoul"] = 113858; end   --黑暗灵魂：易爆--为你的灵魂注入不稳定的能量，使你的爆击几率提高30%，持续20秒。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["spell_warlock_darkregeneration"] = 108359; end   --黑暗再生--你和你的宠物恢复最大生命值的30%，受到的所有治疗效果提高25%，持续12秒。
	if(unitLevel>=30)then listSpell["ability_warlock_shadowflame"] = 47897; end   --恶魔吐息--恶魔吐息对施法者面前10码的锥形区域内的所有敌人造成1,255点暗影伤害，并对其施加暗影烈焰效果。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_fire_twilightflamebreath.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">暗影烈焰</span><br/>移动速度降低30%，在6秒内造成1,032点暗影烈焰伤害。每次造成伤害会产生2点恶魔之怒。
	if(unitLevel>=30)then listSpell["ability_warlock_mortalcoil"] = 6789; end   --死亡缠绕--使敌方目标因恐惧而逃跑，持续3秒。施法者将恢复最大生命值的15%。
	if(unitLevel>=30)then listSpell["ability_warlock_shadowfurytga"] = 30283; end   --暗影之怒--释放暗影之怒，使8码范围内的所有敌人昏迷3秒。
	if(unitLevel>=45)then listSpell["warlock_sacrificial_pact"] = 108416; end   --牺牲契约--你的恶魔仆从牺牲当前生命值的25%，为你施加护盾抵挡伤害。该护盾可吸收相当于已牺牲生命值的400%，持续20秒。<br/><br/>如果你没有恶魔仆从，就会牺牲你自己的生命值。可在遭受控制限制效果时施放。
	if(unitLevel>=45)then listSpell["ability_deathwing_bloodcorruption_death"] = 110913; end   --黑暗交易--抵挡所有伤害，持续8秒。<br/><br/>护盾消失后的8秒内，将受到数值相当于被阻挡伤害的50%的伤害。可在遭受控制限制效果时施放。
	if(unitLevel>=60)then listSpell["ability_deathwing_bloodcorruption_earth"] = 111397; end   --鲜血恐惧--激活后，不论何时敌人的近战攻击对术士造成伤害时，都将因恐惧而溃逃，最多持续4秒。1层鲜血恐惧，持续1分钟。
	if(unitLevel>=60)then listSpell["ability_deathwing_sealarmorbreachtga"] = 111400; end   --爆燃冲刺--每秒消耗4%的最大生命值，使你的移动速度提高50%。爆燃冲刺期间，移动限制效果不会让你的移动速度降低到正常移动速度的100%以下。<br/><br/>持续直到主动取消。
	if(unitLevel>=60)then listSpell["warlock_spelldrain"] = 108482; end   --无拘意志--净化所有魔法效果、移动限制效果和所有导致角色或恶魔不受控制的效果。
	if(unitLevel>=75)then listSpell["warlock_grimoireofservice"] = 108501; end   --魔典：邪恶仆从--立即召唤第二个恶魔为你作战，持续20秒。恶魔一旦被召唤出来就会立即使用下列的某一个特殊技能：<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_shadow_summonimp.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">魔典：小鬼</span>：立即净化主人身上的敌对魔法效果。<br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_shadow_summonvoidwalker.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">魔典：虚空行者</span>：召唤出来后立即嘲讽它们的目标。<br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_shadow_summonsuccubus.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">魔典：魅魔</span>：如果目标是人型生物，则立即对其使用魅惑。<br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_shadow_summonfelhunter.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">魔典：地狱猎犬</span>：召唤出来后立即对目标进行打断。<br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/spell_shadow_summonfelguard.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">魔典：恶魔卫士</span>：召唤出来后立即使目标昏迷。
	if(unitLevel>=75)then listSpell["warlock_grimoireofsacrifice"] = 108503; end   --魔典：恶魔牺牲--你牺牲自己的恶魔而获得它的能力，强化自身大多数单体目标法术，使其造成的伤害提高25%。除此之外，你每5秒恢复2%的最大生命值，持续1小时。<br/><br/>召唤另一个恶魔将取消该效果。
	if(unitLevel>=90)then listSpell["achievement_boss_magtheridon"] = 108508; end   --玛诺洛斯的狂怒--使你的范围伤害法术的影响范围扩大500%。
end
if unitClass=="MONK" then --10--武僧
	if(unitLevel>=1)then listSpell["monk_stance_whitetiger"] = 103985; end   --猛虎式--移动速度提高10%，造成的伤害提高10%，贯日击和移花接木技能产生的真气增加1点。
	if(unitLevel>=1)then listSpell["ability_monk_jab"] = 100780; end   --贯日击--你使出长拳猛击目标，对其造成5至8点伤害，并产生1点真气。
	if(unitLevel>=3)then listSpell["ability_monk_tigerpalm"] = 100787; end   --猛虎掌--掌击敌人，造成9到15点伤害。<br/><br/>你还将获得猛虎之力，使你的攻击忽略敌人30%的护甲值，持续20秒。
	if(unitLevel>=5)then listSpell["ability_monk_roll"] = 109132; end   --滚地翻--进行短距离翻滚。
	if(unitLevel>=7)then listSpell["ability_monk_roundhousekick"] = 100784; end   --幻灭踢--踢出一道真气能量冲击波，对目标造成22点到36点物理伤害。
	if(unitLevel>=14)then listSpell["ability_monk_provoke"] = 115546; end   --嚎镇八方--你嘲讽目标，使其移动速度提高50%并冲向你。
	if(unitLevel>=18)then listSpell["ability_druid_lunarguidance"] = 115178; end   --轮回转世--让灵魂返回躯体，让死亡的目标复活，并为其恢复35%的最大生命值和法力值。无法在战斗中施放。
	if(unitLevel>=20)then listSpell["spell_holy_dispelmagic"] = 115450; end   --化瘀术--为友方目标移除病痛，驱散所有有害中毒和疾病效果。
	if(unitLevel>=20)then listSpell["spell_monk_zenpilgrimage"] = 126892; end   --禅宗朝圣--你的灵魂前往潘达利亚的晴日峰，将你的肉身留在原地。<br/><br/>再次施放禅宗朝圣以回到你之前所在地方附近。
	if(unitLevel>=22)then listSpell["ability_monk_touchofdeath"] = 115080; end   --轮回之触--攻击敌方目标的死穴，立即将其杀死。<br/><br/>只能对生命值等于或低于你的非玩家目标使用。
	if(unitLevel>=22)then listSpell["ability_monk_legacyoftheemperor"] = 115921; end   --帝王传承--你颂唱末代皇帝之语，使目标的力量、敏捷和智力提高5%。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会获得此效果。
	if(unitLevel>=24)then listSpell["ability_monk_fortifyingale_new"] = 115203; end   --壮胆酒--皮肤如石头般坚硬，使你的生命值提高20%，受到的伤害降低20%。持续20秒。
	if(unitLevel>=26)then listSpell["ability_monk_expelharm"] = 115072; end   --移花接木--立即为你恢复22至36点生命值，并对附近10码范围内的一名敌人造成自然伤害，数值相当于该次治疗量的50%。产生1点真气。
	if(unitLevel>=28)then listSpell["ability_shockwave"] = 116095; end   --金刚震--尝试废除目标的移动能力，使其移动速度降低50%。如果目标仍在武僧10码范围内，金刚震的持续时间就会被刷新。<br/><br/>在一个已经被诱捕的目标上使用金刚震会使其被定身，持续8秒。
	if(unitLevel>=30)then listSpell["spell_monk_nimblebrew"] = 137562; end   --逍遥酒--移除你所有的定身、昏迷、恐惧和惊骇效果，并在6秒内使后续此类效果的持续时间缩短60%。
	if(unitLevel>=32)then listSpell["ability_monk_spearhand"] = 116705; end   --切喉手--你猛击目标的咽喉，打断其施法，并阻止其施放任何同系的法术，持续4秒。<br/><br/>如果敌人在施法时面对着你，则会沉默2秒。
	if(unitLevel>=44)then listSpell["ability_monk_paralysis"] = 115078; end   --分筋错骨--令目标的肌肉突然萎缩，使其瘫痪40秒。如果从目标身后施放，则持续时间会延长50%。同一时间内只能对一个目标使用分筋错骨。<br/><br/>任何伤害都会解除这个效果。
	if(unitLevel>=46)then listSpell["ability_monk_cranekick_new"] = 101546; end   --神鹤引项踢--在空中施展回旋踢，每0.75秒对附近8码范围内的所有敌人造成5至9点伤害。移动速度降低30%。在命中至少3个目标时产生1点真气。持续2.25秒。<br/><br/>施放神鹤引项踢时，你还能继续进行躲闪和招架。
	if(unitLevel>=54)then listSpell["ability_monk_cracklingjadelightning"] = 117952; end   --碎玉闪电--引导碎玉闪电攻击目标，在6秒内造成1,314点自然伤害。当你造成伤害时，你有30%的几率生成1点真气。<br/><br/>如果目标在受到碎玉闪电伤害时对你发起近战攻击，他们会被击退一小段距离。这个效果有8秒的冷却时间。
	if(unitLevel>=64)then listSpell["ability_monk_healthsphere"] = 115460; end   --疗伤珠--你在目标位置用疗伤的迷雾制造一颗疗伤珠，持续1分钟。如果有盟友从中穿过，便会消耗疗伤珠，为其恢复10,029点生命值。<br/><br/>武僧在同一时间内最多可以激活3颗疗伤珠。<br/><br/>如果疗伤珠在未被使用前就消失了，则疗伤珠将为附近6码范围内的一个盟友恢复该效果的50%。
	if(unitLevel>=68)then listSpell["ability_warrior_disarm"] = 117368; end   --探云鞭--你甩出一根鞭绳夺取目标的武器和盾牌，并为你所用，持续8秒。<br/><br/>如果你夺取了一件更好的主手武器，则你造成伤害或治疗效果会提高5%，或者受到的伤害会降低5%。
	if(unitLevel>=82)then listSpell["ability_monk_zenmeditation"] = 115176; end   --禅悟冥想--使你受到的所有伤害降低90%，并将对附近30码范围内的小队和团队成员施放的最多5个有害法术转移给你，持续8秒。<br/><br/>受到近战攻击会打断你的冥想，并取消这个效果。
	if(unitLevel>=87)then listSpell["spell_shaman_spectraltransformation"] = 119996; end   --魂体双分：转移--将你的身体和灵魂交换位置。
	if(unitLevel>=87)then listSpell["monk_ability_transcendence"] = 101643; end   --魂体双分--你将肉体和灵魂分离，并将灵魂留在原地，持续15分钟。<br/><br/>使用魂体双分：转移让你和你的灵魂交换位置。
	--酒仙--bg-monk-brewmaster
	if(telants == "Brewmaster")then
	if(unitLevel>=10)then listSpell["ability_monk_drunkenhaze"] = 115180; end   --迷醉酒雾--你掷出一桶绝世佳酿，使8码范围内所有敌人的移动速度降低50%，持续15秒。造成大量的威胁值。<br/><br/>受影响目标的近战攻击有3%的几率不能击中目标，反而对其自身造成1,158点伤害。
	if(unitLevel>=10)then listSpell["monk_stance_drunkenox"] = 115069; end   --磐牛式--受到的伤害降低25%，能量回复速度提高10%，受到爆击的几率降低6%，耐力值提高20%，并使你能够用醉拳化解伤害。<br/><br/><span style="color: #ffffff;">醉拳</span><br/>灵活地化解物理攻击，一次只承受80%的伤害，剩余20%的伤害将在随后的10秒内承受。
	if(unitLevel>=11)then listSpell["achievement_brewery_2"] = 121253; end   --醉酿投--你向目标投掷一桶酒，对附近8码范围内的所有敌人造成25到41点伤害。同时使目标浸透在你的迷醉酒雾中，并对其施加虚弱打击效果。产生2点真气。<br/><br/><span class="icon-frame frame-18"><img src="{assetUrl}/wow/icons/18/ability_monk_drunkenhaze.jpg" width="18" height="18"/></span> <span style="color: #ffffff;">迷醉酒雾</span><br/>你掷出一桶绝世佳酿，使8码范围内所有敌人的移动速度降低50%，持续15秒。造成大量的威胁值。<br/><br/>受影响目标的近战攻击有3%的几率不能击中目标，反而对其自身造成1,158点伤害。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span> <br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=18)then listSpell["ability_monk_breathoffire"] = 115181; end   --火焰之息--喷火对你面前8码范围内的所有目标造成1,635点伤害。<br/><br/>如果目标受到迷醉酒雾影响，则目标会在8秒内燃烧，额外受到2,118点伤害，。
	if(unitLevel>=18)then listSpell["ability_monk_clashingoxcharge"] = 122057; end   --对冲--你和你的目标同时冲锋并在半途相撞，使得周围6码范围内的所有目标昏迷4秒。
	if(unitLevel>=26)then listSpell["ability_monk_guard"] = 115295; end   --金钟罩--使用金钟罩抵挡将要承受的攻击，在30秒内吸收14,344点伤害。<br/> <br/>金钟罩持续期间，你对自己施加的治疗效果提高30%。
	if(unitLevel>=36)then listSpell["ability_monk_elusiveale"] = 115308; end   --飘渺酒--消耗你的飘渺酒的效果，每层效果使你躲闪近战和远程攻击的几率提高30%，持续1秒。
	if(unitLevel>=48)then listSpell["monk_ability_avertharm"] = 115213; end   --慈悲庇护--使用该技能后的6秒内，你周围10码范围内的所有友方目标受到伤害的20%将转由到你来承担。<br/><br/>慈悲庇护的伤害可以被醉拳化解。如果你的生命值低于10%，则慈悲庇护的效果消失。
	if(unitLevel>=70)then listSpell["monk_ability_summonoxstatue"] = 115315; end   --召唤玄牛雕像--在目标位置召唤一座玄牛雕像。持续15分钟。同一时间只能召唤一座玄牛雕像。<br/><br/>在你使用嚎镇八方和玄牛睥睨时，玄牛雕像会使用同样的技能。<br/><br/><span style="color: #ffffff;">玄牛护体（被动）</span><br/>每当武僧造成912点伤害时，玄牛雕像就会对40码范围内一名受伤的小队或团队成员施放可吸收14,344点伤害的金钟罩，持续30秒。该效果不能施放在武僧身上。
	if(unitLevel>=75)then listSpell["inv_misc_beer_06"] = 119582; end   --活血酒--立即移除所有由醉拳化解的剩余伤害。
	end
	--织雾--bg-monk-mistweaver
	if(telants == "Mistweaver")then
	if(unitLevel>=10)then listSpell["monk_stance_wiseserpent"] = 115070; end   --灵龙式--治疗效果提高20%，并将你的能量资源转换成法力值，提高命中和精准，数值相当于从装备或效果获得的精神总量的50%。<br/><br/>从装备获得的急速提高50%。你的攻击强度相当于你的法术强度的200%，你无法再从其他攻击强度增益效果中获益。<br/><br/>另外，你还会获得龙威显赫，使你对20码范围内生命值最低的目标进行治疗，数值相当于你造成的非自动攻击伤害的25%。
	if(unitLevel>=10)then listSpell["ability_monk_soothingmists"] = 115175; end   --抚慰之雾--在8秒内为目标恢复25,285点生命值。<br/><br/>当你用抚慰之雾进行治疗时，你有30%的几率产生1点真气。
	if(unitLevel>=16)then listSpell["spell_monk_envelopingmist"] = 124682; end   --氤氲之雾--在6秒内为目标恢复44,952点生命值，并使其受到你抚慰之雾的治疗提高30%。<br/><br/>如果在引导抚慰之雾时施放，氤氲之雾将变为瞬发。
	if(unitLevel>=32)then listSpell["ability_monk_surgingmist"] = 116694; end   --升腾之雾--使目标恢复17,578点生命值。产生1点真气。<br/><br/>如果在引导抚慰之雾时施放，则升腾之雾将成为瞬发法术，直接治疗该目标。
	if(unitLevel>=42)then listSpell["ability_monk_renewingmists"] = 115151; end   --复苏之雾--你用疗伤的迷雾环绕目标，每2秒为其恢复2,286点生命值，持续18秒。产生1点真气。<br/><br/>复苏之雾每治疗一次，就会飘向20码范围内最近的友方受伤单位，最多飘移2次。
	if(unitLevel>=50)then listSpell["ability_monk_chicocoon"] = 116849; end   --作茧缚命--将目标包围在真气形成的茧中，吸收81,973点伤害，并使其受到的所有周期性治疗效果提高50%。持续12秒。
	if(unitLevel>=56)then listSpell["monk_ability_cherrymanatea"] = 115294; end   --法力茶--每层法力茶效果可为你回复最大法力值的4%。法力茶需要引导，每层效果持续1秒。取消引导不会浪费效果。
	if(unitLevel>=62)then listSpell["ability_monk_uplift"] = 116670; end   --振魂引--在你的复苏之雾处于激活状态下时，为所有目标治疗7,922点生命值。
	if(unitLevel>=66)then listSpell["ability_monk_thunderfocustea"] = 116680; end   --雷光聚神茶--你获得一股能量，使你的下一个升腾之雾治疗效果翻倍或使你的下一个振魂引刷新所有目标身上的复苏之雾效果的持续时间，持续30秒。
	if(unitLevel>=70)then listSpell["ability_monk_summonserpentstatue"] = 115313; end   --召唤青龙雕像--在目标位置召唤一座青龙雕像。持续15分钟。同一时间只能激活一座雕像。<br/><br/><span style="color: #ffffff;">龙威显赫（被动）</span><br/>当武僧造成非自动攻击伤害时，召唤出来的青龙雕像将治疗附近20码范围内生命值最低的目标，治疗量相当于造成伤害的25%。<br/><br/><span style="color: #ffffff;">龙心向背（被动）</span><br/>当你施放抚慰之雾时，青龙雕像也会对40码范围内的一个受伤盟友施放抚慰之雾。
	if(unitLevel>=78)then listSpell["spell_shaman_blessingofeternals"] = 115310; end   --还魂术--立即为100码范围内所有的小队或团队成员恢复14,619点生命值，并为其移除任何有害魔法、中毒和疾病效果。
	end
	--踏风--bg-monk-battledancer
	if(telants == "Battledancer")then
	if(unitLevel>=10)then listSpell["monk_ability_fistoffury"] = 113656; end   --怒雷破--对你前方所有目标施展急速拳击，使其昏迷并每1秒造成21点到34点伤害，持续4秒。伤害由所有目标平均分摊。
	if(unitLevel>=18)then listSpell["ability_monk_flyingdragonkick"] = 101545; end   --翔龙在天--加速腾跃到空中。<br/><br/>在移动中再次使用翔龙在天使你降落至地面，对8码范围内的所有敌人造成1,852点伤害，并使其移动速度降低70%，持续4秒。
	if(unitLevel>=22)then listSpell["ability_monk_touchofkarma"] = 122470; end   --业报之触--你受到的所有伤害将转移给敌方目标，在6秒内持续造成自然伤害。该伤害不会超过你的总生命值。效果持续10秒。
	if(unitLevel>=36)then listSpell["ability_monk_energizingwine"] = 115288; end   --豪能酒--在6秒内产生60点能量。<br/>只能在战斗中使用。
	if(unitLevel>=48)then listSpell["ability_monk_explodingjadeblossom"] = 115073; end   --旋火冲--对你前方50码范围内的第一个敌方目标造成6到11点火焰伤害。<br/><br/>如果旋火冲扩散到10码外，则其造成的伤害将提高50%并使目标定身2秒。
	if(unitLevel>=56)then listSpell["ability_monk_risingsunkick"] = 107428; end   --旭日东升踢--你向上猛踢，对目标造成39点到65点伤害，并造成致死之伤效果。<br/><br/>并且你的技能对8码范围内的所有目标造成的伤害提高20%，持续15秒。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_criticalstrike.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">致死之伤</span><br/>重伤目标，使其受到的所有治疗效果降低，持续10秒。
	if(unitLevel>=56)then listSpell["ability_monk_tigereyebrandy"] = 116740; end   --虎眼酒--激活后每层虎眼酒效果会提高2.60%的伤害，最多可消耗10层虎眼酒效果，持续15秒。
	if(unitLevel>=75)then listSpell["spell_sandstorm"] = 137639; end   --风火雷电--武僧开始分裂，召唤出一个元素之灵来攻击目标。武僧同一时间最多可分裂出两个元素之灵。<br/><br/>元素之灵会攻击它们的目标，并镜像武僧的伤害性技能。但是，每召唤一个元素之灵，武僧本体的伤害都会降低。<br/><br/>一个元素之灵 - 武僧和元素之灵造成相当于武僧60%的普通伤害。<br/><br/>两个元素之灵 - 武僧和元素之灵造成相当于武僧45%的普通伤害。<br/><br/>元素之灵会持续到武僧取消该效果，或他们的目标死亡，或不可用为止。
	if(unitLevel>=81)then listSpell["ability_monk_prideofthetiger"] = 116781; end   --白虎传承--你尊奉白虎传承，爆击几率提高5%。<br/><br/>如果目标在你的小队或团队中，则全体小队和团队成员都会受到影响。
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["ability_monk_tigerslust"] = 116841; end   --迅如猛虎--立即解除目标身上所有定身和移动限制效果，并使其移动速度提高70%，持续6秒。
	if(unitLevel>=30)then listSpell["ability_monk_chiwave"] = 115098; end   --真气波--施放一道真气波拂过你的队友和敌人，造成519点自然伤害或恢复519点生命值。弹射到25码范围内最近的目标身上，最多弹射7次。<br/><br/>当弹射到盟友身上时，真气波会优先选择受伤的而非生命值全满的目标。
	if(unitLevel>=30)then listSpell["ability_monk_forcesphere"] = 124081; end   --禅意珠--在目标上方生成一颗禅意珠，为其恢复104点生命值，并在16秒内每2秒对目标周围10码范围内最近的敌人造成104点自然伤害。在同一时间内最多可召唤两颗禅意珠。<br/><br/>如果禅意珠的目标生命值降至35%或更低，禅意珠被驱散或效果结束，则会发生爆炸，对其周围10码范围内的所有目标造成424点自然伤害，或恢复269点生命值。
	if(unitLevel>=30)then listSpell["spell_arcane_arcanetorrent"] = 123986; end   --真气爆裂--你召唤出一道真气能量漩涡并将其丢向目标，对其路径上的所有敌人造成1,393点自然伤害，并为所有盟友恢复1,152点生命值。真气爆裂总是会治疗武僧。<br/><br/>施放真气爆裂时，你仍可以躲闪、招架和自动攻击。
	if(unitLevel>=45)then listSpell["ability_monk_chibrew"] = 115399; end   --真气酒--立即为你恢复所有真气。
	if(unitLevel>=60)then listSpell["spell_monk_ringofpeace"] = 116844; end   --平心之环--为友方目标形成一道庇护之环，立即使所有敌人被缴械并沉默，持续3秒。此外，在平心之环内对友方目标进行攻击或施法的敌人，其被缴械并沉默的时间将额外延长3秒。平心之环持续8秒。
	if(unitLevel>=60)then listSpell["ability_monk_chargingoxwave"] = 119392; end   --蛮牛冲--一头蛮牛雕像冲向你面前30码处，使其行进路线上的所有敌人昏迷3秒。
	if(unitLevel>=60)then listSpell["ability_monk_legsweep"] = 119381; end   --扫堂腿--你击倒5码范围内的所有敌人，有效地使其昏迷5秒。
	if(unitLevel>=75)then listSpell["ability_monk_dampenharm"] = 122278; end   --躯不坏--你抑制对你发动的最有害的攻击所造成的伤害。在接下来的45秒内，下3次会对你造成数值等于或大于你总生命值20%的伤害的攻击，其伤害量将被减半。<br/><br/>躯不坏可在昏迷时使用。
	if(unitLevel>=75)then listSpell["spell_monk_diffusemagic"] = 122783; end   --散魔功--受到的所有法术伤害降低90%，并清除你身上的所有魔法效果，将其返还至40码范围内向你施加这些魔法效果的施法者。持续6秒。
	if(unitLevel>=90)then listSpell["ability_monk_rushingjadewind"] = 116847; end   --碧玉疾风--你召唤一阵龙卷风行进至你面前30码处，对其行进路线上的所有目标造成5,539点自然伤害，并使你的神鹤引项踢造成的伤害提高30%，持续8秒。<br/><br/><span style="color: #ffffff;">酒仙</span> <br/>施放时造成酒醒入定的效果。<br/><br/><span style="color: #ffffff;">织雾</span><br/>你的神鹤引项踢的治疗效果提高50%，持续12秒。
	if(unitLevel>=90)then listSpell["ability_monk_summontigerstatue"] = 123904; end   --白虎下凡--呼唤白虎天神，召唤一个雕像为施法者作战。雕像会协助你，攻击你的主要目标，并且每6秒对附近10码范围内的3个敌人施放伏虎闪雷，在5秒内造成1,750点伤害，持续45秒。<br/><br/><span style="color: #ffffff;">酒仙</span> <br/>雪怒同时也会嘲讽目标，强迫其攻击他。
	if(unitLevel>=90)then listSpell["ability_monk_quitornado"] = 115008; end   --真气突--你凝聚真气，向前方突进，对路径上的所有敌人造成2,100点自然伤害，并为所有盟友恢复8,430点生命值。<br/><br/>真气突代替滚地翻。
end
if unitClass=="DRUID" then --11--德鲁伊
	if(unitLevel>=1)then listSpell["spell_nature_wrathv2"] = 5176; end   --愤怒--对目标造成2,891点自然伤害。
	if(unitLevel>=3)then listSpell["spell_nature_starfall"] = 8921; end   --月火术--灼烧敌人，对其造成669.50点奥术伤害，并在14秒内额外造成2,156点奥术伤害。
	if(unitLevel>=4)then listSpell["spell_nature_rejuvenation"] = 774; end   --回春术--为目标恢复4,307点生命值，并且之后每3秒额外恢复4,307点生命值，持续12秒。
	if(unitLevel>=6)then listSpell["ability_druid_catform"] = 768; end   --猎豹形态--变形进入猎豹形态，敏捷提高攻击强度，自动攻击伤害提高100%，并且移动速度提高25%（与其他提高移动速度的效果叠加）。<br/><br/>还使施法者免疫变形效果，并可使用多种猎豹形态下专有的技能。<br/><br/>不在猎豹形态下时，仍持续恢复能量。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=6)then listSpell["ability_druid_prowl"] = 5215; end   --潜行--允许德鲁伊潜行，但移动速度降低30%。效果一直持续，直到取消此状态。使用这个技能会激活猎豹形态。
	if(unitLevel>=6)then listSpell["ability_druid_disembowel"] = 1822; end   --斜掠--斜掠目标，造成116点流血伤害，并在15秒内额外造成580点流血伤害。奖励1个连击点数。
	if(unitLevel>=6)then listSpell["ability_druid_ferociousbite"] = 22568; end   --凶猛撕咬--终结技，根据连击点数决定造成的伤害最多额外消耗25点能量值使伤害最多提高100%。<br/><br/>当你用凶猛撕咬攻击生命值低于25%的目标时，将刷新你在该目标身上的割裂持续时间。<br/><br/>对流血目标的爆击几率提高25%。<br/><br/>   1点：1,088-1,458点伤害<br/>   2点：1,861-2,231点伤害<br/>   3点：2,634-3,004点伤害<br/>   4点：3,407-3,777点伤害<br/>   5点：4,180-4,550点伤害
	if(unitLevel>=6)then listSpell["ability_druid_mangle2"] = 33917; end   --裂伤--向目标施放裂伤，对其造成物理伤害。造成的伤害随着形态的变化而改变。在熊形态下使用会产生5点怒气值，在猎豹形态下使用会奖励1个连击点数。
	if(unitLevel>=8)then listSpell["ability_racial_bearform"] = 5487; end   --熊形态--变形进入熊形态，由布甲和皮甲得到的护甲值加成提高120%，耐力提高20%。<br/><br/>显著提高产生的威胁值，敏捷提高攻击强度，因装备而获得的急速和爆击提高50%，使施法者免疫变形效果，并可使用多种熊形态下专有的技能。<br/><br/>变形进入熊形态时怒气值为10。<br/><br/>变身可以解除施法者身上的移动减速效果。
	if(unitLevel>=8)then listSpell["ability_physical_taunt"] = 6795; end   --低吼--嘲讽目标，使其向你发起攻击，但是对已经在攻击你的目标无效。
	if(unitLevel>=8)then listSpell["ability_druid_maul"] = 6807; end   --重殴--槌击目标，造成110%的武器伤害。<br/><br/>对正在流血的目标额外造成20%的伤害。<br/><br/>在怒气值过剩时使用。
	if(unitLevel>=10)then listSpell["spell_nature_stranglevines"] = 339; end   --纠缠根须--将目标固定在原地，持续30秒。任何伤害都可能会打断纠缠根须的效果。
	if(unitLevel>=12)then listSpell["ability_druid_lunarguidance"] = 50769; end   --起死回生--使灵魂返回躯体，让已死的目标复活，并恢复35%的生命值和法力值。无法在战斗中施放。
	if(unitLevel>=14)then listSpell["spell_arcane_teleportmoonglade"] = 18960; end   --传送：月光林地--将施法者传送到月光林地。
	if(unitLevel>=16)then listSpell["ability_druid_travelform"] = 783; end   --旅行形态--变形进入旅行形态，移动速度提高40%。使施法者免疫变形效果。只能在户外使用。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=18)then listSpell["ability_druid_aquaticform"] = 1066; end   --水栖形态--变身进入水栖形态，使德鲁伊的游泳速度提高50%，并使其可以在水下呼吸。还使施法者免疫变形效果。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=22)then listSpell["inv_misc_monsterclaw_03"] = 106785; end   --横扫--横扫附近的敌人，造成物理伤害。造成的伤害随着形态的变化而改变。<br/><br/>对流血的目标额外造成20%的伤害。
	if(unitLevel>=24)then listSpell["ability_druid_dash"] = 1850; end   --急奔--移除所有定身和诱捕效果，并使你在猎豹形态下的移动速度提高70%，持续15秒。<br/><br/>不会解除潜行效果。<br/><br/>使用这个技能会激活猎豹形态。
	if(unitLevel>=26)then listSpell["spell_nature_healingtouch"] = 5185; end   --治疗之触--为一个盟友目标恢复20,477点生命值。
	if(unitLevel>=28)then listSpell["spell_nature_faeriefire"] = 770; end   --精灵之火--精灵环绕目标，阻止其潜行或隐身，并造成3层破甲效果。<br/><br/>在熊形态下施放时会造成27点伤害并有25%的几率重置裂伤的冷却时间。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/ability_warrior_sunder.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">破甲</span><br/>使目标的护甲值降低4%，持续30秒。最多可叠加3次。
	if(unitLevel>=32)then listSpell["ability_druid_supriseattack"] = 9005; end   --突袭--飞扑突袭，使目标昏迷4秒，并在18秒内造成4,596点流血伤害。必须在潜行状态下使用，奖励1个连击点数。
	if(unitLevel>=36)then listSpell["ability_tracking"] = 5225; end   --追踪人型生物--在微缩地图上显示附近所有人形生物的位置。
	if(unitLevel>=38)then listSpell["ability_druid_lacerate"] = 33745; end   --割伤--割伤敌方目标，造成36点流血伤害和额外的20点伤害，持续15秒。最多可叠加3次。<br/><br/>每次割伤命中时，都有25%的几率重置裂伤的冷却时间。
	if(unitLevel>=42)then listSpell["spell_nature_cyclone"] = 16914; end   --飓风--在目标区域制造一场强烈的风暴，每1秒对该区域中的所有敌人造成397点自然伤害。持续10秒。德鲁伊必须引导能量以维持法术。
	if(unitLevel>=44)then listSpell["spell_nature_stoneclawtotem"] = 22812; end   --树皮术--德鲁伊的皮肤变得如树皮一样坚硬。受到的所有伤害降低20%。<br/><br/>受到保护时，伤害性攻击不会延迟施法。<br/><br/>这个法术可以在昏迷、冰冻、瘫痪、恐惧或睡眠时使用。可在所有形态下使用。持续12秒。
	if(unitLevel>=52)then listSpell["spell_nature_natureswrath"] = 16689; end   --自然之握--激活之后，任何击中施法者的敌人都会受到纠缠根须效果的影响。可生效1次。持续45秒。
	if(unitLevel>=54)then listSpell["spell_nature_lightning"] = 29166; end   --激活--使目标在10秒内回复相当于施法者法力值上限10%的法力值。如果对自己施法，施法者在10秒内将额外回复自身法力值上限10%的法力值。
	if(unitLevel>=56)then listSpell["spell_nature_reincarnation"] = 20484; end   --复生--使灵魂回到躯体中，让已死的目标起死回生，并为其恢复60%的生命值和20%的法力值。
	if(unitLevel>=58)then listSpell["ability_druid_flightform"] = 33943; end   --飞行形态--变形进入飞行形态，移动速度提高150%，并且可以飞行。无法在战斗中使用。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=60)then listSpell["ability_hunter_beastsoothe"] = 2908; end   --安抚--安抚目标，驱散所有激怒效果。
	if(unitLevel>=62)then listSpell["spell_nature_regeneration"] = 1126; end   --野性印记--使友方目标的力量、敏捷和智力提高5%，持续1小时。<br/><br/>若目标在你的小队或团队中，则所有小队和团队成员都会获得此效果。
	if(unitLevel>=66)then listSpell["spell_nature_sleep"] = 2637; end   --休眠--使敌方目标沉睡，最多持续40秒，任何伤害都会唤醒被催眠的目标。在同一时间内只能强制使一个目标进入休眠状态，只对野兽和龙类有效。
	if(unitLevel>=68)then listSpell["ability_bullrush"] = 22842; end   --狂暴回复--立即将最多60点怒气值转化为最多285点生命值。
	if(unitLevel>=70)then listSpell["ability_druid_flightform"] = 40120; end   --迅捷飞行形态--变形进入飞行形态，移动速度提高280%，并且可以飞行。无法在战斗中使用。替代飞行形态。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=72)then listSpell["spell_druid_mightofursoc"] = 106922; end   --乌索克之力--使当前生命值和最大生命值分别提高30%，持续20秒。激活熊形态。
	if(unitLevel>=74)then listSpell["spell_nature_tranquility"] = 740; end   --宁静--施放宁静，为40码范围内生命值最低的5 个或12个（25人团队中）小队或团队目标每2秒恢复一次生命值，持续8秒。<br/><br/>宁静会恢复9,193点生命值，并在8秒内每2秒恢复1,569点额外的生命值。最多可叠加3次。德鲁伊必须不断引导能量以维持法术。
	if(unitLevel>=78)then listSpell["spell_nature_earthbind"] = 33786; end   --旋风--将敌人吹上天空，使其无法行动，但也无法被攻击，持续最多6秒。德鲁伊在同一时间内只能对一个目标使用旋风。
	if(unitLevel>=82)then listSpell["ability_druid_mangle.tga"] = 22570; end   --割碎--终结技，造成200%武器伤害并使目标昏迷。根据连击点数决定附加伤害量和昏迷效果的持续时间：<br/><br/>   1点：729到730点伤害，1秒<br/>   2点：1,121到1,122点伤害，2秒<br/>   3点：1,513到1,514点伤害，3秒<br/>   4点：1,905到1,906点伤害，4秒<br/>   5点：2,297到2,298点伤害，5秒
	if(unitLevel>=84)then listSpell["spell_druid_stampedingroar_cat"] = 106898; end   --狂奔怒吼--德鲁伊发出咆哮，使10码范围内的所有友方玩家的移动速度提高60%，持续8秒，并解除这些目标身上的所有定身和诱捕效果。<br/><br/>不会解除潜行效果。<br/><br/>在熊形态和猎豹形态之外的形态下使用这个技能会激活熊形态。
	if(unitLevel>=87)then listSpell["spell_druid_symbiosis"] = 110309; end   --共生术--创造一个共生连接，给予德鲁伊一个本属于目标职业的技能，取决于德鲁伊的专精。<br/><br/>同时给予目标一个本属于德鲁伊的技能，取决于目标的职业和作战角色。<br/><br/>持续1小时，死亡后不会消失。不能对其他德鲁伊施放该技能。如果德鲁伊和目标距离太远，这个效果就会被解除。
	--平衡--bg-druid-balance
	if(telants == "Balance")then
	if(unitLevel>=0)then listSpell["spell_nature_ravenform"] = 132158; end   --自然迅捷--激活之后，你的下一个旋风、纠缠根须、治疗之触、休眠、滋养、复生或愈合变为瞬发，且不消耗法力值，可在所有形态下使用。法术的治疗效果和持续时间增加50%。
	if(unitLevel>=10)then listSpell["spell_arcane_starfire"] = 2912; end   --星火术--对目标造成4,803点奥术伤害。
	if(unitLevel>=12)then listSpell["spell_arcane_arcane03"] = 78674; end   --星涌术--你融汇月亮和太阳的能量，对目标发出一股毁灭性的能量冲击波。造成5,416点法术风暴伤害，并产生20点月亮或太阳能量，具体取决于何种能量将使你获益更多。
	if(unitLevel>=16)then listSpell["spell_nature_forceofnature"] = 24858; end   --枭兽形态--变形进入枭兽形态，造成的奥术和自然伤害提高10%，受到的所有伤害降低15%。德鲁伊在变形后不能施放治疗法术。<br/><br/>在此形态时，你将使100码范围内的所有小队和团队成员的法术急速提高5%。<br/><br/>变身可以解除施法者身上的移动限制效果。
	if(unitLevel>=18)then listSpell["ability_mage_firestarter"] = 93402; end   --阳炎术--灼烧敌人，对其造成669.50点自然伤害，并在14秒内造成额外的2,156点自然伤害。你的愤怒和星涌术对目标产生爆击时，你的阳炎术持续时间将延长2秒。
	if(unitLevel>=20)then listSpell["talentspec_druid_balance"] = 127663; end   --沟通星界--与太阳和月亮沟通，每1秒获得25点月亮能量或太阳能量，持续4秒。产生对你最有利的能量类型。
	if(unitLevel>=22)then listSpell["spell_holy_removecurse"] = 2782; end   --净化腐蚀--抵消友方目标身上的腐蚀效果，移除所有诅咒和中毒效果。
	if(unitLevel>=28)then listSpell["ability_vehicle_sonicshockwave"] = 78675; end   --日光术--你在一个敌方目标的头顶召唤一道日光，打断该目标正在施放的法术，并使光柱内的全部敌人陷入沉默。日光术持续8秒。
	if(unitLevel>=68)then listSpell["spell_nature_natureguardian"] = 112071; end   --超凡之盟--让你从月蚀和日蚀效果中获得同步伤害加成，使你的自然和奥术法术造成的伤害提高15%。此外，施放月火术同时也会对你的目标造成阳炎术的周期性伤害效果。<br/><br/>激活该技能会消耗所有月亮和太阳能量，而且在技能持续期间你将无法获取更多能量，持续15秒。
	if(unitLevel>=76)then listSpell["ability_druid_starfall"] = 48505; end   --星辰坠落--你召唤流星从天而降，攻击施法者身边40码范围内与你交战的所有目标，每颗流星造成638.50点奥术伤害。最多召唤20颗流星。持续10秒。触发月蚀效果将重置该法术的冷却时间。<br/><br/>变形进入动物形态或者召唤坐骑都会解除此效果。任何会使你的角色失控的效果都会中断星辰坠落的效果。
	if(unitLevel>=84)then listSpell["druid_ability_wildmushroom_a"] = 88747; end   --野性蘑菇--在目标位置处生长出一颗拥有5点生命值的魔法蘑菇。<br/><br/>6秒后，蘑菇将会隐形。<br/><br/>可对这些蘑菇使用其他野性蘑菇的技能，使其产生额外的效果。<br/><br/>同一时间只能放置3颗蘑菇。
	if(unitLevel>=84)then listSpell["druid_ability_wildmushroom_b"] = 88751; end   --野性蘑菇：引爆--引爆你全部的野性蘑菇，对8码范围内的所有目标造成388.50点自然伤害，并在每个蘑菇周围半径8码范围内生成一片蔓延的真菌，使所有受其影响的敌人速度降低50%，持续20秒。
	end
	--野性--bg-druid-cat
	if(telants == "Cat")then
	if(unitLevel>=10)then listSpell["ability_mount_jungletiger"] = 5217; end   --猛虎之怒--造成的物理伤害提高15%，持续6秒，并立即回复60点能量。在狂暴（猎豹形态）状态下无法激活。只能在猎豹形态下使用。
	if(unitLevel>=16)then listSpell["spell_shadow_vampiricaura"] = 5221; end   --撕碎--撕碎目标，对其造成500%的伤害外加390点伤害。必须从目标背后使用。奖励1个连击点数。<br/><br/>对流血的目标额外造成20%的伤害。
	if(unitLevel>=18)then listSpell["ability_druid_skinteeth"] = 52610; end   --野蛮咆哮--终结技，使物理伤害提高40%，仅在猎豹形态下有效。根据连击点数决定持续时间：<br/><br/>   1点：18秒<br/>   2点：24秒<br/>   3点：30秒<br/>   4点：36秒<br/>   5点：42秒
	if(unitLevel>=20)then listSpell["ability_ghoulfrenzy"] = 1079; end   --割裂--终结技，使目标在一段时间内受到流血伤害。根据连击点数决定伤害总量：<br/><br/>   1点：16秒内3,480点伤害。<br/>   2点：16秒内6,064点伤害。<br/>   3点：16秒内8,648点伤害。<br/>   4点：16秒内11,232点伤害。<br/>   5点：16秒内13,808点伤害。<br/><br/>每次你在猎豹形态下使用撕碎、毁灭或者裂伤技能时，你施加于目标身上的割裂效果的持续时间会延长2秒，最多可延长6秒。
	if(unitLevel>=22)then listSpell["spell_holy_removecurse"] = 2782; end   --净化腐蚀--抵消友方目标身上的腐蚀效果，移除所有诅咒和中毒效果。
	if(unitLevel>=28)then listSpell["spell_druid_thrash"] = 106832; end   --痛击--痛击周围的所有敌人，造成直接的物理伤害和持续的流血伤害，并造成虚弱打击效果。造成的伤害随形态的变化而改变。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=48)then listSpell["ability_druid_berserk"] = 106952; end   --狂暴--当在熊形态下使用时，移除裂伤的冷却时间，并使其最多可攻击3个目标，持续10秒。<br/><br/>当在猎豹形态下使用时，该形态下的所有技能消耗降低50%，持续15秒。
	if(unitLevel>=54)then listSpell["ability_druid_ravage"] = 6785; end   --毁灭--毁灭目标，对其造成950%的伤害外加741点伤害。必须在潜行状态下从目标背后使用。奖励1个连击点数。<br/><br/>毁灭对生命值高于80%的目标的爆击几率提高50%。
	if(unitLevel>=56)then listSpell["ability_druid_tigersroar"] = 61336; end   --生存本能--受到的所有伤害降低50%，持续12秒。
	if(unitLevel>=64)then listSpell["inv_misc_bone_taurenskull_01"] = 106839; end   --迎头痛击--你向目标冲锋，对其迎头痛击，打断其正在施放的法术并使其在4秒内无法施放该系法术。<br/><br/>并使其所有法术的法力消耗提高25%，持续10秒。
	end
	--守护--bg-druid-bear
	if(telants == "Bear")then
	if(unitLevel>=10)then listSpell["ability_racial_cannibalize"] = 62606; end   --野蛮防御--躲闪几率提高45%，持续6秒。
	if(unitLevel>=18)then listSpell["spell_druid_bearhug"] = 102795; end   --熊抱--近战攻击，使目标昏迷3秒，每1秒造成一次伤害，数值相当于德鲁伊生命值的10%。在此期间德鲁伊无法移动，持续3秒。使用这个技能会激活熊形态。
	if(unitLevel>=20)then listSpell["ability_ghoulfrenzy"] = 1079; end   --割裂--终结技，使目标在一段时间内受到流血伤害。根据连击点数决定伤害总量：<br/><br/>   1点：16秒内3,480点伤害。<br/>   2点：16秒内6,064点伤害。<br/>   3点：16秒内8,648点伤害。<br/>   4点：16秒内11,232点伤害。<br/>   5点：16秒内13,808点伤害。<br/><br/>每次你在猎豹形态下使用撕碎、毁灭或者裂伤技能时，你施加于目标身上的割裂效果的持续时间会延长2秒，最多可延长6秒。
	if(unitLevel>=22)then listSpell["spell_holy_removecurse"] = 2782; end   --净化腐蚀--抵消友方目标身上的腐蚀效果，移除所有诅咒和中毒效果。
	if(unitLevel>=28)then listSpell["spell_druid_thrash"] = 106832; end   --痛击--痛击周围的所有敌人，造成直接的物理伤害和持续的流血伤害，并造成虚弱打击效果。造成的伤害随形态的变化而改变。<br/><br/><span class="icon-frame frame-24"><img src="{assetUrl}/wow/icons/36/inv_relics_totemofrage.jpg" width="24" height="24"/></span> <span style="color: #ffffff;">虚弱打击</span><br/>大挫目标锐气，使其造成的物理伤害降低10%，持续30秒。
	if(unitLevel>=48)then listSpell["ability_druid_berserk"] = 106952; end   --狂暴--当在熊形态下使用时，移除裂伤的冷却时间，并使其最多可攻击3个目标，持续10秒。<br/><br/>当在猎豹形态下使用时，该形态下的所有技能消耗降低50%，持续15秒。
	if(unitLevel>=54)then listSpell["ability_druid_ravage"] = 6785; end   --毁灭--毁灭目标，对其造成950%的伤害外加741点伤害。必须在潜行状态下从目标背后使用。奖励1个连击点数。<br/><br/>毁灭对生命值高于80%的目标的爆击几率提高50%。
	if(unitLevel>=56)then listSpell["ability_druid_tigersroar"] = 61336; end   --生存本能--受到的所有伤害降低50%，持续12秒。
	if(unitLevel>=64)then listSpell["inv_misc_bone_taurenskull_01"] = 106839; end   --迎头痛击--你向目标冲锋，对其迎头痛击，打断其正在施放的法术并使其在4秒内无法施放该系法术。<br/><br/>并使其所有法术的法力消耗提高25%，持续10秒。
	if(unitLevel>=76)then listSpell["ability_druid_enrage"] = 5229; end   --激怒--生成20点怒气点数，随后在10秒内生成10点额外的怒气点数。
	end
	--恢复--bg-druid-restoration
	if(telants == "Restoration")then
	if(unitLevel>=0)then listSpell["spell_nature_ravenform"] = 132158; end   --自然迅捷--激活之后，你的下一个旋风、纠缠根须、治疗之触、休眠、滋养、复生或愈合变为瞬发，且不消耗法力值，可在所有形态下使用。法术的治疗效果和持续时间增加50%。
	if(unitLevel>=10)then listSpell["inv_relics_idolofrejuvenation"] = 18562; end   --迅捷治愈--立即为身上拥有回春或愈合效果的友方目标恢复14,207点生命值。<br/><br/>此外，在接下来的7秒内，每1秒为该目标周围10码范围内，生命值最低的3个盟友恢复1,704点生命值。
	if(unitLevel>=12)then listSpell["ability_druid_nourish"] = 50464; end   --滋养--为一个友方目标恢复6,763点生命值。<br/><br/>你施放在目标身上的回春术、愈合、生命绽放或野性成长效果可以使该法术的治疗效果提高20%。
	if(unitLevel>=18)then listSpell["spell_nature_resistnature"] = 8936; end   --愈合--为一个友方目标恢复10,563点生命值并在6秒内额外恢复2,403点生命值。<br/><br/>愈合法术造成爆击效果的几率提高60%。<br/><br/>每当愈合法术治疗生命值为50%及以下的目标时，其持续时间自动刷新至6秒。
	if(unitLevel>=22)then listSpell["ability_shaman_cleansespirit"] = 88423; end   --自然之愈--净化盟友目标，移除所有魔法、诅咒和中毒效果。
	if(unitLevel>=36)then listSpell["inv_misc_herb_felblossom"] = 33763; end   --生命绽放--在15秒内为目标恢复9,480点生命值。当生命绽放结束或被驱散时，目标立即恢复8,290点生命值。该效果最多可在同一目标上叠加3次。<br/><br/>每当你对目标施放治疗之触、滋养或愈合时，会刷新持续时间。<br/><br/>同一时间只能在一个目标身上激活生命绽放效果。
	if(unitLevel>=64)then listSpell["spell_druid_ironbark"] = 102342; end   --铁木树皮--目标的皮肤变得像铁木一样坚韧，受到的所有伤害降低20%。持续12秒。
	if(unitLevel>=76)then listSpell["ability_druid_flourish"] = 48438; end   --野性成长--最多治疗目标周围30码范围内的5个小队或团队成员，为其在7秒内恢复7,049点生命值。优先治疗受伤最严重的团队成员。<br/><br/>起初治疗效果会很明显，在野性成长持续时间即将结束时效果减缓。
	if(unitLevel>=84)then listSpell["druid_ability_wildmushroom_b"] = 102791; end   --野性蘑菇：绽放--使你所有的野性蘑菇绽放，为10码范围内的所有盟友恢复4,544点生命值。<br/><br/>野性蘑菇的治疗加成将均分给所有受到治疗的目标。
	if(unitLevel>=84)then listSpell["druid_ability_wildmushroom_a"] = 145205; end   --野性蘑菇--
	if(unitLevel>=88)then listSpell["spell_nature_preservation"] = 145518; end   --源生--
	end
	-------------------------talent-------------------------
	if(unitLevel>=15)then listSpell["spell_druid_displacement"] = 102280; end   --野性位移--将德鲁伊传送至前方最多20码处，激活猎豹形态，并在4秒内提高50%的移动速度。
	if(unitLevel>=15)then listSpell["spell_druid_wildcharge"] = 102401; end   --野性冲锋--飞向附近一个盟友的位置。
	if(unitLevel>=30)then listSpell["spell_nature_natureblessing"] = 108238; end   --新生--立即为德鲁伊恢复最大生命值的30%。可在所有形态下使用。
	if(unitLevel>=30)then listSpell["ability_druid_naturalperfection"] = 102351; end   --塞纳里奥结界--保护一个友方目标，使其在受到伤害时每2秒恢复12,543点生命值，持续6秒。获得治疗效果后，塞纳里奥结界将消失。在任何形态下都可以使用该技能。持续30秒。
	if(unitLevel>=45)then listSpell["spell_druid_massentanglement"] = 102359; end   --群体缠绕--使目标在原地无法移动，持续20秒，并扩散定身效果到附近的敌人。共可影响5个目标。对目标造成的任何伤害都可能解除这个效果。在任何形态下都可以使用该技能。
	if(unitLevel>=45)then listSpell["ability_druid_typhoon"] = 132469; end   --台风--召唤一道猛烈的台风攻击施法者前方30码内的目标，将其击退，并使其眩晕6秒。在任何形态下都可以使用该技能。
	if(unitLevel>=60)then listSpell["spell_druid_incarnation"] = 106731; end   --化身--获得一个符合你专精的高级变形形态，持续30秒。在化身持续期间，你可以自由变换形态。<br/><br/><span style="color: #ffffff;">平衡：艾露恩之眷</span><br/>强化了的枭兽形态，在月蚀或日蚀处于激活状态下造成的所有奥术和自然伤害提高25%。<br/><br/><span style="color: #ffffff;">野性：丛林之王</span><br/>强化了的猎豹形态，使你可以使用通常需要潜行才能使用的所有技能，还可以在战斗中使用潜行，并取消毁灭的站位要求。<br/><br/><span style="color: #ffffff;">守护：乌索克之子</span><br/>强化了的熊形态，使近战伤害技能和低吼的冷却时间减少到1.5秒。<br/><br/><span style="color: #ffffff;">恢复：生命之树</span><br/>生命之树形态，使你的治疗效果提高15%，护甲值提高120%，并强化生命绽放、野性成长、愈合以及纠缠根须的法术施放。
	if(unitLevel>=60)then listSpell["ability_druid_forceofnature"] = 106737; end   --自然之力--召唤1个树人来协助德鲁伊的当前作战角色，持续15秒。可在任何形态下使用。<br/><br/><span style="color: #ffffff;">平衡</span><br/>树人每2秒施放一次愤怒，造成1,698点自然伤害，并会施放纠缠根须。<br/>  <br/><span style="color: #ffffff;">野性</span><br/>树人每2秒造成8点物理伤害，并会使用猛击技能。<br/><br/><span style="color: #ffffff;">守护</span><br/>树人每2秒造成2点物理伤害，并会使用嘲讽技能。<br/><br/><span style="color: #ffffff;">恢复</span><br/>树人每2.5秒为附近一名受伤的盟友恢复3,550点生命值，并会使用迅捷治愈。
	if(unitLevel>=75)then listSpell["ability_druid_demoralizingroar"] = 99; end   --惊魂咆哮--祈求乌索尔之魂发出咆哮，使10码范围内的所有敌人迷惑3秒。任何伤害都将移除这个效果。在任何形态下都可以使用该技能。
	if(unitLevel>=75)then listSpell["spell_druid_ursolsvortex"] = 102793; end   --乌索尔旋风--在目标地点制造一股旋风，使8码范围内的所有敌人的移动速度降低50%。<br/><br/>敌人首次尝试离开漩涡时，狂风会将其拉回漩涡中心。<br/><br/>持续10秒。可在所有形态下使用。
	if(unitLevel>=75)then listSpell["ability_druid_bash"] = 5211; end   --蛮力猛击--召唤乌索克之魂使目标昏迷5秒。这个技能可以在所有形态下使用。
	if(unitLevel>=90)then listSpell["spell_holy_blessingofagility"] = 108288; end   --野性之心--任何情况下耐力、敏捷和智力都提高6%。激活之后，极大地提高德鲁伊非当前专精之外的战斗能力，持续45秒。根据当前的专精获得以下加成：<br/><br/><span style="color: #ffffff;">非守护专精</span><br/>在熊形态下，敏捷、精准、命中以及护甲值加成提高，得到复仇效果，被近战攻击爆击的几率降低。<br/><br/><span style="color: #ffffff;">非野性专精</span><br/>在猎豹形态下，敏捷、命中和精准提高。<br/><br/><span style="color: #ffffff;">非恢复专精</span><br/>治疗效果提高并且所有治疗法术的法力值消耗降低100%。守护专精的德鲁伊在变形状态下也可以施放回春术。<br/><br/><span style="color: #ffffff;">非平衡专精</span><br/>法术伤害和命中率提高。所有伤害法术的法力值消耗降低100%。
	if(unitLevel>=90)then listSpell["achievement_zone_feralas"] = 124974; end   --自然的守护--使造成的所有伤害和治疗效果提高10%，持续30秒。激活时，所有单体治疗法术还会对附近一个敌方目标造成伤害，数值相当于其治疗量的25%，并且所有单体伤害法术和技能还会治疗附近一个友方目标，数值相当于其伤害量的25%。
end
end

function NA_getAllSpell()
  local allSpell = {}
  for k in pairs(listSpell) do
    allSpell[k] = {spellID=listSpell[k]}
  end
  return allSpell;
end

function NA_getSpellName(spellID)
  for k,v in pairs(listSpell) do
    if(v == spellID)then
      return k;
    end
  end
  return spellID;
end
