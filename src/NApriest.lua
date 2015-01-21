function getNA5Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'585','589','10060','14914','15487','21562','34433','47540','123040','129250','528','NA_ChagetTarget','527','33206','596','120517','110744','121135','2061','81700','17','152118','152116','33076','2060','132157','586','19236','112833','I5512'};
  elseif(no == 1)then
    return {'585','589','10060','14914','15487','21562','34433','48045','81209','88625','123040','129250','528','NA_ChagetTarget','47788','17','527','139','34861','33076','155245','596','152116','120517','121135','110744','32546','2061','2060','586','19236','112833','I5512'};
  elseif(no == 2)then
    return {'589','2944','8092','10060','15407','15473','15487','21562','32379','34433','34914','47585','48045','73510','110744','120644','121135','123040','129197','155361','NA_ChagetTarget','528','15286','586','19236','17','I5512'};
  end
  return {};
end

NA5ProfileNames = {[0]='Discipline',[1]='Holy',[2]='Shadow',};

function NA5Dps()
  W_Log(1,"牧师 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
        if(false
					or NA_Fire(NA_checkHP(0), '586', NA_Player) --渐隐术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,2), '112833', NA_Player) --幽灵伪装
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
        if(false
					or NA_Fire(NA_checkHP(0), '586', NA_Player) --渐隐术
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1) and NA_isUsableTalentSpell(1,2), '112833', NA_Player) --幽灵伪装
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
        if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '528', NA_Target) --驱散魔法
					or NA_Fire(NA_checkHP(1), '15286', NA_Player) --吸血鬼的拥抱
					or NA_Fire(NA_checkHP(0), '47585', NA_Player) --消散
					or NA_Fire(NA_checkHP(0), '586', NA_Player) --渐隐术
					or NA_Fire(NA_checkHP(1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '528', NA_Target) --驱散魔法
					or NA_Fire(NA_isUsableTalentSpell(3,2), '123040', NA_Target) --摧心魔
					or NA_Fire(not NA_isUsableTalentSpell(3,2), '34433', NA_Target) --暗影魔
					or NA_Fire(NA_isUsableTalentSpell(3,3), '129250', NA_Target) --真言术：慰
					or NA_Fire(not NA_isUsableTalentSpell(3,3), '14914', NA_Target) --神圣之火
					or NA_Fire(true, '585', NA_Target) --惩击
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_CheckBuff(NA_Target)==1, '528', NA_Target) --驱散魔法
					or NA_Fire(NA_isUsableTalentSpell(3,2), '123040', NA_Target) --摧心魔
					or NA_Fire(not NA_isUsableTalentSpell(3,2), '34433', NA_Target) --暗影魔
					or NA_Fire(NA_isUsableTalentSpell(3,3), '129250', NA_Target) --真言术：慰
					or NA_Fire(not NA_isUsableTalentSpell(3,3), '14914', NA_Target) --神圣之火
					or NA_Fire(true, '585', NA_Target) --惩击
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        local ayst = W_RetainBuff(NA_Target, -589, true);   --暗言术：痛
				local xxgzc = W_RetainBuff(NA_Target, -34914, true);   --吸血鬼之触
				local countShadowOrbs = UnitPower(NA_Player, 13);  --暗影宝珠
				local copdotwave = NA_isUsableTalentSpell(7,1) and NA_isUsableTalentSpell(3,3) and W_HPlevel(NA_Target)>0.2;
				local copmfi = NA_isUsableTalentSpell(7,1) and NA_isUsableTalentSpell(3,3) and W_HPlevel(NA_Target)<=0.2;
				local cop = NA_isUsableTalentSpell(7,1)
				local vent = NA_isUsableTalentSpell(7,2)
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        local zysd = W_RetainBuff(NA_Target, -17, true);   --真言术：盾
				local xrlh = W_RetainBuff(NA_Target, -6788, true);   --虚弱灵魂
				local tsz = W_RetainBuff(NA_Player, 81700, true);   --天使长
				local fycb = W_BuffCount(NA_Player, 81661);   --福音传播
				
				
        if(false
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==2, '527', NA_Target) --纯净术
					or NA_Fire(W_HPlevel(NA_Target)<0.4, '33206', NA_Target) --痛苦压制
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,100)>=3 and tsz, '596', NA_Target) --治疗祷言
					or NA_Fire(NA_isUsableTalentSpell(6,3) and NA_CountLowPlayers(NA_Player,0.9,900)>=3, '120517', NA_Player) --光晕
					or NA_Fire(NA_isUsableTalentSpell(6,2) and W_HPlevel(NA_Target)<=0.8, '110744', NA_Target) --神圣之星
					or NA_Fire(NA_isUsableTalentSpell(6,1) and NA_CountLowPlayers(NA_Target,0.8,900)>=3, '121135', NA_Target) --瀑流
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_RetainBuff(NA_Player, 115255, true), '2061', NA_Target) --快速治疗
					or NA_Fire((W_HPlevel(NA_Target)<0.7 and fycb>3) or W_BuffTime(NA_Player, 81661, true)<3, '81700', NA_Player) --天使长
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and not xrlh, '17', NA_Target) --真言术：盾
					or NA_Fire(NA_isUsableTalentSpell(7,1) and NA_CheckRoles(NA_Target)==1 and W_HPlevel(NA_Target)<0.8 and not W_RetainBuff(NA_Target, 152118, true), '152118', NA_Target) --意志洞悉
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_HPlevel(NA_Target)<0.7 and W_BuffCount(NA_Player, 152116)<=3, '152116', NA_Target) --救赎恩惠
					or NA_Fire(NA_isUsableTalentSpell(5,2) and W_HPlevel(NA_Target)<0.7, '10060', NA_Player) --能量灌注
					or NA_Fire(W_RetainBuff(NA_Player, 109964, true), '596', NA_Target) --治疗祷言
					or NA_Fire(W_HPlevel(NA_Target)<=0.8, '33076', NA_Target) --愈合祷言
					or NA_Fire(W_HPlevel(NA_Target)<=0.8, '47540', NA_Target) --苦修
					or NA_Fire(W_HPlevel(NA_Target)<=0.8, '2061', NA_Target) --快速治疗
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_HPlevel(NA_Target)>0.8, '2060', NA_Target) --治疗术
					or NA_Fire(NA_CountLowPlayers(NA_Player,0.8,144)>=3, '132157', NA_Player) --神圣新星
					or NA_Fire(W_HPlevel(NA_Target)>=0.9 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        local zysd2 = W_RetainBuff(NA_Target, -17, true);   --真言术：盾
				local xrlh2 = W_RetainBuff(NA_Target, -6788, true);   --虚弱灵魂
				local hf = W_RetainBuff(NA_Target, -139, true);   --恢复
				local mshc = W_BuffCount(NA_Player, 63735);   --妙手回春：减少治疗术和愈合祷言施法时间
				local qcxy = W_RetainBuff(NA_Player, 145327);   --虔诚信仰：强化治疗术和愈合祷言
				local hf = W_RetainBuff(NA_Target, -139, true);   --恢复
				local syzx = W_RetainBuff(NA_Player, 145336, true);   --宽仁之心:强化圣言术效果
				
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.4, '47788', NA_Target) --守护之魂
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and not xrlh2, '17', NA_Target) --真言术：盾
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==2, '527', NA_Target) --纯净术
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and not hf, '139', NA_Player) --恢复
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,900)>=3, '34861', NA_Target) --治疗之环
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and mshc>0, '33076', NA_Target) --愈合祷言
					or NA_Fire(NA_isUsableTalentSpell(7,1) and NA_CountLowPlayers(NA_Target,0.8,900)>=3, '155245', NA_Target) --清晰使命
					or NA_Fire(NA_isUsableTalentSpell(5,2) and W_HPlevel(NA_Target)<0.7, '10060', NA_Player) --能量灌注
					or NA_Fire(not NA_isUsableTalentSpell(7,1) and NA_CountLowPlayers(NA_Target,0.8,900)>=3, '596', NA_Target) --治疗祷言
					or NA_Fire(NA_isUsableTalentSpell(7,3) and W_HPlevel(NA_Target)<0.7 and W_BuffCount(NA_Player, 152116)<=3, '152116', NA_Target) --救赎恩惠
					or NA_Fire(NA_isUsableTalentSpell(6,3) and NA_CountLowPlayers(NA_Player,0.9,900)>=3, '120517', NA_Player) --光晕
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_HPlevel(NA_Target)<=0.8, '121135', NA_Target) --瀑流
					or NA_Fire(NA_isUsableTalentSpell(6,2) and W_HPlevel(NA_Target)<=0.8, '110744', NA_Target) --神圣之星
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '32546', NA_Target) --联结治疗
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '2061', NA_Target) --快速治疗
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and W_HPlevel(NA_Target)>0.7 and mshc>0, '2060', NA_Target) --治疗术
					or NA_Fire(W_HPlevel(NA_Target)>=0.9 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
				
        if(false

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Discipline
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,3))==0, '21562', NA_Player) --真言术：韧
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '2060', NA_Target) --治疗术

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Holy
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,3))==0, '21562', NA_Player) --真言术：韧
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '139', NA_Target) --恢复

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Shadow
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,3))==0, '21562', NA_Player) --真言术：韧
					or NA_Fire(not W_FormInfo(1), '15473', NA_Player) --暗影形态
					or NA_Fire(not ayst, '589', NA_Target) --暗言术：痛

      )then return true; end
    end
  end
  return false;
end
