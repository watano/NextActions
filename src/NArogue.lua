function getNA4Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'408','1329','1766','1784','1833','1856','1943','2823','5171','14185','26679','32645','36554','51723','79140','111240','121411','137619','152151','NA_ChagetTarget','57934','5938','I5512','8676','108211'};
  elseif(no == 1)then
    return {'408','1752','1766','1784','1833','1856','2098','2823','5171','8676','13750','13877','14185','26679','36554','51690','84617','121411','137619','152150','152151','NA_ChagetTarget','57934','5938','I5512','108211'};
  elseif(no == 2)then
    return {'53','408','703','1766','1784','1833','1856','1943','2098','2823','5171','8676','14183','14185','16511','26679','36554','51713','51723','114014','121411','137619','152150','152151','NA_ChagetTarget','57934','5938','I5512','108211'};
  end
  return {};
end

NA4ProfileNames = {[0]='Assassination',[1]='Combat',[2]='Subtlety',};

function NA4Dps()
  W_Log(1,"盗贼 dps");
  local hasxg = W_RetainBuff(NA_Player, 1966, true);   --佯攻
	
	local hasxg = W_RetainBuff(NA_Player, 1966, true);   --佯攻
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Assassination
      
      if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '5938', NA_Target) --毒刃
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Combat
      
      if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '5938', NA_Target) --毒刃
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Subtlety
      
      if(false
					or NA_Fire(NA_CheckBuff(NA_Target)==2, '5938', NA_Target) --毒刃
					or NA_Fire(NA_checkHP(1), 'I5512', NA_Player) --I5512

      )then return true; end
      
    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Assassination
        local hasys = W_RetainBuff(NA_Player, 11327, true);   --隐身
				local hasqx = W_RetainBuff(NA_Player, 1784, true);   --潜行
				local hasmd = W_RetainBuff(NA_Player, 121153, true);   --盲点
				--local countyg = W_BuffCount(NA_Player, 114015, true);   --预感
				--local hasayfs = W_RetainBuff(NA_Player, 152151, true);   --暗影反射
				--local hasayjz = W_RetainBuff(NA_Player, 108209, true);   --暗影集中
				local hasqg = W_RetainBuff(NA_Player, 5171, true);   --切割
				local hasgl = W_RetainBuff(NA_Target, -1943, true);   --割裂
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Combat
        local hasys = W_RetainBuff(NA_Player, 11327, true);   --隐身
				local hasqx = W_RetainBuff(NA_Player, 1784, true);   --潜行
				local hasmd = W_RetainBuff(NA_Player, 121153, true);   --盲点
				local hasyhdj = W_RetainBuff(NA_Target, 84617, true);   --要害打击
				local countyg = W_BuffCount(NA_Player, 114015);   --预感
				local countckdjz = W_BuffCount(NA_Player, 84654);   --刺客的狡诈
				local countyhdj = W_BuffCount(NA_Target, 84617);   --要害打击
				local hasayfs = W_RetainBuff(NA_Player, 152151, true);   --暗影反射
				local hasqg = W_RetainBuff(NA_Player, 5171, true);   --切割
				local hasgl = W_RetainBuff(NA_Target, -1943, true);   --割裂
				local hascd = W_RetainBuff(NA_Player, 13750, true);   --冲动
				local hasxhfb = W_RetainBuff(NA_Target, -121411, true);   --猩红风暴
				local talentyg = GetTalentRowSelectionInfo(15);   --天赋预感选择
				local talentayjz = GetTalentRowSelectionInfo(3);   --天赋暗影集中选择
				local talentgz = GetTalentRowSelectionInfo(2);   --天赋诡诈选择
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        local countyg = W_BuffCount(NA_Player, 114015);   --预感
				local cxdot = W_RetainBuff(NA_Target, -16511, true);   --出血
				local hasdxrd = W_RetainBuff(NA_Player, 91023, true);   --洞悉弱点
				local hasayzw = W_RetainBuff(NA_Player, 51713, true);   --暗影之舞
				local hasmrds = W_RetainBuff(NA_Player, 31223, true);   --敏锐大师
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(W_HPlevel(NA_Target)<=0 or UnitName(NA_Target)==nil, 'NA_ChagetTarget', NA_Target) --NA_ChagetTarget

          or NA_fireByOvale()
        ))then return true; end
  
        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Assassination
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '57934', NA_Target) --嫁祸诀窍

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Combat
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '57934', NA_Target) --嫁祸诀窍

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        
				
        if(false
					or NA_Fire(NA_CheckRoles(NA_Target)==1, '57934', NA_Target) --嫁祸诀窍

        )then return true; end
      end
    elseif(NA_IsSolo)then --solo时切换目标
      return NA_ChagetTarget();      
    end
  else  --不在战斗中  
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Assassination
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --致命药膏
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --吸血药膏

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Combat
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --致命药膏
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --吸血药膏

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Subtlety
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --致命药膏
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --吸血药膏

      )then return true; end
    end
  end
  return false;
end
