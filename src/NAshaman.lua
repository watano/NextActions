function getNA7Actions(no)
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

function getNA7Telants(no)
  if(no < 0)then
    return '';
  elseif(no == 0)then
    return 'Elemental';
  elseif(no == 1)then
    return 'Enhancement';
  elseif(no == 2)then
    return 'Restoration';
  end
  return '';
end

function NA7Dps()
  W_Log(1,"萨满 dps");

  
  if(W_IsInCombat())then
    if(W_IsDeadTarget()) then
      return NA_ChagetTarget();       
    elseif(W_TargetCanAttack()) then
      -- 保命施法
          
      if(false
           )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Elemental
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Enhancement
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Restoration
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end

      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(false
              )then return true; end
      return false;
    end
  else
    
    if(false
          )then return true; end
  end
  return false;
end
