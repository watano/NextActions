function getNA5Actions(no)
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

function getNA5Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Assassination';
  elseif(no == 1)then
    return 'Combat';
  elseif(no == 2)then
    return 'Subtlety';
  end
  return '';
end

function NA5Dps()
  W_Log(1,"牧师 dps");

  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
           )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Assassination
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Combat
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Subtlety
      
      
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
