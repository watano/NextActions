DraenorTreasures = LibStub("AceAddon-3.0"):NewAddon("DraenorTreasures", "AceBucket-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes", true)
if not HandyNotes then return end

local iconDefaults = {
default = "Interface\\Icons\\TRADE_ARCHAEOLOGY_CHESTOFTINYGLASSANIMALS",
unknown = "Interface\\Addons\\HandyNotes_DraenorTreasures\\Artwork\\chest_normal_daily.tga",
hundredrare = "Interface\\Addons\\HandyNotes_DraenorTreasures\\Artwork\\RareIconBlue.tga",
rare = "Interface\\Addons\\HandyNotes_DraenorTreasures\\Artwork\\RareIcon.tga",
swprare = "Interface\\Icons\\Trade_Archaeology_Fossil_SnailShell",
shrine = "Interface\\Icons\\inv_misc_statue_02",
glider = "Interface\\Icons\\inv_feather_04",
rocket = "Interface\\Icons\\ability_mount_rocketmount",
}
PlayerFaction, _ = UnitFactionGroup("player")
DraenorTreasures.nodes = { }
local nodes = DraenorTreasures.nodes
local isTomTomloaded = false

if (IsAddOnLoaded("TomTom")) then 
	isTomTomloaded = true
end


nodes["ShadowmoonValleyDR"] = {
--SMV 财宝
[55004500]={ "35581", "炼金师的包裹", "草药", "", "default", "SMVTreasures","109124"},
[52804840]={ "35584", "先祖巨斧", "i519 双手 力量斧", "任务ID有可能错误 - 财宝可能在拾取后仍然保持活跃状态", "default", "SMVTreasures","113560"},
[41502790]={ "33869", "装甲雷象僚牙", "i518 饰品 护甲加成+精通 使用后", "", "default", "SMVTreasures","108902"},
[37704430]={ "33584", "阿库伯的灰烬", "休息奖励经验值的消耗品", "", "default", "SMVTreasures","113531"},
[49303750]={ "33867", "占星家的盒子", "玩具", "", "default", "SMVTreasures","109739"},
[36804140]={ "33046", "爱人的祭品", "趣味物品 - 副手", "", "default", "SMVTreasures","113547"},
[37202310]={ "33613", "冒泡的大锅", "i516 法术 副手", "在一个山洞内", "default", "SMVTreasures","108945"},
[84504470]={ "33885", "渡鸦女皇的货物", "要塞资源", "", "default", "SMVTreasures","824"},
[33503970]={ "33569", "雕饰饮水角", "可重複使用的法力药水", "", "default", "SMVTreasures","113545"},
[61706790]={ "34743", "托瓦斯的水晶之刃", "垃圾物品", "", "default", "SMVTreasures","111636"},
[20303060]={ "33575", "恶魔宝箱", "i550 智力 项鍊", "", "default", "SMVTreasures","108904"},
[29853748]={ "36879", "满是灰尘的宝箱", "随机装绑绿装", "", "default", "SMVTreasures","824"},
[51803550]={ "33037", "带夹层的罐子", "金钱", "经常有bugs - 金钱会从邮件获取", "default", "SMVTreasures","824"},
[26500570]={ "34174", "神奇鱼", "要塞资源", "", "default", "SMVTreasures","824"},
[34404620]={ "33891", "巨型月柳球果", "i522 魔杖", "", "default", "SMVTreasures","108901"},
[48704750]={ "35798", "发光的洞穴蘑菇", "草药", "", "default", "SMVTreasures","109130"},
[38504300]={ "33614", "格瑞卡的罈子", "i528 饰品 加速 + 力量 触发", "", "default", "SMVTreasures","113408"},
[47104610]={ "33564", "挂起的背包", "i518 敏捷/智力 皮甲手套", "", "default", "SMVTreasures","108900"},
[42106130]={ "33041", "钢铁部落货箱", "要塞资源", "", "default", "SMVTreasures","824"},
[37505930]={ "33567", "钢铁部落贡品", "饰品 双击 + DMG 使用后", "", "default", "SMVTreasures","108903"},
[57904530]={ "33568", "卡利鸟蛋", "25 要塞资源", "", "default", "SMVTreasures","113271"},
[30301990]={ "35530", "坠月鸟蛋", "要塞资源", "一旦建成后改变位置到要塞内部", "default", "SMVTreasures","824"},
[58902200]={ "35603", "米卡尔的箱子", "垃圾物品", "大多只是针对经验值", "default", "SMVTreasures","113215"},
[52902490]={ "37254", "长满蘑菇的宝箱", "25 要塞资源", "", "default", "SMVTreasures","113388"},
[66903350]={ "36507", "兽人骷髅", "i526 力量 戒指", "", "default", "SMVTreasures","116875"},
[43806060]={ "33611", "和平祭礼 1", "垃圾物品", "", "default", "SMVTreasures","107650"},
[45206050]={ "33610", "和平祭礼 2", "垃圾物品", "", "default", "SMVTreasures","107650"},
[44506350]={ "33384", "和平祭礼 3", "垃圾物品", "", "default", "SMVTreasures","107650"},
[44505920]={ "33612", "和平祭礼 4", "垃圾物品", "", "default", "SMVTreasures","107650"},
[31303910]={ "33886", "罗诺克的物品", "i522 力量 披风", "", "default", "SMVTreasures","109081"},
[22803390]={ "33572", "腐朽的篮子", "垃圾物品", "", "default", "SMVTreasures","113373"},
[36704450]={ "33573", "罗沃的匕首", "i520 敏捷匕首", "", "default", "SMVTreasures","113378"},
[67108430]={ "33565", "带鳞片的双头飞龙蛋", "无增益的一次性食物", "大多只是针对经验值", "default", "SMVTreasures","44722"},
[45802460]={ "33570", "影月流亡者宝箱", "25 要塞资源", "在一个山洞内 出现的放逐者下面", "default", "SMVTreasures","113388"},
[30004530]={ "35919", "影月祭祀匕首", "i524 法术匕首", "", "default", "SMVTreasures","113563"},
[28303930]={ "33883", "影月宝藏", "要塞资源", "", "default", "SMVTreasures","824"},
[27100260]={ "35280", "失窃的宝藏", "要塞资源", "", "default", "SMVTreasures","824"},
[55801990]={ "35600", "奇异孢子", "宠物", "", "default", "SMVTreasures","118104"},
[37202610]={ "35677", "沉没的渔船", "趣味物品 - 关于钓鱼", "", "default", "SMVTreasures","110506"},
[28800710]={ "35279", "沉没的宝箱", "要塞资源", "", "default", "SMVTreasures","824"},
[55307480]={ "35580", "沼泽荧光虫蜂巢", "玩具", "", "default", "SMVTreasures","117550"},
[35904090]={ "33540", "乌兹克的小玩意儿", "i525 敏捷/智力 皮甲鞋", "", "default", "SMVTreasures","113546"},
[34204350]={ "33866", "威玛的草药包", "草药", "", "default", "SMVTreasures","109124"},
[51107910]={ "33574", "守备官宝箱", "玩具", "!!! 等级100区域 !!!", "default", "SMVTreasures","113375"},
[39208380]={ "33566", "进水的宝箱", "i520 力量 拳套 + 要塞资源", "", "default", "SMVTreasures","113372"},
--SMVRares
[37203640]={ "33061", "阿莫卡瓦", "i516 敏捷/智力 锁甲胸", "", "rare", "SMVRares","109060"},
[50807880]={ "37356", "阿夸利亚", "i620 智力 戒指", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119387"},
[68208480]={ "37410", "雪崩", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SMVHundred","823"},
[29600620]={ "35281", "巴哈麦", "熔火鱿鱼", "", "rare", "SMVRares","111666"},
[52801680]={ "35731", "巴鲁恩", "无增益的重複性食物", "", "rare", "SMVRares","113540"},
[43807740]={ "33383", "荆棘大王菲裡", "i620 敏捷法杖", "!!! 等级100 !!!", "hundredrare", "SMVHundred","117551"},
[48604360]={ "33064", "暗影馀孽", "i516 智力拳套 (不含法强)", "缺少的法强大概是bug", "rare", "SMVRares","109075"},
[41008300]={ "35448", "黑暗大师高维德", "i525 智力法杖 + Lobstrok 伙伴", "", "rare", "SMVRares","113548"},
[49604200]={ "35555", "暗爪", "i520 敏捷 披风", "", "rare", "SMVRares","113541"},
[46007160]={ "37351", "戴米多斯", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SMVHundred","823"},
[67806380]={ "35688", "爱娜瓦拉", "i523 智力项鍊", "", "rare", "SMVRares","113556"},
[61606180]={ "35725", "灵光", "i526 敏捷/智力 皮甲腿", "", "rare", "SMVRares","113557"},
[29603380]={ "33664", "咕噜姆", "i516 敏捷/智力 戒指", "", "rare", "SMVRares","113082"},
[37404880]={ "35558", "催眠魔蛙", "玩具", "", "rare", "SMVRares","113631"},
[57404840]={ "35909", "伊沙塔尔", "i520 敏捷/智力 锁甲鞋", "", "rare", "SMVRares","113571"},
[40804440]={ "33043", "戮喉", "i516 敏捷匕首", "", "rare", "SMVRares","109078"},
[32203500]={ "33039", "虚空先知库塔格", "i516 敏捷/智力 锁甲手套", "", "rare", "SMVRares","109061"},
[48007760]={ "37355", "魔女泰普特莎", "i620 敏捷/智力 皮甲鞋", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119360"},
[37601460]={ "33055", "读叶者库裡", "i518 饰品 临机应变 + 治疗 触发", "", "rare", "SMVRares","108907"},
[44802080]={ "35906", "“疯王”斯波隆", "i519 敏捷法杖", "", "rare", "SMVRares","113561"},
[29605080]={ "37357", "马尔高什·护影", "i620 敏捷/智力 锁甲头盔", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119369"},
[51807920]={ "37353", "军士长米格拉", "i620 敏捷/智力 锁甲手套", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119368"},
[38607020]={ "35523", "莫尔瓦·屈魂者", "i520 单手 法术锤", "", "rare", "SMVRares","113559"},
[44005760]={ "33642", "主母奥姆拉", "i522 饰品 智力 +精通 触发", "", "rare", "SMVRares","113527"},
[58408680]={ "37409", "纳吉达", "未知", "!!! 等级100 !!! 在山洞内 - 入口在 59,89", "hundredrare", "SMVHundred",""},
[50207240]={ "37352", "军需官赫沙克", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SMVHundred","823"},
[48602260]={ "35553", "莱沃什", "重複性缓落物品", "", "rare", "SMVRares","113542"},
[53005060]={ "34068", "岩蹄", "i516 力量盾", "", "rare", "SMVRares","109077"},
[48208100]={ "37354", "暗影语者纳尔", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SMVHundred","823"},
[61005520]={ "35732", "辛利", "400% 有CD的陆地坐骑", "", "rare", "SMVRares","113543"},
[61408880]={ "37411", "银喉", "i620 力量 双手剑", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119411"},
[27604360]={ "36880", "斯尼维尔", "i519 布甲腿", "", "rare", "SMVRares","118734"},
[21602100]={ "33640", "维洛斯", "i516 智力 戒指", "", "rare", "SMVRares","108906"},
[54607060]={ "33643", "毒影", "i516 敏捷/智力 皮甲鞋", "", "rare", "SMVRares","108957"},
[31905720]={ "37359", "虚空掠夺者乌奈", "i620 敏捷 单手斧", "!!! 等级100 !!!", "hundredrare", "SMVHundred","119392"},
[32604140]={ "35847", "虚空先知卡鲁格", "i516 布甲腰", "", "rare", "SMVRares","109074"},
[42804100]={ "33038", "风牙狼母", "i516 敏捷/力量 单手剑", "Embaari水晶防御事件的一部分", "rare", "SMVRares","113553"},
[48806640]={ "33389", "伊格德尔", "玩具", "", "rare", "SMVRares","113570"},
}
nodes["FrostfireRidge"] = {
--FFRTreasures
[23102500]={ "33916", "竞技场大师的作战号角", "玩具", "", "default", "FFRTreasures","108735"},
[42401970]={ "34520", "燃烧的珍珠", "i525 饰品 双击 +精通 触发", "", "default", "FFRTreasures","120341"},
[50201860]={ "33531", "Clumsy Cragmaul Brute", "i516 敏捷/智力 锁甲头盔", "", "default", "FFRTreasures","112096"},
[42703170]={ "33940", "攀岩者的宝箱", "i516 敏捷/智力 锁甲鞋", "", "default", "FFRTreasures","112187"},
[40902010]={ "34473", "特使的袋子", "垃圾物品", "", "default", "FFRTreasures","110536"},
[43705550]={ "34841", "被遗忘的补给品", "要塞资源", "", "default", "FFRTreasures","824"},
[24204860]={ "34507", "冰封的霜狼战斧", "i516 法强斧", "", "default", "FFRTreasures","110689"},
[57105210]={ "34476", "冰封的兽人骷髅 ", "i516 饰品精通 + 宠物 触发", "", "default", "FFRTreasures","111554"},
[25502040]={ "34648", "啃过的骨头", "i516 敏捷匕首", "", "default", "FFRTreasures","111415"},
[66702640]={ "33948", "鬣蜥人残渣", "25 要塞资源", "", "default", "FFRTreasures","111543"},
[68204580]={ "33947", "肃霜宝箱", "要塞资源", "", "default", "FFRTreasures","824"},
[56707180]={ "36863", "钢铁部落军需品", "要塞资源", "", "default", "FFRTreasures","824"},
[69006910]={ "33017", "Iron Horde Supplies", "Garrison Resources", "", "default", "FFRTreasures","824"},
[21900960]={ "33926", "环礁池塘", "玩具", "", "default", "FFRTreasures","108739"},
[19201200]={ "34642", "幸运硬币", "趣味物品 - 金钱 Coin", "Sells for 25g", "default", "FFRTreasures","111408"},
[38403780]={ "33502", "黑曜石岩画", "黑曜石 霜狼石刻", "可能是专业技能奖励", "default", "FFRTreasures","112087"},
[21605070]={ "34931", "一袋白鬼战利品", "要塞资源", "", "default", "FFRTreasures","824"},
[37205920]={ "34967", "抢来的战利品", "要塞资源", "", "default", "FFRTreasures","824"},
[09804540]={ "34641", "密封的罐子", "趣味物品 - 箴言", "", "default", "FFRTreasures","111407"},
[27604280]={ "33500", "奴隶的宝贝", "酒精饮料", "", "default", "FFRTreasures","43696"},
[24001300]={ "34647", "积雪覆盖的保险箱", "要塞资源", "", "default", "FFRTreasures","824"},
[24202720]={ "33501", "观众的箱子", "酒精饮料", "", "default", "FFRTreasures","63293"},
[16104980]={ "33942", "遗弃的补给品", "要塞资源", "", "default", "FFRTreasures","824"},
[64702570]={ "33946", "生存专家的宝箱", "要塞资源", "", "default", "FFRTreasures","824"},
[34202350]={ "32803", "雷神储备点", "要塞资源", "", "default", "FFRTreasures","824"},
[64406580]={ "33505", "震动的蛋", "宠物", "", "default", "FFRTreasures","112107"},
[54803560]={ "33525", "年轻的兽人旅行者", "未知", "您需要收集部份的年轻的女兽人和年轻的兽人旅行者来完成这个", "default", "FFRTreasures","112206"},
[63401480]={ "33525", "年轻的女兽人", "未知", "您需要收集部份的年轻的女兽人和年轻的兽人旅行者来完成这个", "default", "FFRTreasures","112206"},
[39661720]={ "33532", "Cragmaul Cache", "Primal Spirit + Apexis Crystals", "!!! LEVEL 100 AREA !!!", "default", "FFRTreasures","120945"},
[45365034]={ "33011", "Grizzled Frostwolf Veteran", "i516 Trinket Stamina + 2% Heal on Kill", "Loot contained in Dusty Chest after talking to NPC and defeating waves of orcs", "default", "FFRTreasures","106899"},
--FFRRares
[88605740]={ "37525", "“屠夫”阿奥克斯", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[62604220]={ "33511", "Borrok the Devourer", "i516 Intellect Shield", "Feed him 20 Ogres to get the loot", "rare", "FFRRares","112110"},
[27405000]={ "34497", "无息", "玩具", "", "rare", "FFRRares","111476"},
[66403140]={ "33843", "巢母裡戈艾克", "i516 饰品 智力 + 双击 触发", "", "rare", "FFRRares","111533"},
[34002320]={ "32941", "深峡冰母蜥蜴", "25 要塞资源", "", "rare", "FFRRares","101436"},
[41206820]={ "34843", "冻牙", "i513 敏捷/智力 皮甲腿", "", "rare", "FFRRares","111953"},
[40404700]={ "33014", "烬喉", "i516 法术匕首", "", "rare", "FFRRares","111490"},
[25405500]={ "34129", "哀恸者冰蹄", "i516 智力项鍊", "", "rare", "FFRRares","112066"},
[54606940]={ "34131", "冷牙", "i516 敏捷/力量 单手剑", "", "rare", "FFRRares","111484"},
[67407820]={ "34477", "飓风之怒", "i516 布甲肩", "", "rare", "FFRRares","112086"},
[86605180]={ "37403", "震地者霍拉", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[71404680]={ "33504", "炎怒巨灵", "i516 副手", "", "rare", "FFRRares","107661"},
[54602220]={ "32918", "巨人屠夫库尔", "i516 饰品 临机应变 + 敏捷 触发", "", "rare", "FFRRares","111530"},
[72203600]={ "37380", "胆小的吉布利特", "未知", "!!! 等级100 !!! 如果他被杀的不够快他会逃离跟消失", "hundredrare", "FFRHundred",""},
[70003600]={ "37562", "熔岩鲸吸者高戈阿克", "i620 力量拳套", "!!! 等级100 !!!", "hundredrare", "FFRHundred","111545"},
[70003600]={ "37388", "Gorivax", "i620 Intellect Cloth Bracer", "", "hundredrare", "FFRHundred","119358"},
[38606300]={ "34865", "劫掠者古图什", "i513 敏捷/智力 锁甲腿", "", "rare", "FFRRares","112077"},
[51806480]={ "34825", "古鲁克", "i513 饰品 加速 + 致命一击", "", "rare", "FFRRares","111948"},
[47005520]={ "34839", "戈伦", "i513 力量 披风", "", "rare", "FFRRares","111955"},
[68801940]={ "37382", "霜降", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[58603420]={ "34130", "狩猎大师康恩", "要塞资源", "", "rare", "FFRRares","824"},
[48202340]={ "37386", "刺颚", "i620 法术盾", "!!! 等级100 !!!", "hundredrare", "FFRHundred","119390"},
[85005220]={ "37556", "和平主义者贾鲁克", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[61602640]={ "34708", "攀岩者杰希尔", "i516 敏捷/智力 皮甲鞋", "", "rare", "FFRRares","112078"},
[87004640]={ "37404", "折铁者卡加", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[43002100]={ "37387", "莫托玛", "i620 布甲肩", "!!! 等级100 !!!", "hundredrare", "FFRHundred","119356"},
[70002700]={ "37381", "鬣蜥人主母", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[83604720]={ "37402", "“绞肉机”奥戈姆", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[28206620]={ "34470", "白鬼鱼贩", "Fish", "", "rare", "FFRRares","111666"},
[36803400]={ "33938", "指挥官穆尔格", "i516 布甲腿", "", "rare", "FFRRares","111576"},
[86604880]={ "37401", "拉戈尔·逐流", "i620 敏捷/智力 皮甲胸", "!!! 等级100 !!!", "hundredrare", "FFRHundred","119359"},
[76406340]={ "34132", "斥候高斯克", "i516 敏捷/智力 皮甲胸", "", "rare", "FFRRares","112094"},
[45001500]={ "37385", "食尸者暴牙", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[38201600]={ "37383", "高拉摩尔之子", "i620 法术锤", "!!! 等级100 !!!", "hundredrare", "FFRHundred","119399"},
[26803160]={ "34133", "打击者", "i516 力量 双手锤", "", "rare", "FFRRares","111475"},
[72203300]={ "37361", "白骨爬行者", "i620 智力/力量 铠甲胸", "!!! 等级100 !!!", "hundredrare", "FFRHundred","111534"},
[43600940]={ "37384", "托格洛斯", "i620 副手", "!!! 等级100 !!!", "hundredrare", "FFRHundred","119379"},
[40601240]={ "34522", "冰封者乌戈洛克", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[72402420]={ "37378", "沃卡尔", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[70603900]={ "37379", "古老的沃罗克", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "FFRHundred","823"},
[40402780]={ "34559", "疤脸雅佳", "i516 敏捷/智力 皮甲腰", "", "rare", "FFRRares","111477"},
[27405000]={ "33511", "Borrok the Devourer", "i516 Intellect Shield", "Feed him 20 Ogres to get the loot", "rare", "FFRRares","112110"},
[70003600]={ "37388", "Gorivax", "i620 Intellect Cloth Bracer", "", "hundredrare", "FFRHundred","119358"},
}
nodes["BladespireFortress"] = {
[26613949]={ "35370", "Doorogs Secret Stash", "Gold + Trash Item", "Second floor of Bladespire Citadel, outside", "default", "FFRBF","113189"},
[26403642]={ "35367", "Gorr'thogg's Personal Reserve", "Alcoholic Beverages", "Top floor of Bladespire Citadel, next to the throne", "default", "FFRBF","118108"},
[26603520]={ "35347", "Ogre Booty", "Garrison Resources", "Second floor of Bladespire Citadel", "default", "FFRBF","824"},
[28293440]={ "35368", "Ogre Booty", "Gold", "First floor of Bladespire Citadel; have to climb some crates to reach the chest", "default", "FFRBF",""},
[27783917]={ "35369", "Ogre Booty", "Gold", "First floor of Bladespire Citadel; have to climb some crates to reach the chest", "default", "FFRBF",""},
[27603382]={ "35371", "Ogre Booty", "Gold", "Second floor of Bladespire Citadel; have to climb some crates to reach the chest", "default", "FFRBF",""},
[27173763]={ "35373", "Ogre Booty", "Gold", "Second floor of Bladespire Citadel; have to climb some crates to reach the chest", "default", "FFRBF",""},
[28093409]={ "35567", "Ogre Booty", "Garrison Resources", "Second floor of Bladespire Citadel", "default", "FFRBF","824"},
[30723869]={ "35568", "Ogre Booty", "Garrison Resources", "Second floor of Bladespire Citadel", "default", "FFRBF","824"},
[30083927]={ "35569", "Ogre Booty", "Garrison Resources", "Second floor of Bladespire Citadel", "default", "FFRBF","824"},
[27283876]={ "35570", "Ogre Booty", "Gold", "First floor of Bladespire Citadel", "default", "FFRBF",""},
}
nodes["Gorgrond"] = {
--GorgrondTreasures
[41705300]={ "36506", "波尔卡的袋子", "i538 法术法杖 (不含法强)", "缺少的法强大概是bug", "default", "GorgrondTreasures","118702"},
[42408340]={ "36625", "被遗弃的包裹", "金钱 + 随机装绑绿装", "", "default", "GorgrondTreasures",""},
[41807810]={ "36658", "永晨补给篮", "随机装绑绿装", "", "default", "GorgrondTreasures",""},
[40407660]={ "36621", "探险家罐子", "50 要塞资源", "", "default", "GorgrondTreasures","118710"},
[40007230]={ "36170", "稀有腿骨", "垃圾物品", "", "default", "GorgrondTreasures","118715"},
[46105000]={ "36651", "可收穫的珍贵水晶", "要塞资源", "", "default", "GorgrondTreasures","824"},
[42604680]={ "35056", "长角的颅骨", "要塞资源", "", "default", "GorgrondTreasures","824"},
[43704240]={ "36618", "钢铁补给箱", "要塞资源", "", "default", "GorgrondTreasures","824"},
[44207420]={ "35709", "嘲颅包裹", "要塞资源", "", "default", "GorgrondTreasures","824"},
[43109290]={ "34241", "奥卡巴的包裹", "垃圾物品", "", "default", "GorgrondTreasures","118227"},
[52506690]={ "36509", "奇怪的颅骨", "i535 副手", "", "default", "GorgrondTreasures","118717"},
[46204290]={ "36521", "石化的双头飞龙蛋", "垃圾物品", "", "default", "GorgrondTreasures","118707"},
[43957055]={ "36118", "一堆碎石", "随机装绑绿装", "", "default", "GorgrondTreasures",""},
[53107440]={ "36654", "巴裡克·碎矿的遗骸", "垃圾物品", "", "default", "GorgrondTreasures","118714"},
[57805600]={ "36605", "波迪尔·深岩的遗物", "垃圾物品", "", "default", "GorgrondTreasures","118703"},
[39006810]={ "36631", "萨莎的秘密包裹", "金钱 + 随机装绑绿装", "", "default", "GorgrondTreasures",""},
[45004260]={ "36634", "狙击手的强弩", "i539 弩", "", "default", "GorgrondTreasures","118713"},
[48109340]={ "36604", "隐秘的急救背包", "金钱 + 随机装绑绿装", "", "default", "GorgrondTreasures",""},
[53008000]={ "34940", "样子古怪的匕首", "i537 敏捷匕首", "", "default", "GorgrondTreasures","118718"},
[71906660]={ "37249", "沉没的宝箱", "要塞资源", "缺少任务ID - 财宝被拾取后将保持在活跃状态", "default", "GorgrondTreasures","824"},
[45704970]={ "36610", "日灼之矛", "垃圾物品", "", "default", "GorgrondTreasures","118708"},
[59406370]={ "36628", "守备官的战锤", "i539 力量 双手锤", "", "default", "GorgrondTreasures","118712"},
[48904730]={ "36203", "热乎乎的鬣蜥人蛋", "7天后会孵出玩具的蛋", "", "default", "GorgrondTreasures","118705"},
[49304360]={ "36596", "武器架", "100 要塞资源", "", "default", "GorgrondTreasures","107645"},
--GorgrondRares
[58604120]={ "37371", "阿卡利", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","823"},
[40007900]={ "35335", "巴肖克", "玩具", "", "rare", "GorgrondRares","118222"},
[69204460]={ "37369", "巴斯滕、努尔塔或瓦斯提尔", "玩具", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119432"},
[39407460]={ "36597", "Berthora", "i532 Agility/Intellect Mail Shoulders", "", "rare", "GorgrondRares","118232"},
[46003360]={ "37368", "剑圣罗戈尔", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[53404460]={ "35503", "炽燃的焦皮", "i536 双手 法术锤", "", "rare", "GorgrondRares","118212"},
[48202100]={ "37362", "背叛者达兹戈", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[57603580]={ "37370", "深渊之根", "i620 敏捷长柄", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119406"},
[72604040]={ "37370", "Depthroot", "i620 Agility Polearm", "!!! Level 100 !!! One of two possible Spawnpoints", "hundredrare", "GorgrondHundred","119406"},
[50002380]={ "37366", "可恨的杜普", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[72803580]={ "37373", "纵火者格拉什", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[58003640]={ "37373", "Firestarter Grash", "i620 Strength/Intellect Plate Gloves", "!!! Level 100 !!! One of two possible Spawnpoints", "hundredrare", "GorgrondHundred","119381"},
[57406860]={ "36387", "石化的岩木", "玩具", "", "rare", "GorgrondRares","118221"},
[41804540]={ "36391", "“蓝焰”戈尔高", "i534 饰品 临机应变 + 智力 触发", "", "rare", "GorgrondRares","118230"},
[46205080]={ "36204", "格鲁特", "i534 饰品 敏捷 + 双击 触发", "", "rare", "GorgrondRares","118229"},
[52805360]={ "37413", "瘤颚", "i620 智力拳套 附加法术触发", "!!! 等级100 !!! 法术触发最可能是法强", "hundredrare", "GorgrondHundred","119397"},
[46804320]={ "36186", "戈尔多克 the Cunning", "i534 力量 单手锤", "", "rare", "GorgrondRares","118210"},
[59604300]={ "37375", "林地守卫者雅尔", "i620 智力 披风", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119414"},
[52207020]={ "35908", "虫巢女王斯基卡", "i534 法强斧", "", "rare", "GorgrondRares","118209"},
[47002380]={ "37365", "豪格", "i620 敏捷/智力 锁甲胸", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119229"},
[55004660]={ "37377", "猎人巴尔拉", "i620 弓", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119412"},
[47603060]={ "37367", "发明家布拉莫", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[50605320]={ "36178", "曼达科尔", "宠物", "", "rare", "GorgrondRares","118709"},
[49003380]={ "37363", "疯狂的麦德加", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[61803930]={ "37376", "莫伽玛戈", "i620 力量盾", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119391"},
[47002580]={ "37364", "莫尔戈·凯恩", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[53407820]={ "34726", "蛛后阿兰妮艾", "i534 敏捷匕首", "", "rare", "GorgrondRares","118208"},
[37608140]={ "36600", "裡普塔尔", "i539 法术匕首", "", "rare", "GorgrondRares","118231"},
[47804140]={ "36393", "洛克尔", "i539 饰品 力量 + 致命一击 触发", "", "rare", "GorgrondRares","118211"},
[54207240]={ "36837", "怒蹄", "i537 双手 敏捷/力量锤", "", "rare", "GorgrondRares","118228"},
[38206620]={ "35910", "践踏者克罗格", "食人魔酿造工具组", "每7天可以产出酒精饮料", "rare", "GorgrondRares","118224"},
[40205960]={ "36394", "硫磺之怒", "玩具", "", "rare", "GorgrondRares","114227"},
[44609220]={ "36656", "日爪", "i533 敏捷拳套", "", "rare", "GorgrondRares","118223"},
[70803400]={ "37374", "迅捷黑色掠夺者", "i620 敏捷/智力 锁甲鞋", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred","119367"},
[64006180]={ "36794", "塞尔多斯", "i540 敏捷/智力 皮甲鞋", "", "rare", "GorgrondRares","118213"},
[76004200]={ "37405", "提丰", "埃匹希斯水晶", "", "rare", "GorgrondRares","823"},
[63803160]={ "37372", "维诺拉斯克", "未知", "!!! 等级100 !!!", "hundredrare", "GorgrondHundred",""},
[52205580]={ "37412", "King Slime", "i620 Strength Cloak", "!!! Level 100 !!!", "hundredrare", "GorgrondHundred","119351"},
--GorgrondLumber
[47205180]={ "900020", "Unknown Petrified Egg", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[53007910]={ "900021", "Unknown Petrified Egg", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[51607230]={ "900022", "Unknown Petrified Egg", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[45308200]={ "900023", "Unknown Petrified Egg", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[42904350]={ "900024", "Unknown Petrified Egg", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[41107730]={ "900025", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[63305720]={ "900026", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[51706910]={ "900027", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[60507280]={ "900028", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[56705730]={ "900029", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[47607680]={ "900030", "Mysterious Petrified Pod", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[42008160]={ "900031", "Botani Essence Seed", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[46009360]={ "900032", "Remains of Explorer Engineer Toldirk Ashlamp", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[45808930]={ "900033", "Forgotten Skull Cache", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[47006900]={ "900034", "Forgotten Skull Cache", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[39305630]={ "900035", "Forgotten Skull Cache", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[49707880]={ "900036", "Forgotten Ogre Cache", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[40906730]={ "900037", "Obsidian Crystal Formation", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[51806150]={ "900038", "Remains of Grimnir Ashpick", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[42305480]={ "900039", "Aged Stone Container", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[47504360]={ "900040", "Aged Stone Container", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[49104850]={ "900041", "Aged Stone Container", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[50205380]={ "900042", "Ancient Titan Chest", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[53404680]={ "900043", "Ancient Titan Chest", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
[42104610]={ "900044", "Ancient Titan Chest", "", "Requires the Garrison Outpost Lumber Mill", "default", "GorgrondLumber","824"},
--GorgrondBoulder
[42209310]={ "900021", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[45504300]={ "900022", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[61505850]={ "900023", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[45106990]={ "900024", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[54307310]={ "900025", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[41508650]={ "900026", "Ancient Ogre Cache", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[41805890]={ "900027", "Obsidian Crystal Formation", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[42106430]={ "900028", "Obsidian Crystal Formation", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[44204660]={ "900029", "Obsidian Crystal Formation", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[48104640]={ "900030", "Obsidian Crystal Formation", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[48105520]={ "900031", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[43204570]={ "900032", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[41804530]={ "900033", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[45708820]={ "900034", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[51304060]={ "900035", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[45604930]={ "900036", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[46106300]={ "900037", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[58105150]={ "900038", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[59607270]={ "900039", "Aged Stone Container", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[42205200]={ "900040", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[43305170]={ "900041", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[48004000]={ "900042", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[50306660]={ "900043", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[49405090]={ "900044", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
[49108250]={ "900045", "Ancient Titan Chest", "", "Requires the Garrison Outpost Sparring Arena", "default", "GorgrondBoulder","824"},
}
nodes["Talador"] = {
--TaladorTreasures
[36509610]={ "34182", "阿尔克的传家宝", "i557 弩", "", "default", "TaladorTreasures","117567"},
[62003240]={ "34236", "艾米瑟尔水晶", "100 要塞资源", "", "default", "TaladorTreasures","116131"},
[81803500]={ "34260", "阿鲁纳矿车", "矿物", "", "default", "TaladorTreasures","109118"},
[62404800]={ "34252", "一桶鱼", "鱼", "", "default", "TaladorTreasures","110506"},
[33307670]={ "34259", "噬骨遗物", "要塞资源", "", "default", "TaladorTreasures","824"},
[37607490]={ "34148", "噬骨长矛", "i566 敏捷/智力 锁甲手套", "缺少任务ID - 财宝被拾取后将保持在活跃状态", "default", "TaladorTreasures","112371"},
[73505140]={ "34471", "闪亮硬币", "i560 饰品 临机应变 + 护甲加成触发", "", "default", "TaladorTreasures","116127"},
[70100700]={ "36937", "火刃宝箱", "埃匹希斯水晶", "", "default", "TaladorTreasures","823"},
[77005000]={ "34248", "烧焦的长剑", "i563 双手 力量剑", "", "default", "TaladorTreasures","116116"},
[66608690]={ "34239", "古怪的逝网蛛卵", "玩具", "", "default", "TaladorTreasures","117569"},
[58901200]={ "33933", "德塞普提亚的冒烟靴子", "玩具", "", "default", "TaladorTreasures","108743"},
[55206680]={ "34253", "德莱尼武器", "100 要塞资源", "", "default", "TaladorTreasures","116118"},
[35509660]={ "34249", "农夫的宝贝", "要塞资源", "", "default", "TaladorTreasures","824"},
[57302860]={ "34238", "工头的午餐盒", "重複性 食物/饮料", "", "default", "TaladorTreasures","116120"},
[64607920]={ "34251", "铁盒子", "i554 单手 力量锤", "", "default", "TaladorTreasures","117571"},
[75003600]={ "33649", "钢铁斥候", "未知", "", "default", "TaladorTreasures",""},
[65501130]={ "34233", "一大壶陈年黑铁佳酿", "酒精饮料", "", "default", "TaladorTreasures","117568"},
[75704140]={ "34261", "克鲁的物品  ", "金钱", "", "default", "TaladorTreasures",""},
[54002760]={ "34290", "凯特娅的宝箱", "宠物", "", "default", "TaladorTreasures","116402"},
[38201250]={ "34258", "海洋之光", "要塞资源", "", "default", "TaladorTreasures","824"},
[68805620]={ "34101", "圣光使者", "垃圾物品", "", "default", "TaladorTreasures","109192"},
[52502950]={ "34235", "微光贝壳", "i557 智力项鍊", "", "default", "TaladorTreasures","116132"},
[78201480]={ "34263", "纯淨水晶尘", "i554 敏捷 戒指", "", "default", "TaladorTreasures","117572"},
[75804480]={ "34250", "阿鲁纳遗物", "垃圾物品", "", "default", "TaladorTreasures","116128"},
[47009170]={ "34256", "泰尔莫遗物", "垃圾物品", "", "default", "TaladorTreasures","116128"},
[64901330]={ "34232", "鲁克的工具盒", "+4 钓鱼线", "", "default", "TaladorTreasures","116117"},
[65908520]={ "34276", "生鏽宝箱", "随机装绑绿装", "", "default", "TaladorTreasures",""},
[39505520]={ "34254", "缚魂者的圣物箱", "i558 智力 戒指", "", "default", "TaladorTreasures","117570"},
[74602930]={ "35162", "恐爪鸟巢穴 1", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[39307770]={ "35162", "恐爪鸟巢穴 10", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[73503070]={ "35162", "恐爪鸟巢穴 2", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[74303400]={ "35162", "恐爪鸟巢穴 3", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[72803560]={ "35162", "恐爪鸟巢穴 4", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[72403700]={ "35162", "恐爪鸟巢穴 5", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[70903550]={ "35162", "恐爪鸟巢穴 6", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[70803200]={ "35162", "恐爪鸟巢穴 7", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[54105630]={ "35162", "恐爪鸟巢穴 8", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[39807670]={ "35162", "恐爪鸟巢穴 9", "宠物", "只有一个Teroclaw巢可以拾取", "default", "TaladorTreasures","112699"},
[38408450]={ "34257", "安葛洛什宝藏", "趣味物品 - 投掷的岩石", "", "default", "TaladorTreasures","116119"},
[65508860]={ "34255", "结网的囊袋", "金钱", "", "default", "TaladorTreasures",""},
[40608950]={ "34140", "尤裡的礼物", "要塞资源", "", "default", "TaladorTreasures","824"},
[57207540]={ "34134", "Isaari's Cache", "i564 Agility Neck", "", "default", "TaladorTreasures","117563"},
--TaladorRares
[46603520]={ "37338", "索克雷萨的化身", "i620 副手", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119378"},
[44003800]={ "37339", "炮兵古戈克", "i620 弩", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119413"},
[37607040]={ "34165", "考尔·裂肉者", "i558 力量 单手锤", "", "rare", "TaladorRares","116123"},
[68201580]={ "34142", "格鲁姆博士", "趣味物品 - 臭气弹", "", "rare", "TaladorRares","112499"},
[34205700]={ "34221", "摩摩尔的回响", "玩具", "", "rare", "TaladorRares","113670"},
[50808380]={ "35018", "邪皮", "i554 法术盾", "", "rare", "TaladorRares","112373"},
[50203520]={ "37341", "魔火扈从", "i620 敏捷 戒指", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119386"},
[46005500]={ "34145", "疯狂的魔像", "i563 敏捷/力量 单手剑 或 i563 法术匕首", "", "rare", "TaladorRares","113287"},
[67408060]={ "34929", "加纳迪安", "i558 饰品 敏捷 +精通 触发", "", "rare", "TaladorRares","116075"},
[31806380]={ "34189", "闪翼", "有使用次数限制的短期加速增益", "", "rare", "TaladorRares","116113"},
[22207400]={ "36919", "格布戈尔", "未知", "不安分的木箱", "rare", "TaladorRares",""},
[47603900]={ "37340", "古托尔", "i620 法术剑", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119402"},
[48002500]={ "37312", "吞天者哈坤", "i620 力量 单手剑", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119403"},
[62004600]={ "34185", "槌牙", "i558 敏捷/智力 锁甲胸", "", "rare", "TaladorRares","116124"},
[78005040]={ "34167", "雌鸟哈米", "i556 智力 披风", "", "rare", "TaladorRares","112369"},
[56606360]={ "35219", "自负的卡拉佐斯/戈尔佐玛/Sikthiss", "玩具", "其中之一-只能拾取一次", "rare", "TaladorRares","116122"},
[66808540]={ "34498", "克裡奇克斯", "玩具", "", "rare", "TaladorRares","116125"},
[37203760]={ "37348", "库尔洛什·灭牙", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","823"},
[33803780]={ "37346", "魔女德姆拉什", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","823"},
[37802140]={ "37342", "燃烧军团先锋", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","823"},
[49009200]={ "34208", "洛玛格·碎颚", "i558 力量项鍊", "", "rare", "TaladorRares","116070"},
[30502640]={ "37345", "领主考利纳克", "i620 力量 戒指", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119388"},
[39004960]={ "37349", "罪孽魔女", "i620 布甲手套", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119353"},
[86403040]={ "34859", "诺洛什", "i558 饰品 临机应变 + 智力 触发", "", "rare", "TaladorRares","116077"},
[31404750]={ "37344", "观察者奥鲁莫", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","823"},
[59505960]={ "34196", "拉坎", "i563 敏捷拳套", "", "rare", "TaladorRares","116112"},
[41004200]={ "37347", "暗焰恐惧行者", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","823"},
[41805940]={ "34671", "沙兹尔", "i554 敏捷/智力 皮甲鞋", "", "rare", "TaladorRares","112370"},
[67703550]={ "36858", "钢牙", "i559 敏捷长柄", "", "rare", "TaladorRares","117562"},
[46002740]={ "37337", "战略家安克尔、大魔导师泰卡尔、缚魂者奈拉娜", "埃匹希斯水晶", "!!! 等级100 !!! 其中之一-只能拾取一次", "hundredrare", "TaladorHundred","823"},
[59008800]={ "34171", "塔拉多寡妇蛛", "i565 敏捷剑", "", "rare", "TaladorRares","116126"},
[53909100]={ "34668", "鸦爪祭司佐卡拉", "i560 布甲头盔", "", "rare", "TaladorRares","116110"},
[63802070]={ "34945", "低阶监工血鬃", "i554 力量 戒指", "别杀死他的宠物", "rare", "TaladorRares","112475"},
[36804100]={ "37350", "警戒者帕索斯", "i620 智力/力量 铠甲肩", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119383"},
[69603340]={ "34205", "游荡的守备官", "i554 力量 单手剑", "", "rare", "TaladorRares","112261"},
[38001460]={ "37343", "毁灭者埃索瑟尔", "i620 敏捷/智力 锁甲肩", "!!! 等级100 !!!", "hundredrare", "TaladorHundred","119371"},
[53802580]={ "34135", "焚化者亚兹拉", "i554 敏捷/智力 锁甲手腕", "", "rare", "TaladorRares","112263"},
}
nodes["SpiresOfArak"] = {
--SoATreasures
[40605500]={ "36458", "被遗弃的採矿锄", "i578 力量 单手斧", "在德拉诺允许更加快速的採矿", "default", "SoATreasures","116913"},
[37705640]={ "36462", "旧钥匙", "Key for achest in Admiral Taylors Garrison", "", "default", "SoATreasures","116020"},
[49203730]={ "36445", "刺客的长矛", "i580 敏捷长柄", "", "default", "SoATreasures","116835"},
[55509080]={ "36366", "战争捐赠物资", "金钱", "", "default", "SoATreasures",""},
[68408900]={ "36453", "折币的报酬", "要塞资源", "", "default", "SoATreasures","824"},
[36505790]={ "36418", "厄菲阿尔的黑暗魔典", "i579 副手", "", "default", "SoATreasures","116914"},
[50502210]={ "36246", "龟裂的太阳石", "垃圾物品", "", "default", "SoATreasures","116919"},
[37204740]={ "36420", "要塞补给品", "要塞资源", "", "default", "SoATreasures","824"},
[41805050]={ "36451", "要塞工匠的锤子", "i580 力量 单手锤", "", "default", "SoATreasures","116918"},
[48604450]={ "36386", "安祖之赐", "i585 弩", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118237"},
[57007900]={ "36390", "安祖之赐", "i585 法术 单手剑", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118241"},
[46904050]={ "36389", "安祖之赐", "i585 敏捷/力量长柄", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118238"},
[52001960]={ "36392", "安祖之赐", "i585 法术法杖", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118239"},
[42402670]={ "36388", "安祖之赐", "i585 魔杖", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118242"},
[61105550]={ "36381", "安祖之赐", "i585 敏捷/力量 单手剑", "饮用一个暗影视界药剂 靠近圣物盒以获取安祖之赐", "default", "SoATreasures","118240"},
[50402580]={ "36444", "钢铁部落炸药", "垃圾物品", "", "default", "SoATreasures","118691"},
[50702880]={ "36247", "失落的草药袋", "草药", "", "default", "SoATreasures","109124"},
[47803610]={ "36411", "失落的戒指", "i578 智力 戒指", "", "default", "SoATreasures","116911"},
[52404280]={ "36416", "遗失的卷轴", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[42701830]={ "36244", "遗失的卷轴", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[63606740]={ "36454", "神秘菌菇", "变色龙莲花", "", "default", "SoATreasures","109130"},
[60808780]={ "35481", "Nizzix's Chest", "Garrison Resources", "Click on Nizzix's Escape Pod at 60.9 88.0 and follow him to the shore", "default", "SoATreasures","824"},
[53305560]={ "36403", "鸦母的供品 1", "奖励5%休息经验值的消耗品", "", "default", "SoATreasures","118267"},
[48305260]={ "36405", "鸦母的供品 2", "奖励5%休息经验值的消耗品", "", "default", "SoATreasures","118267"},
[48905470]={ "36406", "鸦母的供品 3", "奖励5%休息经验值的消耗品", "", "default", "SoATreasures","118267"},
[51906460]={ "36407", "鸦母的供品 4", "奖励5%休息经验值的消耗品", "", "default", "SoATreasures","118267"},
[61006380]={ "36410", "鸦母的供品 5", "奖励5%休息经验值的消耗品", "", "default", "SoATreasures","118267"},
[58706030]={ "36340", "独眼魔战利品", "垃圾物品", "", "default", "SoATreasures","116921"},
[36303940]={ "36402", "兽人信号号角", "i577 饰品 双击 + 力量 触发", "", "default", "SoATreasures","120337"},
[36801720]={ "36243", "流亡者财物 1", "金钱 + 随机装绑绿装", "", "default", "SoATreasures",""},
[42102170]={ "36447", "流亡者财物 2", "金钱 + 随机装绑绿装", "", "default", "SoATreasures",""},
[46903400]={ "36446", "流亡者袋子", "金钱 + 随机装绑绿装", "", "default", "SoATreasures",""},
[43001640]={ "36245", "流亡者圣物 1", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[46004410]={ "36354", "流亡者圣物 2", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[43202720]={ "36355", "流亡者圣物 3", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[67403980]={ "36356", "流亡者圣物 4", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[60205390]={ "36359", "流亡者圣物 5", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[51904890]={ "36360", "流亡者圣物 6", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[37305070]={ "36657", "鲁比的洛洛", "i581 力量项鍊", "你需要在地窖中从厨师拿到Rooby Reat来喂狗", "default", "SoATreasures","116887"},
[44401200]={ "36377", "鲁克玛的影像", "垃圾物品", "", "default", "SoATreasures","118693"},
[59109060]={ "36366", "水手扎祖克的高纯度朗姆酒  ", "酒精饮料", "任务ID缺少，将在拾取后保持活耀状态", "default", "SoATreasures","116917"},
[68203880]={ "36375", "塞泰克神像", "垃圾物品", "", "default", "SoATreasures","118692"},
[71604850]={ "36450", "塞泰克仪式用酒", "治疗药水 + 酒精饮料", "", "default", "SoATreasures","109223"},
[56202880]={ "36362", "碎手宝箱", "要塞资源", "", "default", "SoATreasures","824"},
[47903070]={ "36361", "碎手保险箱", "True Steel Lockbox", "", "default", "SoATreasures","116920"},
[60908460]={ "36456", "切割机零件", "要塞资源", "", "default", "SoATreasures","824"},
[56304530]={ "36433", "走私的埃匹希斯遗物", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[59708130]={ "36365", "自动喷洒机5000XT型", "要塞资源", "", "default", "SoATreasures","824"},
[34102750]={ "36421", "烈日宝箱 1", "要塞资源", "", "default", "SoATreasures","824"},
[33302730]={ "36422", "烈日宝箱 2", "考古碎片", "要求考古学和可能一点跳跃", "default", "SoAArchaeology",""},
[54403240]={ "36364", "毒牙毒液", "100 要塞资源", "", "default", "SoATreasures","118695"},
[66505650]={ "36455", "浸水的背包", "金钱 + 随机装绑绿装", "", "default", "SoATreasures",""},
[36205440]={ "36462", "Admiral Taylor's Coffer", "Garrison Resources", "Requires An Old Key", "default", "SoATreasures","824"},
[57802220]={ "36374", "Statue of Anzu", "Trash Item", "", "default", "SoATreasures","118694"},

--SoARares
[58208460]={ "36291", "贝蒂斯·爆篮", "i583 枪", "", "rare", "SoARares","116907"},
[46802300]={ "35599", "剑舞者艾瑞克斯", "垃圾物品", "", "rare", "SoARares","116839"},
[64006480]={ "36283", "凋零之光", "i586 敏捷/智力 皮甲肩", "", "rare", "SoARares","118205"},
[46402860]={ "36267", "杜卡斯·钢喉", "i586 敏捷/智力 锁甲鞋", "", "rare", "SoARares","118198"},
[69005400]={ "37406", "艾奇迪纳", "未知", "!!! 等级100 !!!", "hundredrare", "SoAHundred",""},
[54803960]={ "36297", "脓花", "i584 副手", "", "rare", "SoARares","118200"},
[25202420]={ "36943", "加兹", "要塞资源", "", "rare", "SoARares","824"},
[74404280]={ "37390", "暴食巨人", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SoAHundred","823"},
[33005900]={ "36305", "贪鳍", "垃圾物品", "", "rare", "SoARares","116836"},
[59201500]={ "36887", "独居的白鬃", "i582 布甲头盔", "", "rare", "SoARares","118279"},
[56609460]={ "36306", "孢子吞噬者贾斯卡", "i589 饰品 加速 + 智力 触发", "", "rare", "SoARares","118202"},
[62603740]={ "36268", "浴血的卡洛斯", "i588 布甲胸", "", "rare", "SoARares","118735"},
[53208900]={ "36396", "穆塔芬", "i589 力量 双手锤", "", "rare", "SoARares","118206"},
[36405240]={ "36129", "纳斯·杜柏林", "i578 敏捷/力量长柄", "", "rare", "SoARares","116837"},
[66005500]={ "36288", "复仇者奥斯奇拉", "i589 敏捷匕首", "", "rare", "SoARares","118204"},
[59403740]={ "36279", "毒药大师波塔斯克", "i583 饰品 双击 + DMG 使用后", "", "rare", "SoARares","118199"},
[38402780]={ "36470", "烂菌", "宠物", "", "rare", "SoARares","118107"},
[69004880]={ "36276", "桑裡卡斯", "i589 敏捷/智力 皮甲胸", "", "rare", "SoARares","118203"},
[71203380]={ "37392", "暗影巨人", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "SoAHundred","823"},
[52003540]={ "36478", "影皮", "i579 法术盾", "", "rare", "SoARares","118201"},
[51800720]={ "37394", "日光放大器", "未知", "!!! 等级100 !!!", "hundredrare", "SoAHundred",""},
[33402200]={ "36265", "岩怒", "i577 敏捷/智力 锁甲腿", "", "rare", "SoARares","116858"},
[58604520]={ "36298", "碎棘", "i578 敏捷 单手剑", "", "rare", "SoARares","116855"},
[52805480]={ "36472", "沼叶", "i582 法术法杖", "", "rare", "SoARares","116857"},
[54606320]={ "36278", "断爪者", "i578 敏捷项鍊", "", "rare", "SoARares","116838"},
[57407400]={ "36254", "破碎者特斯卡", "i578 智力项鍊", "", "rare", "SoARares","116852"},
}
nodes["NagrandDraenor"] = {
--NagrandTreasures
[73001090]={ "35951", "一堆泥土", "要塞资源", "", "default", "NagrandTreasures","824"},
[67605980]={ "35759", "被遗弃的货箱", "金钱", "", "default", "NagrandTreasures",""},
[38404940]={ "36072", "阿布加尔最爱的鱼饵", "阿布加尔最爱的鱼饵", "结合阿布加尔的其他部份以获得追随", "default", "NagrandTreasures","114245"},
[85403870]={ "36089", "阿布加尔丢失的线轮", "阿布加尔最好的线轮", "结合阿布加尔的其他部份以获得追随", "default", "NagrandTreasures","114243"},
[65906120]={ "35711", "阿布加尔的活力", "阿布加尔的活力", "结合阿布加尔的其他部份以获得追随", "default", "NagrandTreasures","114242"},
[75806200]={ "36077", "冒险者的钉锤", "金钱", "", "default", "NagrandTreasures",""},
[82305660]={ "35765", "冒险者的包裹", "金钱", "", "default", "NagrandTreasures",""},
[45605200]={ "35969", "冒险者的包裹", "金钱", "", "default", "NagrandTreasures",""},
[69905240]={ "35597", "冒险者的包裹", "金钱", "", "default", "NagrandTreasures",""},
[56607290]={ "36050", "冒险者的钱袋", "要塞资源", "", "default", "NagrandTreasures","824"},
[73901410]={ "35955", "冒险者的袋子", "金钱", "", "default", "NagrandTreasures",""},
[81501300]={ "35953", "冒险者的法杖", "金钱", "", "default", "NagrandTreasures",""},
[73107550]={ "35673", "偷来的战歌补给品", "要塞资源", "", "default", "NagrandTreasures","824"},
[62506710]={ "36116", "一袋草药", "草药", "", "default", "NagrandTreasures","109124"},
[77302820]={ "35986", "骨质匕首", "i597 敏捷匕首", "", "default", "NagrandTreasures","116760"},
[77101660]={ "36174", "元素的宝藏", "要塞资源", "使用元素石来取得", "default", "NagrandTreasures","824"},
[81103720]={ "35661", "闪亮的梦境花瓣", "回魔药水", "乘探险家伦佐的滑翔翼到那裡  [这裡的东北方]", "default", "NagrandTreasures","118262"},
[85425344]={ "35696", "火刃宝箱", "随机装绑绿装", "", "default", "NagrandTreasures","824"},
[66901950]={ "35954", "元素祭品", "垃圾物品", "", "default", "NagrandTreasures","118234"},
[78901550]={ "36036", "元素镣铐", "i605 敏捷 戒指", "", "default", "NagrandTreasures","118251"},
[53407320]={ "900003", "探险家比斯伯", "没什麽 - 需要 2 财宝 在南边", "您需要使用火箭到他那边 [他位置的东南方]", "glider", "NagrandTreasures",""},
[67601420]={ "900004", "探险家德兹", "没什麽 - 需要 2 财宝 [1 东南, 1 西南]", "你能联繫到他在元素高原东边开始的地方", "glider", "NagrandTreasures",""},
[87204100]={ "900005", "探险家加裡克斯", "没什麽", "需要 2 财宝 [1 南方, 1 东南]", "glider", "NagrandTreasures",""},
[75606460]={ "900006", "探险家拉祖克", "没什麽", "需要 3 财宝 [1 北, 1 东, 1 南]", "glider", "NagrandTreasures",""},
[83803380]={ "900007", "探险家伦佐", "没什麽", "需要 3 财宝 [2 东北, 1 西南]", "glider", "NagrandTreasures",""},
[45806630]={ "36020", "沃舒古碎片", "i607 智力盾", "", "default", "NagrandTreasures","117981"},
[73102160]={ "35692", "淡水蛤蜊", "垃圾物品", "", "default", "NagrandTreasures","118233"},
[88901820]={ "35660", "长满真菌的宝箱", "要塞资源", "乘探险家伦佐的滑翔翼到那裡 [这裡的西南方]", "default", "NagrandTreasures","824"},
[75404710]={ "36074", "赌徒的钱袋", "趣味物品", "", "default", "NagrandTreasures","118236"},
[43305750]={ "35987", "吉尼达尔残骸", "要塞资源", "", "default", "NagrandTreasures","824"},
[48006010]={ "35999", "吉尼达尔残骸", "要塞资源", "", "default", "NagrandTreasures","824"},
[48607270]={ "36008", "吉尼达尔残骸", "要塞资源", "", "default", "NagrandTreasures","824"},
[44606750]={ "36002", "吉尼达尔残骸", "要塞资源", "", "default", "NagrandTreasures","824"},
[55306820]={ "36011", "吉尼达尔残骸", "要塞资源", "", "default", "NagrandTreasures","824"},
[73006220]={ "35590", "地精包裹", "要塞资源", "", "default", "NagrandTreasures","824"},
[47207430]={ "35576", "地精包裹", "要塞资源", "", "default", "NagrandTreasures","824"},
[58205260]={ "35694", "金色卡利鸟蛋", "垃圾物品", "", "default", "NagrandTreasures","118266"},
[38305880]={ "36109", "金趾的战利品", "金钱", "钥匙在鹦鹉上", "default", "NagrandTreasures",""},
[87107290]={ "36051", "灰喉的骨头堆", "宠物 玩具", "", "default", "NagrandTreasures","118054"},
[87504500]={ "35622", "藏匿物", "要塞资源", "乘探险家Garix的滑翔翼到那裡 [这裡的北方]", "default", "NagrandTreasures","824"},
[67404900]={ "36039", "悬槌大锤", "i605 力量 戒指", "", "default", "NagrandTreasures","118252"},
[75306570]={ "36099", "重要的探索补给", "酒精饮料", "", "default", "NagrandTreasures","61986"},
[61805740]={ "36082", "遗失的吊坠", "i593 Green Amulet", "", "default", "NagrandTreasures","116687"},
[70501390]={ "35643", "登山者的包裹", "要塞资源", "", "default", "NagrandTreasures","824"},
[81007980]={ "36049", "食人魔念珠", "i605 力量戒指", "", "default", "NagrandTreasures","118255"},
[57806220]={ "36115", "白鬼药剂", "回魔药水", "", "default", "NagrandTreasures","118278"},
[58305940]={ "36021", "波卡尔的第十三把斧子", "i605 单手 力量斧", "", "default", "NagrandTreasures","116688"},
[72706100]={ "36035", "抛光的刃牙虎人颅骨", "i605 敏捷/力量 戒指", "", "default", "NagrandTreasures","118254"},
[58507630]={ "900008", "探险家Bibsi的火箭", "没什麽", "要求有探险家Bibsi", "rocket", "NagrandTreasures",""},
[75206500]={ "36102", "刃牙虎人储物箱", "金钱", "", "default", "NagrandTreasures",""},
[88913310]={ "36857", "走私者的箱子", "要塞资源", "", "default", "NagrandTreasures","824"},
[40406860]={ "37435", "幽灵宝箱", "要塞资源", "", "default", "NagrandTreasures","824"},
[50108220]={ "35577", "热砂补给品", "要塞资源", "乘探险家Bibsi的滑翔翼到那裡  [这裡的东北方]", "default", "NagrandTreasures","824"},
[52708010]={ "35583", "热砂补给品", "要塞资源", "乘探险家Bibsi的滑翔翼到那裡  [这裡的北方]", "default", "NagrandTreasures","824"},
[77805190]={ "35591", "热砂补给品", "要塞资源", "乘探险家Razzu的滑翔翼到那裡 [这裡的南方]", "default", "NagrandTreasures","824"},
[64601760]={ "35648", "热砂补给品", "要塞资源", "乘探险家Dez的滑翔翼到那裡  [这裡的东北方]", "default", "NagrandTreasures","824"},
[70601860]={ "35646", "热砂补给品", "要塞资源", "乘探险家Dez的滑翔翼到那裡  [这裡的西北方]", "default", "NagrandTreasures","824"},
[87602030]={ "35662", "热砂补给品", "要塞资源", "乘探险家伦佐的滑翔翼到那裡 [这裡的西南方]", "default", "NagrandTreasures","824"},
[88204260]={ "35616", "热砂补给品", "要塞资源", "乘探险家Garix的滑翔翼到那裡 [这裡的西北方]", "default", "NagrandTreasures","824"},
[64706580]={ "36046", "塔拉防御护盾", "i605 敏捷/智力 戒指", "", "default", "NagrandTreasures","118253"},
[37707060]={ "34760", "库尔克罗什的宝藏", "要塞资源", "", "default", "NagrandTreasures","824"},
[50006650]={ "35579", "注灵水晶", "i613 双手 力量剑", "", "default", "NagrandTreasures","118264"},
[51706030]={ "35695", "战歌宝箱", "要塞资源", "", "default", "NagrandTreasures","824"},
[52404440]={ "36073", "战歌头盔", "i609 锁甲敏捷/智力 头盔", "", "default", "NagrandTreasures","118250"},
[73007040]={ "35678", "战歌保险箱", "要塞资源", "", "default", "NagrandTreasures","824"},
[76107000]={ "35682", "战歌长矛", "垃圾物品", "乘探险家Razzuk的滑翔翼到那裡 [这裡的北方]", "default", "NagrandTreasures","118678"},
[80606060]={ "35593", "战歌战利品", "要塞资源", "乘探险家Razzuk的滑翔翼到那裡 [这裡的西方]", "default", "NagrandTreasures","824"},
[89406580]={ "35976", "战歌补给品", "要塞资源", "", "default", "NagrandTreasures","824"},
[64703580]={ "36071", "防水袋", "20格包", "", "default", "NagrandTreasures","118235"},
--NagrandRares
[84605340]={ "35778", "先祖剑圣", "要塞资源", "", "rare", "NagrandRares","824"},
[51001600]={ "37210", "奥盖克松", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118654"},
[62601680]={ "37211", "伯格鲁", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118655"},
[77006400]={ "35735", "狂暴T-300系列II型", "要塞资源", "在一个山洞内, 使用一个开关开启", "rare", "NagrandRares","824"},
[40001600]={ "37396", "碎骨者", "未知", "!!! 等级100 !!!", "hundredrare", "NagrandHundred",""},
[43003640]={ "37400", "布塔格·利刃", "i620 智力/力量 铠甲鞋", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","119380"},
[34607700]={ "34727", "铁须队长", "玩具 + i607 枪", "", "rare", "NagrandRares","118244"},
[50204120]={ "37221", "德考汉", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118656"},
[60003800]={ "37222", "恐蹄", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118657"},
[38602240]={ "37395", "杜戈·碎脊", "i620 敏捷 双手锤", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","119405"},
[89004120]={ "35623", "探险家诺赞德 ", "垃圾物品", "", "rare", "NagrandRares","118679"},
[74801180]={ "35836", "锯齿", "垃圾物品", "", "rare", "NagrandRares","116836"},
[70004180]={ "35893", "燧皮", "i609 力量盾", "", "rare", "NagrandRares","116807"},
[48202220]={ "37223", "野蛮的伽罗格", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118658"},
[52205580]={ "35715", "加鲁尔", "i605 饰品 双击 + Wolf 触发", "", "rare", "NagrandRares","118246"},
[42207860]={ "34725", "加兹奥达", "i602 智力 戒指", "在洞穴内", "rare", "NagrandRares","116798"},
[66605660]={ "35717", "狂暴的瘤蹄", "i598 饰品 双击 + 敏捷触发", "", "rare", "NagrandRares","116824"},
[93202820]={ "35898", "血花", "i602 敏捷/智力 皮甲手套", "这手套可以让你在德拉诺採草快点", "rare", "NagrandRares","116916"},
[45003640]={ "37472", "高塔格·钢握", "未知", "!!! 等级100 !!!", "hundredrare", "NagrandHundred",""},
[84603660]={ "36159", "砂齿", "i609 敏捷/智力 皮甲手腕", "", "rare", "NagrandRares","118689"},
[66805120]={ "35714", "巨羽", "i600 布甲胸", "", "rare", "NagrandRares","116795"},
[86007160]={ "35784", "灰喉", "i610 力量 披风", "", "rare", "NagrandRares","118687"},
[80603040]={ "35923", "猎手黑齿", "i609 敏捷 双手锤", "", "rare", "NagrandRares","118245"},
[87005500]={ "34862", "亥伯裡奥斯", "i597 饰品 加速 +精通 触发", "", "rare", "NagrandRares","116799"},
[45803480]={ "37399", "卡洛什·黑风", "i620 布甲腿", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","119355"},
[43803440]={ "37473", "卡拉尔·死眼", "未知", "!!! 等级100 !!!", "hundredrare", "NagrandHundred",""},
[58201200]={ "37398", "开膛者克鲁德", "i620 智力/力量 铠甲腰", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","119384"},
[52009000]={ "37408", "莱纳亚", "未知", "!!! 等级100 !!!", "hundredrare", "NagrandHundred",""},
[81206000]={ "35932", "马尔洛克·裂石 ", "i597 敏捷法杖", "", "rare", "NagrandRares","116796"},
[45801520]={ "36229", "老钳子先生", "i616 饰品 双击 + Lobstrok 触发", "", "rare", "NagrandRares","118690"},
[34005100]={ "37224", "穆格拉", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118659"},
[47607080]={ "35865", "灵魔", "宠物", "", "rare", "NagrandRares","116815"},
[42804920]={ "35875", "奥菲斯", "i602 布甲腿", "", "rare", "NagrandRares","116765"},
[61806900]={ "35943", "侦察骑兵杜莉萨", "i598 敏捷/智力 皮甲鞋", "", "rare", "NagrandRares","116800"},
[58201800]={ "37637", "竞技场野兽", "埃匹希斯水晶", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","823"},
[38001960]={ "37397", "角斗场屠杀者", "i620 力量 戒指", "!!! 等级100 !!!", "hundredrare", "NagrandHundred","119389"},
[73605780]={ "35712", "狂野的赤爪", "i604 智力拳套 (没有法强)", "缺少的法强大概是bug", "rare", "NagrandRares","118243"},
[58008400]={ "35900", "鲁克拉", "i608 智力/力量 铠甲肩", "", "rare", "NagrandRares","118688"},
[54806120]={ "35931", "斥候波卡尔", "i601 力量 单手斧", "", "rare", "NagrandRares","116797"},
[61804720]={ "35912", "西恩·怀特斯", "要塞资源", "", "rare", "NagrandRares","824"},
[75606500]={ "36128", "灵牙", "i597 智力剑", "", "rare", "NagrandRares","116806"},
[63402960]={ "37225", "泰克塔伦", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118660"},
[65003900]={ "35920", "图拉卡", "i609 敏捷 披风", "", "rare", "NagrandRares","116814"},
[37003800]={ "37520", "邪爪", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","120172"},
[82607620]={ "34645", "战争大师布格索尔", "i600 力量/智力 铠甲手腕", "", "rare", "NagrandRares","116805"},
[70602940]={ "35877", "唤风者科拉斯特", "i598 法术法杖", "", "rare", "NagrandRares","116808"},
[41004400]={ "37226", "艾克加纳克", "热砂保护协会的声望物品", "!!! 等级100 !!!", "swprare", "NagrandSWP","118661"},
}
nodes["garrisonsmvalliance_tier1"] = {
[49604380]={ "35530", "坠月鸟蛋", "要塞资源", "在一辆货车上", "default", "SMVTreasures","824"},
[42405436]={ "35381", "皮皮埋藏的补给品 1", "要塞资源", "", "default", "SMVTreasures","824"},
[50704850]={ "35382", "皮皮埋藏的补给品 2", "要塞资源", "", "default", "SMVTreasures","824"},
[30802830]={ "35383", "皮皮埋藏的补给品 3", "要塞资源", "", "default", "SMVTreasures","824"},
[49197683]={ "35384", "皮皮埋藏的补给品 4", "要塞资源", "", "default", "SMVTreasures","824"},
[51800110]={ "35289", "斯帕克的失窃补给", "要塞资源", "在湖中的洞穴中", "default", "SMVTreasures","824"},
 }
nodes["garrisonsmvalliance_tier2"] = {
[37306590]={ "35530", "坠月鸟蛋", "要塞资源", "在一辆货车上", "default", "SMVTreasures","824"},
[41685803]={ "35381", "皮皮埋藏的补给品 1", "要塞资源", "", "default", "SMVTreasures","824"},
[51874545]={ "35382", "皮皮埋藏的补给品 2", "要塞资源", "", "default", "SMVTreasures","824"},
[34972345]={ "35383", "皮皮埋藏的补给品 3", "要塞资源", "", "default", "SMVTreasures","824"},
[46637608]={ "35384", "皮皮埋藏的补给品 4", "要塞资源", "", "default", "SMVTreasures","824"},
[51800110]={ "35289", "斯帕克的失窃补给", "要塞资源", "在湖中的洞穴中", "default", "SMVTreasures","824"},
 }
nodes["garrisonsmvalliance_tier3"] = {
[61277261]={ "35530", "坠月鸟蛋", "要塞资源", "在帐篷裡", "default", "SMVTreasures","824"},
[60575515]={ "35381", "皮皮埋藏的补给品 1", "要塞资源", "", "default", "SMVTreasures","824"},
[37307491]={ "35382", "皮皮埋藏的补给品 2", "要塞资源", "", "default", "SMVTreasures","824"},
[37864378]={ "35383", "皮皮埋藏的补给品 3", "要塞资源", "", "default", "SMVTreasures","824"},
[61527154]={ "35384", "皮皮埋藏的补给品 4", "要塞资源", "", "default", "SMVTreasures","824"},
[51800110]={ "35289", "斯帕克的失窃补给", "要塞资源", "在湖中的洞穴中", "default", "SMVTreasures","824"},
 }
nodes["garrisonffhorde_tier1"] = {
[74505620]={ "34937", "塞娜小姐的备用物资", "要塞资源", "", "default", "FFRTreasures","824"},
}
nodes["garrisonffhorde_tier2"] = {
[74505620]={ "34937", "塞娜小姐的备用物资", "要塞资源", "", "default", "FFRTreasures","824"},
}
nodes["garrisonffhorde_tier3"] = {
[74505620]={ "34937", "塞娜小姐的备用物资", "要塞资源", "", "default", "FFRTreasures","824"},
}
if ((IsQuestFlaggedCompleted(36386) == false) or (IsQuestFlaggedCompleted(36390) == false) or (IsQuestFlaggedCompleted(36389) == false) or (IsQuestFlaggedCompleted(36392) == false) or (IsQuestFlaggedCompleted(36388) == false) or (IsQuestFlaggedCompleted(36381) == false)) then
nodes["SpiresOfArak"][43901500]={ "36395", "暗影视界药剂 1", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
nodes["SpiresOfArak"][43802470]={ "36397", "暗影视界药剂 2", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
nodes["SpiresOfArak"][69204330]={ "36398", "暗影视界药剂 3", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
nodes["SpiresOfArak"][48906250]={ "36399", "暗影视界药剂 4", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
nodes["SpiresOfArak"][55602200]={ "36400", "暗影视界药剂 5", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
nodes["SpiresOfArak"][53108450]={ "36401", "暗影视界药剂 6", "暗影视界药剂", "药剂可以使用在泰洛卡圣物盒装等585武器6个其中之一 (参见安祖之赐) 一但您拾取所有安祖之赐后物件会立刻被删除", "default", "SoATreasures","115463"}
end
if (PlayerFaction == "Alliance") then
nodes["ShadowmoonValleyDR"][29600620]={ "35281", "Bahameye", "Fire Ammonite", "", "rare", "SMVRares","111666"}
nodes["Gorgrond"][60805400]={ "36502", "拜奥兰特", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","116159"}
nodes["Gorgrond"][46004680]={ "35816", "查尔·恐翼", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113457"}
nodes["Gorgrond"][42805920]={ "35812", "火山领主伊格尼斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113449"}
nodes["Gorgrond"][40505100]={ "35809", "“死水”德斯克斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113446"}
nodes["Gorgrond"][51804160]={ "35808", "暴虐的艾罗萨恩", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113445"}
nodes["Gorgrond"][58006360]={ "35813", "真菌守卫者", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113453"}
nodes["ShadowmoonValleyDR"][21603300]={ "33664", "Gorum", "i516 Agility/Intellect Ring", "Inside Bloodthorn Cave - Spawns at the Ceiling", "rare", "SMVRares","113082"}
nodes["Gorgrond"][52406580]={ "35820", "吞噬者卡加克斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113461"}
nodes["ShadowmoonValleyDR"][30301990]={ "35530", "Lunarfall Egg", "Garrison Resources", "Changes position to inside the garrison once it is built", "default", "SMVTreasures","824"}
nodes["Gorgrond"][51206360]={ "35817", "“天空魔王”洛尔丹", "加经验值的任务物品", "周围很多的苍蝇, 坐标只是在他的路线中的一处！在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113458"}
nodes["ShadowmoonValleyDR"][42804100]={ "33038", "Windfang Matriarch", "i516 Agility/Strength 1H Sword", "Is part of the Embaari Crystal Defense Event", "rare", "SMVRares","113553"}
end
if (PlayerFaction == "Horde") then
nodes["Gorgrond"][60805400]={ "36503", "拜奥兰特", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","116160"}
nodes["Gorgrond"][46004680]={ "35815", "查尔·恐翼", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113456"}
nodes["Gorgrond"][42805920]={ "35811", "火山领主伊格尼斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113448"}
nodes["Gorgrond"][40505100]={ "35810", "“死水”德斯克斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113447"}
nodes["Gorgrond"][51804160]={ "35807", "暴虐的艾罗萨恩", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113444"}
nodes["Gorgrond"][58006360]={ "35814", "真菌守卫者", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113454"}
nodes["Gorgrond"][52406580]={ "35819", "吞噬者卡加克斯", "加经验值的任务物品", "在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113460"}
nodes["Talador"][61107170]={ "34116", "Norana的宝箱", "i564 敏捷项鍊", "", "default", "TaladorTreasures","117563"}
nodes["Gorgrond"][51206360]={ "35818", "“天空魔王”洛尔丹", "加经验值的任务物品", "周围很多的苍蝇, 坐标只是在他的路线中的一处！在这个元素从地图去除前，您必须完成任务", "rare", "GorgrondRares","113459"}
end

 function GetItem(ID)
	if (ID == "824" or ID == "823") then
		local currency, _, _ = GetCurrencyInfo(ID)
		if (currency ~= nil) then
			return currency
		else
			return "货币ID载入错误"
		end
	else
		local _, item, _, _, _, _, _, _, _, _ = GetItemInfo(ID)
		if (item ~= nil) then
			return item
		else
			return "物品ID载入错误"
		end
	end
end	
 function GetIcon(ID)
	if (ID == "824" or ID == "823") then
		local _, _, icon = GetCurrencyInfo(ID)
		if (icon ~= nil) then
			return icon
		else
			return "Interface\\Icons\\inv_misc_questionmark"
		end
	else
		local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(ID)
		if (icon ~= nil) then
			return icon
		else
			return "Interface\\Icons\\inv_misc_questionmark"
		end
	end
end	
function DraenorTreasures:OnEnter(mapFile, coord)
    if (not nodes[mapFile][coord]) then return end
	
	local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
	if ( self:GetCenter() > UIParent:GetCenter() ) then
		tooltip:SetOwner(self, "ANCHOR_LEFT")
	else
		tooltip:SetOwner(self, "ANCHOR_RIGHT")
	end
	tooltip:SetText(nodes[mapFile][coord][2])
	if (nodes[mapFile][coord][3] ~= nil) and (DraenorTreasures.db.profile.show_loot == true) then
		if ((nodes[mapFile][coord][7] ~= nil) and (nodes[mapFile][coord][7] ~= "")) then
			tooltip:AddLine(("掉落: " .. GetItem(nodes[mapFile][coord][7])), nil, nil, nil, true)
			if ((nodes[mapFile][coord][3] ~= nil) and (nodes[mapFile][coord][3] ~= "")) then
			tooltip:AddLine(("掉落资讯: " .. nodes[mapFile][coord][3]), nil, nil, nil, true)
			end
		else
			tooltip:AddLine(("掉落: " .. nodes[mapFile][coord][3]), nil, nil, nil, true)
		end
		
	end
	if (nodes[mapFile][coord][4] ~= "") and (DraenorTreasures.db.profile.show_notes == true) then
	 tooltip:AddLine(("注记: " .. nodes[mapFile][coord][4]), nil, nil, nil, true)
	end
	tooltip:Show()
end

local isMoving = false
local info = {}
local clickedMapFile = nil
local clickedCoord = nil
local function generateMenu(button, level)
	if (not level) then return end
	for k in pairs(info) do info[k] = nil end
	if (level == 1) then
	
		info.isTitle      = 1
		info.text         = "DraenorTreasures"
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		
		info.disabled     = nil
		info.isTitle      = nil
		info.notCheckable = nil
		info.text = "Remove this Object from the Map"
		info.func = DisableTreasure
		info.arg1 = clickedMapFile
		info.arg2 = clickedCoord
		UIDropDownMenu_AddButton(info, level)
		
		if isTomTomloaded == true then
			info.text = "Add this location to TomTom waypoints"
			info.func = addtoTomTom
			info.arg1 = clickedMapFile
			info.arg2 = clickedCoord
			UIDropDownMenu_AddButton(info, level)
		end

		info.text         = CLOSE
		info.func         = function() CloseDropDownMenus() end
		info.arg1         = nil
		info.arg2         = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)

		info.text         = "Restore Removed Objects"
		info.func         = ResetDB
		info.arg1         = nil
		info.arg2         = nil
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, level)
		
		end
	end
local HandyNotes_DraenorTreasuresDropdownMenu = CreateFrame("Frame", "HandyNotes_DraenorTreasuresDropdownMenu")
HandyNotes_DraenorTreasuresDropdownMenu.displayMode = "MENU"
HandyNotes_DraenorTreasuresDropdownMenu.initialize = generateMenu

function DraenorTreasures:OnClick(button, down, mapFile, coord)
		if button == "RightButton" and down then
			clickedMapFile = mapFile
			clickedCoord = coord
			ToggleDropDownMenu(1, nil, HandyNotes_DraenorTreasuresDropdownMenu, self, 0, 0)
		end
	end

function DraenorTreasures:OnLeave(mapFile, coord)
	if self:GetParent() == WorldMapButton then
		WorldMapTooltip:Hide()
	else
		GameTooltip:Hide()
	end
end

local options = {
 type = "group",
 name = "德拉诺财宝",
 desc = "德拉诺财宝位置。",
get = function(info) return DraenorTreasures.db.profile[info.arg] end,
set = function(info, v) DraenorTreasures.db.profile[info.arg] = v; DraenorTreasures:Refresh() end,
 args = {
   desc = {
   name = "一般设定",
   type = "description",
   order = 0,
  },
   icon_scale_treasures = {
   type = "range",
   name = "财宝图示大小",
   desc = "图示的大小",
   min = 0.25, max = 3, step = 0.01,
   arg = "icon_scale_treasures",
   order = 1,
  },
  icon_scale_rares = {
   type = "range",
   name = "稀有图示大小",
   desc = "图示的大小",
   min = 0.25, max = 3, step = 0.01,
   arg = "icon_scale_rares",
   order = 2,
  },
  icon_alpha = {
   type = "range",
   name = "图示透明度",
   desc = "图示的透明度",
   min = 0, max = 1, step = 0.01,
   arg = "icon_alpha",
   order = 20,
  },

  VisibilityOptions = {
  type = "group",
  name = "可见性设定",
  desc = "可见性设定",
  args = {


VisibilityGroup = {
	type = "group",
	order = 0,
	name = "选择哪些区域要显示什麽:",
	inline = true,
	args = {
SMVGroup = {
	name = "影月谷",
	desc = "Shadowmoon Valley",
	type = "header",
	order = 0,
	},
SMVTreasures = {
   type = "toggle",
   name = "财宝",
   arg = "SMVTreasures",
   order = 1,
   width = "half",
  },
SMVRares = {
   type = "toggle",
   name = "稀有",
   arg = "SMVRares",
   order = 2,
   width = "half",
  },
SMVHundredRares = {
   type = "toggle",
   name = "100等稀有",
   desc = "等级100稀有出现地点",
   arg = "SMVHundred",
   order = 3,
   width = "half",
  },
SMVShrines = {
   type = "toggle",
   name = "圣物盒",
   arg = "SMVShrine",
   order = 4,
   width = "half",
  },
FFRGroup = {
	name = "霜火峰",
	desc = "霜火峰",
	type = "header",
	order = 10,
	},	
FFRTreasures = {
   type = "toggle",
   name = "财宝",
   arg = "FFRTreasures",
   width = "half",
   order = 11,
  },
FFRBF = {
   type = "toggle",
   name = "Bladespire",
   desc = "Treasures in Bladespire Fortress",
   arg = "FFRBF",
   width = "half",
   order = 12,
  },
FFRRares = {
   type = "toggle",
   name = "稀有",
   arg = "FFRRares",
   width = "half",
   order = 13,
  },
FFRHundredRares = {
   type = "toggle",
   name = "100等稀有",
   desc = "等级100稀有出现地点",
   arg = "FFRHundred",
   width = "half",
   order = 14,
  },
FFRShrines = {
   type = "toggle",
   name = "圣物盒",
   arg = "FFRShrine",
   order = 15,
   width = "half",
  },
GorgrondGroup = {
	name = "格古隆德",
	desc = "格古隆德",
	type = "header",
	order = 20,
	},	
GorgrondTreasures = {
   type = "toggle",
   name = "财宝",
   arg = "GorgrondTreasures",
   width = "half",
   order = 21,
  },
GorgrondRares = {
   type = "toggle",
   name = "稀有",
   arg = "GorgrondRares",
   width = "half",
   order = 22,
  },  
GorgrondHundredRares = {
   type = "toggle",
   name = "100等稀有",
   arg = "GorgrondHundred",
   desc = "等级100稀有出现地点",
   width = "normal",
   order = 23,
  },  
GorgrondLumber = {
   type = "toggle",
   name = "100等稀有",
   arg = "GorgrondLumber",
   desc = "锯木厂分支",
   width = "normal",
   order = 24,
  },  
GorgrondBoulder = {
   type = "toggle",
   name = "Sparring Arena Treasures",
   arg = "GorgrondBoulder",
   desc = "Sparring Arena Treasures",
   width = "normal",
   order = 25,
  },  
TaladorGroup = {
	name = "塔拉多尔",
	desc = "塔拉多尔",
	type = "header",
	order = 30,
	},	
TaladorTreasures = {
   type = "toggle",
   name = "财宝",
   arg = "TaladorTreasures",
   width = "half",
   order = 31,
  },
TaladorRares = {
   type = "toggle",
   name = "稀有",
   arg = "TaladorRares",
   width = "half",
   order = 32,
  },  
TaladorHundredRares = {
   type = "toggle",
   name = "100等稀有",
   arg = "TaladorHundred",
   desc = "等级100 稀有出现地点",
   width = "normal",
   order = 33,
  },  
SoAGroup = {
	name = "阿拉卡山",
	desc = "阿拉卡山",
	type = "header",
	order = 40,
	},	  
SoATreasures = {
   type = "toggle",
   name = "财宝",
   arg = "SoATreasures",
   width = "half",
   order = 41,
  },
SoARares = {
   type = "toggle",
   name = "稀有",
   arg = "SoARares",
   width = "half",
   order = 42,
  },  
SoAHundredRares = {
   type = "toggle",
   name = "100等稀有",
   desc = "等级100稀有出现地点",
   arg = "SoAHundred",
   width = "half",
   order = 43,
  },
SoAArchaeology = {
   type = "toggle",
   name = "SoA考古",
   desc = "考古财宝",
   arg = "SoAArchaeology",
   width = "half",
   order = 44,
},  
NagrandGroup = {
	name = "纳葛兰",
	desc = "纳葛兰",
	type = "header",
	order = 50,
	},	    
  NagrandTreasures = {
   type = "toggle",
   name = "财宝",
   arg = "NagrandTreasures",
   width = "half",
   order = 51,
  },
  NagrandRares = {
   type = "toggle",
   name = "稀有",
   arg = "NagrandRares",
   width = "half",
   order = 52,
  },
  NagrandHundredRares = {
   type = "toggle",
   name = "100等稀有",
   arg = "NagrandHundred",
   desc = "等级100稀有出现地点",
   width = "half",
   order = 53,
  },
  NagrandSWPRares = {
   type = "toggle",
   name = "SWP 稀有",
   desc = "热砂保护协会 稀有",
   arg = "NagrandSWP",
   width = "half",
   order = 53,
  },
	},
  },
  alwaysshow = {
   type = "toggle",
   name = "仍然显示已经拾取(击杀)的 财宝(稀有)",
   desc = "显示每个财宝/稀有不论拾取状态",
   arg = "alwaysshow",
   order = 100,
   width = "full",
  },
    show_loot = {
   type = "toggle",
   name = "显示掉落",
   desc = "显示每个财宝/稀有的掉落",
   arg = "show_loot",
   order = 101,
   },
  show_notes = {
   type = "toggle",
   name = "显示注记",
   desc = "显示每个财宝/稀有的注记如果可用的话",
   arg = "show_notes",
   order = 101,
   },
	 },
	},
  },
}

function DraenorTreasures:OnInitialize()
 local defaults = {
  profile = {
   icon_scale_treasures = 1.5,
   icon_scale_rares = 2.0,
   icon_alpha = 1.0,
   alwaysshow = false,
   save = true,
   SMVTreasures = true,
   SMVRares = true,
   SMVHundred = true,
   SMVShrine = true,
   FFRTreasures = true,
   FFRRares = true,
   FFRHundred = true,
   FFRShrine = true,
   FFRBF = false,
   GorgrondTreasures = true,
   GorgrondRares = true,
   GorgrondHundred = true,
   GorgrondLumber = false,
   GorgrondBoulder = false,
   TaladorTreasures = true,
   TaladorRares = true,
   TaladorHundred = true,
   SoATreasures = true,
   SoARares = true,
   SoAHundred = true,
   SoAArchaeology = true,
   NagrandTreasures = true,
   NagrandRares = true,
   NagrandHundred = true,
   NagrandSWP = true,
   show_loot = true,
   show_notes = true,
   },
 }

 self.db = LibStub("AceDB-3.0"):New("DraenorTreasuresDB", defaults, "Default")
 self:RegisterEvent("PLAYER_ENTERING_WORLD", "WorldEnter")
end

function DraenorTreasures:WorldEnter()
 self:UnregisterEvent("PLAYER_ENTERING_WORLD")
 self:ScheduleTimer("RegisterWithHandyNotes", 5)
end

function DraenorTreasures:RegisterWithHandyNotes()
do
	local function iter(t, prestate)
		if not t then return nil end
		local state, value = next(t, prestate)
		while state do
			    -- QuestID[1], Name[2], Loot[3], Notes[4], Icon[5], Tag[6], ItemID[7]
			    if (value[1] and self.db.profile[value[6]] and not DraenorTreasures:HasBeenLooted(value)) then
					if ((value[5] == "default") or (value[5] == "unknown")) then
						if ((value[7] ~= nil) and (value[7] ~= "")) then
							return state, nil, GetIcon(value[7]), DraenorTreasures.db.profile.icon_scale_treasures, DraenorTreasures.db.profile.icon_alpha
						else
							GetIcon(value[7]) --this should precache the Item, so that the loot is correctly returned
							return state, nil, iconDefaults[value[5]], DraenorTreasures.db.profile.icon_scale_treasures, DraenorTreasures.db.profile.icon_alpha
						end
					end
				if ((value[7] ~= nil) and (value[7] ~= "")) then
				 	GetIcon(value[7]) --this should precache the Item, so that the loot is correctly returned
				end
				 return state, nil, iconDefaults[value[5]], DraenorTreasures.db.profile.icon_scale_rares, DraenorTreasures.db.profile.icon_alpha
				end
			state, value = next(t, state)
		end
	end
	function DraenorTreasures:GetNodes(mapFile, isMinimapUpdate, dungeonLevel)
		return iter, nodes[mapFile], nil
	end
end
 HandyNotes:RegisterPluginDB("DraenorTreasures", self, options)
 self:RegisterBucketEvent({ "LOOT_CLOSED" }, 2, "Refresh")
 self:Refresh()
end
 
function DraenorTreasures:Refresh()
 self:SendMessage("HandyNotes_NotifyUpdate", "DraenorTreasures")
end

function ResetDB()
	table.wipe(DraenorTreasures.db.char)
	DraenorTreasures:Refresh()
end

function DraenorTreasures:HasBeenLooted(value)
if (self.db.profile.alwaysshow) then return false end
if (DraenorTreasures.db.char[value[1]] and self.db.profile.save) then return true end
if (IsQuestFlaggedCompleted(value[1])) then
	return true
end
return false
end

function DisableTreasure(button, mapFile, coord)
	if (nodes[mapFile][coord][1] ~= nil) then
		DraenorTreasures.db.char[nodes[mapFile][coord][1]] = true;
	end
	DraenorTreasures:Refresh()
end
function addtoTomTom(button, mapFile, coord)
	if isTomTomloaded == true then
		local mapId = HandyNotes:GetMapFiletoMapID(mapFile)
		local x, y = HandyNotes:getXY(coord)
		local desc = nodes[mapFile][coord][2];
        if (nodes[mapFile][coord][3] ~= nil) and (DraenorTreasures.db.profile.show_loot == true) then
            if ((nodes[mapFile][coord][7] ~= nil) and (nodes[mapFile][coord][7] ~= "")) then
                desc = desc.."\nLoot: " .. GetItem(nodes[mapFile][coord][7]);
                desc = desc.."\nLootinfo: " .. nodes[mapFile][coord][3];
            else
                desc = desc.."\nLoot: " .. nodes[mapFile][coord][3];
            end
        end
        if (nodes[mapFile][coord][4] ~= "") and (DraenorTreasures.db.profile.show_notes == true) then
            desc = desc.."\nNotes: " .. nodes[mapFile][coord][4]
        end
		TomTom:AddMFWaypoint(mapId, nil, x, y, {
			title = desc,
			persistent = nil,
			minimap = true,
			world = true
		})
	end
end