import 'dart:io';
import 'dart:convert';
import 'Utils.dart';
import 'WowInfo.dart';

void simc(int classID, String specName, String simcFile){
  WOWClassInfo classInfo = readClassInfo(classID);
}

Map<int, WOWSpellInfo> readAllSpellInfo(int classID) {
  var config = new File('.\\' + classID.toString() + '.json');
  String data = config.readAsStringSync();
  Map info = JSON.decode(data);

  Map<int, WOWSpellInfo> allSpellInfo = {};
  //normal spells
  WOWSpellInfo spell = null;
  String key = 'spells';
  for (Map item in info['spells']) {
    spell = buildSpellInfo(item, (item['minLevel']).toString());
    allSpellInfo[spell.spellID] = spell;
  }

  //spec spells
  int maxspec = 3;
  if (classID == 11) {
    maxspec = 4;
  }
  for (int specNo = 0; specNo < maxspec; specNo++) {
    var spec = info['specs'][specNo];
    String specName = spec['bg'].toString();
    specName = specName.substring(specName.lastIndexOf('-') + 1, specName.length);
    specName = specName.substring(0, 1).toUpperCase() + specName.substring(1);
    List spells = spec['spells'];
    for (var i = 0; i < spells.length; i++) {
      var spell = spells[i];
      spell = buildSpellInfo(spell, (spell['minLevel']).toString());
      spell.specName = specName;
      allSpellInfo[spell.spellID] = spell;
    }
  }

  //talent spells
  for (var talentNo = 0; talentNo < 18; talentNo++) {
    int no = ((talentNo - talentNo % 3) ~/ 3).toInt();
    spell = buildSpellInfo(info['talents'][no][talentNo % 3][0], ((no + 1) * 15).toString());
    spell.specName = 'talents';
    allSpellInfo[spell.spellID] = spell;
  }
  return allSpellInfo;
}

void main(){
  //fetchCharacterSpell('杜隆坦','watanodk');
  //simc('death_knight', 6, 'Frost', r'i:\wowtools\simc\profiles\Tier14H\Death_Knight_Frost_2h_T14H.simc');
  //simc('paladin', 2, 'Retribution', r'i:\wowtools\simc\profiles\PreRaid\Paladin_Retribution_PreRaid.simc');
//  simc('hunter', 3, 'Beastmaster', r'i:\wowtools\simc\profiles\PreRaid\Hunter_BM_PreRaid.simc');
  simc(3, 'Beastmaster', r'd:\games\wowtools\simc\profiles\Tier16M\Hunter_BM_T16M.simc');
}