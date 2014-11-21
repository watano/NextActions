import 'dart:io';
import 'dart:convert';
import 'Utils.dart';

String NA_Target = 'NA_Target';
String NA_Player = 'NA_Player';
String NA_Pet = 'NA_Pet';

List<WOWClassInfo> AllClassInfo = [
  new WOWClassInfo()..classID=1 ..name='WARRIOR' ..cnName='战士' ..enName='warrior',
  new WOWClassInfo()..classID=2 ..name='PALADIN' ..cnName='圣骑士' ..enName='paladin',
  new WOWClassInfo()..classID=3 ..name='HUNTER' ..cnName='猎人' ..enName='hunter',//Beastmaster Marksman
  new WOWClassInfo()..classID=4 ..name='ROGUE' ..cnName='盗贼' ..enName='rogue',
  new WOWClassInfo()..classID=5 ..name='PRIEST' ..cnName='牧师' ..enName='priest',
  new WOWClassInfo()..classID=6 ..name='DEATHKNIGHT' ..cnName='死亡骑士' ..enName='deathknight',
  new WOWClassInfo()..classID=7 ..name='SHAMAN' ..cnName='萨满' ..enName='shaman',
  new WOWClassInfo()..classID=8 ..name='MAGE' ..cnName='法师' ..enName='mage',
  new WOWClassInfo()..classID=9 ..name='WARLOCK' ..cnName='术士' ..enName='warlock',
  new WOWClassInfo()..classID=10 ..name='MONK' ..cnName='武僧' ..enName='monk',
  new WOWClassInfo()..classID=11 ..name='DRUID' ..cnName='德鲁伊' ..enName='druid',
];
var AllSpells = {
  'horn_of_winter': [57330, NA_Player],
  'unholy_blight': [115989, NA_Target],
  'blood_plague': [55078, NA_Target],
  'pestilence': [50842, NA_Target],
  'plague_leech': [123693, NA_Target],
  'howling_blast': [49184, NA_Target],
  'blood_tap': [45529, NA_Target],
  'frost_strike': [49143, NA_Target],
  'death_and_decay': [43265, NA_Target],
  'plague_strike': [45462, NA_Target],
  'empower_rune_weapon': [47568, NA_Target],
  'outbreak': [77575, NA_Target],
  'soul_reaper:Unholy': [130736, NA_Target],
  'soul_reaper:Frost': [130735, NA_Target],
  'soul_reaper:Blood': [114866, NA_Target],
  'frost_fever': [55095, NA_Target],//55095, 59921
  'obliterate': [49020, NA_Target],

  'explosive_trap': [13813, NA_Target],
  'focus_fire': [82692, NA_Target],
  'serpent_sting': [1978, NA_Target],
//                 'blood_fury':[123693, NA_Target],
  'fervor': [82726, NA_Target],
  'bestial_wrath': [19574, NA_Target],
  'multi_shot': [2643, NA_Target],
  'cobra_shot': [77767, NA_Target],
  'rapid_fire': [3045, NA_Target],
  'stampede': [121818, NA_Target],
  'kill_shot': [53351, NA_Target],
  'kill_command': [34026, NA_Target],
  'a_murder_of_crows': [131894, NA_Target],
  'glaive_toss': [117050, NA_Target],
  'lynx_rush': [120697, NA_Target],
  'dire_beast': [120679, NA_Target],
  'barrage': [120360, NA_Target],
  'powershot': [109259, NA_Target],
  'arcane_shot': [3044, NA_Target],
  'thrill_of_the_hunt': [109306, NA_Target],
};

var AllBuffs = {
  'blood_charge': [114851, NA_Target],
  'frost_fever': [55095, NA_Target],
  'killing_machine': [51124, NA_Target],
  'blood_plague': [55078, NA_Target],
  'rime': [59057, NA_Player],
  'runic_empowerment': [81229, NA_Player],
};


class WOWClassInfo {
  int classID = 0;
  String name;
  String cnName;
  String enName;
  List<WOWSpellInfo> spells = [];
  List<String> specNames = [];
  List<String> specCnNames = [];
  List<String> specEnNames = [];
  List<List<WOWSpellInfo>> specs = [];
  List<WOWSpellInfo> talents = [];

  WOWSpellInfo findSpell(String spell, String spec) {
    List<WOWSpellInfo> currSpec = null;
    int index = 0;
    for (String s in specNames) {
      if (s == spec) {
        break;
      }
      index++;
    }
    if(index>=specNames.length){
      print('[错误]${spec}![${specNames.toString()}]');
      return null;
    }
    for (WOWSpellInfo s in specs[index]) {
      if (s.getSpellNo(spell) != null) {
        return s;
      }
    }
    for (WOWSpellInfo s in talents) {
      if (s.getSpellNo(spell) != null) {
        return s;
      }
    }
    for (WOWSpellInfo s in spells) {
      if (s.getSpellNo(spell) != null) {
        return s;
      }
    }
    print('[警告]不能找到法术:${spell}@${spec}');
    return null;
  }
}

class WOWSpellInfo {
  int spellID = 0;
  int minLevel = 0;
  bool passive = false;
  String no;
  String target = NA_Player;
  String name;
  String icon;
  String htmlDescription;
  String specName = null;

  String getSpellNo(String spell) {
    if (name == spell || icon == spell || no == spell) {
      return no;
    }
    return null;
  }
}

void fetchAll() {
  //战士1 圣骑士2 猎人3 盗贼4 牧师5 死亡骑士6 萨满7 法师8 术士9 武僧10 德鲁伊11
  for (WOWClassInfo ci in AllClassInfo) {
    var url = Uri.parse('http://www.battlenet.com.cn/wow/zh/tool/talent-calculator/' + ci.classID.toString());
    //print(url);
    var httpClient = new HttpClient();
    httpClient.getUrl(url).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      var s = response.transform(new Utf8Decoder(allowMalformed: false));
      var inLine = 1;
      var body = '';
      s.forEach((String line) {
        line = line.trim();
        if (inLine == 1 && line.indexOf('TalentCalculator') > 0) {
          inLine = 2;
          body = line.substring(line.indexOf('TalentCalculator') + 16 + 6, line.length);
        } else if (inLine == 2) {
          body += line;
        }
        if (body.indexOf('});') > 0) {
          body = body.substring(0, body.indexOf('});') + 1);
          inLine = 3;
        }
        if (inLine == 3) {
          //print(body);
          writeToFile('.\\' + ci.classID.toString() + '.json', body);
        }
      });
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      httpClient.close();
    });
  }
}

WOWSpellInfo buildSpellInfo(dynamic info, String minLevel) {
  var spell = info['spell'];
  var spellInfo = new WOWSpellInfo();
  spellInfo.passive = (info['passive']).toString() == 'true' || (spell['castTime']).toString() == '被动';
  spellInfo.icon = (spell['icon']).toString();
  spellInfo.no = (spell['icon']).toString();
  spellInfo.spellID = spell['id'] as int;
  spellInfo.name = (spell['name']).toString();

  for (String k in AllSpells.keys) {
    List info = AllSpells[k];
    if (spellInfo.spellID == (info[0] as int)) {
      spellInfo.no = k;
      spellInfo.target = info[1] as String;
    }
  }

  spellInfo.htmlDescription = (spell['htmlDescription']).toString();
  spellInfo.minLevel = int.parse(minLevel);
  return spellInfo;
}

WOWClassInfo readClassInfo(int classID) {
  WOWClassInfo classInfo = AllClassInfo[classID-1];
  var config = new File('.\\' + classID.toString() + '.json');
  String data = config.readAsStringSync();
  Map info = JSON.decode(data);

  //normal spells
  String key = 'spells';
  for (Map item in info['spells']) {
    classInfo.spells.add(buildSpellInfo(item, (item['minLevel']).toString()));
  }

  //spec spells
  int maxspec = 3;
  if (classInfo.classID == 11) {
    maxspec = 4;
  }
  for (int specNo = 0; specNo < maxspec; specNo++) {
    var spec = info['specs'][specNo];
    String specName = spec['bg'].toString();
    specName = specName.substring(specName.lastIndexOf('-') + 1, specName.length);
    specName = specName.substring(0, 1).toUpperCase() + specName.substring(1);
    classInfo.specNames.add(specName);
    classInfo.specCnNames.add(spec['name'].toString());
    classInfo.specEnNames.add(spec['bg'].toString());
    classInfo.specs.add([]);
    List spells = spec['spells'];
    for (var i = 0; i < spells.length; i++) {
      var spell = spells[i];
      classInfo.specs[specNo].add(buildSpellInfo(spell, (spell['minLevel']).toString()));
    }
  }

  //talent spells
  for (var talentNo = 0; talentNo < 18; talentNo++) {
    int no = ((talentNo - talentNo % 3) ~/ 3).toInt();
    classInfo.talents.add(buildSpellInfo(info['talents'][no][talentNo % 3][0], ((no + 1) * 15).toString()));
  }
  return classInfo;
}

read4AllClass() {
  String code = '''
local listSpell = {}, {}
local listItem = {},{}

function initAllInfo(unitClass, unitLevel, telants)
''';
  for (WOWClassInfo ci in AllClassInfo) {
    var classInfo = readClassInfo(ci.classID);
    code += '\nif unitClass=="${classInfo.name}" then --${classInfo.classID.toString()}--${classInfo.cnName}';
    for (WOWSpellInfo spellInfo in classInfo.spells) {
      if (spellInfo.passive) {
        continue;
      }
      code += '\n\tif(unitLevel>=${spellInfo.minLevel})then listSpell[\"${spellInfo.no}\"] = ${spellInfo.spellID}; end   --${spellInfo.name}--${spellInfo.htmlDescription}';
    }

    int i = 0;
    for (String specName in classInfo.specNames) {
      code += '\n\t--' + classInfo.specCnNames[i] + '--' + classInfo.specEnNames[i];
      code += '\n\tif(telants == "${specName}")then';
      for (WOWSpellInfo spellInfo in classInfo.specs[i]) {
        if (spellInfo.passive) {
          continue;
        }
        code += '\n\tif(unitLevel>=${spellInfo.minLevel})then listSpell[\"${spellInfo.no}\"] = ${spellInfo.spellID}; end   --${spellInfo.name}--${spellInfo.htmlDescription}';
      }
      i++;
      code += '\n\tend';
    }

    i = 0;
    code += '\n\t-------------------------talent-------------------------';
    for (WOWSpellInfo spellInfo in classInfo.talents) {
      if (spellInfo.passive) {
        continue;
      }
      code += '\n\tif(unitLevel>=${spellInfo.minLevel})then listSpell[\"${spellInfo.no}\"] = ${spellInfo.spellID}; end   --${spellInfo.name}--${spellInfo.htmlDescription}';
    }
    code += '\nend';
  }
  code += '''\n\nend

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
''';
  writeToFile(r'e:\work\projects\myprojects\NextActions\src\NAInfo.lua', code, encoding: 'utf-8');
}


void main() {
  //read4AllClass();
  fetchAll();
}
