import 'dart:io';
import 'WowInfo.dart';
import 'Utils.dart';

//-----------------------------------------------------------Two-Handed Frost
Profile DKProfile0 = new Profile(6, 0, 'Two-Handed Frost', 'Frost')
    ..commonCodes='''
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
'''
    ..addassistCmd('UnitIsDead(NA_Target)', '复活盟友', NA_Target)

    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '灵界打击', NA_Target)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '反魔法护罩', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '冰封之韧', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '符能转换', NA_Player)

    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 57330, true)', '寒冬号角', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_HPlevel(NA_Player) < 0.7', '符能转换', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '冰冷触摸', NA_Target)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '死亡之握', NA_Target)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '凋零缠绕', NA_Target)

    ..attackCodes = '''
local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
'''

    //灵魂收割 当目标血量低于35%
    ..addattackCmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackCmd('NA_IsSolo or NA_IsMaxDps', '冰霜之柱', NA_Target)
    ..addattackCmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //湮没 当杀戮机器触发且有双病
    ..addattackCmd('hasKillingMachine and retainFrostFever and retainBloodPlague', '湮没', NA_Target)
    //保持双疾病
    ..addattackCmd('not retainFrostFever and not retainBloodPlague', '爆发', NA_Target)
    ..addattackCmd('not retainFrostFever', '凛风冲击', NA_Target)//凛风冲击 冰冷触摸
    ..addattackCmd('not retainBloodPlague', '暗影打击', NA_Target)
    //湮没 当任何一对符文冷却完成
    ..addattackCmd('W_StarCount(1)>1 or W_StarCount(2)>1 or W_StarCount(3)>1 or W_StarCount(4)>1', '湮没', NA_Target)
    //冰霜打击 当符能溢出
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.7', '冰霜打击', NA_Target)
    //凛风冲击 当白霜触发
    ..addattackCmd('hasFreezingFog or hasRime', '冰冷触摸', NA_Target)//--免費冰冷触摸/凛风冲击
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.6', '凋零缠绕', NA_Target)
    //冰霜打击
    ..addattackCmd('true', '冰霜打击', NA_Target)
    //湮没
    ..addattackCmd('true', '湮没', NA_Target)


    //------------------------------------------AOE------------------------------------
    //灵魂收割 当目标血量低于35%
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackAOECmd('NA_IsSolo or NA_IsMaxDps', '冰霜之柱', NA_Target)
    ..addattackAOECmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //疾病：血病跳数达到10跳
    ..addattackAOECmd('not retainFrostFever and not retainBloodPlague', '爆发', NA_Target)
    ..addattackAOECmd('not retainFrostFever', '凛风冲击', NA_Target)//凛风冲击 冰冷触摸
    ..addattackAOECmd('not retainBloodPlague', '暗影打击', NA_Target)
    //凛风冲击 当两个冰霜符文和死亡符文冷却完成
    ..addattackAOECmd('hasFreezingFog or hasRime', '凛风冲击', NA_Target)//--免費冰冷触摸/凛风冲击
    ..addattackAOECmd('W_StarCount(3)>1 or W_StarCount(4)>1', '凛风冲击', NA_Target)
    //冰霜打击 当符能即将达到上限
    ..addattackAOECmd('W_PowerLevel(NA_Player) > 0.7', '冰霜打击', NA_Target)
    //湮没 当杀戮机器触发
    ..addattackAOECmd('hasKillingMachine and retainFrostFever and retainBloodPlague', '湮没', NA_Target)
    //凛风冲击
    ..addattackAOECmd('true', '凛风冲击', NA_Target)
    //冰霜打击
    ..addattackAOECmd('true', '冰霜打击', NA_Target)
    //暗影打击
    ..addattackAOECmd('true', '暗影打击', NA_Target);
//-----------------------------------------------------------Blood
Profile DKProfile1 = new Profile(6, 1, 'Blood', 'Blood')
    ..commonCodes = '''
local hasBoneshield = not(NA_ProfileNo == 1) or W_HasBuff(NA_Player, 49222, true);  --白骨之盾'''
    ..addkeepHPCmd('NA_ProfileNo == 1 and needHP', '符文分流', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 1 and needHP', '吸血鬼之血', NA_Player)

    ..addkeepBuffCmd('not hasBoneshield', '白骨之盾', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_HPlevel(NA_Player) < 0.7', '天灾契约', NA_Player)

    ..attackCodes = '''
local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);  --血之疫病
local hasCrimsonScourge = W_HasBuff(NA_Player, 81141, true);    --赤色天灾
local notTanking = not NA_IsSolo and not W_isTanking();
'''
    ..addattackCmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackCmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //..addattackCmd('NA_IsMaxDps', '亡者复生', NA_Player)
    ..addattackCmd('NA_IsMaxDps', '符文刃舞', NA_Target)

    ..addattackCmd('notTanking', '黑暗命令', NA_Target)
    ..addattackCmd('notTanking', '冰冷触摸', NA_Target)
    ..addattackCmd('notTanking and W_PowerLevel(NA_Player)>0.6', '凋零缠绕', NA_Target)
    ..addattackCmd('notTanking and W_HPlevel(NA_Target)>0.3', '死亡之握', NA_Target)

    ..addattackCmd('not retainFrostFever and not retainBloodPlague', '爆发', NA_Target)
    //..addattackCmd('not retainFrostFever and not retainBloodPlague, '传染', NA_Target)
    ..addattackCmd('not retainFrostFever', '冰冷触摸', NA_Target)
    ..addattackCmd('not retainBloodPlague', '暗影打击', NA_Target)

    ..addattackCmd('hasCrimsonScourge', '血液沸腾', NA_Target)//--赤色天灾--->血液沸腾
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.6', '符文打击', NA_Target)
    //--符文打击
    //..addattackCmd('retainFrostFever or retainBloodPlague', '心脏打击', NA_Target)//--心脏打击
    ..addattackCmd('retainFrostFever or retainBloodPlague', '血液沸腾', NA_Target)//--血液沸腾
    ..addattackCmd('W_HPlevel(NA_Player) < 0.8', '灵界打击', NA_Target)
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.6', '凋零缠绕', NA_Target)

    ..addattackCmd('not hasBoneshield', '白骨之盾', NA_Player)//--白骨之盾


    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackAOECmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //..addattackAOECmd('NA_IsMaxDps', '亡者复生', NA_Player)
    ..addattackAOECmd('NA_IsMaxDps', '符文刃舞', NA_Target)

    ..addattackAOECmd('notTanking', '黑暗命令', NA_Target)
    ..addattackAOECmd('notTanking', '冰冷触摸', NA_Target)
    ..addattackAOECmd('notTanking and W_PowerLevel(NA_Player)>0.6', '凋零缠绕', NA_Target)
    ..addattackAOECmd('notTanking and W_HPlevel(NA_Target)>0.3', '死亡之握', NA_Target)

    ..addattackAOECmd('not retainFrostFever and not retainBloodPlague', '爆发', NA_Target)
    //..addattackAOECmd('not retainFrostFever and not retainBloodPlague, '传染', NA_Target)
    ..addattackAOECmd('not retainFrostFever', '冰冷触摸', NA_Target)
    ..addattackAOECmd('not retainBloodPlague', '暗影打击', NA_Target)

    ..addattackAOECmd('hasCrimsonScourge', '血液沸腾', NA_Target)//--赤色天灾--->血液沸腾
    ..addattackAOECmd('W_PowerLevel(NA_Player) > 0.6', '符文打击', NA_Target)
    //--符文打击
    //..addattackAOECmd('retainFrostFever or retainBloodPlague', '心脏打击', NA_Target)//--心脏打击
    ..addattackAOECmd('retainFrostFever or retainBloodPlague', '血液沸腾', NA_Target)//--血液沸腾
    ..addattackAOECmd('W_HPlevel(NA_Player) < 0.8', '灵界打击', NA_Target)
    ..addattackAOECmd('W_PowerLevel(NA_Player) > 0.6', '凋零缠绕', NA_Target)

    ..addattackAOECmd('not hasBoneshield', '白骨之盾', NA_Player)//--白骨之盾
;
//-----------------------------------------------------------Dual-Wield Frost
Profile DKProfile2 = new Profile(6, 2, 'Dual-Wield Frost', 'Frost')
    ..commonCodes = '''
'''
    ..attackCodes = '''
local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
'''
    //灵魂收割 当目标血量低于35%
    ..addattackCmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackCmd('NA_IsSolo or NA_IsMaxDps', '冰霜之柱', NA_Target)
    ..addattackCmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //冰霜打击：杀戮机器触发/符能超过88
    ..addattackCmd('hasKillingMachine or W_PowerLevel(NA_Player) > 0.88', '冰霜打击', NA_Target)
    //凛风冲击：2个死/冰符文同时冷却
    ..addattackCmd('W_StarCount(3)>1 and W_StarCount(4)>1', '凛风冲击', NA_Target)
    //暗影打击：邪恶符文不在冷却，血病即将消失。
    ..addattackCmd('not retainBloodPlague', '暗影打击', NA_Target)
    //凛风冲击：触发白霜
    ..addattackCmd('hasRime', '凛风冲击', NA_Target)
    //冰霜打击：符文能量大于76.
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.76', '冰霜打击', NA_Target)
    //湮没：一个或更多的邪符文不在冷却，并且触发杀戮机器
    ..addattackCmd('(W_StarCount(1)>0 or W_StarCount(2)>0 or W_StarCount(3)>0 or W_StarCount(4)>0) and hasKillingMachine', '湮没', NA_Target)
    //凛风冲击
    ..addattackCmd('true', '凛风冲击', NA_Target)
    //活力分流
    //  ..addattackCmd('true', '活力分流', NA_Player)
    //冰霜打击：符文能量超过40
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.40', '冰霜打击', NA_Target)
    //吸血瘟疫
    ..addattackCmd('true', '吸血瘟疫', NA_Target)

    //------------------------------------------AOE------------------------------------
    //灵魂收割 当目标血量低于35%
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.35', '灵魂收割', NA_Target)
    ..addattackAOECmd('NA_IsSolo or NA_IsMaxDps', '冰霜之柱', NA_Target)
    ..addattackAOECmd('NA_IsMaxDps', '符文武器增效', NA_Target)
    //疾病：血病跳数达到10跳
    ..addattackAOECmd('not retainFrostFever and not retainBloodPlague', '爆发', NA_Target)
    ..addattackAOECmd('not retainFrostFever', '凛风冲击', NA_Target)//凛风冲击 冰冷触摸
    ..addattackAOECmd('not retainBloodPlague', '暗影打击', NA_Target)
    //凛风冲击 当两个冰霜符文和死亡符文冷却完成
    ..addattackAOECmd('hasFreezingFog or hasRime', '凛风冲击', NA_Target)//--免費冰冷触摸/凛风冲击
    ..addattackAOECmd('W_StarCount(3)>1 or W_StarCount(4)>1', '凛风冲击', NA_Target)
    //冰霜打击 当符能即将达到上限
    ..addattackAOECmd('W_PowerLevel(NA_Player) > 0.7', '冰霜打击', NA_Target)
    //湮没 当杀戮机器触发
    ..addattackAOECmd('hasKillingMachine and retainFrostFever and retainBloodPlague', '湮没', NA_Target)
    //凛风冲击
    ..addattackAOECmd('true', '凛风冲击', NA_Target)
    //冰霜打击
    ..addattackAOECmd('true', '冰霜打击', NA_Target)
    //暗影打击
    ..addattackAOECmd('true', '暗影打击', NA_Target);

//-----------------------------------------------------------Beastmaster
Profile LRProfile0 = new Profile(3, 0, 'Beastmaster', 'Beastmaster')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('W_HPlevel(NA_Pet) < 0.9 and not UnitIsDead(NA_Pet) and not W_HasBuff(NA_Pet, 136, true)', '治疗宠物', NA_Pet)
    ..addkeepBuffCmd('not NA_IsMaxDps and not W_HasBuff(NA_Player, 5118, true) and not W_HasBuff(NA_Player, 13159, true)', '猎豹守护', NA_Player)//猎豹守护 豹群守护
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '奥术射击', NA_Target)

    ..attackCodes = '''        
'''
    ..addattackCmd('W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true)', '治疗宠物', NA_Pet)
    ..addattackCmd('W_HPlevel(NA_Pet)<=0', '复活宠物', NA_Pet)
//狂野怒火(集中值>70)
    ..addattackCmd('W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0', '狂野怒火', NA_Pet)
//夺命射击
    ..addattackCmd('W_HPlevel(NA_Target)<0.2', '夺命射击', NA_Target)
//集中火力
    ..addattackCmd('W_BuffCount(NA_Player, 19615)>=5', '集中火力', NA_Target)
//杀戮命令
    ..addattackCmd('true', '杀戮命令', NA_Target)
//凶暴野兽(如果选择)
    ..addattackCmd('true', '凶暴野兽', NA_Target)
//弹幕射击(如果选择)
    ..addattackCmd('true', '弹幕射击', NA_Target)
//夺命黑鸦(如果选择)
    //..addattackCmd('true', '夺命黑鸦', NA_Target)
//飞刃(如果选择)
    //..addattackCmd('true', '飞刃', NA_Target)
//兽群奔腾(如果选择)
    //..addattackCmd('true', '群兽奔腾', NA_Target)
//强风射击(如果选择)
    //..addattackCmd('true', '强风射击', NA_Target)
//奥术射击
    ..addattackCmd('true', '奥术射击', NA_Target)
//眼镜蛇射击
    ..addattackCmd('true', '眼镜蛇射击', NA_Target)

    //------------------------------------------AOE------------------------------------

    ..addattackAOECmd('W_HPlevel(NA_Pet)>0 and W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true)', '治疗宠物', NA_Pet)
    ..addattackAOECmd('W_HPlevel(NA_Pet)<=0', '复活宠物', NA_Pet)
//狂野怒火(集中值>70)
    ..addattackAOECmd('W_PowerLevel(NA_Player)>0.7 and W_HPlevel(NA_Pet) > 0', '狂野怒火', NA_Pet)
//集中火力
    ..addattackAOECmd('true', '集中火力', NA_Target)
//多重射击(野兽顺劈)
    ..addattackAOECmd('true', '多重射击', NA_Target)
//夺命射击
    ..addattackAOECmd('W_HPlevel(NA_Target)<0.2', '夺命射击', NA_Target)
//杀戮命令
    ..addattackAOECmd('true', '杀戮命令', NA_Target)
//凶暴野兽(如果选择)
    ..addattackAOECmd('true', '凶暴野兽', NA_Target)
//弹幕射击(如果选择)
    ..addattackAOECmd('true', '弹幕射击', NA_Target)
//夺命黑鸦(如果选择)
    //..addattackAOECmd('true', '夺命黑鸦', NA_Target)
//飞刃(如果选择)
    //..addattackAOECmd('true', '飞刃', NA_Target)
//兽群奔腾(如果选择)
    ..addattackAOECmd('true', '群兽奔腾', NA_Target)
//强风射击(如果选择)
    //..addattackAOECmd('true', '强风射击', NA_Target)
//眼镜蛇射击
    ..addattackAOECmd('true', '眼镜蛇射击', NA_Target)
;

//-----------------------------------------------------------Marksman
Profile LRProfile1 = new Profile(3, 1, 'Marksman', 'Marksman')
    ..commonCodes = '''
'''

    ..attackCodes = '''        
'''
..addattackCmd('true', '奇美拉射击', NA_Target)
//..addattackCmd('true', '杀戮射击', NA_Target)
..addattackCmd('true', '夺命黑鸦', NA_Target)
..addattackCmd('W_HPlevel(NA_Target) > 0.8 or W_HasBuff(NA_Player, 3045, true)', '瞄准射击', NA_Target)
..addattackCmd('W_HasBuff(NA_Player, 109306, true)', '瞄准射击', NA_Target)
..addattackCmd('W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true)', '弹幕射击', NA_Target)
..addattackCmd('W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true)', '瞄准射击', NA_Target)
..addattackCmd('true', '群兽奔腾', NA_Target)
..addattackCmd('true', '稳固射击', NA_Target)
..addattackCmd('true', '急速射击', NA_Target)


    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('not W_HasBuff(NA_Player, 13165, true) and not W_HasBuff(NA_Player, 109260, true)', '铁鹰守护', NA_Player) //--雄鹰守护 雄鹰守护:13165 铁鹰守护:109260
    ..addattackAOECmd('W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true)', '治疗宠物', NA_Pet)
//    ..addattackAOECmd('NA_IsMaxDps and W_HPlevel(NA_Pet) > 0', '狂野怒火', NA_Pet)
    //..addattackAOECmd('NA_IsMaxDps and W_PowerLevel(NA_Player)<0.5', '急速射击', NA_Player)
    //  ..addattackAOECmd('NA_IsMaxDps', '山猫冲锋', NA_Target) //--山猫冲锋
    ..addattackAOECmd('NA_IsMaxDps', '夺命黑鸦', NA_Target)//--群兽奔腾
    ..addattackAOECmd('NA_IsMaxDps', '群兽奔腾', NA_Target)//--群兽奔腾
//  ..addattackAOECmd('NA_IsMaxDps and hasability_druid_ferociousbite', 'Rabid', NA_Pet)//  --疯乱
;
//-----------------------------------------------------------Beastmaster
Profile LRProfile2 = new Profile(3, 2, 'Survival', 'Survival')
    ..commonCodes = '''
'''

    ..attackCodes = '''        
'''
..addattackCmd('not W_HasBuff(NA_Player, 13165, true) and not W_HasBuff(NA_Player, 109260, true)', '铁鹰守护', NA_Player)
..addattackCmd('W_HPlevel(NA_Pet) < 0.5 and not W_HasBuff(NA_Pet, 136, true)', '治疗宠物', NA_Pet)
..addattackCmd('true', '爆炸射击', NA_Target)
..addattackCmd('true', '黑箭', NA_Target)
..addattackCmd('true', '夺命黑鸦', NA_Target)
..addattackCmd('true', '凶暴野兽', NA_Target)
..addattackCmd('true', '毒蛇钉刺', NA_Target)
..addattackCmd('W_HPlevel(NA_Target) < 0.8 and not W_HasBuff(NA_Player, 3045, true)', '弹幕射击', NA_Target)
//..addattackCmd('true', '急速射击', NA_Target)
..addattackCmd('true', '奥术射击', NA_Target)
..addattackCmd('true', '眼镜蛇射击', NA_Target)

;
//-----------------------------------------------------------Protection
Profile QSProfile0 = new Profile(2, 0, 'Protection', 'Protection')
    ..commonCodes = '''
'''

    ..addkeepBuffCmd('NA_ProfileNo == 0 and not NA_IsSolo and not W_HasBuff(NA_Player, 25780, true)', '正义之怒', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true)', '王者祝福', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '审判', NA_Target)

    ..addkeepHPCmd('W_HPlevel(NA_Player) < 0.85 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9)', '永恒之火', NA_Target)
    ..addkeepHPCmd('W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2)', '圣疗术', NA_Player)
    //..addkeepHPCmd('W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2)', '虔诚光环', NA_Player)

    ..attackCodes = '''
        local notTanking = not NA_IsSolo and not W_isTanking();        
'''
    //十字军打击 - 填充 - 填充 - 十字军打击 - 填充 - 填充 - 十字军打击 - 填充 - 填充(如此继续)
    //填充 : 审判 > 复仇者之盾(无论大十字军是否触发) > 你的90级天赋 > 神圣愤怒 > 奉献
    //十字军打击 - 审判 - 复仇者之盾 - 十字军打击 - 90级天赋 - 审判 - 十字军打击 - 神圣愤怒 - 奉献(如此继续)
    ..addattackCmd('W_HPlevel(NA_Target) < 0.2', '愤怒之锤', NA_Target)
    ..addattackCmd('notTanking', '清算', NA_Target)
    //..addattackCmd('NA_IsMaxDps', '复仇之怒', NA_Target)
    ..addattackCmd('true', '正义盾击', NA_Target)
    ..addattackCmd('true', '十字军打击', NA_Target)
    ..addattackCmd('true', '审判', NA_Target)
    ..addattackCmd('true', '复仇者之盾', NA_Target)
    ..addattackCmd('true', '神圣愤怒', NA_Target)
    ..addattackCmd('true', '奉献', NA_Player)


    //------------------------------------------AOE------------------------------------
    //正义之锤 - 审判 - 奉献 - 正义之锤 - 审判 - 复仇者之盾 - 正义之锤 - 90级天赋 - 神圣愤怒(如此继续)
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.2', '愤怒之锤', NA_Target)
    ..addattackAOECmd('notTanking', '清算', NA_Target)
    //..addattackAOECmd('NA_IsMaxDps', '复仇之怒', NA_Target)
    ..addattackAOECmd('true', '神圣愤怒', NA_Target)
    ..addattackAOECmd('true', '奉献', NA_Player)
    ..addattackAOECmd('true', '复仇者之盾', NA_Target)
    ..addattackAOECmd('true', '正义盾击', NA_Target)
    ..addattackAOECmd('true', '正义之锤', NA_Target)
    ..addattackAOECmd('true', '审判', NA_Target);
//-----------------------------------------------------------Retribution
Profile QSProfile1 = new Profile(2, 1, 'Retribution', 'Retribution')
    ..commonCodes = '''
'''

    ..addkeepBuffCmd('NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true)', '王者祝福', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '审判', NA_Target)
    ..addkeepHPCmd('W_HPlevel(NA_Player) < 0.7 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.8)', '荣耀圣令', NA_Target)
    ..addkeepHPCmd('W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2)', '圣疗术', NA_Target)
    //..addkeepHPCmd('W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2)', '虔诚光环', NA_Player)

    ..attackCodes = '''
'''

    //异端裁决>处决宣判>5豆圣殿裁决>愤怒之锤(>4T16神圣风暴)>十字军打击>审判>驱邪术>3-4豆圣殿裁决>(圣洁护盾)
    //..addattackCmd('W_PaladinPower(NA_Player)>2 and not hasinquisition', '异端裁决', NA_Player)
    ..addattackCmd('true', '愤怒之锤', NA_Target)
    ..addattackCmd('NA_IsSolo and W_HPlevel(NA_Player) < 0.8', '神圣棱镜', NA_Target)
    //..addattackCmd('hasinquisition and NA_IsMaxDps', '复仇之怒', NA_Player)
    //..addattackCmd('NA_IsMaxDps', '远古列王守卫', NA_Player)
    ..addattackCmd('W_PaladinPower(NA_Player)>2', '圣殿骑士的裁决', NA_Player)
    ..addattackCmd('true', '驱邪术', NA_Target)
    ..addattackCmd('true', '审判', NA_Target)
    ..addattackCmd('true', '十字军打击', NA_Target)
    ..addattackCmd('true', '神圣棱镜', NA_Target)

    //------------------------------------------AOE------------------------------------
    //异端裁决>5豆神圣风暴>圣光之锤>(>4T16神圣风暴)>正义之锤>愤怒之锤>群体驱邪>审判>3-4豆神圣风暴>(圣洁护盾)
    //..addattackAOECmd('W_PaladinPower(NA_Player)>2 and not hasinquisition', '异端裁决', NA_Player)
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.2', '愤怒之锤', NA_Target)
    ..addattackAOECmd('NA_IsSolo and W_HPlevel(NA_Player) < 0.8', '神圣棱镜', NA_Target)
    ..addattackAOECmd('W_PaladinPower(NA_Player)>2', '神圣风暴', NA_Target)
    ..addattackAOECmd('true', '正义之锤', NA_Target)
    ..addattackAOECmd('true', '驱邪术', NA_Target)
    ..addattackAOECmd('true', '审判', NA_Target)
    ..addattackAOECmd('true', '神圣棱镜', NA_Target);

//-----------------------------------------------------------holy
Profile QSProfile2 = new Profile(2, 2, 'Holy', 'Holy')
    ..commonCodes = '''
  local hastorch_thrown = W_HasBuff(NA_Target, 114163, true);  --永恒之火
'''
    ..addkeepBuffCmd('NA_IsSolo and not W_HasBuff(NA_Player, 20217, true) and not W_HasBuff(NA_Player, 19740, true)', '王者祝福', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '审判', NA_Target)

    //..addassistCmd('W_PowerLevel(NA_Player) < 0.8', '神圣恳求', NA_Player)
    ..addassistCmd('NA_IsMaxDps', '圣光之锤', NA_Target)
    ..addassistCmd('NA_IsMaxDps and W_PowerLevel(NA_Player) > 0.3', '神圣复仇者', NA_Player)
    ..addassistCmd('not hastorch_thrown and W_PaladinPower(NA_Player)>2', '永恒之火', NA_Target)
    ..addassistCmd('not hastorch_thrown and W_PaladinPower(NA_Player)>2', '荣耀圣令', NA_Target)
    ..addassistCmd('W_HPlevel(NA_Target) < 1', '神圣震击', NA_Target)
    ..addassistCmd('NA_IsAOE and W_HPlevel(NA_Target) < 1 and W_PaladinPower(NA_Player)>2', '黎明圣光', NA_Target)
    ..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.1', '圣疗术', NA_Target)
    //  ..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.3', '神圣棱镜', NA_Target)
    ..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.3', '圣佑术', NA_Target)
    //..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.3', '远古列王守卫', NA_Player)
    //..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.5', '神恩术', NA_Player)
    ..addassistCmd('NA_IsMaxDps and W_HPlevel(NA_Target) < 0.6 and W_HPlevel(NA_Player)>0.7', '牺牲之手', NA_Target)
    //..addassistCmd('W_HPlevel(NA_Target) < 0.7', '神圣之光', NA_Target)
    ..addassistCmd('not NA_IsAOE and W_HPlevel(NA_Target) < 0.7', '圣光闪现', NA_Target)
    ..addassistCmd('NA_IsAOE and W_HPlevel(NA_Target) < 0.7', '圣光普照', NA_Target)

    ..attackCodes = '''
'''
    ..addattackCmd('W_HPlevel(NA_Target) < 0.2', '愤怒之锤', NA_Target)
    ..addattackCmd('true', '十字军打击', NA_Target)
    ..addattackCmd('true', '审判', NA_Target)
    ..addattackCmd('true', '神圣震击', NA_Target)


    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('W_HPlevel(NA_Target) < 0.2', '愤怒之锤', NA_Target)
    ..addattackAOECmd('true', '十字军打击', NA_Target)
    ..addattackAOECmd('true', '审判', NA_Target)
    ..addattackAOECmd('true', '神圣震击', NA_Target);
//-----------------------------------------------------------Arcane
Profile FSProfile0 = new Profile(8, 0, 'Arcane', 'Arcane')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 1459, true)', '奥术光辉', NA_Player)
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 6117, true)', '法师护甲', NA_Player)

    //..addkeepBuffCmd('NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack() and not W_HasBuff(NA_Target, -114923, true)', '秘法炸弹', NA_Target)
    ..addkeepBuffCmd('NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack()', '火焰冲击', NA_Target)
    ..addkeepBuffCmd('NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack()', '奥术弹幕', NA_Target)

    ..attackCodes = '''
        local countArcaneCharge = W_BuffCount(NA_Player, -36032); --奥术充能
        local countArcaneMissiles = W_BuffCount(NA_Player, 79683); --奥术飞弹
'''
    ..addattackCmd('W_HPlevel(NA_Player) < 0.2', '寒冰屏障', NA_Player)
    ..addattackCmd('W_HPlevel(NA_Player) < 0.9', '寒冰护体', NA_Player)
    //--1.炸弹
    //--虚空风暴和活体炸弹天赋：在减益效果持续时间小于1秒时使用;
    //--寒冰炸弹天赋：在可用时使用
    //..addattackCmd('not W_HasBuff(NA_Target, -114923, true)', '秘法炸弹', NA_Target)
    //2.奥术飞弹(拥有2层触发奥弹buff)
    ..addattackCmd('NA_IsMaxDps and countArcaneMissiles>1', '奥术飞弹', NA_Target)
    ..addattackCmd('countArcaneMissiles>0', '奥术飞弹', NA_Target)
    //--3.奥术冲击(法力值大于90%-92%) 注：此百分比为释放该法术前
    ..addattackCmd('NA_IsMaxDps and W_PowerLevel(NA_Player)>0.9', '奥术冲击', NA_Target)
    //--4.奥术飞弹(拥有1层触发奥弹buff)
    ..addattackCmd('NA_IsMaxDps and countArcaneMissiles>0', '奥术飞弹', NA_Target)
    //--5.奥术冲击(奥术充能debuff剩余时间<3秒)
    ..addattackCmd('NA_IsMaxDps and W_BuffTime(NA_Player, -36032, true)<3', '奥术冲击', NA_Target)
    ..addattackCmd('not NA_IsMaxDps and NA_IsSolo', '火焰冲击', NA_Target)
    ..addattackCmd('not NA_IsMaxDps and NA_IsSolo', '奥术弹幕', NA_Target)
    //..addattackCmd('not NA_IsMaxDps and NA_IsSolo', '冰枪术', NA_Target)


    //------------------------------------------AOE------------------------------------
    //..addattackAOECmd('not NA_IsMaxDps and NA_IsSolo', '魔爆术', NA_Target)
    ..addattackAOECmd('not NA_IsMaxDps and NA_IsSolo', '冰锥术', NA_Target)
    //..addattackAOECmd('not NA_IsMaxDps', '暴风雪', NA_Target)
    ;
//-----------------------------------------------------------Frost
Profile FSProfile1 = new Profile(8, 1, 'Frost', 'Frost')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('UnitHealth(NA_Pet)<=0', '召唤水元素', NA_Player)
    ..addkeepBuffCmd('NA_ProfileNo == 1 and NA_IsSolo and W_TargetCanAttack()', '寒冰箭', NA_Target)

    ..attackCodes = '''
local counthbz = W_BuffCount(NA_Player, 44544); --寒冰指
local counthlzh = W_BuffCount(NA_Player, 57761); --冰冷智慧 
local hbzd = W_RetainBuff(NA_Target, -112948, true); --寒冰炸弹
'''
    ..addattackCmd('W_HPlevel(NA_Player) < 0.2', '寒冰屏障', NA_Player)
    ..addattackCmd('W_HPlevel(NA_Player) < 0.9', '寒冰护体', NA_Player)
    ..addattackCmd('NA_IsMaxDps', '冰冷血脉', NA_Player)
    ..addattackCmd('counthbz>0', '冰枪术', NA_Target) //寒冰指下的冰枪术
    ..addattackCmd('NA_IsMaxDps', '镜像', NA_Player)
    //..addattackCmd('not W_RetainBuff(NA_Target, -44457, true)', '活动炸弹', NA_Target)
    ..addattackCmd('counthlzh>0', '霜火之箭', NA_Target)
    //..addattackCmd('counthbz>0', '冰枪术', NA_Target)
    ..addattackCmd('true', '寒冰宝珠', NA_Target)
    ..addattackCmd('not hbzd', '寒冰炸弹', NA_Target)
    ..addattackCmd('true', '浮冰', NA_Player)

    //..addattackCmd('NA_IsSolo and W_HPlevel(NA_Target) < 0.2', '冰枪术', NA_Target)
    ..addattackCmd('true', '寒冰箭', NA_Target)
    //..addattackCmd('true', '冰枪术', NA_Target)


    //------------------------------------------AOE------------------------------------
    //..addattackAOECmd('not W_RetainBuff(NA_Target, -44457, true)', '活动炸弹', NA_Target)
    //..addattackAOECmd('not NA_IsMaxDps and NA_IsSolo', '魔爆术', NA_Target)
    ..addattackAOECmd('not NA_IsMaxDps and NA_IsSolo', '冰锥术', NA_Target)
    ..addattackAOECmd('true', '寒冰宝珠', NA_Target)
    //..addattackAOECmd('not NA_IsMaxDps', '暴风雪', NA_Target)
    ;
//-----------------------------------------------------------Fire
Profile FSProfile2 = new Profile(8, 2, 'Frost', 'Frost')
    ..commonCodes = '''
'''
    //..addkeepBuffCmd('NA_ProfileNo == 2 and NA_IsSolo and W_TargetCanAttack() and not W_RetainBuff(NA_Target, -44457, true)', '活动炸弹', NA_Target)

    ..attackCodes = '''
'''
    //..addattackCmd('not W_RetainBuff(NA_Target, -44457, true)', '活动炸弹', NA_Target)


    //------------------------------------------AOE------------------------------------
    //..addattackAOECmd('not W_RetainBuff(NA_Target, -44457, true)', '活动炸弹', NA_Target)
    ..addattackAOECmd('true', '寒冰宝珠', NA_Target)
    //..addattackAOECmd('not NA_IsMaxDps and NA_IsSolo', '魔爆术', NA_Target)
    //..addattackAOECmd('not NA_IsMaxDps', '暴风雪', NA_Target)
    ;

//-----------------------------------------------------------Demonology
Profile SSProfile0 = new Profile(9, 0, 'Demonology', 'Demonology')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 109773, true)', '黑暗意图', NA_Player)
    ..addkeepBuffCmd('NA_ProfileNo == 0 and NA_IsSolo and W_TargetCanAttack()', '暗影箭', NA_Target)

    //..addkeepHPCmd('NA_IsSolo and UnitIsDead(NA_Pet)', '生命通道', NA_Pet) //召唤
    ..addkeepHPCmd('W_HPlevel(NA_Pet) < 0.35 and not UnitIsDead(NA_Pet) and W_HPlevel(NA_Player)>0.5', '生命通道', NA_Pet)
    ..addkeepHPCmd('W_HPlevel(NA_Player)<0.1', '不灭决心', NA_Player)
    ..addkeepHPCmd('W_HPlevel(NA_Player)<0.2', '灵魂碎裂', NA_Target)
    ..addkeepHPCmd('W_HPlevel(NA_Player)<0.2', '吸取生命', NA_Target)
    ..addkeepHPCmd('NA_IsSolo and W_HPlevel(NA_Player)<0.5', '死亡缠绕', NA_Target)
    ..addkeepHPCmd('NA_IsSolo and W_HPlevel(NA_Player)<0.5', '吸取生命', NA_Target)
    ..addkeepHPCmd('W_PowerLevel(NA_Player) < 0.2 and W_HPlevel(NA_Player)>0.5', '生命分流', NA_Player)

    ..attackCodes = '''
  local isDemonform = W_HasBuff(NA_Player, 103958, true);  --恶魔变形
  local moltencore = W_BuffCount(NA_Player, 122355, true); --熔火之心 
'''
    ..addattackCmd('true', '古尔丹之手', NA_Target)
    ..addattackCmd('not isDemonform and not W_RetainBuff(NA_Target, -146739, true)', '腐蚀术', NA_Target)
    //..addattackCmd('not isDemonform and not W_HasBuff(NA_Target, -1490, true)', '元素诅咒', NA_Target)
    //..addattackCmd('isDemonform and not W_HasBuff(NA_Player, 116202, true)', '元素诅咒', NA_Target)//元素光环
    //..addattackCmd('NA_IsMaxDps', '魔典：邪恶仆从', NA_Player) 119914
    ..addattackCmd('true', '黑暗灵魂：学识', NA_Player)
    ..addattackCmd('W_GetSpellCooldown(119915)<=0 or W_GetSpellCooldown(119914)<=0', '恶魔掌控', NA_Target)
//
    ..addattackCmd('NA_IsMaxDps', '召唤末日守卫', NA_Player)

    ..addattackCmd('not isDemonform and not W_RetainBuff(NA_Target, -603, true)', '恶魔变形', NA_Player)
    ..addattackCmd('not isDemonform and UnitPower(NA_Player, SPELL_POWER_DEMONIC_FURY)>=1000', '恶魔变形', NA_Player)
    ..addattackCmd('isDemonform and not W_RetainBuff(NA_Target, -603, true)', '腐蚀术', NA_Target)//末日降临
    ..addattackCmd('isDemonform', '暗影箭', NA_Target)//混乱之触

    ..addattackCmd('moltencore>0', '灵魂之火', NA_Target)
    ..addattackCmd('true', '暗影箭', NA_Target)

    //------------------------------------------AOE------------------------------------
  ..addattackAOECmd('true', '古尔丹之手', NA_Target)
  ..addattackAOECmd('not isDemonform and not W_RetainBuff(NA_Target, -146739, true)', '腐蚀术', NA_Target)
  //..addattackAOECmd('NA_IsMaxDps', '魔典：邪恶仆从', NA_Player)
  ..addattackAOECmd('NA_IsMaxDps', '黑暗灵魂：学识', NA_Player)
  ..addattackAOECmd('NA_IsMaxDps', '召唤地狱火', NA_Player)
  ..addattackAOECmd('NA_IsMaxDps and W_GetSpellCooldown(119914)<=0', '恶魔掌控', NA_Target)

    ..addattackAOECmd('not isDemonform and UnitPower(NA_Player, SPELL_POWER_DEMONIC_FURY)>=1000 ', '恶魔变形', NA_Player)
    ..addattackAOECmd('isDemonform and not W_RetainBuff(NA_Target, -603, true)', '腐蚀术', NA_Target)//末日降临
    //..addattackAOECmd('isDemonform', '元素诅咒', NA_Target)//元素光环
    //..addattackAOECmd('isDemonform', '邪焰', NA_Target)//混乱之触

    ..addattackAOECmd('moltencore>0', '灵魂之火', NA_Target)
    ..addattackAOECmd('true', '地狱烈焰', NA_Target);

//-----------------------------------------------------------Destruction
Profile SSProfile1 = new Profile(9, 1, 'Destruction', 'Destruction')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 109773, true)', '黑暗意图', NA_Player)
    ..addkeepBuffCmd('NA_ProfileNo == 1 and NA_IsSolo and W_TargetCanAttack()', '献祭', NA_Target)
    ..addkeepHPCmd('NA_ProfileNo == 1 and NA_IsSolo and W_HPlevel(NA_Player)<0.2', '灰烬转换', NA_Player)

    ..attackCodes = '''
'''

    ..addattackCmd('true', '黑暗灵魂：易爆', NA_Player)
    ..addattackCmd('UnitName(NA_Pet)==\'菲兹托克\' and W_GetSpellCooldown(119899)<=0', '恶魔掌控', NA_Target)
    //..addattackCmd('UnitName(NA_Pet)==\'亚塔克西\' and W_GetSpellCooldown(119907)<=0', '恶魔掌控', NA_Target)
    ..addattackCmd('UnitName(NA_Pet)==\'克丽欧拉\' and W_GetSpellCooldown(115770)<=0', '恶魔掌控', NA_Target)
    ..addattackCmd('UnitName(NA_Pet)==\'科尔拉克\' and W_GetSpellCooldown(115781)<=0', '恶魔掌控', NA_Target)
    ..addattackCmd('NA_IsMaxDps', '召唤末日守卫', NA_Player)

    ..addattackCmd('W_HPlevel(NA_Target)<0.2 and UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>0', '暗影灼烧', NA_Target)
    ..addattackCmd('UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>3', '浩劫', NA_Target)
    ..addattackCmd('GetUnitSpeed(NA_Player)<1 and (W_HasBuff(NA_Player, 80240, true) or UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>3)', '混乱之箭', NA_Target)
    ..addattackCmd('NA_IsSolo and GetUnitSpeed(NA_Player)<1 and UnitPower(NA_Player, SPELL_POWER_BURNING_EMBERS)>1', '混乱之箭', NA_Target)
    ..addattackCmd('GetUnitSpeed(NA_Player)<1 and not W_RetainBuff(NA_Target, -348, true)', '献祭', NA_Target)
    ..addattackCmd('true', '燃烧', NA_Target)
    ..addattackCmd('true', '烧尽', NA_Target)
    //..addattackCmd('not W_RetainBuff(NA_Target, -104232, true)', '火焰之雨', NA_Target)

    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('W_HasBuff(NA_Player, 108683, true)', '燃烧', NA_Target)
    ..addattackAOECmd('true', '烧尽', NA_Target);

//-----------------------------------------------------------Affliction
Profile SSProfile2 = new Profile(9, 2, 'Affliction', 'Affliction')
    ..commonCodes = '''
'''

    ..attackCodes = '''
  local count980 = W_BuffCount(NA_Target, -980, true); --痛楚
  local retain146739 = W_RetainBuff(NA_Target, -146739, true); --腐蚀术
  local retain30108 = W_RetainBuff(NA_Target, -30108, true); --痛苦无常
'''
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 109773, true)', '黑暗意图', NA_Player)
    ..addkeepBuffCmd('NA_ProfileNo == 2 and NA_IsSolo and W_TargetCanAttack()', '痛楚', NA_Target)

    ..addattackCmd('NA_IsMaxDps', '召唤末日守卫', NA_Player)
    ..addattackCmd('NA_IsMaxDps', '灵魂燃烧', NA_Player)
    ..addattackCmd('W_HPlevel(NA_Target)<0.2', '吸取灵魂', NA_Target)

    ..addattackCmd('W_HasBuff(NA_Player, 74434, true)', '吸取生命', NA_Target)
    ..addattackCmd('W_HasBuff(NA_Player, 17941, true)', '鬼影缠身', NA_Target)

//卡 CD 黑暗灵魂
  ..addattackCmd('true', '黑暗灵魂：哀难', NA_Player)
//卡 CD 大灾变，如果 T7 选择了大灾变
    //..addattackCmd('true', '大灾变', NA_Player)
//保持 10 层痛楚
  ..addattackCmd('count980<10', '痛楚', NA_Target)
//保持腐蚀术
  ..addattackCmd('not retain146739', '腐蚀术', NA_Target)
//保持痛苦无常
  ..addattackCmd('not retain30108', '痛苦无常', NA_Target)
//保持鬼魅灵魂，如果 T7 选择了灵魂燃烧：鬼影缠身
    //..addattackCmd('true', '灵魂燃烧', NA_Player)
//鬼影缠身，如果黑暗灵魂开启，或灵魂碎片已满
  ..addattackCmd('not W_RetainBuff(NA_Target, -48181, true) and UnitPower(NA_Player, SPELL_POWER_SOUL_SHARDS)>0', '鬼影缠身', NA_Target)
//吸取灵魂
  ..addattackCmd('W_HPlevel(NA_Target)<0.2', '吸取灵魂', NA_Target)

    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('NA_IsMaxDps', '召唤末日守卫', NA_Player)
    ..addattackAOECmd('NA_IsMaxDps', '召唤地狱火', NA_Player)
    ..addattackAOECmd('NA_IsMaxDps', '灵魂燃烧', NA_Player)
    ..addattackAOECmd('count980<5 and W_HasBuff(NA_Player, 86211, true)', '灵魂交换', NA_Target)

//卡 CD 黑暗灵魂
..addattackAOECmd('true', '黑暗灵魂：哀难', NA_Player)
//使用灵魂燃烧：腐蚀之种对尽量多的目标施加腐蚀术，如果多目标相对集中
..addattackAOECmd('not W_RetainBuff(NA_Target, -27243, true)', '腐蚀之种', NA_Target)
//卡 CD 大灾变，如果 T7 选择了大灾变
  //..addattackAOECmd('true', '大灾变', NA_Player)
//保持主目标的痛楚、腐蚀术和痛苦无常
//保持 10 层痛楚
..addattackAOECmd('count980<10', '痛楚', NA_Target)
//保持腐蚀术
..addattackAOECmd('not retain146739', '腐蚀术', NA_Target)
//保持痛苦无常
..addattackAOECmd('not retain30108', '痛苦无常', NA_Target)
//保持鬼魅灵魂，如果 T7 选择了灵魂燃烧：鬼影缠身
  //..addattackAOECmd('true', '灵魂燃烧', NA_Player)
//鬼影缠身，如果黑暗灵魂开启，或灵魂碎片已满
..addattackAOECmd('not W_RetainBuff(NA_Target, -48181, true) and UnitPower(NA_Player, SPELL_POWER_SOUL_SHARDS)>0', '鬼影缠身', NA_Target)
//对副目标逐一施加腐蚀之种
..addattackAOECmd('not W_RetainBuff(NA_Target, -27243, true)', '腐蚀之种', NA_Target)
//吸取灵魂
..addattackAOECmd('W_HPlevel(NA_Target)<0.2', '吸取灵魂', NA_Target)

//    ..addattackAOECmd('not W_RetainBuff(NA_Target, -74434, true)', '灵魂燃烧', NA_Target)
//    ..addattackAOECmd('not W_RetainBuff(NA_Target, -27243, true)', '腐蚀之种', NA_Target)
//    ..addattackAOECmd('not retain146739', '腐蚀术', NA_Target)
//    ..addattackAOECmd('count980<10', '痛楚', NA_Target)
//    ..addattackAOECmd('not W_RetainBuff(NA_Target, -980, true)', '痛楚', NA_Target)
//    ..addattackAOECmd('not retain30108', '痛苦无常', NA_Target)
//    ..addattackAOECmd('not W_RetainBuff(NA_Target, -48181, true)', '鬼影缠身', NA_Target)
//    ..addattackAOECmd('W_HPlevel(NA_Target)<0.2', '吸取灵魂', NA_Target)
//    //..addattackAOECmd('true', '灾难之握', NA_Target)
    ;

//-----------------------------------------------------------Protection
Profile ZSProfile0 = new Profile(1, 0, 'Protection', 'Protection')
    ..commonCodes = '''
'''
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '冲锋', NA_Target)
    ..addkeepBuffCmd('NA_IsSolo and NA_ProfileNo == 0 and W_TargetCanAttack()', '盾牌冲锋', NA_Target)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '英勇投掷', NA_Target)
    ..addkeepBuffCmd('NA_IsSolo and not W_HasBuff(NA_Player, 6673, true)', '战斗怒吼', NA_Player)

    ..addkeepHPCmd('not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8', '乘胜追击', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.8', '盾牌屏障', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.2', '破釜沉舟', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.2', '盾墙', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and W_HPlevel(NA_Player)<0.1', '挫志怒吼', NA_Player)

    //..addassistCmd('not NA_IsSolo', '援护', NA_Target)
    ..addassistCmd('not NA_IsSolo', '捍卫', NA_Target)

    ..attackCodes = '''local notTanking = not NA_IsSolo and not W_isTanking();
'''

    ..addattackCmd('notTanking', '嘲讽', NA_Target)
    ..addattackCmd('true', '斩杀', NA_Target)
    ..addattackCmd('W_PowerLevel(NA_Player) < 0.5', '复仇', NA_Target)
    ..addattackCmd('true', '英勇打击', NA_Target)
    ..addattackCmd('true', '盾牌猛击', NA_Target)
    ..addattackCmd('W_BuffCount(NA_Target, -113746, true)<3', '毁灭打击', NA_Target)
    ..addattackCmd('true', '盾牌冲锋', NA_Target)
    ..addattackCmd('true', '冲锋', NA_Target)
    ..addattackCmd('true', '英勇投掷', NA_Target)
    ..addattackCmd('true', '风暴之锤', NA_Target)

    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('notTanking', '嘲讽', NA_Target)
    //..addattackAOECmd('W_PowerLevel(NA_Player) > 0.5', '顺劈斩', NA_Target)
    ..addattackAOECmd('W_PowerLevel(NA_Player) < 0.5', '复仇', NA_Target)
    ..addattackAOECmd('true', '盾牌猛击', NA_Target)
    ..addattackAOECmd('W_BuffCount(NA_Target, -113746, true)<3', '毁灭打击', NA_Target)
    ..addattackAOECmd('true', '盾牌冲锋', NA_Target)
    ..addattackAOECmd('true', '冲锋', NA_Target)
    ..addattackAOECmd('true', '英勇投掷', NA_Target)
    ..addattackAOECmd('true', '风暴之锤', NA_Target);
//-----------------------------------------------------------Fury
Profile ZSProfile1 = new Profile(1, 1, 'Fury', 'Fury')
    ..commonCodes = '''
'''
    ..attackCodes = '''
'''
    ..addattackCmd('true', '斩杀', NA_Target)
    ..addattackCmd('W_PowerLevel(NA_Player) < 0.7', '嗜血', NA_Target)
    ..addattackCmd('NA_IsMaxDps', '风暴之锤', NA_Target)
    //..addattackCmd('NA_IsMaxDps', '天神下凡', NA_Player)
    ..addattackCmd('W_HasBuff(NA_Player, 46916, true)', '狂风打击', NA_Target)
    ..addattackCmd('W_HPlevel(NA_Target)>0.2 and W_HasBuff(NA_Player, 131116, true)', '怒击', NA_Target)
    ..addattackCmd('W_HasBuff(NA_Player, 32216, true)', '乘胜追击', NA_Target)
    ..addattackCmd('W_PowerLevel(NA_Player) > 0.4', '怒击', NA_Target)
    ..addattackCmd('true', '狂风打击', NA_Target)
    ..addattackCmd('true', '冲锋', NA_Target)
    ..addattackCmd('true', '英勇投掷', NA_Target)
    ..addattackCmd('NA_IsSolo', '风暴之锤', NA_Target)

    //------------------------------------------AOE------------------------------------
    ..addattackAOECmd('true', '斩杀', NA_Target)
    ..addattackAOECmd('NA_IsMaxDps', '剑刃风暴', NA_Target)
    //..addattackAOECmd('NA_IsMaxDps', '破坏者', NA_Target)
    ..addattackAOECmd('true', '旋风斩', NA_Target)
    ..addattackAOECmd('W_PowerLevel(NA_Player) < 0.7', '嗜血', NA_Target)
    ..addattackAOECmd('true', '狂风打击', NA_Target)
    ..addattackAOECmd('true', '冲锋', NA_Target)
    ..addattackAOECmd('true', '英勇投掷', NA_Target)
    ..addattackAOECmd('true', '风暴之锤', NA_Target);
//-----------------------------------------------------------Arms
Profile ZSProfile2 = new Profile(1, 2, 'Arms', 'Arms')
    ..commonCodes = '''
'''

;

//-----------------------------------------------------------Bear
Profile XDProfile0 = new Profile(11, 0, 'Bear', 'Bear')
    ..commonCodes = '''
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
local inBear = W_HasBuff(NA_Player, 5487, true);
local inCat = W_HasBuff(NA_Player, 768, true);
local yxhc = W_HasBuff(NA_Player, 108293, true);
'''
    ..attackCodes = '''
      local hasThrash = W_RetainBuff(NA_Target, -77758, true);   --痛击dot
      local countLacerate = W_BuffCount(NA_Target, -33745, true);   --割伤dot
      local notTanking = not NA_IsSolo and not W_isTanking();
'''
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP3', '塞纳里奥结界', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP3', '野蛮防御', NA_Player)
    ..addkeepHPCmd('needHP2', '树皮术', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP2', '野性之心', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP2 and yxhc', '回春术', NA_Player) //野性之心下的回春
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '生存本能', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP', '狂暴回复', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 2 and needHP2', '自然的守护', NA_Player)

    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 1126, true)', '野性印记', NA_Player)
    ..addkeepBuffCmd('NA_IsSolo and W_TargetCanAttack()', '野性冲锋', NA_Target)

    ..addattackCmd('not NA_IsSolo and not W_HasBuff(NA_Target, -770, true)', '精灵之火', NA_Target)
    ..addattackCmd('inBear and notTanking', '低吼', NA_Target)
    ..addattackCmd('inBear and W_RetainBuff(NA_Player, 135286, true)', '重殴', NA_Target)
    ..addattackCmd('inBear and not hasThrash', '痛击', NA_Target)
    ..addattackCmd('inBear and countLacerate < 3', '割伤', NA_Target)
    ..addattackCmd('inBear and W_RetainBuff(NA_Target, -33745, true)', '割伤', NA_Target)
    //..addattackCmd('inBear and W_PowerLevel(NA_Player) < 0.1', '激怒', NA_Player)


    ..addattackCmd('inCat and GetComboPoints("player","target") > 4', '凶猛撕咬', NA_Target)
    ..addattackCmd('true', '狂暴', NA_Player)
    ..addattackCmd('true', '裂伤', NA_Target)
    ..addattackCmd('true', '野性冲锋', NA_Target)


    ..addattackAOECmd('inBear and notTanking', '低吼', NA_Target)
    ..addattackAOECmd('inBear and not hasThrash', '痛击', NA_Target)
    //..addattackAOECmd('true', '横扫', NA_Target)
    ..addattackAOECmd('true', '裂伤', NA_Target)
    ..addattackAOECmd('true', '野性冲锋', NA_Target)
    //..addattackAOECmd('inBear and W_PowerLevel(NA_Player) < 0.1', '激怒', NA_Player)
    ;

//-----------------------------------------------------------Cat
Profile XDProfile1 = new Profile(11, 1, 'Cat', 'Cat')..commonCodes = '''
''';

//-----------------------------------------------------------Restoration
Profile XDProfile2 = new Profile(11, 2, 'Restoration', 'Restoration')..commonCodes = '''
'''
;
//-----------------------------------------------------------Balance
Profile XDProfile3 = new Profile(11, 3, 'Balance', 'Balance')..commonCodes = '''
'''
    ..attackCodes = '''
local yhsdot = W_RetainBuff(NA_Target, -164812, true);   --月火术dot
local yysdot = W_RetainBuff(NA_Target, -164815, true);   --阳炎术dot
local yzd = W_RetainBuff(NA_Player, 171743, true);   --月之巅
local rzd = W_RetainBuff(NA_player, 171744, true);   --日之巅
local ygzx = W_RetainBuff(NA_Player, 164545, true);   --日光增效
local rgzx = W_RetainBuff(NA_player, 164547, true);   --月光增效
local cfzm = W_RetainBuff(NA_player, 112071, true);   --超凡之盟
'''

..addattackCmd('rgzx and UnitPower(NA_Player,8) > 20', '星涌术', NA_Target)
..addattackCmd('ygzx and UnitPower(NA_Player,8) < -40', '星涌术', NA_Target)
..addattackCmd('NA_GetSpellCharges(78674)==2 and W_GetSpellCooldown(78674)<6 or NA_GetSpellCharges(78674)==3', '星涌术', NA_Target)
..addattackCmd('UnitPower(NA_Player,8) > 40', '超凡之盟', NA_Player)
..addattackCmd('UnitPower(NA_Player,8) > 0', '化身：艾露恩之眷', NA_Player)
..addattackCmd('W_BuffTime(NA_Target,-164815) < 7 or rzd', '阳炎术', NA_Target)
..addattackCmd('yzd or W_BuffTime(NA_Target,-164812) < 4 or cfzm and W_BuffTime(NA_Player,112071) <= 2', '月火术', NA_Target)
..addattackCmd('UnitPower(NA_Player,8) >= 0', '愤怒', NA_Target)
..addattackCmd('UnitPower(NA_Player,8) <= 0' , '星火术', NA_Target)
;
Profile MSProfile0 = new Profile(5, 0, 'Discipline', 'Discipline');
Profile MSProfile1 = new Profile(5, 1, 'Holy', 'Holy');
Profile MSProfile2 = new Profile(5, 2, 'Shadow', 'Shadow')
..commonCodes=''' 
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
'''
..addkeepHPCmd('needHP2', '吸血鬼的拥抱', NA_Player)
..addkeepHPCmd('needHP', '消散', NA_Player)
..addkeepHPCmd('needHP', '渐隐术', NA_Player)
..addkeepHPCmd('needHP2', '绝望祷言', NA_Player)
..addkeepHPCmd('needHP2', '真言术：盾', NA_Player)

    ..attackCodes = '''
local ayst = W_RetainBuff(NA_Target, -589, true);   --暗言术：痛
local xxgzc = W_RetainBuff(NA_Target, -34914, true);   --吸血鬼之触
local countShadowOrbs = UnitPower(NA_Player, SPELL_POWER_SHADOW_ORBS)  --暗影宝珠
'''
..addattackCmd('true', '心灵震爆', NA_Target)
..addattackCmd('not ayst', '暗言术：痛', NA_Target)
..addattackCmd('not xxgzc', '吸血鬼之触', NA_Target)
..addattackCmd('true', '暗言术：灭', NA_Target)
..addattackCmd('true', '摧心魔', NA_Target)
..addattackCmd('countShadowOrbs == 3', '噬灵疫病', NA_Target)
..addattackCmd('true', '光晕', NA_Target)
..addattackCmd('true', '精神鞭笞', NA_Target)

;

Profile DZProfile0 = new Profile(4, 0, 'Assassination', 'Assassination')
..addkeepBuffCmd('not W_HasBuff(NA_Player, 1784, true)', '潜行', NA_Player)
..addkeepBuffCmd('W_TargetCanAttack()', '伏击', NA_Target)

    ..attackCodes = '''
      local hasys = W_RetainBuff(NA_Player, 11327, true);   --隐身
      local hasqx = W_RetainBuff(NA_Player, 1784, true);   --潜行
      local hasmd = W_RetainBuff(NA_Player, 121153, true);   --盲点
      --local countyg = W_BuffCount(NA_Player, 114015, true);   --预感
      --local hasayfs = W_RetainBuff(NA_Player, 152151, true);   --暗影反射
      --local hasayjz = W_RetainBuff(NA_Player, 108209, true);   --暗影集中
      local hasqg = W_RetainBuff(NA_Player, 5171, true);   --切割
      local hasgl = W_RetainBuff(NA_Target, -1943, true);   --割裂
  '''
..addattackCmd('W_HPlevel(NA_Target)<0.35 or hasmd', '斩击', NA_Target)
..addattackCmd('hasgl and UnitPower(NA_Player,4)==5', '毒伤', NA_Target)
..addattackCmd('not hasgl and UnitPower(NA_Player,4)>0', '割裂', NA_Target)
..addattackCmd('not hasys and W_GetSpellCooldown(1856)>60', '伺机待发', NA_Player)
..addattackCmd('true', '消失', NA_Player)
..addattackCmd('not hasqg and UnitPower(NA_Player,4)>0', '切割', NA_Player)
..addattackCmd('hasys or hasqx', '伏击', NA_Target)
..addattackCmd('hasqg and UnitPower(NA_Player,4)>0', '毒伤', NA_Target)
..addattackCmd('true', '宿敌', NA_Target)
..addattackCmd('true', '毁伤', NA_Target)
;

Profile DZProfile1 = new Profile(4, 1, 'Combat', 'Combat')
    ..commonCodes = '''
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
 '''
..addkeepHPCmd('needHP3', '佯攻', NA_Player)
..addkeepHPCmd('needHP2', '复原', NA_Player)
..addkeepHPCmd('needHP2', '暗影斗篷', NA_Player)
..addkeepHPCmd('needHP', '闪避', NA_Player)
..addkeepHPCmd('needHP3', '备战就绪', NA_Player)

    ..attackCodes = '''
      local hasys = W_RetainBuff(NA_Player, 11327, true);   --隐身
      local hasqx = W_RetainBuff(NA_Player, 1784, true);   --潜行
      local hasqg = W_RetainBuff(NA_Player, 5171, true);   --切割
      local hasyhdj = W_RetainBuff(NA_Target, -84617, true);   --要害打击
 '''
..addattackCmd('hasys or hasqx', '伏击', NA_Target)
..addattackCmd('not hasqg and UnitPower(NA_Player,4)>0', '切割', NA_Player)
..addattackCmd('true', '要害打击', NA_Target)
..addattackCmd('W_GetSpellCooldown(1752)>0 and UnitPower(NA_Player)<30', '影舞步', NA_Target)
..addattackCmd('true', '冲动', NA_Player)
..addattackCmd('UnitPower(NA_Player,4)>4', '刺骨', NA_Target)
..addattackCmd('not hasyhdj and W_GetSpellCooldown(1856)>60 and W_GetSpellCooldown(14185)==0', '伺机待发', NA_Player)
..addattackCmd('not hasyhdj', '要害打击', NA_Target)
..addattackCmd('true', '消失', NA_Player)
..addattackCmd('true', '影袭', NA_Target)
    ;

Profile DZProfile2 = new Profile(4, 2, 'Subtlety', 'Subtlety');

Profile WSProfile0 = new Profile(10, 0, 'Brewmaster', 'Brewmaster')
    ..commonCodes = '''
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
'''
    ..attackCodes = '''
local zdzq = W_RetainBuff(NA_Player, 124274, true);   --中度醉拳dot
local maxzq = W_RetainBuff(NA_Player, 124273, true);   --重度醉拳dot
local pmj = W_RetainBuff(NA_Player, 115308, true);   --飘渺酒
local jxrd = W_RetainBuff(NA_Player, 115307, true);   --酒醒入定  
local mhzl = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力  
local notTanking = not NA_IsSolo and not W_isTanking();
'''

    ..addkeepHPCmd('needHP', '躯不坏', NA_Player)
    ..addkeepHPCmd('needHP', '壮胆酒', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP2', '禅悟冥想', NA_Player)
    ..addkeepHPCmd('NA_ProfileNo == 0 and needHP2', '金钟罩', NA_Player)
    ..addkeepHPCmd('needHP3', '移花接木', NA_Player)
    ..addkeepHPCmd('needHP3', '真气波', NA_Player)

    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 116781, true) and NA_ProfileNo ~= 1', '白虎传承', NA_Player)

    ..addattackCmd('true', '轮回之触', NA_Target)
    ..addattackCmd('zdzq', '活血酒', NA_Player)
    ..addattackCmd('maxzq', '活血酒', NA_Player)
    ..addattackCmd('true', '醉酿投', NA_Target)
    ..addattackCmd('not pmj', '飘渺酒', NA_Player)
    ..addattackCmd('not jxrd', '幻灭踢', NA_Target)
    ..addattackCmd('not mhzl', '猛虎掌', NA_Target)
    ..addattackCmd('true', '真气波', NA_Target)
    ..addattackCmd('true', '移花接木', NA_Player)
    ..addattackCmd('true', '白虎下凡', NA_Target)
    ..addattackCmd('true', '扫堂腿', NA_Target)
    ..addattackCmd('UnitPower(NA_Player, SPELL_POWER_CHI)>3', '幻灭踢', NA_Target)
    ..addattackCmd('UnitPower(NA_Player,3)>70', '贯日击', NA_Target)
    ..addattackCmd('true', '金钟罩', NA_Player)
    ..addattackCmd('true', '猛虎掌', NA_Target)

    ..addattackAOECmd('true', '醉酿投', NA_Target)
    ..addattackAOECmd('not jxrd', '幻灭踢', NA_Target)
    ..addattackAOECmd('not mhzl', '猛虎掌', NA_Target)
    ..addattackAOECmd('UnitPower(NA_Player, SPELL_POWER_CHI)>3', '幻灭踢', NA_Target)
    ..addattackAOECmd('UnitPower(NA_Player)>70', '贯日击', NA_Target)
    ..addattackAOECmd('true', '猛虎掌', NA_Target)
    ..addattackAOECmd('W_HPlevel(NA_Player)<1', '移花接木', NA_Player)
    ;

Profile WSProfile1 = new Profile(10, 1, 'Mistweaver', 'Mistweaver')
    ..attackCodes = '''
local xrdst2 = W_RetainBuff(NA_Target, -130320, true);   --贯日击的易伤
local mhzl2 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力
local hlzw = W_BuffCount(NA_Player, 118674);   --活力之雾
local shs = W_FormInfo(2);   --神鹤式
'''
    ..addkeepBuffCmd('not W_HasBuff(NA_Player, 115921, true) and NA_ProfileNo == 1', '帝王传承', NA_Player)

..addattackCmd('not shs', '神鹤式', NA_Player)
..addattackCmd('true', '轮回之触', NA_Target)
..addattackCmd('not xrdst2', '旭日东升踢', NA_Target)
..addattackCmd('not mhzl2', '猛虎掌', NA_Target)
..addattackCmd('true', '真气波', NA_Target)
..addattackCmd('true', '移花接木', NA_Player)
..addattackCmd('true', '白虎下凡', NA_Target)
..addattackCmd('true', '扫堂腿', NA_Target)
..addattackCmd('hlzw==5', '升腾之雾', NA_Target)
..addattackCmd('UnitPower(NA_Player, SPELL_POWER_CHI)>3', '幻灭踢', NA_Target)
..addattackCmd('true', '旭日东升踢', NA_Target)
..addattackCmd('true', '法力茶', NA_Player)
..addattackCmd('true', '雷光聚神茶', NA_Player)

..assistCodes = '''
local fszw = W_RetainBuff(NA_Target, -119611, true);   --复苏之雾
local fwzw = W_RetainBuff(NA_Target, -115175, true);   --抚慰之雾  
local lls = W_FormInfo(1);   --灵龙式
'''
..addassistCmd('NA_ProfileNo == 1 and not lls', '灵龙式', NA_Player)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.3', '作茧缚命', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and true', '复苏之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and true', '移花接木', NA_Player)
..addassistCmd('NA_ProfileNo == 1 and UnitPower(NA_Player, SPELL_POWER_CHI)>3', '振魂引', NA_Player)
..addassistCmd('NA_ProfileNo == 1 and true', '真气波', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.8', '神鹤引项踢', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.7 and fwzw', '升腾之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.7 and fwzw', '氤氲之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.9', '抚慰之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.6', '升腾之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.5', '氤氲之雾', NA_Target)
..addassistCmd('NA_ProfileNo == 1 and true', '法力茶', NA_Player)
..addassistCmd('NA_ProfileNo == 1 and true', '雷光聚神茶', NA_Player)
;
Profile WSProfile2 = new Profile(10, 2, 'Battledancer', 'Battledancer')
    ..attackCodes = '''
local xrdst3 = W_RetainBuff(NA_Target, -107428, true);   --贯日击的易伤
local mhzl3 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力 
local nlp = W_RetainBuff(NA_Player, 113656, true);   --怒雷破
'''
..addattackCmd('true', '轮回之触', NA_Target)
..addattackCmd('true', '贯日击', NA_Target)
..addattackCmd('needHP3 or UnitPower(NA_Player, SPELL_POWER_CHI)<3', '移花接木', NA_Player)
..addattackCmd('not mhzl3', '猛虎掌', NA_Target)
..addattackCmd('not xrdst3', '贯日击', NA_Target)
..addattackCmd('UnitPower(NA_Player,3)<60', '怒雷破', NA_Target)
..addattackCmd('true', '贯日击', NA_Target)
..addattackCmd('true', '真气波', NA_Player)
..addattackCmd('UnitPower(NA_Player, SPELL_POWER_CHI)>3', '幻灭踢', NA_Target)
..addattackCmd('nlp', '虎眼酒', NA_Player)
;

Profile SMProfile0 = new Profile(7, 0, 'Elemental', 'Elemental')
    ..commonCodes=''' 
local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
'''
..addkeepHPCmd('needHP', '星界转移', NA_Player)
..addkeepHPCmd('needHP2', '石壁图腾', NA_Player)
//..addkeepHPCmd('needHP2', '纳鲁的赐福 ', NA_Player)
..addkeepHPCmd('needHP2', '土元素图腾 ', NA_Player)

    ..attackCodes = '''
local lyzj = W_RetainBuff(NA_Target, -8050, true);   --烈焰震击
local sdzd = W_BuffCount(NA_Player, 324);   --闪电之盾
--local qhsf = W_RetainBuff(NA_Player, 222222, true);   --强化释放
'''
..addattackCmd('not lyzj or W_BuffTime(NA_Target,-8050)<9', '烈焰震击', NA_Target)
..addattackCmd('true', '怒火释放', NA_Player)
..addattackCmd('true', '熔岩爆裂', NA_Target)
..addattackCmd('true', '元素冲击', NA_Target)
..addattackCmd('needHP2', '萨满之怒', NA_Player)
..addattackCmd('true', '火元素图腾', NA_Player)
..addattackCmd('qhsf', '火焰释放', NA_Player)
..addattackCmd('needHP2', '先祖指引', NA_Player)
..addattackCmd('needHP2', '治疗之涌', NA_Player)
..addattackCmd('sdzd>14 and W_BuffTime(NA_Target,-8050)<6', '大地震击', NA_Player)
..addattackCmd('W_GetSpellCooldown(2894)<240', '灼热图腾', NA_Player)
..addattackCmd('W_GetSpellCooldown(2894)<180', '元素的召唤', NA_Player)
..addattackCmd('true', '升腾', NA_Player)
..addattackCmd('true', '闪电箭', NA_Target)
..addattackCmd('true', '闪电链', NA_Target)
..addattackCmd('true', '灵魂行者的恩赐', NA_Player)
;
Profile SMProfile1 = new Profile(7, 1, 'Enhancement', 'Enhancement');
Profile SMProfile2 = new Profile(7, 2, 'Restoration', 'Restoration')
..assistCodes='''
    local ddzd = W_RetainBuff(NA_Target, -379, true);   --大地之盾
    local szhd = W_RetainBuff(NA_Player, 52127, true);   --水之护盾
    local hasjl = W_RetainBuff(NA_Target, -61295, true);   --激流
    local hascxby = W_RetainBuff(NA_Player, 51564, true);   --潮汐奔涌
    local hassmsf = W_RetainBuff(NA_Player, 73685, true);   --生命释放
    local hasxzxj = W_RetainBuff(NA_Player, 16188, true);   --先祖迅捷
'''
..addassistCmd('needHP', '星界转移', NA_Player)
..addassistCmd('needHP2', '石壁图腾', NA_Player)

..addassistCmd('NA_ProfileNo == 2 and not hasxzxj and W_HPlevel(NA_Target)<0.3', '先祖迅捷', NA_Player)
..addassistCmd('NA_ProfileNo == 2 and hasxzxj and W_HPlevel(NA_Target)<0.3', '治疗之涌', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and true', '治疗之泉图腾', NA_Player)
..addassistCmd('NA_ProfileNo == 2 and not ddzd', '大地之盾', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and not szhd', '水之护盾', NA_Player)
//..addassistCmd('NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.7', '纳鲁的赐福', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and not hassmsf and W_HPlevel(NA_Target)<0.9', '生命释放', NA_Player)
..addassistCmd('NA_ProfileNo == 2 and not hasjl and W_HPlevel(NA_Target)<0.9', '激流', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and hasjl and W_HPlevel(NA_Target)<0.7', '治疗链', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and hascxby and W_HPlevel(NA_Target)<0.6', '治疗之涌', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.9', '治疗波', NA_Target)
..addassistCmd('NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.6', '升腾', NA_Player)
..addassistCmd('NA_ProfileNo == 2 and W_HPlevel(NA_Target)<0.6', '灵魂行者的恩赐', NA_Player)
;


List<Profile> AllProfiles = [];

class Profile {
  int classID;
  int profileID;
  String name;
  String specName;
  String commonCodes = '';

  String keepHPCodes = '';
  List<CmdInfo> keepHPCmds = [];

  String attackAOECodes = '';
  List<CmdInfo> attackAOECmds = [];

  String attackCodes = '';
  List<CmdInfo> attackCmds = [];

  String assistCodes = '';
  List<CmdInfo> assistCmds = [];

  String keepBuffCodes = '';
  List<CmdInfo> keepBuffCmds = [];

  Profile(this.classID, this.profileID, this.name, this.specName);

  void addkeepHPCmd(String cnd, String spell, String target) {
    keepHPCmds.add(new CmdInfo(cnd, spell, target));
  }

  void addattackAOECmd(String cnd, String spell, String target) {
    attackAOECmds.add(new CmdInfo(cnd, spell, target));
  }

  void addattackCmd(String cnd, String spell, String target) {
    attackCmds.add(new CmdInfo(cnd, spell, target));
  }

  void addassistCmd(String cnd, String spell, String target) {
    assistCmds.add(new CmdInfo(cnd, spell, target));
  }

  void addkeepBuffCmd(String cnd, String spell, String target) {
    keepBuffCmds.add(new CmdInfo(cnd, spell, target));
  }
}

class CmdInfo {
  String cnd;
  String spell;
  String target;

  CmdInfo(this.cnd, this.spell, this.target);
}

String getSpellName(String spell, String spec) {
  var spellInfo = classInfo.findSpell(spell, spec);
  if (spellInfo != null && spellInfo.name != null) {
    return spellInfo.name;
  } else {
    return spell;
  }
}

String getBuffName(String spell, String spec) {
  var buff = getSpellName(spell, spec);
  if (buff == spell && AllBuffs[spell] != null) {
    buff += ':' + (AllBuffs[spell][0] as int).toString();
  }
  return buff;
}

void parseSimc(int classID, String specName, String file) {
  classInfo = readClassInfo(classID);
  print('----------------------------------------${classInfo.cnName}------${specName}--------${file}');
  var f = new File(file);
  List<String> lines = f.readAsLinesSync();

  //p.attackAOECmds.clear();
  //p.attackCmds.clear();

  for (String line in lines) {
    line = line.trim();
    if (line.startsWith('actions.aoe') || line.startsWith('actions.single_target') || line.startsWith('actions+=')) {
      if (specName == 'Frost') {
        line = line.replaceAll('soul_reaper', 'soul_reaper:Frost');
      } else if (specName == 'Unholy') {
        line = line.replaceAll('soul_reaper', 'soul_reaper:Unholy');
      } else if (specName == 'Blood') {
        line = line.replaceAll('soul_reaper', 'soul_reaper:Blood');
      }
      int start = line.indexOf('=/');
      if (start < 0) {
        start = line.indexOf('=') - 1;
      }
      int end = line.indexOf(', ');
      if (end < 0) {
        end = line.length;
      }
      //      String spell = line.substring(start+2, end);
      //print('-----------' + getSpellName(spell, specName));
      start = line.indexOf('if=');
      String cnd = line;
      if (start > 0) {
        cnd = line.substring(start + 3, line.length);
      }
      cnd = cnd.replaceAll('&', ' and ');
      cnd = cnd.replaceAll('|', ' or ');
      cnd = cnd.replaceAll('!', ' not ');
      cnd = cnd.replaceAll('target.health.pct-3*(target.health.pct%target.time_to_die)', 'W_HPlevel(NA_Target)*100');
      cnd = cnd.replaceAll('runic_power', 'W_PowerLevel(NA_Player)');
      cnd = regReplace(cnd, r'[,]*line_cd=\d+', '');
      cnd = regReplace(cnd, r'blood=(\d+)', r'W_StarCount(1)==\1');
      cnd = regReplace(cnd, r'frost=(\d+)', r'W_StarCount(3)==\1');
      cnd = regReplace(cnd, r'unholy=(\d+)', r'W_StarCount(2)==\1');

      cnd = cndSpellReplace(specName, cnd, r'talent\.([\w]+)\.enabled', r'W_SpellEnabled("\1", NA_Target)');

      cnd = cndBuffReplace(specName, cnd, r'dot\.([\w]+)\.ticking', r'W_HasBuff(NA_Player, "\1", true)');
      cnd = cndBuffReplace(specName, cnd, r'cooldown\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = cndBuffReplace(specName, cnd, r'dot\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = cndBuffReplace(specName, cnd, r'buff\.([\w]+)\.stack', r'W_BuffCount(NA_Player, "\1")');
      cnd = cndBuffReplace(specName, cnd, r'buff\.([\w]+)\.react', r'W_HasBuff(NA_Player, "\1")');

      String target = NA_Player;
      String cmdType = "";
      if (line.startsWith('actions.aoe')) {
        //p.addattackAOECmd(cnd, spell, target);
        cmdType = 'AOE';
      } else if (line.startsWith('actions.single_target') || line.startsWith('actions+=')) {
        //p.addattackCmd(cnd, spell, target);
        cmdType = 'single_target';
      }
      print(cmdType + '====>' + cnd);
    }
  }
}

String cndSpellReplace(String specName, String cnd, String regexp, String replace) {
  return cnd.replaceAllMapped(new RegExp(regexp, caseSensitive: false), (m) {
    String s = m.group(1);
    //print(':::'+getSpellName(s, specName));
    return replace.replaceAll('\\1', getSpellName(s, specName));
  });
}

String cndBuffReplace(String specName, String cnd, String regexp, String replace) {
  return cnd.replaceAllMapped(new RegExp(regexp, caseSensitive: false), (m) {
    String s = m.group(1);
    print(':::' + getBuffName(s, specName));
    return replace.replaceAll('\\1', s);
  });
}

Set<String> actions = new Set();
WOWClassInfo classInfo = null;
Profile currProfile = null;

String cmdCodes(List<CmdInfo> cmds) {
  String code = '';
  for (CmdInfo cmd in cmds) {
    WOWSpellInfo spellInfo = classInfo.findSpell(cmd.spell, currProfile.specName);
    String spellNo = cmd.spell;
    String spellName = cmd.spell;
    if (spellInfo != null) {
      spellNo = spellInfo.spellID.toString();
      spellName = spellInfo.name;
    }
    actions.add(spellNo);
    code += '''\t\t\t\t\tor NA_Fire(${cmd.cnd}, '${spellNo}', ${cmd.target}) --${spellName}\n''';
  }
  return code;
}

String classProfilesCodes() {
  String codeActions = '';
  String codeProfileNames = '';
  String commonCodes = '';

  String attackAOECodes = '';
  String attackCodes = '';
  String assistCodes = '';
  String keepHPCodes = '';
  String keepBuffCodes = '';

  String profileAtkCodes = '';
  String profileAssistCodes = '';
  String profileKeepHPCodes = '';
  String profileKeepBuffCodes = '';
  for (Profile p in AllProfiles) {
    currProfile = p;
    if (p.classID != classInfo.classID) {
      continue;
    }
    actions.clear();

    profileAtkCodes += '''
      elseif(NA_ProfileNo == ${p.profileID})then --${p.name}
        ${p.attackCodes.replaceAll('\n', '\n\t\t\t\t')}
        ${p.attackAOECodes.replaceAll('\n', '\n\t\t\t\t')}
        if(not NA_IsAOE and (false
${cmdCodes(p.attackCmds)}
        ))then return true; end
  
        if(NA_IsAOE and (false
${cmdCodes(p.attackAOECmds)}
        ))then return true; end
''';
    profileAssistCodes += '''
      elseif(NA_ProfileNo == ${p.profileID})then --${p.name}
        ${p.assistCodes.replaceAll('\n', '\n\t\t\t\t')}
        if(false
${cmdCodes(p.assistCmds)}
        )then return true; end
''';
    profileKeepHPCodes += '''
      elseif(NA_ProfileNo == ${p.profileID})then --${p.name}
        ${p.keepHPCodes.replaceAll('\n', '\n\t\t\t\t')}
        if(false
${cmdCodes(p.keepHPCmds)}
        )then return true; end
''';
    profileKeepBuffCodes += '''
    elseif(NA_ProfileNo == ${p.profileID})then --${p.name}
      ${p.keepBuffCodes.replaceAll('\n', '\n\t\t\t\t')}
      if(false
${cmdCodes(p.keepBuffCmds)}
      )then return true; end
''';

    codeActions += '''
  elseif(no == ${p.profileID})then
    return {${joinText2(actions, "'", "',", ",")}};
''';
    codeProfileNames += '\'${p.name}\',';
    commonCodes += p.commonCodes;
    keepHPCodes += p.keepHPCodes;
    attackAOECodes += p.attackAOECodes;
    attackCodes += p.attackCodes;
    assistCodes += p.assistCodes;
    keepBuffCodes += p.keepBuffCodes;

    print(p.name + '==' + actions.length.toString());
  }

  String code = '''
function getNA${classInfo.classID}Actions(no)
  if(no < 0)then return {};
${codeActions}  end
  return {};
end

NA${classInfo.classID}ProfileNames = {${codeProfileNames}''};

function NA${classInfo.classID}Dps()
  W_Log(1,"${classInfo.cnName} dps");
  ${commonCodes.replaceAll('\n', '\n\t')}
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
${profileKeepHPCodes}      end

      if(NA_ProfileNo < 0)then return false;
${profileAtkCodes}      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(NA_ProfileNo < 0)then return false;
${profileAssistCodes}      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
${profileKeepBuffCodes}    end
  end
  return false;
end
''';
  return code;
}

void genProfileIni(Profile p){
  String codes = '''
classID=${p.classID}
profileID=${p.profileID}
name=${p.name}
specName=${p.specName}\n''';

  codes +='\n[commonCodes]\n';
  codes += p.commonCodes;

  codes +='\n[keepHPCmds]\n';
  for(CmdInfo cmd in p.keepHPCmds){
    codes += cmd.spell+'@'+cmd.target+'='+cmd.cnd+'\n';
  }
  codes +='\n[keepBuffCmds]\n';
  for(CmdInfo cmd in p.keepBuffCmds){
    codes += cmd.spell+'@'+cmd.target+'='+cmd.cnd+'\n';
  }

  codes +='\n[attackCodes]\n';
  codes += p.attackCodes;
  codes +='\n[attackCmds]\n';
  for(CmdInfo cmd in p.attackCmds){
    codes += cmd.spell+'@'+cmd.target+'='+cmd.cnd+'\n';
  }
  codes +='\n[attackAOECodes]\n';
  codes += p.attackAOECodes;
  codes +='\n[attackAOECmds]\n';
  for(CmdInfo cmd in p.attackAOECmds){
    codes += cmd.spell+'@'+cmd.target+'='+cmd.cnd+'\n';
  }

  codes +='\n[assistCodes]\n';
  codes += p.assistCodes;
  codes +='\n[assistCmds]\n';
  for(CmdInfo cmd in p.assistCmds){
    codes += cmd.spell+'@'+cmd.target+'='+cmd.cnd+'\n';
  }
  //print(codes);
  String enName = '';
  for(WOWClassInfo c in AllClassInfo){
    if(c.classID == p.classID){
      writeToFile('..\\profiles\\' + c.enName+p.profileID.toString() + '.ini', codes, encoding: 'utf-8');
      return;
    }
  }
}

Profile readProfileIni(String path){
  Profile p = new Profile(0,0,null,null);
  List<String> lines = readFileLines(path);
  String codes = '';
  String section = '';
  for(String line in lines){
    line = line.trim();
    if(line.startsWith('#')){
      continue;
    }
    if(line.startsWith('[') && line.endsWith(']')){
      section = line.substring(1, line.length-1).trim().toLowerCase();
    }else if(section == 'commonCodes'.toLowerCase()){
      p.commonCodes += line +'\n';
    }else if(section == 'assistCodes'.toLowerCase()){
      p.assistCodes += line +'\n';
    }else if(section == 'attackCodes'.toLowerCase()){
      p.attackCodes += line +'\n';
    }else if(line.indexOf('=')>0){
      String name = line.substring(0, line.indexOf('='));
      String value = line.substring(line.indexOf('=')+1);
      if(section == ''){
        if(name == 'classID'){
          p.classID = int.parse(value);
        }
        if(name == 'profileID'){
          p.profileID = int.parse(value);
        }
        if(name == 'name'){
          p.name = value;
        }
        if(name == 'specName'){
          p.specName = value;
        }
      }else if(section == 'attackCmds'.toLowerCase()){
        p.addattackCmd(value, name.substring(0, name.indexOf('@')), name.substring(name.indexOf('@')+1));
      }else if(section == 'attackAOECmds'.toLowerCase()){
        p.addattackAOECmd(value, name.substring(0, name.indexOf('@')), name.substring(name.indexOf('@')+1));
      }else if(section == 'assistCmds'.toLowerCase()){
        p.addassistCmd(value, name.substring(0, name.indexOf('@')), name.substring(name.indexOf('@')+1));
      }else if(section == 'keepHPCmds'.toLowerCase()){
        p.addkeepHPCmd(value, name.substring(0, name.indexOf('@')), name.substring(name.indexOf('@')+1));
      }else if(section == 'keepBuffCmds'.toLowerCase()){
        p.addkeepBuffCmd(value, name.substring(0, name.indexOf('@')), name.substring(name.indexOf('@')+1));
      }
    }
  }
  return p;
}

void genLuaCodes(){
  for (int classID=1;classID<12; classID++) {
    classInfo = readClassInfo(classID);
    String code = classProfilesCodes();
    writeToFile(r'..\src\NA' + classInfo.enName.toLowerCase() + '.lua', code, encoding: 'utf-8');
  }
}

void genIniCodes(){
    for(Profile p in AllProfiles){
      genProfileIni(p);
    }
}

void genIniProfileCodeFromLua(String codes){
  List<String> lines = codes.split('\n');
  for(String line in lines){
    line = line.trim();
    String key = '';
    String value = '';
    if(line.startsWith('--')){
      key = '#';
      line = line.substring(2);
    }
    if(line.indexOf('--')>=0){
      key += line.substring(line.indexOf('--')+2);
      line = line.substring(0, line.indexOf('--'));
    }
    if(line.lastIndexOf(',')>0 && line.lastIndexOf(')')>0){
      key += '@' + line.substring(line.lastIndexOf(',')+1, line.lastIndexOf(')')).trim();
      line = line.substring(0, line.lastIndexOf(','));
      line = line.substring(0, line.lastIndexOf(','));
    }
    if(line.startsWith('or NA_Fire(')){
      value = line.substring('or NA_Fire('.length);
    }
    if(key.length>0){
      print(key+'='+value);
    }
  }
}

main() {
//  AllProfiles.addAll([DKProfile0, DKProfile1, DKProfile2]);
//  AllProfiles.addAll([FSProfile0, FSProfile1, FSProfile2]);
//  AllProfiles.addAll([LRProfile0, LRProfile1, LRProfile2]);
//  AllProfiles.addAll([QSProfile0, QSProfile1, QSProfile2]);
//  AllProfiles.addAll([SSProfile0, SSProfile1, SSProfile2]);
//  AllProfiles.addAll([ZSProfile0, ZSProfile1, ZSProfile2]);
//  AllProfiles.addAll([XDProfile0, XDProfile1, XDProfile2, XDProfile3]);
//  AllProfiles.addAll([DZProfile0, DZProfile1, DZProfile2]);
//  AllProfiles.addAll([MSProfile0, MSProfile1, MSProfile2]);
//  AllProfiles.addAll([SMProfile0, SMProfile1, SMProfile2]);
//  AllProfiles.addAll([WSProfile0, WSProfile1, WSProfile2]);
//
//  genIniCodes();

  Directory root = new Directory('..\\profiles\\');
  for(FileSystemEntity f in root.listSync()){
    if(f is File){
      AllProfiles.add(readProfileIni(f.path));
    }
  }

  genLuaCodes();

  genIniProfileCodeFromLua('''                   

''');
}
