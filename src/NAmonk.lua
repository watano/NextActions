function getNA10Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      '115080','119582','121253','115308','100784','100787','115098','115072','123904','119381','100780','115295','122278','115203','115176','116781'
    };
  elseif(no == 1)then
    return {
      '154436','115080','107428','100787','115098','115072','123904','119381','116694','100784','115294','116680','115070','116849','115151','116670','101546','124682','115175','115921'
    };
  elseif(no == 2)then
    return {
      '115080','100780','115072','100787','100784'
    };
  
  end
  return {};
end

function getNA10Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Brewmaster';
  elseif(no == 1)then
    return 'Mistweaver';
  elseif(no == 2)then
    return 'Windwalker';
  
  end
  return '';
end

function NA10Dps()
  W_Log(1,"武僧 dps");
  local needHP = W_HPlevel(NA_Player) < 0.3 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.5);
	local needHP2 = W_HPlevel(NA_Player) < 0.6 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.7);
	local needHP3 = W_HPlevel(NA_Player) < 0.9 or (NA_IsSolo and not NA_IsMaxDps and W_HPlevel(NA_Player) < 0.9);
	
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
					or NA_Fire(needHP, '122278', NA_Player) --躯不坏
					or NA_Fire(needHP, '115203', NA_Player) --壮胆酒
					or NA_Fire(NA_ProfileNo == 0 and needHP2, '115176', NA_Player) --禅悟冥想
					or NA_Fire(NA_ProfileNo == 0 and needHP2, '115295', NA_Player) --金钟罩
					or NA_Fire(needHP3, '115072', NA_Player) --移花接木
					or NA_Fire(needHP3, '115098', NA_Player) --真气波

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Brewmaster
        local zdzq = W_RetainBuff(NA_Player, 124274, true);   --中度醉拳dot
				local maxzq = W_RetainBuff(NA_Player, 124273, true);   --重度醉拳dot
				local pmj = W_RetainBuff(NA_Player, 115308, true);   --飘渺酒
				local jxrd = W_RetainBuff(NA_Player, 115307, true);   --酒醒入定  
				local mhzl = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力  
				local notTanking = not NA_IsSolo and not W_isTanking();
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '115080', NA_Target) --轮回之触
					or NA_Fire(zdzq, '119582', NA_Player) --活血酒
					or NA_Fire(maxzq, '119582', NA_Player) --活血酒
					or NA_Fire(true, '121253', NA_Target) --醉酿投
					or NA_Fire(not pmj, '115308', NA_Player) --飘渺酒
					or NA_Fire(not jxrd, '100784', NA_Target) --幻灭踢
					or NA_Fire(not mhzl, '100787', NA_Target) --猛虎掌
					or NA_Fire(true, '115098', NA_Target) --真气波
					or NA_Fire(true, '115072', NA_Player) --移花接木
					or NA_Fire(true, '123904', NA_Target) --白虎下凡
					or NA_Fire(true, '119381', NA_Target) --扫堂腿
					or NA_Fire(UnitPower(NA_Player, SPELL_POWER_CHI)>3, '100784', NA_Target) --幻灭踢
					or NA_Fire(UnitPower(NA_Player,3)>70, '100780', NA_Target) --贯日击
					or NA_Fire(true, '115295', NA_Player) --金钟罩
					or NA_Fire(true, '100787', NA_Target) --猛虎掌

        ))then return true; end
  
        if(NA_IsAOE and (false
					or NA_Fire(true, '121253', NA_Target) --醉酿投
					or NA_Fire(not jxrd, '100784', NA_Target) --幻灭踢
					or NA_Fire(not mhzl, '100787', NA_Target) --猛虎掌
					or NA_Fire(UnitPower(NA_Player, SPELL_POWER_CHI)>3, '100784', NA_Target) --幻灭踢
					or NA_Fire(UnitPower(NA_Player)>70, '100780', NA_Target) --贯日击
					or NA_Fire(true, '100787', NA_Target) --猛虎掌
					or NA_Fire(W_HPlevel(NA_Player)<1, '115072', NA_Player) --移花接木

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Mistweaver
        local xrdst2 = W_RetainBuff(NA_Target, -130320, true);   --贯日击的易伤
				local mhzl2 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力
				local hlzw = W_BuffCount(NA_Player, 118674);   --活力之雾
				local shs = W_FormInfo(2);   --神鹤式
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not shs, '154436', NA_Player) --神鹤式
					or NA_Fire(true, '115080', NA_Target) --轮回之触
					or NA_Fire(not xrdst2, '107428', NA_Target) --旭日东升踢
					or NA_Fire(not mhzl2, '100787', NA_Target) --猛虎掌
					or NA_Fire(true, '115098', NA_Target) --真气波
					or NA_Fire(true, '115072', NA_Player) --移花接木
					or NA_Fire(true, '123904', NA_Target) --白虎下凡
					or NA_Fire(true, '119381', NA_Target) --扫堂腿
					or NA_Fire(hlzw==5, '116694', NA_Target) --升腾之雾
					or NA_Fire(UnitPower(NA_Player, SPELL_POWER_CHI)>3, '100784', NA_Target) --幻灭踢
					or NA_Fire(true, '107428', NA_Target) --旭日东升踢
					or NA_Fire(true, '115294', NA_Player) --法力茶
					or NA_Fire(true, '116680', NA_Player) --雷光聚神茶

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Windwalker
        local xrdst3 = W_RetainBuff(NA_Target, -107428, true);   --贯日击的易伤
				local mhzl3 = W_RetainBuff(NA_Player, 125359, true);   --猛虎之力 
				local nlp = W_RetainBuff(NA_Player, 113656, true);   --怒雷破
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(true, '115080', NA_Target) --轮回之触
					or NA_Fire(true, '100780', NA_Target) --贯日击
					or NA_Fire(needHP3 or UnitPower(NA_Player, SPELL_POWER_CHI)<3, '115072', NA_Player) --移花接木
					or NA_Fire(not mhzl3, '100787', NA_Target) --猛虎掌
					or NA_Fire(not xrdst3, '100780', NA_Target) --贯日击
					or NA_Fire(true, '100780', NA_Target) --贯日击
					or NA_Fire(UnitPower(NA_Player, SPELL_POWER_CHI)>3, '100784', NA_Target) --幻灭踢

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
local fszw = W_RetainBuff(NA_Target, -119611, true);   --复苏之雾
local fwzw = W_RetainBuff(NA_Target, -115175, true);   --抚慰之雾  
local lls = W_FormInfo(1);   --灵龙式

      if(false
					or NA_Fire(NA_ProfileNo == 1 and not lls, '115070', NA_Player) --灵龙式
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.3, '116849', NA_Target) --作茧缚命
					or NA_Fire(NA_ProfileNo == 1 and true, '115151', NA_Target) --复苏之雾
					or NA_Fire(NA_ProfileNo == 1 and true, '115072', NA_Player) --移花接木
					or NA_Fire(NA_ProfileNo == 1 and UnitPower(NA_Player, SPELL_POWER_CHI)>3, '116670', NA_Player) --振魂引
					or NA_Fire(NA_ProfileNo == 1 and true, '115098', NA_Target) --真气波
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.8, '101546', NA_Target) --神鹤引项踢
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.7 and fwzw, '116694', NA_Target) --升腾之雾
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.7 and fwzw, '124682', NA_Target) --氤氲之雾
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.9, '115175', NA_Target) --抚慰之雾
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.6, '116694', NA_Target) --升腾之雾
					or NA_Fire(NA_ProfileNo == 1 and W_HPlevel(NA_Target)<0.5, '124682', NA_Target) --氤氲之雾
					or NA_Fire(NA_ProfileNo == 1 and true, '115294', NA_Player) --法力茶
					or NA_Fire(NA_ProfileNo == 1 and true, '116680', NA_Player) --雷光聚神茶
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
					or NA_Fire(not W_HasBuff(NA_Player, 116781, true) and NA_ProfileNo ~= 1, '116781', NA_Player) --白虎传承
					or NA_Fire(not W_HasBuff(NA_Player, 115921, true) and NA_ProfileNo == 1, '115921', NA_Player) --帝王传承
    
    )then return true; end
  end
  return false;
end
