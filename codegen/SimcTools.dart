import 'dart:io';
import 'Utils.dart';
import 'WowInfo.dart';
import 'SpellMapping.dart';

void initSpells(int classID, String specName) {
  for (int i = 0; i < AllEnglishSpells.length; i++) {
    Map spells = AllEnglishSpells[i];
    if (spells['classID'] == classID) {
      AllSpells.addAll(spells['spells']);
      return;
    }
  }
}

void simc(int classID, String specName, String simcFile) {
  initSpells(classID, specName);
  var f = new File(simcFile);
  List<String> lines = f.readAsLinesSync();

  for (String line in lines) {
    line = line.trim();
    if (line.startsWith('actions.aoe') || line.startsWith('actions.single_target') || line.startsWith('actions+=')) {
      print('#' + line);
      if (line.indexOf('=/use_item,') > 0 || line.indexOf('=/potion,') > 0 || line.indexOf('=/run_action_list,') > 0) {
        continue;
      }
      String cnd = line;
      String cmdType = "";
      String fireCmd = "..addattackCmd(";
      if (line.startsWith('actions.aoe')) {
        //p.addattackAOECmd(cnd, spell, target);
        cmdType = 'AOE';
        fireCmd = "..addattackAOECmd";
      } else if (line.startsWith('actions.single_target') || line.startsWith('actions+=')) {
        //p.addattackCmd(cnd, spell, target);
        cmdType = 'single_target';
        fireCmd = "..addattackCmd";
      }
      cnd = cnd.replaceAll('&', ' and ');
      cnd = cnd.replaceAll('|', ' or ');
      cnd = cnd.replaceAll('!', ' not ');
      cnd = cnd.replaceAll('runic_power', 'W_PowerLevel(NA_Player)');
      cnd = cnd.replaceAll('target.time_to_die', 'NA_TimeToDie(NA_Target)');
      cnd = cnd.replaceAll('target.health.pct', 'W_HPlevel(NA_Target)*100');
      cnd = cnd.replaceAll('enabled', 'true');
      cnd = cnd.replaceAll('!ticking', 'not hasquickshot');
      cnd = cnd.replaceAll('ticking', 'hasquickshot');
      cnd = cnd.replaceAll('five_stacks=1', 'W_BuffCount(NA_Player, 19615)>=5');
      cnd = cnd.replaceAll('five_stacks=1', 'W_BuffCount(NA_Player, 19615)>=5');

      cnd = regReplace(cnd, r'[,]*line_cd=\d+', '');

      cnd = regReplace(cnd, r'active_enemies>(\d+)', 'NA_IsAOE');

      cnd = regReplace(cnd, r'\/([\w]+),if=(.+)', '\\1@NA_Target=\\2');
      cnd = regReplace(cnd, r'([\w]+),if=(.+)', '\\1@NA_Target=\\2');

      cnd = regReplace(cnd, r'talent\.([\w]+)\.enabled', r'W_SpellEnabled("\1", NA_Player)');

      cnd = regReplaceBuff(cnd, r'pet.([\w]+).dot\.([\w]+)\.ticking', r'W_HasBuff(NA_Pet, "\2", true)');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).cooldown\.([\w]+)\.remains', r'W_BuffTime(NA_Pet, "\2", false)');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).dot\.([\w]+)\.remains', r'W_BuffTime(NA_Pet, "\2", false)');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).buff\.([\w]+)\.stack', r'W_BuffCount(NA_Pet, "\2")');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).buff\.([\w]+)\.react', r'W_HasBuff(NA_Pet, "\2")');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).buff\.([\w]+)\.up', r'W_HasBuff(NA_Pet, "\2")');
      cnd = regReplaceBuff(cnd, r'pet.([\w]+).buff\.([\w]+)\.down', r'W_HasBuff(NA_Pet, "\2")');

      cnd = regReplaceBuff(cnd, r'dot\.([\w]+)\.ticking', r'W_HasBuff(NA_Player, "\1", true)');
      cnd = regReplaceBuff(cnd, r'cooldown\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = regReplaceBuff(cnd, r'dot\.([\w]+)\.remains', r'W_BuffTime(NA_Player, "\1", false)');
      cnd = regReplaceBuff(cnd, r'buff\.([\w]+)\.stack', r'W_BuffCount(NA_Player, "\1")');
      cnd = regReplaceBuff(cnd, r'buff\.([\w]+)\.react', r'W_HasBuff(NA_Player, "\1")');
      cnd = regReplaceBuff(cnd, r'buff\.([\w]+)\.up', r'W_HasBuff(NA_Player, "\1")');
      cnd = regReplaceBuff(cnd, r'buff\.([\w]+)\.down', r'W_HasBuff(NA_Player, "\1")');

      cnd = regReplace(cnd, r'focus.deficit', 'W_PowerLevel(NA_Player)*10');
      cnd = regReplace(cnd, r'focus', 'W_PowerLevel(NA_Player)');
      cnd = regReplace(cnd, r'\/([\w]+)', '\\1@NA_Target=true');

      cnd = cnd.substring(cnd.indexOf('=') + 1);
      cnd = replaceSpell(cnd);

      cnd = regReplace(cnd, r'blood=(\d+)', r'W_StarCount(1)==\1');
      cnd = regReplace(cnd, r'unholy=(\d+)', r'W_StarCount(2)==\1');
      cnd = regReplace(cnd, r'frost=(\d+)', r'W_StarCount(3)==\1');
      cnd = regReplace(cnd, r'death=(\d+)', r'W_StarCount(4)==\1');
      cnd = regReplace(cnd, r'blood([><=]+)(\d+)', r'W_StarCount(1)\1\2');
      cnd = regReplace(cnd, r'unholy([><=]+)(\d+)', r'W_StarCount(2)\1\2');
      cnd = regReplace(cnd, r'frost([><=]+)(\d+)', r'W_StarCount(3)\1\2');
      cnd = regReplace(cnd, r'death([><=]+)(\d+)', r'W_StarCount(4)\1\2');

      cnd = regReplace(cnd, r'Blood', r'W_StarCount(1)');
      cnd = regReplace(cnd, r'Unholy', r'W_StarCount(2)');
      cnd = regReplace(cnd, r'Frost=', r'W_StarCount(3)');
      cnd = regReplace(cnd, r'Death', r'W_StarCount(4)');

      print(cnd);
    }
  }
}

String replaceSpell(String cnd) {
  String newCnd = cnd.trim();
  if (newCnd.indexOf('@') > 0) {
    String spellName = newCnd.substring(0, newCnd.indexOf('@'));
    if (spellName == 'dire_beast') {
      //print('dire_beast');
    }
    if (AllSpells[spellName] != null) {
      newCnd = newCnd.replaceFirst(spellName, AllSpells[spellName]);
    }
  }
  return newCnd;
}

String regReplaceBuff(String str, String regExp, String replace) {
  return str.replaceAllMapped(new RegExp(regExp, caseSensitive: false), (Match m) {
    String newReplace = replace;
    if (m.groupCount > 0) {
      for (int i = 0; i < m.groupCount + 1; i++) {
        String buff = m.group(i);
        if (AllBuffs[buff] != null) {
          buff = AllBuffs[buff].toString();
        }
        //print('\\'+i.toString() +'--'+ m.group(i) +'--'+m.groupCount.toString());
        newReplace = newReplace.replaceAll('\\' + i.toString(), buff);
      }
    }
    return newReplace;
  });
}

Map<String, int> parseOvaleDefine(String file) {
  RegExp p = new RegExp(r'Define[ \t]*\([ \t]*([a-zA-Z0-9_]+)[ \t]*([0-9_]+)[ \t]*\)', caseSensitive: false);
  Map<String, int> spellMapping = {};
  for (WOWClassInfo clsInfo in AllClassInfo) {
    for (String line in readFileLines(file)) {
      for (Match m in p.allMatches(line)) {
        if (m.groupCount > 0) {
          spellMapping[m.group(1)] = int.parse(m.group(2));
        }
      }
    }
  }
  return spellMapping;
}

void parseOvale(String OvaleHome, int classID, String script) {
  print(script);
  Map<String, int> spellMapping = {};

  //spellMapping.addAll(parseOvaleDefine(OvaleHome + 'scripts\\ovale_common.lua'));
  for (WOWClassInfo clsInfo in AllClassInfo) {
    if (clsInfo.classID == classID) {
      spellMapping.addAll(parseOvaleDefine(OvaleHome + 'scripts\\ovale_${clsInfo.enName}_spells.lua'));
      break;
    }
  }
  Set<int> spellList = new Set<int>();
  RegExp p = new RegExp(r'Spell[ \t]*\([ \t]*([a-zA-Z0-9_]+)\)', caseSensitive: false);
  for (String line in readFileLines(OvaleHome + 'scripts\\' + script)) {
    for (Match m in p.allMatches(line)) {
      if (m.groupCount > 0) {
        int spellId = spellMapping[m.group(1)];
        if (spellId != null && spellId > 0) {
          spellList.add(spellId);
        }
      }
    }
  }
  List<int> allSpellID = spellList.toList();
  allSpellID.sort();
  if(allSpellID.length>35){
    print('警告：技能数超过最大支持数！');
  }
  print("actions="+allSpellID.join(",")+"");
}

void main() {
  String OvaleHome = r'd:\games\wow\Interface\AddOns\Ovale\';
  parseOvale(OvaleHome, 1, 'simulationcraft_warrior_arms.lua');
  parseOvale(OvaleHome, 1, 'simulationcraft_warrior_fury_1h.lua');
  parseOvale(OvaleHome, 1, 'simulationcraft_warrior_protection.lua');

  parseOvale(OvaleHome, 2, 'simulationcraft_paladin_holy.lua');
  parseOvale(OvaleHome, 2, 'simulationcraft_paladin_protection.lua');
  parseOvale(OvaleHome, 2, 'simulationcraft_paladin_retribution.lua');

  parseOvale(OvaleHome, 3, 'simulationcraft_hunter_bm.lua');
  parseOvale(OvaleHome, 3, 'simulationcraft_hunter_mm.lua');
  parseOvale(OvaleHome, 3, 'simulationcraft_hunter_sv.lua');

  parseOvale(OvaleHome, 4, 'simulationcraft_rogue_assassination.lua');
  parseOvale(OvaleHome, 4, 'simulationcraft_rogue_combat.lua');
  parseOvale(OvaleHome, 4, 'simulationcraft_rogue_subtlety.lua');

  parseOvale(OvaleHome, 5, 'simulationcraft_priest_discipline_dmg.lua');
  parseOvale(OvaleHome, 5, 'simulationcraft_priest_holy_dmg.lua');
  parseOvale(OvaleHome, 5, 'simulationcraft_priest_shadow_as.lua');

  parseOvale(OvaleHome, 6, 'simulationcraft_deathknight_blood.lua');
  parseOvale(OvaleHome, 6, 'simulationcraft_deathknight_frost_1h.lua');
  parseOvale(OvaleHome, 6, 'simulationcraft_deathknight_frost_2h.lua');
  parseOvale(OvaleHome, 6, 'simulationcraft_deathknight_unholy.lua');

  parseOvale(OvaleHome, 7, 'simulationcraft_shaman_elemental.lua');
  parseOvale(OvaleHome, 7, 'simulationcraft_shaman_enhancement.lua');
//  parseOvale(OvaleHome, 7, 'simulationcraft_warlock_affliction.lua');

  parseOvale(OvaleHome, 8, 'simulationcraft_mage_arcane.lua');
  parseOvale(OvaleHome, 8, 'simulationcraft_mage_fire.lua');
  parseOvale(OvaleHome, 8, 'simulationcraft_mage_frost.lua');

  parseOvale(OvaleHome, 9, 'simulationcraft_warlock_affliction.lua');
  parseOvale(OvaleHome, 9, 'simulationcraft_warlock_demonology.lua');
  parseOvale(OvaleHome, 9, 'simulationcraft_warlock_destruction.lua');

  parseOvale(OvaleHome, 10, 'simulationcraft_monk_brewmaster_1h_ce.lua');
  parseOvale(OvaleHome, 10, 'simulationcraft_monk_brewmaster_1h_serenity.lua');
  parseOvale(OvaleHome, 10, 'simulationcraft_monk_windwalker_1h.lua');

  parseOvale(OvaleHome, 11, 'simulationcraft_druid_balance.lua');
  parseOvale(OvaleHome, 11, 'simulationcraft_druid_feral.lua');
  parseOvale(OvaleHome, 11, 'simulationcraft_druid_guardian.lua');

  //fetchCharacterSpell('杜隆坦','watanodk');

  //simc(6, 'Unholy', r'd:\games\wowtools\simc\profiles\Tier17P\Death_Knight_Unholy_T17P.simc');
  //simc('paladin', 2, 'Retribution', r'i:\wowtools\simc\profiles\PreRaid\Paladin_Retribution_PreRaid.simc');
//  simc('hunter', 3, 'Beastmaster', r'i:\wowtools\simc\profiles\PreRaid\Hunter_BM_PreRaid.simc');
  //simc(3, 'Beastmaster', r'd:\games\wowtools\simc\profiles\Tier17P\Hunter_BM_T17P.simc');
}
