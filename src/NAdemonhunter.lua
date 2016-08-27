function getNA12Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'198589','179057','185123','162794','188499','198793','195072'};
  elseif(no == 1)then
    return {};
  end
  return {};
end

NA12ProfileNames = {[0]='浩劫',[1]='复仇',};
NA12ProfileDescriptions = {[0]='天赋:2233321--属性:暴击>精通>全能>=急速',[1]='天赋:--属性:',};

function NA12Dps()
  W_Log(1,"恶魔猎手 dps");
  
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --浩劫
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --复仇
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --浩劫
        
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(1), '198589', NA_Player) --疾影
					or NA_Fire(NA_checkHP(0), '179057', NA_Player) --混乱新星
					or NA_Fire(true, '185123', NA_Target) --投掷利刃
					or NA_Fire(true, '162794', NA_Target) --混乱打击
					or NA_Fire(true, '188499', NA_Target) --刃舞
					or NA_Fire(true, '198793', NA_Target) --复仇回避
					or NA_Fire(true, '195072', NA_Target) --邪能冲撞

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(true, '185123', NA_Target) --投掷利刃
					or NA_Fire(true, '162794', NA_Target) --混乱打击
					or NA_Fire(true, '188499', NA_Target) --刃舞
					or NA_Fire(true, '198793', NA_Target) --复仇回避
					or NA_Fire(true, '195072', NA_Target) --邪能冲撞

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --复仇
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --浩劫
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --复仇
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --浩劫
      
      if(false
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '185123', NA_Target) --投掷利刃
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '195072', NA_Target) --邪能冲撞

      )then return true; end
    elseif(NA_ProfileNo == 1)then --复仇
      
      if(false

      )then return true; end
    end
  end
  return false;
end
