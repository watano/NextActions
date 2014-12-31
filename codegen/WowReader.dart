import 'dart:convert';
import 'WowInfo.dart';
import 'Utils.dart';

void main() {
  //fetchUser();
  writeAllSpellInfo();
}

void fetchUser() {
//  var region = 'www.battlenet.com.cn';
  var region = 'localhost:8001/DartWeb/json';
  String realm = '杜隆坦';
  String account = 'watanodk';
  String url = Uri.encodeFull('http://${region}/api/wow/character/${realm}/${account}?fields=items');

  print(url);
  var itemTypes = ['head','neck','shoulder','back','chest','shirt','tabard','wrist','hands','waist','legs','feet','finger1','finger2','trinket1','trinket2','mainHand'];
  getUrl(url, (String data){
    var info = JSON.decode(data);
    print(info['realm']);
  });
}

String spellInfo2Code(WOWSpellInfo spell){
  return '${spell.name}=${spell.spellID},${spell.filter},${spell.minLevel},${spell.passive.toString()},${spell.icon},${spell.htmlDescription}';
}

void writeAllSpellInfo(){
  String code = '';
  for (int classID=1;classID<12; classID++) {
    WOWClassInfo classInfo = readClassInfo(classID);
    code += '[${classInfo.enName}]\n';
    for(WOWSpellInfo spell in classInfo.spells){
      code += '${spellInfo2Code(spell)}\n';
    }
    for(int i=0; i<classInfo.specNames.length; i++){
      code += '[${classInfo.enName}.${classInfo.specNames[i]}]\n';
      for(WOWSpellInfo spell in classInfo.specs[i]){
        code += '${spellInfo2Code(spell)}\n';
      }
    }
    code += '[${classInfo.enName}.talents]\n';
    for(WOWSpellInfo spell in classInfo.talents){
      code += '${spellInfo2Code(spell)}\n';
    }
  }
  writeToFile(r'AllSpellInfo.ini', code, encoding: 'utf-8');
}