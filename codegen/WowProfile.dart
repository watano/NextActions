import 'dart:io';
import 'WowInfo.dart';
import 'Utils.dart';

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
    codeProfileNames += '[${p.profileID}]=\'${p.name}\',';
    commonCodes += p.commonCodes;
    keepHPCodes += p.keepHPCodes;
    attackAOECodes += p.attackAOECodes;
    attackCodes += p.attackCodes;
    assistCodes += p.assistCodes;
    keepBuffCodes += p.keepBuffCodes;

	if(actions.length>35){
		print(p.name + '==' + actions.length.toString());
	}
  }

  String code = '''
function getNA${classInfo.classID}Actions(no)
  if(no < 0)then return {};
${codeActions}  end
  return {};
end

NA${classInfo.classID}ProfileNames = {${codeProfileNames}};

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
