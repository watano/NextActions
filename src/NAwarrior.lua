function getNA1Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'2565','355','871','12975','190456','34428','1160','163558','1719','228920','23922','6572','20243','100','57755','198304','6343','46968'};
  elseif(no == 1)then
    return {'184364','97462','5308','1719','118000','184367','85288','23881','190411','100','57755'};
  elseif(no == 2)then
    return {};
  end
  return {};
end

NA1ProfileNames = {[0]='防战',[1]='狂暴战',[2]='武器战',};
NA1ProfileDescriptions = {[0]='天赋:1112323--属性:耐力>力量>精通≥暴击≈急速≈全能',[1]='天赋:2312331--属性:急速>精通>暴击>全能',[2]='天赋:--属性:',};

function NA1Dps()
  W_Log(1,"战士 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --防战
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防战
        local dpgd = W_RetainBuff(NA_Player, 132404, true);   --盾牌格挡
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(not dpgd, '2565', NA_Player) --盾牌格挡
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '12975', NA_Player) --破釜沉舟
					or NA_Fire(W_HPlevel(NA_Player)<0.8, '190456', NA_Player) --无视苦痛
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(W_HPlevel(NA_Player)<1, '1160', NA_Player) --挫志怒吼
					or NA_Fire(true, '163558', NA_Target) --副手斩杀
					or NA_Fire(true, '1719', NA_Player) --战吼
					or NA_Fire(true, '228920', NA_Target) --破坏者
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(true, '6572', NA_Target) --复仇
					or NA_Fire(true, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '198304', NA_Target) --拦截

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(not dpgd, '2565', NA_Player) --盾牌格挡
					or NA_Fire(notTanking, '355', NA_Target) --嘲讽
					or NA_Fire(W_HPlevel(NA_Player)<0.2, '871', NA_Player) --盾墙
					or NA_Fire(W_HPlevel(NA_Player)<0.1, '12975', NA_Player) --破釜沉舟
					or NA_Fire(W_HPlevel(NA_Player)<0.8, '190456', NA_Player) --无视苦痛
					or NA_Fire(not NA_IsMaxDps and W_HPlevel(NA_Player)<0.8, '34428', NA_Player) --乘胜追击
					or NA_Fire(W_HPlevel(NA_Player)<1, '1160', NA_Player) --挫志怒吼
					or NA_Fire(true, '163558', NA_Target) --副手斩杀
					or NA_Fire(true, '1719', NA_Player) --战吼
					or NA_Fire(true, '228920', NA_Target) --破坏者
					or NA_Fire(true, '6343', NA_Target) --雷霆一击
					or NA_Fire(true, '46968', NA_Target) --震荡波
					or NA_Fire(true, '6572', NA_Target) --复仇
					or NA_Fire(true, '23922', NA_Target) --盾牌猛击
					or NA_Fire(true, '20243', NA_Target) --毁灭打击
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷
					or NA_Fire(true, '198304', NA_Target) --拦截

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --狂暴战
        local has215570 =  W_HasBuff(NA_Player, 215570, true); --摧枯拉朽
				local in5308 = W_HPlevel(NA_Target)<0.2; --斩杀阶段
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_IsSolo and NA_checkHP(2), '184364', NA_Player) --狂怒回复
					or NA_Fire(NA_IsSolo and NA_checkHP(0), '97462', NA_Player) --命令怒吼
					or NA_Fire(true, '5308', NA_Target) --斩杀
					or NA_Fire(true, '1719', NA_Player) --战吼
					or NA_Fire(true, '118000', NA_Player) --巨龙怒吼
					or NA_Fire(in5308 and W_PowerLevel(NA_Player) > 0.85, '184367', NA_Target) --暴怒
					or NA_Fire(in5308, '85288', NA_Target) --怒击
					or NA_Fire(in5308, '23881', NA_Target) --嗜血
					or NA_Fire(true, '184367', NA_Target) --暴怒
					or NA_Fire(has215570, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '85288', NA_Target) --怒击
					or NA_Fire(NA_IsSolo and not NA_checkHP(1), '23881', NA_Target) --嗜血
					or NA_Fire(true, '190411', NA_Target) --旋风斩
					or NA_Fire(true, '100', NA_Target) --冲锋
					or NA_Fire(true, '57755', NA_Target) --英勇投掷

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --防战
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --狂暴战
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --武器战
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --防战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '198304', NA_Target) --拦截

      )then return true; end
    elseif(NA_ProfileNo == 1)then --狂暴战
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '100', NA_Target) --冲锋
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '57755', NA_Target) --英勇投掷

      )then return true; end
    elseif(NA_ProfileNo == 2)then --武器战
      
      if(false

      )then return true; end
    end
  end
  return false;
end
