function getNA2Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'498','19740','19750','20217','20271','20925','24275','26573','31850','31935','35395','53595','53600','86659','96231','105593','105809','114157','114158','114163','114165','119072','136494','152262','62124','4987','6940','1022','1038','633','642','85673','I5512','25780'};
  elseif(no == 1)then
    return {'853','879','19740','20154','20217','20271','24275','31801','31884','35395','53385','53595','85256','85499','96231','105593','105809','114157','114158','114165','115750','152262','157048','4987','6940','1022','85673','633','498','642','19750','20925','I5512'};
  elseif(no == 2)then
    return {'633','853','19740','19750','20165','20217','20271','20473','31842','82326','85499','85673','96231','105593','115750','53563','156910','498','642','4987','6940','1022','85222','114163','82327','114165','I5512'};
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
					or NA_Fire(NA_CheckDebuff(NA_Player)==1 or NA_CheckDebuff(NA_Player)==2 or NA_CheckDebuff(NA_Player)==3, '4987', NA_Player) --清洁术
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_BuffTime(NA_Player, 114163)<2 and W_BuffCount(NA_Player, 114637)>2 and (W_PaladinPower(NA_Player)>=3 or W_RetainBuff(NA_Player, 86172, true) or W_RetainBuff(NA_Player, 114637, true)), '114163', NA_Player) --永恒之火
					or NA_Fire(NA_isUsableTalentSpell(3,2) and W_RetainBuff(NA_Player, 114637, true) and W_BuffCount(NA_Player, 114637)>=5, '114163', NA_Player) --永恒之火
					or NA_Fire(not NA_isUsableTalentSpell(3,2) and W_RetainBuff(NA_Player, 114637, true) and W_BuffCount(NA_Player, 114637)>=5 and NA_checkHP(1), '85673', NA_Player) --荣耀圣令
					or NA_Fire(NA_isUsableTalentSpell(3,3) and W_BuffTime(NA_Player, 20925)<8, '20925', NA_Player) --圣洁护盾
					or NA_Fire(NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 85804)>=3, '19750', NA_Player) --圣光闪现
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

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
					or NA_Fire(NA_CheckDebuff(NA_Player)==1 or NA_CheckDebuff(NA_Player)==2 or NA_CheckDebuff(NA_Player)==3, '4987', NA_Player) --清洁术
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 2)then --奶骑
      
      if(false
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
      
    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防骑
        local notTanking = not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(notTanking, '62124', NA_Target) --清算

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(notTanking, '62124', NA_Target) --清算

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判
					or NA_Fire(W_TargetCanAttack(), '879', NA_Target) --驱邪术

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(W_TargetCanAttack(), '20271', NA_Target) --审判
					or NA_Fire(W_TargetCanAttack(), '879', NA_Target) --驱邪术

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --奶骑
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_isUsableTalentSpell(3,1) and W_BuffCount(NA_Player, 85804)<3, '20271', NA_Target) --审判
					or NA_Fire(W_PaladinPower(NA_Player)<=3, '20473', NA_Target) --神圣震击
					or NA_Fire(W_PaladinPower(NA_Player)<3, '20271', NA_Target) --审判
					or NA_Fire(NA_isUsableTalentSpell(2,1) and NA_SpellInterrupt(NA_Target), '105593', NA_Target) --制裁之拳

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
					or NA_Fire(NA_CheckDebuff(NA_Target)==2 or NA_CheckDebuff(NA_Target)==3, '4987', NA_Target) --清洁术
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and W_HPlevel(NA_Player)>0.7 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target) < 0.6 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 1022, true), '1022', NA_Target) --保护之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target) < 0.9 and not UnitIsUnit(NA_Player,NA_Target), '1038', NA_Target) --拯救之手

        )then return true; end
      elseif(NA_ProfileNo == 1)then --惩戒骑
        
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==2 or NA_CheckDebuff(NA_Target)==3, '4987', NA_Target) --清洁术
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
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==2 or NA_CheckDebuff(NA_Target)==3, '4987', NA_Target) --清洁术
					or NA_Fire(true, '20473', NA_Target) --神圣震击
					or NA_Fire(NA_CheckGlyph(1068) and W_HPlevel(NA_Target) < 0.4 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(W_RetainBuff(NA_Player, 88821, true) and NA_CountLowPlayers(NA_Target,0.9,100)>3 and W_HPlevel(NA_Target)<0.9, '20473', NA_Target) --神圣震击
					or NA_Fire(not NA_CheckGlyph(1068) and W_HPlevel(NA_Target) < 0.4 and W_HPlevel(NA_Player)>0.7 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 6940, true), '6940', NA_Target) --牺牲之手
					or NA_Fire(NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target)<0.6 and not UnitIsUnit(NA_Player,NA_Target) and not W_RetainBuff(NA_Target, 1022, true), '1022', NA_Target) --保护之手
					or NA_Fire(NA_CountLowPlayers(NA_Player,0.9,900)>3 and W_PaladinPower(NA_Player)>=3 and W_RetainBuff(NA_Player, 31842, true), '85222', NA_Target) --黎明圣光
					or NA_Fire(NA_isUsableTalentSpell(3,2) and not hastorch_thrown and W_PaladinPower(NA_Player)>=3 and W_HPlevel(NA_Target)<0.9, '114163', NA_Target) --永恒之火
					or NA_Fire(not NA_isUsableTalentSpell(3,2) and W_PaladinPower(NA_Player)>=3 and W_HPlevel(NA_Target) < 0.9, '85673', NA_Target) --荣耀圣令
					or NA_Fire(W_HPlevel(NA_Target) < 0.7, '19750', NA_Target) --圣光闪现
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.5,100)>3 and W_RetainBuff(NA_Player, 31842, true), '82327', NA_Target) --圣光普照
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_RetainBuff(NA_Player, 54149, true), '82326', NA_Target) --圣光术
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_HPlevel(NA_Target) < 0.9, '114165', NA_Target) --神圣棱镜
					or NA_Fire(W_HPlevel(NA_Target) < 0.7, '31842', NA_Target) --复仇之怒

        )then return true; end
      end
    elseif(NA_IsSolo)then --solo时切换目标
      return NA_ChagetTarget();      
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
