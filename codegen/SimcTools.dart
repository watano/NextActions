import 'dart:io';
import 'dart:convert';
import 'Utils.dart';
import 'WowInfo.dart';


Map<int, WOWSpellInfo> allSpellInfo = {};

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

void simc(int classID, String specName, String simcFile){
  allSpellInfo = readAllSpellInfo(classID);
  var f = new File(simcFile);
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
//  if(allSpellMap[spell] != null){
//    return allSpellMap[spell];
//  }
//  if(allSpellMap[spell+":"+spec] != null){
//    return allSpellMap[spell+":"+spec];
//  }
//  allMissSpells.add(spell);
  return spell;
}

void main(){
  //fetchCharacterSpell('杜隆坦','watanodk');
  //simc('death_knight', 6, 'Frost', r'i:\wowtools\simc\profiles\Tier14H\Death_Knight_Frost_2h_T14H.simc');
  //simc('paladin', 2, 'Retribution', r'i:\wowtools\simc\profiles\PreRaid\Paladin_Retribution_PreRaid.simc');
//  simc('hunter', 3, 'Beastmaster', r'i:\wowtools\simc\profiles\PreRaid\Hunter_BM_PreRaid.simc');
  simc(3, 'Beastmaster', r'd:\games\wowtools\simc\profiles\Tier16M\Hunter_BM_T16M.simc');
}