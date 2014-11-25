import 'dart:io';
import 'dart:convert';
import 'Utils.dart';
import 'SC_data.dart' as sc;
import 'WowInfo.dart';


List<WOWClassInfo> AllClassInfo = [
  new WOWClassInfo()..classID=1 ..name='WARRIOR' ..cnName='战士' ..enName='warrior',
  new WOWClassInfo()..classID=2 ..name='PALADIN' ..cnName='圣骑士' ..enName='paladin',
  new WOWClassInfo()..classID=3 ..name='HUNTER' ..cnName='猎人' ..enName='hunter',
  new WOWClassInfo()..classID=4 ..name='ROGUE' ..cnName='盗贼' ..enName='rogue',
  new WOWClassInfo()..classID=5 ..name='PRIEST' ..cnName='牧师' ..enName='priest',
  new WOWClassInfo()..classID=6 ..name='DEATHKNIGHT' ..cnName='死亡骑士' ..enName='deathknight',
  new WOWClassInfo()..classID=7 ..name='SHAMAN' ..cnName='萨满' ..enName='shaman',
  new WOWClassInfo()..classID=8 ..name='MAGE' ..cnName='法师' ..enName='mage',
  new WOWClassInfo()..classID=9 ..name='WARLOCK' ..cnName='术士' ..enName='warlock',
  new WOWClassInfo()..classID=10 ..name='MONK' ..cnName='武僧' ..enName='monk',
  new WOWClassInfo()..classID=11 ..name='DRUID' ..cnName='德鲁伊' ..enName='druid',
];

var AllBuffs = {
                'bloodlust':[2825, NA_Player],
//DK
                'blood_charge':[114851, NA_Target],
                'frost_fever':[55095, NA_Target],
                'killing_machine':[51124, NA_Target],
                'blood_plague':[55078, NA_Target],
                'rime':[59057, NA_Player],
                'runic_empowerment':[81229, NA_Player],
//Hunter
                'beast_cleave':[115939, NA_Player],
                'glaive_toss':[117050, NA_Player],
                'lynx_rush':[120697, NA_Target],
                'a_murder_of_crows':[131894, NA_Player],
                'dire_beast':[120679, NA_Player],
                'barrage':[120360, NA_Player],
                'powershot':[109259, NA_Player],
                'thrill_of_the_hunt':[109306, NA_Player],
                'focus_fire':[82692, NA_Player],
//Paladin
                'inquisition':[84963, NA_Player],
                'divine_purpose':[86172, NA_Player],
                'avenging_wrath':[31884, NA_Player],
                'Retribution_guardian_of_ancient_kings':[86698, NA_Player],
                'holy_avenger':[105809, NA_Player],
                'ancient_power':[23979, NA_Player],
                'execution_sentence':[84963, NA_Player],
                'divine_crusader':[144595, NA_Target],
};

Map<int, WOWSpellInfo> allSpells = {};
Map<String, String> allSpellMap = {
  'soul_reaper':'灵魂收割',
  'blood_charge':'鲜血充能',

  'beast_cleave':'野兽顺劈斩',
  'glaive_toss':'飞刃',
  'lynx_rush':'山猫冲锋',
  'a_murder_of_crows':'夺命黑鸦',
  'dire_beast':'凶暴野兽',
  'barrage':'弹幕射击',
  'powershot':'强风射击',
  'thrill_of_the_hunt':'狩猎刺激',
  'focus_fire':'集中火力',
  'beast_within':'野兽之心',
  'explosive_trap':'爆炸陷阱',
  'blood_fury':'血性狂怒',
  'fervor':'热情',
  'careful aim':'精确瞄准',

  'bloodlust':'嗜血',
};
Set<String> allMissSpells = new Set<String>();

class CharacterInfo{
  int classID;
  int race;
  int level;
  List<int> selectedTalent = [];
  List<int> otherTalent = [];

  void printIt(){
    print('class=${classID}');
    print('race=${race}');
    print('level=${level}');
  }
}

void fetchCharacterSpell(String realm, String name){
  var url = 'http://www.battlenet.com.cn/api/wow/character/${Uri.encodeQueryComponent(realm)}/${Uri.encodeQueryComponent(name)}?fields=talents';
  getUrl(url, (String data){
    var info = JSON.decode(data);
    var currCharacterInfo = new CharacterInfo();
    currCharacterInfo.classID = info['class'];
    currCharacterInfo.race = info['race'];
    currCharacterInfo.level = info['level'];
    for(var t in info['talents']){
      List<int> tSpells;
      if(t['selected'] != null && t['selected']){
        print('+++++++++++++++++${t['spec']['name']}');
        tSpells = currCharacterInfo.selectedTalent;
      }else{
        print('----------------------${t['spec']['name']}');
        tSpells = currCharacterInfo.otherTalent;
      }
      for(var s in t['talents']){
        print(s['tier'].toString()+'---'+s['spell']['id'].toString()+'---'+s['spell']['name'].toString());
        tSpells.add(s['spell']['id']);
      }
    }
    readClassInfo(currCharacterInfo.classID);
  });
}

void readClassInfo(int classID) {
  allSpells = new Map();
  var config = new File('.\\'+classID.toString()+'.json');
  String data = config.readAsStringSync();
    Map info = JSON.decode(data);

    //normal spells
    String key = 'spells';
    for(Map item in info['spells']){
      WOWSpellInfo spellInfo = buildSpellInfo(item, (item['minLevel']).toString());
      addSpell(spellInfo);
    }

    //spec spells
    int maxspec = 3;
    if(classID == 11){
      maxspec = 4;
    }
    for(int specNo=0;specNo<maxspec;specNo++){
      var spec = info['specs'][specNo];
      String specName = spec['bg'].toString();
      specName = specName.substring(specName.lastIndexOf('-')+1, specName.length);
      specName = specName.substring(0, 1).toUpperCase()+specName.substring(1);
      print(specName+"-----"+spec['name'].toString());
      List spells = spec['spells'];
      for(var i=0;i<spells.length; i++){
        var spell = spells[i];
        WOWSpellInfo spellInfo = buildSpellInfo(spell, (spell['minLevel']).toString());
        addSpell(spellInfo);
      }
    }

    //talent spells
    for(var talentNo=0;talentNo<18;talentNo++){
      int no = (talentNo-talentNo%3)~/3;
      WOWSpellInfo spellInfo = buildSpellInfo(info['talents'][no][talentNo%3], ((no+1)*15).toString());
      addSpell(spellInfo);
    }
}

void addSpell(WOWSpellInfo spellInfo){
  if(allSpells[spellInfo.spellID] == null ){
    allSpells[spellInfo.spellID] = spellInfo;
  }else{
    print(allSpells[spellInfo.spellID].name +":::"+allSpells[spellInfo.spellID].spellID.toString()+"<--->"+spellInfo.spellID.toString());
  }
}

void getAllSpellMap(String className){
  for(String key in sc.spellMap.keys){
    String value = sc.spellMap[key].trim().toLowerCase();
    if(value.startsWith(className+":")){
      allSpellMap[key] = value.substring((className+":").length);
      //print(key+"="+allSpellMap[key]);
    }
  }
  for(String key in allSpellMap.keys){
    String value = allSpellMap[key].trim().toLowerCase();
    for(List item in sc.sc_spell_data){
      if(item != null && item.length>5 && item[0] is String && (item[0] as String).trim().toLowerCase() == value){
        if(allSpells[item[1] as int] != null){
          allSpellMap[key] = allSpells[item[1] as int].name;
          //print(key+"==="+allSpells[item[1] as int].name);
        }
      }
    }
  }
}


void parseSimc(int classID, String specName, String file){
  var f = new File(file);
  List<String> lines = f.readAsLinesSync();

  for(String line in lines){
    line = line.trim();
    if(line.startsWith('actions.aoe') || line.startsWith('actions.single_target') || line.startsWith('actions+=')){
      String cnd = line;
      String cmdType = "";
      String fireCmd = "..addattackCmd(";
      if(line.startsWith('actions.aoe')){
        //p.addattackAOECmd(cnd, spell, target);
        cmdType = 'AOE';
        fireCmd = "..addattackAOECmd";
      }else if(line.startsWith('actions.single_target') || line.startsWith('actions+=')){
        //p.addattackCmd(cnd, spell, target);
        cmdType = 'single_target';
        fireCmd = "..addattackCmd";
      }
      cnd = cnd.replaceAll('&', ' and ');
      cnd = cnd.replaceAll('|', ' or ');
      cnd = cnd.replaceAll('!', ' not ');
      cnd = cnd.replaceAll('target.health.pct-3*(target.health.pct%target.time_to_die)', 'W_HPlevel(NA_Target)*100');
      cnd = cnd.replaceAll('runic_power', 'W_PowerLevel(NA_Player)');
      cnd = cnd.replaceAll('target.time_to_die', 'W_PowerLevel(NA_Target)');
      cnd = cnd.replaceAll('focus', 'W_PowerLevel(NA_Player)');
      cnd = cnd.replaceAll('enabled', 'true');
      cnd = cnd.replaceAll('!ticking', 'not hasquickshot');
      cnd = cnd.replaceAll('ticking', 'hasquickshot');
      cnd = cnd.replaceAll('five_stacks=1', 'W_BuffCount(NA_Player, 19615)>=5');
      cnd = cnd.replaceAll('five_stacks=1', 'W_BuffCount(NA_Player, 19615)>=5');
      cnd = regReplace(cnd, r'[,]*line_cd=\d+', '');
      cnd = regReplace(cnd, r'blood=(\d+)', r'W_StarCount(1)==\1');
      cnd = regReplace(cnd, r'frost=(\d+)', r'W_StarCount(3)==\1');
      cnd = regReplace(cnd, r'unholy=(\d+)', r'W_StarCount(2)==\1');
      cnd = regReplace(cnd, r'active_enemies>(\d+)', 'NA_IsAOE');

      cnd = cndSpellReplace(specName, cnd, r'\/([\w]+),if=(.+)', '${fireCmd}(\'\\2\', "\\1", NA_Target)');
      cnd = cndSpellReplace(specName, cnd, r'([\w]+),if=(.+)', '${fireCmd}(\'\\2\', "\\1", NA_Target)');

      cnd = cndSpellReplace(specName, cnd, r'talent\.([\w]+)\.enabled', r'W_SpellEnabled("\1", NA_Player)');

      cnd = cndSpellReplace(specName, cnd, r'dot\.([\w]+)\.ticking', r'W_HasBuff(NA_Player, "\1", true)');
      cnd = cndSpellReplace(specName, cnd, r'cooldown\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = cndSpellReplace(specName, cnd, r'dot\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = cndSpellReplace(specName, cnd, r'buff\.([\w]+)\.stack', r'W_BuffCount(NA_Player, "\1")');
      cnd = cndSpellReplace(specName, cnd, r'buff\.([\w]+)\.react', r'W_HasBuff(NA_Player, "\1")');
      cnd = cndSpellReplace(specName, cnd, r'buff\.([\w]+)\.up', r'W_HasBuff(NA_Player, "\1")');
      cnd = cndSpellReplace(specName, cnd, r'buff\.([\w]+)\.down', r'W_HasBuff(NA_Player, "\1")');
      cnd = cndSpellReplace(specName, cnd, r'\/([\w]+)', '${fireCmd}("true", "\\1", NA_Target)');

      String target = NA_Player;
      print(cnd.substring(cnd.indexOf('=')+1));
    }
  }
}

String cndSpellReplace(String specName, String cnd, String regexp, String replace){
  return cnd.replaceAllMapped(new RegExp(regexp, caseSensitive: false), (Match m){
    String s = m.group(1);
    String out = replace.replaceAll('\\1', getSpellName(s, specName));
    if(m.groupCount>1){
      for(var i=2; i<=m.groupCount; i++){
        String ss = m.group(i);
        out = out.replaceAll('\\${i}', ss);
      }
    }
    return out;
  });
}

String getSpellName(String spell, String spec){
  if(allSpellMap[spell] != null){
    return allSpellMap[spell];
  }
  if(allSpellMap[spell+":"+spec] != null){
    return allSpellMap[spell+":"+spec];
  }
  allMissSpells.add(spell);
  return spell;
}

void simc(String className, int classID, String specName, String simcFile){
  readClassInfo(classID);
  getAllSpellMap(className);
  parseSimc(classID, specName, simcFile);
  for(String s in allMissSpells){
    if(s != 'aoe' && s != 'run_action_list' && s != 'single_target'){
      print('"${s}":"${className}:${s.replaceAll('_', ' ')}",');
    }
  }
}

void main(){
  //fetchCharacterSpell('杜隆坦','watanodk');
  //simc('death_knight', 6, 'Frost', r'i:\wowtools\simc\profiles\Tier14H\Death_Knight_Frost_2h_T14H.simc');
  //simc('paladin', 2, 'Retribution', r'i:\wowtools\simc\profiles\PreRaid\Paladin_Retribution_PreRaid.simc');
//  simc('hunter', 3, 'Beastmaster', r'i:\wowtools\simc\profiles\PreRaid\Hunter_BM_PreRaid.simc');
  simc('hunter', 3, 'Beastmaster', r'd:\games\wowtools\simc\profiles\Tier16M\Hunter_BM_T16M.simc');
}