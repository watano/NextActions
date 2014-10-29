function getNA4Actions(no)
  if(no < 0)then
    return {};
  elseif(no == 0)then
    return {
      
    };
  elseif(no == 1)then
    return {
      
    };
  elseif(no == 2)then
    return {
      
    };
  
  end
  return {};
end

function getNA4Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Discipline';
  elseif(no == 1)then
    return 'Holy';
  elseif(no == 2)then
    return 'Shadow';
  
  end
  return '';
end

function NA4Dps()
  W_Log(1,"盗贼 dps");
  
  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false

      )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
      elseif(NA_ProfileNo == 0)then --Discipline
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Holy
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Shadow
        
        
        if(not NA_IsAOE and (false

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
      
      )then return true; end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else
    
    if(false
    
    )then return true; end
  end
  return false;
end
