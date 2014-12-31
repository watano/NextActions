import 'dart:io';
import 'Utils.dart';
import 'SpellMapping.dart';

Map AllTalents = {
  'stampede':'',

};

void initSpells(int classID, String specName){
  for(int i=0;i<AllEnglishSpells.length; i++){
    Map spells = AllEnglishSpells[i];
    if(spells['classID'] == classID){
      AllSpells.addAll(spells['spells']);
      return;
    }
  }
}

void simc(int classID, String specName, String simcFile){
  initSpells(classID, specName);
  var f = new File(simcFile);
  List<String> lines = f.readAsLinesSync();

  for(String line in lines){
    line = line.trim();
    if(line.startsWith('actions.aoe') || line.startsWith('actions.single_target') || line.startsWith('actions+=')){
      print('#'+line);
      if(line.indexOf('=/use_item,')>0 || line.indexOf('=/potion,')>0 || line.indexOf('=/run_action_list,')>0){
        continue;
      }
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

      cnd = cnd.substring(cnd.indexOf('=')+1);
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

String replaceSpell(String cnd){
  String newCnd = cnd.trim();
  if(newCnd.indexOf('@')>0){
    String spellName = newCnd.substring(0, newCnd.indexOf('@'));
    if(spellName == 'dire_beast'){
      //print('dire_beast');
    }
    if(AllSpells[spellName] != null){
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
        if(AllBuffs[buff] != null){
          buff = AllBuffs[buff].toString();
        }
        //print('\\'+i.toString() +'--'+ m.group(i) +'--'+m.groupCount.toString());
        newReplace = newReplace.replaceAll('\\' + i.toString(), buff);
      }
    }
    return newReplace;
  });
}

void main(){
  //fetchCharacterSpell('杜隆坦','watanodk');
  simc(6, 'Unholy', r'd:\games\wowtools\simc\profiles\Tier17P\Death_Knight_Unholy_T17P.simc');
  //simc('paladin', 2, 'Retribution', r'i:\wowtools\simc\profiles\PreRaid\Paladin_Retribution_PreRaid.simc');
//  simc('hunter', 3, 'Beastmaster', r'i:\wowtools\simc\profiles\PreRaid\Hunter_BM_PreRaid.simc');
  //simc(3, 'Beastmaster', r'd:\games\wowtools\simc\profiles\Tier17P\Hunter_BM_T17P.simc');
}