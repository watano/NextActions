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
  new WOWClassInfo()..classID=12 ..name='DEMONHUNTER' ..cnName='恶魔猎手' ..enName='demonhunter',
];

class WOWClassInfo {
  int classID = 0;
  String name;
  String cnName;
  String enName;
  List<WOWSpellInfo> spells = [];
  List<String> specNames = [];
  List<String> specCnNames = [];
  List<int> specIDs = [];
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
    if (index >= specNames.length) {
      print('[错误]${spec}![${specNames.toString()}]');
      return null;
    }
    for (WOWSpellInfo s in specs[index]) {
      if (s.getSpellNo(spell) != null) {
        return s;
      }
    }
    for (WOWSpellInfo s in talents) {
      if (s.getSpellNo(spell) != null && s.filter.startsWith('talent:') && s.filter.endsWith('_${specIDs[index]}')) {
        return s;
      }
    }
    for (WOWSpellInfo s in talents) {
      if (s.getSpellNo(spell) != null && s.filter.startsWith('talent:') && s.filter.endsWith('_0')) {
        return s;
      }
    }
    for (WOWSpellInfo s in spells) {
      if (s.getSpellNo(spell) != null) {
        return s;
      }
    }
    if (!spell.startsWith('NA_') &&
        !spell.startsWith('I') &&
        !spell.startsWith('M') &&
        !(new RegExp(r"(\d+)").hasMatch(spell))) {
      print('[警告]不能找到法术:${spell}@${spec}');
    }
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
  String filter;

  String getSpellNo(String spell) {
    if (name == spell || icon == spell || no == spell) {
      return no;
    }
    return null;
  }
}

void fetchAll() {
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

WOWSpellInfo buildSpellInfo(dynamic info, String minLevel, String filter) {
  var spell = info['spell'];
  var spellInfo = new WOWSpellInfo();
  spellInfo.passive = (info['passive']).toString() == 'true' || (spell['castTime']).toString() == '被动';
  spellInfo.icon = (spell['icon']).toString();
  spellInfo.no = (spell['icon']).toString();
  spellInfo.spellID = spell['id'] as int;
  spellInfo.name = (spell['name']).toString();
  spellInfo.filter = filter;
  spellInfo.htmlDescription = (spell['htmlDescription']).toString();
  spellInfo.minLevel = int.parse(minLevel);
  return spellInfo;
}

WOWClassInfo readClassInfo(int classID) {
  WOWClassInfo classInfo = AllClassInfo[classID - 1];
  var config = new File('.\\' + classID.toString() + '.json');
  String data = config.readAsStringSync();
  Map info = JSON.decode(data);

  //normal spells
  String key = 'spells';
  for (Map item in info['spells']) {
    classInfo.spells.add(buildSpellInfo(item, (item['minLevel']).toString(), ''));
  }

  //spec spells
  int maxspec = 3;
  if (classInfo.classID == 11) {
    maxspec = 4;
  } else if (classInfo.classID == 12) {
    maxspec = 2;
  }
  for (int specNo = 0; specNo < maxspec; specNo++) {
    var spec = info['specs'][specNo];
    String specName = spec['name'].toString();
    //print('specName='+specName);
    classInfo.specNames.add(specName);
    classInfo.specCnNames.add(spec['name'].toString());
    classInfo.specIDs.add(spec['id']);
    classInfo.specs.add([]);
    List spells = spec['spells'];
    for (var i = 0; i < spells.length; i++) {
      var spell = spells[i];
      classInfo.specs[specNo].add(buildSpellInfo(spell, (spell['minLevel']).toString(), 'spec:${spec['id']}'));
    }
  }

  //talent spells
  for (var talentNo = 0; talentNo < 21; talentNo++) {
    int no = ((talentNo - talentNo % 3) ~/ 3).toInt();
    for (dynamic talentSpells in info['talents'][no][talentNo % 3]) {
      int minLevel = (no + 1) * 15;
      if (minLevel >= 100) {
        minLevel = 100;
      }
      classInfo.talents.add(buildSpellInfo(talentSpells, minLevel.toString(), 'talent:${talentNo}_${talentSpells['specId']}'));
    }
  }
  return classInfo;
}

void main() {
  fetchAll();
}
