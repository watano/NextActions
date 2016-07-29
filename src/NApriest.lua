function getNA5Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {};
  elseif(no == 1)then
    return {};
  elseif(no == 2)then
    return {};
  end
  return {};
end

NA5ProfileNames = {[0]='Discipline',[1]='Holy',[2]='Shadow',};
NA5ProfileDescriptions = {[0]='天赋:--属性:',[1]='天赋:--属性:',[2]='天赋:--属性:',};

function NA5Dps()
  W_Log(1,"牧师 dps");
  
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Discipline
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Holy
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Shadow
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
				
        if(false

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Discipline
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Holy
      
      if(false

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Shadow
      
      if(false

      )then return true; end
    end
  end
  return false;
end
