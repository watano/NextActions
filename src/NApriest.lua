function getNA5Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'123040','14914','585','47540','15487','528','33206','596','120517','132157','17','527','81700','33076','2061','2060','586','19236','21562'};
  elseif(no == 1)then
    return {'123040','14914','585','528','47788','17','527','139','34861','33076','2061','2060','596','120517','32546','586','19236','21562'};
  elseif(no == 2)then
    return {'2944','8092','589','34914','120644','73510','15407','32379','34433','123040','139139','15286','47585','586','19236','17','21562','15473'};
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
					or NA_Fire(NA_checkHP(1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
        if(false
					or NA_Fire(NA_checkHP(0), '586', NA_Player) --渐隐术
					or NA_Fire(NA_checkHP(1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
        if(false
					or NA_Fire(NA_checkHP(1), '15286', NA_Player) --吸血鬼的拥抱
					or NA_Fire(NA_checkHP(0), '47585', NA_Player) --消散
					or NA_Fire(NA_checkHP(0), '586', NA_Player) --渐隐术
					or NA_Fire(NA_checkHP(1), '19236', NA_Player) --绝望祷言
					or NA_Fire(NA_checkHP(1), '17', NA_Player) --真言术：盾

        )then return true; end
      end

      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '123040', NA_Target) --摧心魔
					or NA_Fire(true, '14914', NA_Target) --神圣之火
					or NA_Fire(true, '585', NA_Target) --惩击
					or NA_Fire(true, '47540', NA_Target) --苦修
					or NA_Fire(NA_SpellInterrupt(NA_Target), '15487', NA_Target) --沉默
					or NA_Fire(true, '528', NA_Target) --驱散魔法

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '123040', NA_Target) --摧心魔
					or NA_Fire(true, '14914', NA_Target) --神圣之火
					or NA_Fire(true, '585', NA_Target) --惩击
					or NA_Fire(true, '528', NA_Target) --驱散魔法

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        local ayst = W_RetainBuff(NA_Target, -589, true);   --暗言术：痛
				local xxgzc = W_RetainBuff(NA_Target, -34914, true);   --吸血鬼之触
				local countShadowOrbs = UnitPower(NA_Player, 13);  --暗影宝珠
				local copdotwave = GetTalentRowSelectionInfo(19) and GetTalentRowSelectionInfo(9) and W_HPlevel(NA_Target)>0.2;
				local copmfi = GetTalentRowSelectionInfo(19) and GetTalentRowSelectionInfo(9) and W_HPlevel(NA_Target)<=0.2;
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(copdotwave and (W_RetainBuff(NA_Target, -34914, true) and W_RetainBuff(NA_Target, -589, true) and UnitPower(NA_Player,13)==5), '2944', NA_Target) --噬灵疫病
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)<=4, '8092', NA_Target) --心灵震爆
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)==4 and not W_RetainBuff(NA_Target, -589, true) and not W_RetainBuff(NA_Target, -2944, true) and W_GetSpellCooldown(8092)<2 and W_GetSpellCooldown(8092)>0.2, '589', NA_Target) --暗言术：痛
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)==5 and not W_RetainBuff(NA_Target, -2944, true) and not W_RetainBuff(NA_Target, -589, true), '589', NA_Target) --暗言术：痛
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)==5 and not W_RetainBuff(NA_Target, -2944, true) and not W_RetainBuff(NA_Target, -34914, true), '34914', NA_Target) --吸血鬼之触
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)>=2 and W_BuffTime(NA_Target, -589)>=6 and W_GetSpellCooldown(8092)>1 and W_BuffTime(NA_Target, -34914)>0, '589', NA_Target) --暗言术：痛
					or NA_Fire(copdotwave and UnitPower(NA_Player,13)>=2 and W_BuffTime(NA_Target, -34914)>=5 and W_GetSpellCooldown(8092)>1, '589', NA_Target) --暗言术：痛
					or NA_Fire(copdotwave and W_GetSpellCooldown(8092)>1 and GetTalentRowSelectionInfo(18), '120644', NA_Target) --光晕
					or NA_Fire(copdotwave and not W_RetainBuff(NA_Target, -589, true) or W_BuffTime(NA_Target, -589)<6, '589', NA_Target) --暗言术：痛
					or NA_Fire(copdotwave and not W_RetainBuff(NA_Target, -34914, true) or W_BuffTime(NA_Target, -34914)<5, '34914', NA_Target) --吸血鬼之触
					or NA_Fire(copdotwave and ((W_RetainBuff(NA_Target, -589, true) and not W_RetainBuff(NA_Target, -34914, true)) or (not W_RetainBuff(NA_Target, -589, true) and W_RetainBuff(NA_Target, -34914, true))) and UnitPower(NA_Player,13)<=2 and W_GetSpellCooldown(8092)>1, '73510', NA_Target) --心灵尖刺
					or NA_Fire(copdotwave and W_RetainBuff(NA_Target, -589, true) and W_RetainBuff(NA_Target, -34914, true) and W_GetSpellCooldown(8092)>1 and not W_GetSpellCooldown(32379)<=0.1, '15407', NA_Target) --精神鞭笞
					or NA_Fire(copdotwave and true, '73510', NA_Target) --心灵尖刺
					or NA_Fire(copdotwave and true, '32379', NA_Target) --暗言术：灭
					or NA_Fire(copdotwave and GetTalentRowSelectionInfo(18), '120644', NA_Target) --光晕
					or NA_Fire(copdotwave and true, '589', NA_Target) --暗言术：痛
					or NA_Fire(copmfi and UnitPower(NA_Player,13)==5, '2944', NA_Target) --噬灵疫病
					or NA_Fire(copmfi and true, '8092', NA_Target) --心灵震爆
					or NA_Fire(copmfi and W_HPlevel(NA_Target)<0.2, '32379', NA_Target) --暗言术：灭
					or NA_Fire(copmfi and UnitPower(NA_Player,13)>=3 and (W_GetSpellCooldown(8092)<1.5 or W_HPlevel(NA_Target)<0.2 and W_GetSpellCooldown(32379)<1.5), '2944', NA_Target) --噬灵疫病
					or NA_Fire(copmfi and not GetTalentRowSelectionInfo(8), '34433', NA_Target) --暗影魔
					or NA_Fire(copmfi and GetTalentRowSelectionInfo(8), '123040', NA_Target) --摧心魔
					or NA_Fire(copmfi and W_BuffTime(NA_Target, -589)<6 or not W_RetainBuff(NA_Target, -589, true), '589', NA_Target) --暗言术：痛
					or NA_Fire(copmfi and W_BuffTime(NA_Target, -34914)<5 or not W_RetainBuff(NA_Target, -34914, true), '34914', NA_Target) --吸血鬼之触
					or NA_Fire(copmfi and (W_GetSpellCooldown(8092)>0.1 or (W_GetSpellCooldown(32379)>0.1 and W_HPlevel(NA_Target)<0.2)), '139139', NA_Player) --疯狂
					or NA_Fire(copmfi and true, '120644', NA_Target) --光晕
					or NA_Fire(copmfi and true, '73510', NA_Target) --心灵尖刺
					or NA_Fire(copmfi and true, '32379', NA_Target) --暗言术：灭
					or NA_Fire(copmfi and W_RetainBuff(NA_Player, 162452, true), '8092', NA_Target) --心灵震爆
					or NA_Fire(copmfi and true, '589', NA_Target) --暗言术：痛
					or NA_Fire(true, '123040', NA_Target) --摧心魔
					or NA_Fire(W_HPlevel(NA_Target)<0.2 and UnitPower(NA_Player,13)<=4, '32379', NA_Target) --暗言术：灭
					or NA_Fire(UnitPower(NA_Player,13)<=2, '8092', NA_Target) --心灵震爆
					or NA_Fire(UnitPower(NA_Player,13)==5, '2944', NA_Target) --噬灵疫病
					or NA_Fire(UnitPower(NA_Player,13)>=3 and (W_GetSpellCooldown(8092)<1.5 or W_HPlevel(NA_Target)<0.2 and W_GetSpellCooldown(32379)<1.5) and not W_RetainBuff(NA_Target, -2944, true), '2944', NA_Target) --噬灵疫病
					or NA_Fire(true, '8092', NA_Target) --心灵震爆
					or NA_Fire(true, '120644', NA_Target) --光晕
					or NA_Fire(GetTalentRowSelectionInfo(21), '589', NA_Target) --暗言术：痛
					or NA_Fire(not GetTalentRowSelectionInfo(20) and UnitPower(NA_Player,13)>=3 and not xxgzc, '34914', NA_Target) --吸血鬼之触
					or NA_Fire(GetTalentRowSelectionInfo(21) and W_BuffCount(NA_Player, 162448)==3, '73510', NA_Target) --心灵尖刺
					or NA_Fire(W_BuffCount(NA_Player, 162448)>0, '73510', NA_Target) --心灵尖刺
					or NA_Fire(UnitPower(NA_Player,13)>=2 and W_BuffTime(NA_Target, -589)<=3 and GetTalentRowSelectionInfo(21), '589', NA_Target) --暗言术：痛
					or NA_Fire(UnitPower(NA_Player,13)>=2 and W_BuffTime(NA_Target, -34914)<=3.5 and not xxgzc, '34914', NA_Target) --吸血鬼之触
					or NA_Fire(not (W_GetSpellCooldown(8092)>0.1 or W_GetSpellCooldown(32379)>0.1 or UnitPower(NA_Player,13)==5), '15407', NA_Target) --精神鞭笞
					or NA_Fire(W_RetainBuff(NA_Player, 162452, true), '8092', NA_Target) --心灵震爆
					or NA_Fire(true, '32379', NA_Target) --暗言术：灭
					or NA_Fire(true, '589', NA_Target) --暗言术：痛

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        local zysd = W_RetainBuff(NA_Target, -17, true);   --真言术：盾
				local xrlh = W_RetainBuff(NA_Target, -6788, true);   --虚弱灵魂
				local tsz = W_RetainBuff(NA_Player, 81700, true);   --天使长
				local fycb = W_BuffCount(NA_Player, 81661);   --福音传播
				
				
        if(false
					or NA_Fire(W_HPlevel(NA_Target)<0.4, '33206', NA_Target) --痛苦压制
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.8,10)>3, '596', NA_Target) --治疗祷言
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.7,10)>3, '120517', NA_Player) --光晕
					or NA_Fire(NA_CountLowPlayers(NA_Target,0.7,10)>3, '132157', NA_Player) --神圣新星
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and not xrlh, '17', NA_Target) --真言术：盾
					or NA_Fire(NA_CheckDebuff(NA_Target)==1 or NA_CheckDebuff(NA_Target)==2, '527', NA_Target) --纯净术
					or NA_Fire((W_HPlevel(NA_Target)<0.6 and fycb>3) or W_BuffTime(NA_Player, 81661, true)<3, '81700', NA_Player) --天使长
					or NA_Fire(W_HPlevel(NA_Target)<0.6 and tsz, '33076', NA_Target) --愈合祷言
					or NA_Fire(W_HPlevel(NA_Target)<0.8, '47540', NA_Target) --苦修
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '2061', NA_Target) --快速治疗
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '2060', NA_Target) --治疗术

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
					or NA_Fire(W_HPlevel(NA_Target)<0.8, '34861', NA_Target) --治疗之环
					or NA_Fire(W_HPlevel(NA_Target)<0.8 and mshc>0, '33076', NA_Target) --愈合祷言
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '2061', NA_Target) --快速治疗
					or NA_Fire(W_HPlevel(NA_Target)<0.9 and mshc>0, '2060', NA_Target) --治疗术
					or NA_Fire(W_HPlevel(NA_Target)<0.8, '596', NA_Target) --治疗祷言
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '120517', NA_Player) --光晕
					or NA_Fire(W_HPlevel(NA_Target)<0.7, '32546', NA_Target) --联结治疗

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
					or NA_Fire(not W_HasBuff(NA_Player, 21562, true), '21562', NA_Player) --真言术：韧
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '2060', NA_Target) --治疗术

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Holy
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 21562, true), '21562', NA_Player) --真言术：韧
					or NA_Fire(W_HPlevel(NA_Target)<0.9, '2060', NA_Target) --治疗术

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Shadow
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 21562, true), '21562', NA_Player) --真言术：韧
					or NA_Fire(not W_FormInfo(1), '15473', NA_Player) --暗影形态
					or NA_Fire(not ayst, '589', NA_Target) --暗言术：痛

      )then return true; end
    end
  end
  return false;
end
