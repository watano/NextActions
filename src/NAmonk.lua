function getNA10Actions(no)
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

  
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
    
      if(false
           )then return true; end

      if(NA_ProfileNo < 0)then
        return false;
          elseif(NA_ProfileNo == 0)then --Brewmaster
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 1)then --Mistweaver
      
      
      if(not NA_IsAOE and (false
        
      ))then return true; end

      if(NA_IsAOE and (false
        
      ))then return true; end
    elseif(NA_ProfileNo == 2)then --Windwalker
      
      
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
