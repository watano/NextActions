function getNA10Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'轮回之触','真气酒','122783','122278','115203','115176','115072','飘渺酒','白虎下凡','屏气凝神','100784','119582','真气破','金钟罩','119381','121253','123986','115098','禅意珠','贯日击','100780','115181','116847','神鹤引项踢','白虎传承'};
  elseif(no == 1)then
    return {'神鹤式','轮回之触','移花接木','贯日击','107428','100780','100784','真气破','升腾之雾','115098','禅意珠','123986','119381','197908','灵龙式','116849','115151','124682','193884','壮胆酒','帝王传承'};
  elseif(no == 2)then
    return {'115080','移花接木','123904','真气酒','100780','虎眼酒','107428','152173','113656','风暴打击','115288','115098','123986','禅意珠','100784','真气破','贯日击','116847','101546','白虎传承'};
  end
  return {};
end

NA10ProfileNames = {[0]='Brewmaster',[1]='Mistweaver',[2]='Battledancer',};
NA10ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:',};

function NA10Dps()
  W_Log(1,"武僧 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Brewmaster
      
      if(false
					or NA_Fire((UnitHealth(NA_Target)<UnitHealthMax(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '轮回之触', NA_Target) --轮回之触
					or NA_Fire(NA_isUsableTalentSpell(3,3) and UnitPower(NA_palyer,12)>=2 and W_BuffCount(NA_Player, 115308)<=10, '真气酒', NA_Player) --真气酒
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(1) and not W_RetainBuff(NA_Player, 115203, true), '122783', NA_Player) --散魔功
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0) and not W_RetainBuff(NA_Player, 115203, true) and not W_RetainBuff(NA_Player, 115308, true), '122278', NA_Player) --躯不坏
					or NA_Fire(NA_checkHP(0) and (not W_RetainBuff(NA_Player, 122278, true) or not W_RetainBuff(NA_Player, 122783, true)) and not W_RetainBuff(NA_Player, 115308, true), '115203', NA_Player) --壮胆酒
					or NA_Fire(NA_checkHP(1), '115176', NA_Player) --禅悟冥想
					or NA_Fire(NA_checkHP(1), '115072', NA_Player) --移花接木
					or NA_Fire(W_BuffCount(NA_Player, 115308)>=9 and (not W_RetainBuff(NA_Player, 122278, true) or not W_RetainBuff(NA_Player, 122783, true)) and not W_RetainBuff(NA_Player, 115308, true), '飘渺酒', NA_Player) --飘渺酒
					or NA_Fire(NA_isUsableTalentSpell(6,2), '白虎下凡', NA_Target) --白虎下凡
					or NA_Fire(NA_isUsableTalentSpell(7,3) and UnitPower(NA_Player,3)<=40, '屏气凝神', NA_Player) --屏气凝神
					or NA_Fire(not jxrd, '100784', NA_Target) --幻灭踢
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and W_RetainBuff(NA_Player, 152173, true) and (zdzq or maxzq), '119582', NA_Player) --活血酒
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and maxzq, '119582', NA_Player) --活血酒
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3, '真气破', NA_Target) --真气破
					or NA_Fire(W_RetainBuff(NA_Player, 152173, true) and not W_RetainBuff(NA_Player, 115295, true), '金钟罩', NA_Player) --金钟罩
					or NA_Fire(NA_checkHP(1) and not W_RetainBuff(NA_Player, 115295, true), '金钟罩', NA_Player) --金钟罩
					or NA_Fire(NA_isUsableTalentSpell(4,3), '119381', NA_Target) --扫堂腿

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Mistweaver
      
      if(false
					or NA_Fire(NA_checkHP(1), '壮胆酒', NA_Player) --壮胆酒

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Battledancer
      
      if(false
					or NA_Fire((UnitHealth(NA_Target)<UnitHealthMax(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '115080', NA_Target) --轮回之触
					or NA_Fire(NA_checkHP(2) or UnitPower(NA_Player, 12)<3, '移花接木', NA_Player) --移花接木

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Brewmaster
        local zdzq = W_RetainBuff(NA_Player, 124274, true);   --中度醉拳dot
				local maxzq = W_RetainBuff(NA_Player, 124273, true);   --重度醉拳dot
				local pmj = W_RetainBuff(NA_Player, 115308, true);   --飘渺酒
				local jxrd = W_RetainBuff(NA_Player, 115307, true);   --酒醒入定
				local mhzl = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire((UnitHealth(NA_Target)<UnitHealthMax(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '轮回之触', NA_Target) --轮回之触
					or NA_Fire(NA_isUsableTalentSpell(3,3) and UnitPower(NA_palyer,12)>=2 and W_BuffCount(NA_Player, 115308)<=10, '真气酒', NA_Player) --真气酒
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(1) and not W_RetainBuff(NA_Player, 115203, true), '122783', NA_Player) --散魔功
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0) and not W_RetainBuff(NA_Player, 115203, true) and not W_RetainBuff(NA_Player, 115308, true), '122278', NA_Player) --躯不坏
					or NA_Fire(NA_checkHP(0) and (not W_RetainBuff(NA_Player, 122278, true) or not W_RetainBuff(NA_Player, 122783, true)) and not W_RetainBuff(NA_Player, 115308, true), '115203', NA_Player) --壮胆酒
					or NA_Fire(NA_checkHP(1), '115176', NA_Player) --禅悟冥想
					or NA_Fire(NA_checkHP(1), '115072', NA_Player) --移花接木
					or NA_Fire(W_BuffCount(NA_Player, 115308)>=9 and (not W_RetainBuff(NA_Player, 122278, true) or not W_RetainBuff(NA_Player, 122783, true)) and not W_RetainBuff(NA_Player, 115308, true), '飘渺酒', NA_Player) --飘渺酒
					or NA_Fire(NA_isUsableTalentSpell(6,2), '白虎下凡', NA_Target) --白虎下凡
					or NA_Fire(NA_isUsableTalentSpell(7,3) and UnitPower(NA_Player,3)<=40, '屏气凝神', NA_Player) --屏气凝神
					or NA_Fire(not jxrd, '100784', NA_Target) --幻灭踢
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and W_RetainBuff(NA_Player, 152173, true) and (zdzq or maxzq), '119582', NA_Player) --活血酒
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and maxzq, '119582', NA_Player) --活血酒
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3, '真气破', NA_Target) --真气破
					or NA_Fire(W_RetainBuff(NA_Player, 152173, true) and not W_RetainBuff(NA_Player, 115295, true), '金钟罩', NA_Player) --金钟罩
					or NA_Fire(NA_checkHP(1) and not W_RetainBuff(NA_Player, 115295, true), '金钟罩', NA_Player) --金钟罩
					or NA_Fire(NA_isUsableTalentSpell(4,3), '119381', NA_Target) --扫堂腿
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2 and not W_RetainBuff(NA_Player, 152173, true), '121253', NA_Target) --醉酿投
					or NA_Fire(NA_isUsableTalentSpell(2,3) and UnitPower(NA_Player,3)<=70, '123986', NA_Target) --真气爆裂
					or NA_Fire(NA_isUsableTalentSpell(2,1) and UnitPower(NA_Player,3)<=70 and NA_checkHP(2), '115098', NA_Target) --真气波
					or NA_Fire(NA_isUsableTalentSpell(2,2) and not W_RetainBuff(NA_Player, 124081, true), '禅意珠', NA_Player) --禅意珠
					or NA_Fire(W_BuffTime(NA_Player, 115307)<=3 and W_GetSpellCooldown(121253)>=1.25, '100784', NA_Target) --幻灭踢
					or NA_Fire(W_RetainBuff(NA_Target, 152173, true), '100784', NA_Target) --幻灭踢
					or NA_Fire(UnitPower(NA_Player,12)>=4, '100784', NA_Target) --幻灭踢
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and W_GetSpellCooldown(121253)>=1.25, '115072', NA_Player) --移花接木
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and W_GetSpellCooldown(121253)>=1.25 and W_GetSpellCooldown(115072)>=1.25, '贯日击', NA_Target) --贯日击
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and zdzq and W_BuffTime(NA_Player, 115307)>=6, '119582', NA_Player) --活血酒
					or NA_Fire(not mhzl or UnitPower(NA_Player,3)<=70, '100780', NA_Target) --猛虎掌
					or NA_Fire(W_GetSpellCooldown(121253)>=1.25, '100780', NA_Target) --猛虎掌
					or NA_Fire(true, '100780', NA_Target) --猛虎掌

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(true, '金钟罩', NA_Player) --金钟罩
					or NA_Fire(UnitPowerMax(NA_Player,12)>=3 and W_BuffTime(NA_Player, 115307)>=6 and W_BuffTime(NA_Target, 115181)<=1.25, '115181', NA_Target) --火焰之息
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=4, '真气破', NA_Target) --真气破
					or NA_Fire(NA_isUsableTalentSpell(6,1) and (UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and NA_isUsableTalentSpell(6,1), '116847', NA_Target) --碧玉疾风
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and maxzq, '119582', NA_Player) --活血酒
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2 and not W_RetainBuff(NA_Player, 152173, true), '121253', NA_Target) --醉酿投
					or NA_Fire(NA_isUsableTalentSpell(2,3) and UnitPower(NA_Player,3)<=70, '123986', NA_Target) --真气爆裂
					or NA_Fire(NA_isUsableTalentSpell(2,1) and UnitPower(NA_Player,3)<=70, '115098', NA_Target) --真气波
					or NA_Fire(NA_isUsableTalentSpell(2,2) and not W_RetainBuff(NA_Target, 124081, true), '禅意珠', NA_Player) --禅意珠
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_BuffTime(NA_Player, 115307)<=3 and W_GetSpellCooldown(121253)>=1.25, '100784', NA_Target) --幻灭踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_RetainBuff(NA_Target, 152173, true), '100784', NA_Target) --幻灭踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and UnitPower(NA_Player,12)>=4, '100784', NA_Target) --幻灭踢
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and W_GetSpellCooldown(121253)>=1.25 and UnitPower(NA_Player,3)>=40, '115072', NA_Player) --移花接木
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and not NA_isUsableTalentSpell(6,1), '神鹤引项踢', NA_Target) --神鹤引项踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and (UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=1 and W_GetSpellCooldown(121253)>=1.25 and W_GetSpellCooldown(115072)>=1.25, '贯日击', NA_Target) --贯日击
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and NA_isUsableTalentSpell(6,1) and zdzq and W_BuffTime(NA_Player, 115307)>=6, '119582', NA_Player) --活血酒
					or NA_Fire(NA_isUsableTalentSpell(6,1) and (not mhzl or UnitPower(NA_Player,3)>=40), '100780', NA_Target) --猛虎掌
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_GetSpellCooldown(121253)>=1.25, '100780', NA_Target) --猛虎掌
					or NA_Fire(NA_isUsableTalentSpell(4,2), '119381', NA_Target) --扫堂腿
					or NA_Fire(true, '100780', NA_Target) --猛虎掌

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Mistweaver
        local xrdst2 = W_RetainBuff(NA_Target, -130320, true);   --贯日击的易伤
				local mhzl2 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力
				local hlzw = W_BuffCount(NA_Player, 118674);   --活力之雾
				local shs = W_FormInfo(2);   --神鹤式
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not shs and CheckInteractDistance(NA_Target, 3), '神鹤式', NA_Player) --神鹤式
					or NA_Fire(shs and (W_HPlevel(NA_Target)<W_HPlevel(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '轮回之触', NA_Target) --轮回之触
					or NA_Fire(shs and true, '移花接木', NA_Player) --移花接木
					or NA_Fire(shs and (UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2, '贯日击', NA_Target) --贯日击
					or NA_Fire(shs and not W_RetainBuff(NA_Target, -130320, true) or W_BuffTime(NA_Target, -130320)<3, '107428', NA_Target) --旭日东升踢
					or NA_Fire(shs and not mhzl2, '100780', NA_Target) --猛虎掌
					or NA_Fire(shs and not NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3, '100784', NA_Target) --幻灭踢
					or NA_Fire(shs and NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3, '真气破', NA_Target) --真气破
					or NA_Fire(shs and hlzw==5, '升腾之雾', NA_Target) --升腾之雾
					or NA_Fire(shs and NA_isUsableTalentSpell(2,1), '115098', NA_Target) --真气波
					or NA_Fire(shs and NA_isUsableTalentSpell(2,2) and not W_RetainBuff(NA_Player, 124081, true), '禅意珠', NA_Player) --禅意珠
					or NA_Fire(shs and NA_isUsableTalentSpell(2,3), '123986', NA_Target) --真气爆裂
					or NA_Fire(shs and NA_isUsableTalentSpell(4,3), '119381', NA_Target) --扫堂腿
					or NA_Fire(shs and true, '197908', NA_Player) --法力茶

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Battledancer
        local xrdst3 = W_RetainBuff(NA_Target, -107428, true);   --贯日击的易伤
				local mhzl3 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力
				local nlp = W_RetainBuff(NA_Player, 113656, true);   --怒雷破
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire((UnitHealth(NA_Target)<UnitHealthMax(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '115080', NA_Target) --轮回之触
					or NA_Fire(NA_checkHP(2) or UnitPower(NA_Player, 12)<3, '移花接木', NA_Player) --移花接木
					or NA_Fire(NA_isUsableTalentSpell(6,2), '123904', NA_Target) --白虎下凡
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2 and W_BuffCount(NA_Player, 116740)<=16, '真气酒', NA_Player) --真气酒
					or NA_Fire(W_BuffTime(NA_Player, 125359)<=3 or not mhzl3, '100780', NA_Target) --猛虎掌
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)==20, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_RetainBuff(NA_Player, 152173, true), '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_GetSpellCooldown(113656)>0 and UnitPower(NA_Player, 12)>=3 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_GetSpellCooldown(152175)>0 and UnitPower(NA_Player, 12)>=3 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and UnitPower(NA_Player,12)>=2 and W_BuffCount(NA_Player, 116740)>=16 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Target, -107428, true) or W_BuffTime(NA_Target, -107428)<3, '107428', NA_Target) --旭日东升踢
					or NA_Fire(not mhzl3 and W_BuffTime(NA_Target, -107428)>1 and UnitPower(NA_Player,3)<=85, '100780', NA_Target) --猛虎掌
					or NA_Fire(NA_isUsableTalentSpell(7,3) and UnitPower(NA_Player, 12)>=2 and mhzl3 and W_RetainBuff(NA_Target, -107428, true), '152173', NA_Player) --屏气凝神
					or NA_Fire(UnitPower(NA_Player,3)<70 and W_BuffTime(NA_Player, 125359)>1.25 and W_BuffTime(NA_Target, -107428)>1.25 and not W_RetainBuff(NA_Player, 152173, true), '113656', NA_Target) --怒雷破
					or NA_Fire(NA_isUsableTalentSpell(7,1) and UnitPower(NA_Player,3)<=85 and W_BuffTime(NA_Player, 125359)>1.25 and W_BuffTime(NA_Target, -107428)>1.25 and not W_RetainBuff(NA_Player, 115288, true), '风暴打击', NA_Target) --风暴打击
					or NA_Fire(W_GetSpellCooldown(113656)>6 and (not NA_isUsableTalentSpell(7,3) or (not W_RetainBuff(NA_Player, 152173, true) and W_BuffTime(NA_Player, 152173)>4)) and UnitPower(NA_Player,3)<40, '115288', NA_Player) --豪能酒
					or NA_Fire(not NA_isUsableTalentSpell(7,2), '107428', NA_Target) --旭日东升踢
					or NA_Fire(NA_isUsableTalentSpell(2,1) and UnitPower(NA_Player,3)<80 and not W_RetainBuff(NA_Player, 152173, true), '115098', NA_Player) --真气波
					or NA_Fire(NA_isUsableTalentSpell(2,3) and UnitPower(NA_Player,3)<80 and not W_RetainBuff(NA_Player, 152173, true), '123986', NA_Target) --真气爆裂
					or NA_Fire(NA_isUsableTalentSpell(2,2) and UnitPower(NA_Player,3)<80 and not W_RetainBuff(NA_Player, 124081, true) and not W_RetainBuff(NA_Player, 152173, true), '禅意珠', NA_Player) --禅意珠
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3 and W_RetainBuff(NA_Player, 137384, true), '100784', NA_Target) --幻灭踢
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3 and W_RetainBuff(NA_Player, 137384, true), '真气破', NA_Target) --真气破
					or NA_Fire(W_RetainBuff(NA_Player, 137384, true) and W_BuffTime(NA_Player, 137384)<=2, '100780', NA_Target) --猛虎掌
					or NA_Fire(not NA_isUsableTalentSpell(7,2) and (UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))<2, '100784', NA_Target) --幻灭踢
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player,12)>=3, '真气破', NA_Target) --真气破
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2, '贯日击', NA_Target) --贯日击

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire((UnitHealth(NA_Target)<UnitHealthMax(NA_Player) or W_HPlevel(NA_Target)<0.1) and UnitPower(NA_Player, 12)>2, '115080', NA_Target) --轮回之触
					or NA_Fire(NA_checkHP(2) or UnitPower(NA_Player, 12)<3, '移花接木', NA_Player) --移花接木
					or NA_Fire(NA_isUsableTalentSpell(6,2), '123904', NA_Target) --白虎下凡
					or NA_Fire((UnitPowerMax(NA_Player,12)-UnitPower(NA_Player,12))>=2 and W_BuffCount(NA_Player, 116740)<=16, '真气酒', NA_Player) --真气酒
					or NA_Fire(W_BuffTime(NA_Player, 125359)<=3 or not mhzl3, '100780', NA_Target) --猛虎掌
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)==20, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_RetainBuff(NA_Player, 152173, true), '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_GetSpellCooldown(113656)>0 and UnitPower(NA_Player, 12)>=3 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(NA_isUsableTalentSpell(7,1) and not W_RetainBuff(NA_Player, 116740, true) and W_BuffCount(NA_Player, 116740)>=10 and W_GetSpellCooldown(152175)>0 and UnitPower(NA_Player, 12)>=3 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Player, 116740, true) and UnitPower(NA_Player,12)>=2 and W_BuffCount(NA_Player, 116740)>=16 and W_RetainBuff(NA_Target, -107428, true) and mhzl3, '虎眼酒', NA_Player) --虎眼酒
					or NA_Fire(not W_RetainBuff(NA_Target, -107428, true) or W_BuffTime(NA_Target, -107428)<3, '107428', NA_Target) --旭日东升踢
					or NA_Fire(not mhzl3 and W_BuffTime(NA_Target, -107428)>1 and UnitPower(NA_Player,3)<=85, '100780', NA_Target) --猛虎掌
					or NA_Fire(NA_isUsableTalentSpell(7,3) and UnitPower(NA_Player, 12)>=2 and mhzl3 and W_RetainBuff(NA_Target, -107428, true), '152173', NA_Player) --屏气凝神
					or NA_Fire(NA_isUsableTalentSpell(7,2) and UnitPower(NA_Player, 12)>=4, '真气破', NA_Target) --真气破
					or NA_Fire(NA_isUsableTalentSpell(6,1), '116847', NA_Target) --碧玉疾风
					or NA_Fire(not NA_isUsableTalentSpell(6,1) and UnitPower(NA_Player, 12)==UnitPowerMAX(NA_Player, 12), '107428', NA_Target) --旭日东升踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and UnitPower(NA_Player,3)<=85 and W_BuffTime(NA_Player, 125359)>1.25 and W_BuffTime(NA_Target, -107428)>1.25 and not W_RetainBuff(NA_Player, 152173, true), '113656', NA_Target) --怒雷破
					or NA_Fire(NA_isUsableTalentSpell(6,1) and NA_isUsableTalentSpell(7,1) and UnitPower(NA_Player,3)<=85 and W_BuffTime(NA_Player, 125359)>1.25 and W_BuffTime(NA_Target, -107428)>1.25 and not W_RetainBuff(NA_Player, 115288, true), '风暴打击', NA_Target) --风暴打击
					or NA_Fire(NA_isUsableTalentSpell(2,2) and not W_RetainBuff(NA_Player, 124081, true), '禅意珠', NA_Player) --禅意珠
					or NA_Fire(NA_isUsableTalentSpell(2,1) and UnitPower(NA_Player,3)<80 and not W_RetainBuff(NA_Player, 152173, true), '115098', NA_Player) --真气波
					or NA_Fire(NA_isUsableTalentSpell(2,3) and UnitPower(NA_Player,3)<80 and not W_RetainBuff(NA_Player, 152173, true), '123986', NA_Target) --真气爆裂
					or NA_Fire(NA_isUsableTalentSpell(6,1) and not NA_isUsableTalentSpell(7,2) and (W_RetainBuff(NA_Player, 137384, true) and W_RetainBuff(NA_Player, 152173, true)), '100784', NA_Target) --幻灭踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and W_RetainBuff(NA_Player, 137384, true) and W_BuffTime(NA_Player, 137384)<=2, '100780', NA_Target) --猛虎掌
					or NA_Fire(NA_isUsableTalentSpell(6,1) and not NA_isUsableTalentSpell(7,2) and (UnitPowerMax(NA_Player, 12)-UnitPower(NA_Player, 12))<2, '100784', NA_Target) --幻灭踢
					or NA_Fire(not NA_isUsableTalentSpell(6,1), '101546', NA_Target) --神鹤引项踢
					or NA_Fire(NA_isUsableTalentSpell(6,1) and (UnitPowerMax(NA_Player, 12)-UnitPower(NA_Player, 12))>=2, '贯日击', NA_Target) --贯日击

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Brewmaster
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Mistweaver
        local fszw = W_RetainBuff(NA_Target, 119611, true);   --复苏之雾
				local fwzw = W_RetainBuff(NA_Target, 115175, true);   --抚慰之雾
				local lls = W_FormInfo(1);   --灵龙式
				
				
        if(false
					or NA_Fire(not lls and not CheckInteractDistance(NA_Target, 3), '灵龙式', NA_Player) --灵龙式
					or NA_Fire(lls and W_HPlevel(NA_Target)<0.3, '116849', NA_Target) --作茧缚命
					or NA_Fire(lls and true, '115151', NA_Target) --复苏之雾
					or NA_Fire(lls and true, '移花接木', NA_Player) --移花接木
					or NA_Fire(lls and W_HPlevel(NA_Target)<0.7 and fwzw, '124682', NA_Target) --氤氲之雾
					or NA_Fire(lls and W_HPlevel(NA_Target)<0.7 and fwzw, '升腾之雾', NA_Target) --升腾之雾
					or NA_Fire(lls and NA_isUsableTalentSpell(2,1), '115098', NA_Target) --真气波
					or NA_Fire(lls and NA_isUsableTalentSpell(2,2) and not W_RetainBuff(NA_Player, 124081, true), '禅意珠', NA_Target) --禅意珠
					or NA_Fire(lls and NA_isUsableTalentSpell(2,3), '123986', NA_Target) --真气爆裂
					or NA_Fire(lls and W_HPlevel(NA_Target)<0.9 and W_GetSpellCooldown(115151)>0 and W_GetSpellCooldown(115072)>0 and UnitPower(NA_Player, 12)<2, '193884', NA_Target) --抚慰之雾
					or NA_Fire(lls and NA_CheckRoles(NA_Target)==1 and not W_RetainBuff(NA_Target, 132120, true) and W_HPlevel(NA_Target)<0.9, '124682', NA_Target) --氤氲之雾
					or NA_Fire(lls and NA_CheckRoles(NA_Target)==1 and W_HPlevel(NA_Target)<0.9 and not W_RetainBuff(NA_Target, 115175, true), '193884', NA_Target) --抚慰之雾
					or NA_Fire(lls and NA_CheckRoles(NA_Target)~=1 and W_HPlevel(NA_Target)<0.7, '193884', NA_Target) --抚慰之雾
					or NA_Fire(lls and true, '197908', NA_Player) --法力茶

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Battledancer
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Brewmaster
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 116781, true), '白虎传承', NA_Player) --白虎传承

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Mistweaver
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 115921, true), '帝王传承', NA_Player) --帝王传承

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Battledancer
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 116781, true), '白虎传承', NA_Player) --白虎传承

      )then return true; end
    end
  end
  return false;
end
