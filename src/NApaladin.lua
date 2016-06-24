function getNA2Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'498','19740','19750','20217','20271','20925','24275','26573','31850','31935','35395','53595','53600','86659','96231','105593','105809','114157','114158','114163','114165','119072','136494','152262','633','642','62124','20154','6940','1022','1038','85673','25780'};
  elseif(no == 1)then
    return {'853','879','19740','20154','20217','20271','24275','31801','31884','35395','53385','53595','85256','85499','96231','105593','105809','114157','114158','114165','115750','152262','157048','498','633','642','19750','20925','6940','1022','85673'};
  elseif(no == 2)then
    return {'633','853','19740','19750','20165','20217','20271','20473','31842','82326','85499','85673','96231','105593','115750','53563','156910','498','642','6940','1022','114163','114165'};
  end
  return {};
end

NA2ProfileNames = {[0]='防骑',[1]='惩戒骑',[2]='奶骑',};

function NA2Dps()
  W_Log(1,"圣骑士 dps");
  local hastorch_thrown = W_HasBuff(NA_Target, 114163, true);  --永恒之火
	
	
	local hastorch_thrown = W_HasBuff(NA_Target, 114163, true);  --永恒之火
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --防骑
      
      if(false
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(1), '105809', NA_Player) --神圣复仇者
					or NA_Fire(NA_checkHP(2) or not NA_isUsableTalentSpell(7,2) or (not W_RetainBuff(NA_Player, 152262, true) and W_GetSpellCooldown(152262)>5 and W_GetSpellCooldown(152262)<9), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(7,2) and not W_RetainBuff(NA_Player, 498, true) and W_GetSpellCooldown(498)>0, '152262', NA_Player) --炽天使
					or NA_Fire(NA_checkHP(1) and not W_RetainBuff(NA_Player, 105809, true) and not W_RetainBuff(NA_Player, 53600, true) and not W_RetainBuff(NA_Player, 498, true), '86659', NA_Player) --远古列王守卫
					or NA_Fire(NA_checkHP(0), '633', NA_Player) --圣疗术
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 105809, true) and not W_RetainBuff(NA_Player, 53600, true) and not W_RetainBuff(NA_Player, 498, true) and not W_RetainBuff(NA_Player, 86659, true), '31850', NA_Player) --炽热防御者
					or NA_Fire(W_HPlevel(NA_Player)<0.05, '642', NA_Player) --圣盾术
					or NA_Fire(W_RetainBuff(NA_Player, 642, true), '62124', NA_Target) --清算
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_BuffTime(NA_Player, 114163)<2 and W_BuffCount(NA_Player, 114637)>2 and (W_PaladinPower(NA_Player)>=3 or W_RetainBuff(NA_Player, 86172, true) or W_RetainBuff(NA_Player, 114637, true)), '114163', NA_Player) --永恒之火
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_RetainBuff(NA_Player, 114637, true) and W_BuffCount(NA_Player, 114637)>=5, '114163', NA_Player) --永恒之火
					or NA_Fire(not NA_isUsableTalentSpell(3,2) and W_RetainBuff(NA_Player, 114637, true) and W_BuffCount(NA_Player, 114637)>=5 and NA_checkHP(1), '85673', NA_Player) --荣耀圣令
					or NA_Fire(NA_isUsableTalentSpell(3,3) and W_BuffTime(NA_Player, 20925)<8, '20925', NA_Player) --圣洁护盾
					or NA_Fire(NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 85804)>=3, '19750', NA_Player) --圣光闪现

      )then return true; end
    elseif(NA_ProfileNo == 1)then --惩戒骑
      
      if(false
					or NA_Fire(W_HPlevel(NA_Player) < 0.7 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.8), '85673', NA_Target) --荣耀圣令
					or NA_Fire(W_HPlevel(NA_Player) < 0.1 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.2), '633', NA_Target) --圣疗术
					or NA_Fire(NA_checkHP(1), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(0), '633', NA_Player) --圣疗术
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '642', NA_Player) --圣盾术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 114250)==3, '19750', NA_Player) --圣光闪现
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(3,3), '20925', NA_Player) --圣洁护盾

      )then return true; end
    elseif(NA_ProfileNo == 2)then --奶骑
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防骑
        local notTanking = not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(1), '105809', NA_Player) --神圣复仇者
					or NA_Fire(NA_checkHP(2) or not NA_isUsableTalentSpell(7,2) or (not W_RetainBuff(NA_Player, 152262, true) and W_GetSpellCooldown(152262)>5 and W_GetSpellCooldown(152262)<9), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(7,2) and not W_RetainBuff(NA_Player, 498, true) and W_GetSpellCooldown(498)>0, '152262', NA_Player) --炽天使
					or NA_Fire(NA_checkHP(1) and not W_RetainBuff(NA_Player, 105809, true) and not W_RetainBuff(NA_Player, 53600, true) and not W_RetainBuff(NA_Player, 498, true), '86659', NA_Player) --远古列王守卫
					or NA_Fire(NA_checkHP(0), '633', NA_Player) --圣疗术
					or NA_Fire(NA_checkHP(0) and not W_RetainBuff(NA_Player, 105809, true) and not W_RetainBuff(NA_Player, 53600, true) and not W_RetainBuff(NA_Player, 498, true) and not W_RetainBuff(NA_Player, 86659, true), '31850', NA_Player) --炽热防御者
					or NA_Fire(W_HPlevel(NA_Player)<0.05, '642', NA_Player) --圣盾术
					or NA_Fire(W_RetainBuff(NA_Player, 642, true), '62124', NA_Target) --清算
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_BuffTime(NA_Player, 114163)<2 and W_BuffCount(NA_Player, 114637)>2 and (W_PaladinPower(NA_Player)>=3 or W_RetainBuff(NA_Player, 86172, true) or W_RetainBuff(NA_Player, 114637, true)), '114163', NA_Player) --永恒之火
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_RetainBuff(NA_Player, 114637, true) and W_BuffCount(NA_Player, 114637)>=5, '114163', NA_Player) --永恒之火
					or NA_Fire(W_RetainBuff(NA_Player, 86172, true), '53600', NA_Target) --正义盾击
					or NA_Fire((W_PaladinPower(NA_Player)>=5 or NA_isUsableTalentSpell(5,1)) and (not NA_isUsableTalentSpell(7,2) or W_GetSpellCooldown(152262)>5), '53600', NA_Target) --正义盾击
					or NA_Fire(W_GetSpellCooldown(105809)>5 and (not NA_isUsableTalentSpell(7,2) or W_GetSpellCooldown(152262)>5), '53600', NA_Target) --正义盾击
					or NA_Fire(W_RetainBuff(NA_Player, 85043, true) and not NA_CheckGlyph(191), '31935', NA_Target) --复仇者之盾
					or NA_Fire(NA_isUsableTalentSpell(5,2) and (W_RetainBuff(NA_Player, 152262, true) or (NA_CheckGlyph(194) and W_HPlevel(NA_Target) <=0.2)), '119072', NA_Target) --神圣愤怒
					or NA_Fire(true, '53595', NA_Target) --正义之锤
					or NA_Fire(NA_isUsableTalentSpell(7,1) and (not W_RetainBuff(NA_Player, 156990, true) or not W_RetainBuff(NA_Player, 156989, true)), '20271', NA_Target) --审判
					or NA_Fire(true, '35395', NA_Target) --十字军打击
					or NA_Fire(NA_CheckGlyph(183), '20271', NA_Target) --审判
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(not NA_CheckGlyph(191), '31935', NA_Target) --复仇者之盾
					or NA_Fire(NA_isUsableTalentSpell(5,2), '119072', NA_Target) --神圣愤怒
					or NA_Fire(W_RetainBuff(NA_Player, 85043, true), '31935', NA_Target) --复仇者之盾
					or NA_Fire(NA_isUsableTalentSpell(3,3) and W_BuffTime(NA_Player, 20925)<2, '20925', NA_Player) --圣洁护盾
					or NA_Fire(NA_isUsableTalentSpell(6,3), '114157', NA_Target) --处决宣判
					or NA_Fire(NA_CheckGlyph(194) and W_HPlevel(NA_Target)<=0.2, '119072', NA_Target) --神圣愤怒
					or NA_Fire(true, '31935', NA_Target) --复仇者之盾
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_FormInfo(2) and W_BuffTime(NA_Player, 156990)<4 and not W_RetainBuff(NA_Player, 156989, true), '20154', NA_Target) --正义圣印
					or NA_Fire(NA_isUsableTalentSpell(6,2), '114158', NA_Target) --圣光之锤
					or NA_Fire(NA_isUsableTalentSpell(6,1), '114165', NA_Player) --神圣棱镜
					or NA_Fire(true, '26573', NA_Player) --奉献
					or NA_Fire(NA_isUsableTalentSpell(6,3), '114157', NA_Target) --处决宣判
					or NA_Fire(true, '24275', NA_Target) --愤怒之锤
					or NA_Fire(NA_isUsableTalentSpell(3,3) and W_BuffTime(NA_Player, 20925)<8, '20925', NA_Player) --圣洁护盾
					or NA_Fire(true, '119072', NA_Target) --神圣愤怒
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_FormInfo(2) and W_BuffTime(NA_Player, 156989)<W_BuffTime(NA_Player, 156990), '20154', NA_Player) --正义圣印
					or NA_Fire(NA_isUsableTalentSpell(3,3), '20925', NA_Player) --圣洁护盾
					or NA_Fire(NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 85804)>=3, '19750', NA_Player) --圣光闪现

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(notTanking, '62124', NA_Target) --清算
					or NA_Fire(true, '119072', NA_Target) --神圣愤怒
					or NA_Fire(true, '26573', NA_Player) --奉献
					or NA_Fire(true, '31935', NA_Target) --复仇者之盾
					or NA_Fire(true, '53600', NA_Target) --正义盾击
					or NA_Fire(true, '53595', NA_Target) --正义之锤
					or NA_Fire(true, '20271', NA_Target) --审判

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(1), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(0), '633', NA_Player) --圣疗术
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '642', NA_Player) --圣盾术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 114250)==3, '19750', NA_Player) --圣光闪现
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(3,3), '20925', NA_Player) --圣洁护盾
					or NA_Fire(NA_isUsableTalentSpell(1,1), '85499', NA_Player) --圣光之速
					or NA_Fire(NA_isUsableTalentSpell(7,1), '20271', NA_Target) --审判
					or NA_Fire(NA_isUsableTalentSpell(6,3), '114157', NA_Target) --处决宣判
					or NA_Fire(NA_isUsableTalentSpell(6,2), '114158', NA_Target) --圣光之锤
					or NA_Fire(NA_isUsableTalentSpell(5,1) and W_RetainBuff(NA_Player, 152262, true) and NA_isUsableTalentSpell(7,2), '105809', NA_Player) --神圣复仇者
					or NA_Fire(NA_isUsableTalentSpell(5,1) and W_PaladinPower(NA_Player)<=2 and not NA_isUsableTalentSpell(7,2), '105809', NA_Player) --神圣复仇者
					or NA_Fire(W_RetainBuff(NA_Player, 152262, true) and NA_isUsableTalentSpell(7,2), '31884', NA_Player) --复仇之怒
					or NA_Fire(not NA_isUsableTalentSpell(7,2), '31884', NA_Player) --复仇之怒
					or NA_Fire(NA_isUsableTalentSpell(7,2), '152262', NA_Player) --炽天使
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_PaladinPower(NA_Player)==5 and W_RetainBuff(NA_Player, 157048, true), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_PaladinPower(NA_Player)==5 and not NA_isUsableTalentSpell(7,3), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_PaladinPower(NA_Player)==5 and W_RetainBuff(NA_Player, 157048, true), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_PaladinPower(NA_Player)==5 and (NA_isUsableTalentSpell(7,2) and W_GetSpellCooldown(152262)<=5), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_PaladinPower(NA_Player)==5 or W_RetainBuff(NA_Player, 105809, true) and W_PaladinPower(NA_Player)>=3 and (not NA_isUsableTalentSpell(7,2) or W_GetSpellCooldown(152262)>5), '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_BuffTime(NA_Player, 144595)<4 and not NA_isUsableTalentSpell(7,3), '53385', NA_Target) --神圣风暴
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_PaladinPower(NA_Player)==5 or W_RetainBuff(NA_Player, 105809, true) and W_PaladinPower(NA_Player)>=3, '157048', NA_Target) --最终审判
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_RetainBuff(NA_Player, 86172, true) and W_BuffTime(NA_Player, 86172)<4, '157048', NA_Target) --最终审判
					or NA_Fire(true, '24275', NA_Target) --愤怒之锤
					or NA_Fire(NA_isUsableTalentSpell(7,1) and W_FormInfo(1) and W_BuffTime(NA_Player, 156990)<W_GetSpellCooldown(20271), '20271', NA_Target) --审判
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(W_RetainBuff(NA_Player, 166831, true) and W_PaladinPower(NA_Player)<=2 and not W_RetainBuff(NA_Player, 105809, true), '879', NA_Target) --驱邪术
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Player, 156989, true) and not W_RetainBuff(NA_Player, 31884, true) and not W_RetainBuff(NA_Player, 32182, true) and not W_RetainBuff(NA_Player, 80353, true), '20154', NA_Player) --正义圣印
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_RetainBuff(NA_Player, 157048, true) and (W_RetainBuff(NA_Player, 31884, true) or W_HPlevel(NA_Target)<0.35), '53385', NA_Target) --神圣风暴
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_RetainBuff(NA_Player, 31884, true) or W_HPlevel(NA_Target)<0.35, '157048', NA_Target) --最终审判
					or NA_Fire(W_RetainBuff(NA_Player, 31884, true) or W_HPlevel(NA_Target)<0.35 and (not NA_isUsableTalentSpell(7,2) or W_GetSpellCooldown(152262)>6), '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(W_PaladinPower(NA_Player)<5, '35395', NA_Target) --十字军打击
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and (W_RetainBuff(NA_Player, 31884, true) or W_HPlevel(NA_Target)<0.35) and not NA_isUsableTalentSpell(7,3), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and W_RetainBuff(NA_Player, 157048, true), '53385', NA_Target) --神圣风暴
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_RetainBuff(NA_Player, 86172, true), '157048', NA_Target) --最终审判
					or NA_Fire(W_PaladinPower(NA_Player)>=4, '157048', NA_Target) --最终审判
					or NA_Fire(NA_CheckGlyph(1009) and W_PaladinPower(NA_Player)<5 and W_GetSpellCooldown(152262)>3, '879', NA_Target) --驱邪术
					or NA_Fire(W_RetainBuff(NA_Player, 86172, true), '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(W_RetainBuff(NA_Player, 144595, true) and not NA_isUsableTalentSpell(7,3), '53385', NA_Target) --神圣风暴
					or NA_Fire(W_PaladinPower(NA_Player)>=4 and (not NA_isUsableTalentSpell(7,3) or W_GetSpellCooldown(152262)>7), '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(NA_isUsableTalentSpell(7,1) and W_BuffTime(NA_Player, 156989)<W_GetSpellCooldown(20271) and not W_RetainBuff(NA_Player, 32182, true) and not W_RetainBuff(NA_Player, 80353, true), '20154', NA_Player) --正义圣印
					or NA_Fire(W_PaladinPower(NA_Player)<5, '879', NA_Target) --驱邪术
					or NA_Fire(W_PaladinPower(NA_Player)>=3 and (not NA_isUsableTalentSpell(7,3) or W_GetSpellCooldown(152262)>9), '85256', NA_Target) --圣殿骑士的裁决
					or NA_Fire(NA_isUsableTalentSpell(6,1), '114165', NA_Target) --神圣棱镜

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target) < 0.2, '24275', NA_Target) --愤怒之锤
					or NA_Fire(NA_IsSolo and W_HPlevel(NA_Player) < 0.8, '114165', NA_Target) --神圣棱镜
					or NA_Fire(W_PaladinPower(NA_Player)>2, '53385', NA_Target) --神圣风暴
					or NA_Fire(true, '53595', NA_Target) --正义之锤
					or NA_Fire(true, '879', NA_Target) --驱邪术
					or NA_Fire(true, '20271', NA_Target) --审判
					or NA_Fire(true, '114165', NA_Target) --神圣棱镜

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --奶骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 85804)<3, '20271', NA_Target) --审判
					or NA_Fire(W_PaladinPower(NA_Player)<=3, '20473', NA_Target) --神圣震击
					or NA_Fire(W_PaladinPower(NA_Player)<3, '20271', NA_Target) --审判

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防骑
        
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and W_HPlevel(NA_Player)>0.7 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target) < 0.6 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 1022, true), '1022', NA_Target) --保护之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target) < 0.9 and not UnitIsUnit(NA_Player,NA_Target), '1038', NA_Target) --拯救之手

        )then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and W_HPlevel(NA_Player)>0.7 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target) < 0.6 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 1022, true), '1022', NA_Target) --保护之手

        )then return true; end
      elseif(NA_ProfileNo == 2)then --奶骑
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1 and not W_RetainBuff(NA_Target, 53563, true), '53563', NA_Target) --圣光道标
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Target, 156910, true) and W_HPlevel(NA_Target)<0.9, '156910', NA_Target) --信仰道标
					or NA_Fire(NA_checkHP(1), '498', NA_Player) --圣佑术
					or NA_Fire(NA_checkHP(0), '642', NA_Player) --圣盾术
					or NA_Fire(W_HPlevel(NA_Target)<0.3, '633', NA_Target) --圣疗术
					or NA_Fire(true, '20473', NA_Target) --神圣震击
					or NA_Fire(NA_CheckGlyph(1068) and W_HPlevel(NA_Target) < 0.4 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(not NA_CheckGlyph(1068) and W_HPlevel(NA_Target) < 0.4 and W_HPlevel(NA_Player)>0.7 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target)<0.6 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 1022, true), '1022', NA_Target) --保护之手
					or NA_Fire(NA_isUsableTalentSpell(3,2) and not hastorch_thrown and W_PaladinPower(NA_Player)>=3 and W_HPlevel(NA_Target)<0.9, '114163', NA_Target) --永恒之火
					or NA_Fire(not NA_isUsableTalentSpell(3,2) and W_PaladinPower(NA_Player)>=3 and W_HPlevel(NA_Target) < 0.9, '85673', NA_Target) --荣耀圣令
					or NA_Fire(W_HPlevel(NA_Target) < 0.7, '19750', NA_Target) --圣光闪现
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_RetainBuff(NA_Player, 54149, true), '82326', NA_Target) --圣光术
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_HPlevel(NA_Target) < 0.9, '114165', NA_Target) --神圣棱镜
					or NA_Fire(W_HPlevel(NA_Target) < 0.7, '31842', NA_Target) --复仇之怒

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --防骑
      
      if(false
					or NA_Fire(NA_ProfileNo == 0 and not W_HasBuff(NA_Player, 25780, true), '25780', NA_Player) --正义之怒
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '20217', NA_Player) --王者祝福
					or NA_Fire(select(8,UnitBuff(NA_Player, "王者祝福"))~=NA_Player and select(3,UnitStat(NA_Player,1))>0, '19740', NA_Player) --力量祝福
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判

      )then return true; end
    elseif(NA_ProfileNo == 1)then --惩戒骑
      
      if(false
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判
					or NA_Fire(W_TargetCanAttack(), '879', NA_Target) --驱邪术
					or NA_Fire(not W_HasBuff(NA_Player, 19740, true) and not W_HasBuff(NA_Player, 20217, true), '20217', NA_Target) --王者祝福

      )then return true; end
    elseif(NA_ProfileNo == 2)then --奶骑
      
      if(false
					or NA_Fire(W_HPlevel(NA_Target)<1, '20473', NA_Target) --神圣震击

      )then return true; end
    end
  end
  return false;
end
