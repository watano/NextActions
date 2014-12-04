function getNA4Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'111240','1766','32645','1943','14185','1856','5171','8676','79140','1329','1784','2823','108211'};
  elseif(no == 1)then
    return {'14185','152151','8676','1856','36554','13750','5171','137619','121411','2098','84617','1752','1784','2823','108211'};
  elseif(no == 2)then
    return {'8676','1766','14183','16511','53','51713','2098','14185','1856','152151','5171','1943','1784','2823','108211'};
  end
  return {};
end

NA4ProfileNames = {[0]='Assassination',[1]='Combat',[2]='Subtlety',''};

function NA4Dps()
  W_Log(1,"盗贼 dps");
  local hasxg = W_RetainBuff(NA_Player, 1966, true);   --佯攻
	
	local hasxg = W_RetainBuff(NA_Player, 1966, true);   --佯攻
	
	
	
  if(W_IsInCombat())then
    if(W_TargetCanAttack()) then
      -- 保命施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Assassination
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Combat
        
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        
        if(false

        )then return true; end
      end

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
					or NA_Fire(W_HPlevel(NA_Target)<0.35 or hasmd, '111240', NA_Target) --斩击
					or NA_Fire(NA_SpellInterrupt(NA_Target), '1766', NA_Target) --脚踢
					or NA_Fire(hasgl and UnitPower(NA_Player,4)==5, '32645', NA_Target) --毒伤
					or NA_Fire(not hasgl and UnitPower(NA_Player,4)>0, '1943', NA_Target) --割裂
					or NA_Fire(not hasys and W_GetSpellCooldown(1856)>60, '14185', NA_Player) --伺机待发
					or NA_Fire(true, '1856', NA_Player) --消失
					or NA_Fire(not hasqg and UnitPower(NA_Player,4)>0, '5171', NA_Player) --切割
					or NA_Fire(hasys or hasqx, '8676', NA_Target) --伏击
					or NA_Fire(hasqg and UnitPower(NA_Player,4)>0, '32645', NA_Target) --毒伤
					or NA_Fire(true, '79140', NA_Target) --宿敌
					or NA_Fire(true, '1329', NA_Target) --毁伤

        ))then return true; end
  
        if(NA_IsAOE and (false

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
					or NA_Fire(not hasys and W_GetSpellCooldown(1856)>60, '14185', NA_Player) --伺机待发
					or NA_Fire(W_GetSpellCooldown(51690)<10 and UnitPower(NA_Player,4)>3 or hascd, '152151', NA_Player) --152151
					or NA_Fire(hasys or hasqx, '8676', NA_Target) --伏击
					or NA_Fire((UnitPower(NA_Player,4)<3 or (talentyg and countyg<3) or (UnitPower(NA_Player,4)<4 or (talentyg and countyg<4))) and ((talentayjz and not hascd and UnitPower(NA_Player)<20) or (talentgz and UnitPower(NA_Player)>=90) or (not talentayjz and not talentgz and UnitPower(NA_Player)>=60)), '1856', NA_Player) --消失
					or NA_Fire(UnitPower(NA_Player)<50 and (not talentzyfs or W_GetSpellCooldown(152151)>30 or W_BuffTime(NA_Player, 152151)>3), '36554', NA_Target) --暗影步
					or NA_Fire(UnitPower(NA_Player)<35, '13750', NA_Player) --冲动
					or NA_Fire(W_BuffTime(NA_Player, 5171)<2 or (W_BuffTime(NA_Player, 5171)<15 and countckdjz==11 and UnitPower(NA_Player,4)>=4), '5171', NA_Target) --切割
					or NA_Fire(UnitPower(NA_Player,4)<=1 and hasyhdj and (not talentayfs or hasayfs or W_GetSpellCooldown(152151)>30), '137619', NA_Target) --死亡标记
					or NA_Fire(W_BuffTime(NA_Target, -121411)<=1 and (UnitPower(NA_Player,4)==5 and (hasmd or not talentyg or (talentyg and countyg>=4))), '121411', NA_Target) --猩红风暴
					or NA_Fire(UnitPower(NA_Player,4)==5 and (hasmd or not talentyg or (talentyg and countyg>=4)), '2098', NA_Target) --刺骨
					or NA_Fire(countyhdj<2 and (UnitPower(NA_Player,4)<5 or (talentyg and countyg<=4 and not hasmd)), '84617', NA_Target) --要害打击
					or NA_Fire(UnitPower(NA_Player,4)<5 or (talentyg and countyg<=4 and not hasmd), '1752', NA_Player) --影袭

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        local countyg = W_BuffCount(NA_Player, 114015);   --预感
				local cxdot = W_RetainBuff(NA_Target, -16511, true);   --出血
				local hasdxrd = W_RetainBuff(NA_Player, 91023, true);   --洞悉弱点
				local hasayzw = W_RetainBuff(NA_Player, 51713, true);   --暗影之舞
				local hasmrds = W_RetainBuff(NA_Player, 31223, true);   --敏锐大师
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(UnitPower(NA_Player,4)<=4 or countyg<3, '8676', NA_Target) --伏击
					or NA_Fire(NA_SpellInterrupt(NA_Target), '1766', NA_Target) --脚踢
					or NA_Fire(UnitPower(NA_Player,4)<=4, '14183', NA_Player) --预谋
					or NA_Fire(W_BuffTime(NA_Target, -16511, true)<8 and  countyg<4 and hasqg and hasgl and W_BuffTime(NA_Target, -1943, true)>2, '16511', NA_Target) --出血
					or NA_Fire(countyg<4 and hasqg and hasgl and W_BuffTime(NA_Target, -1943, true)>2, '53', NA_Target) --背刺
					or NA_Fire(UnitPower(NA_Player,3)>=75 and not hasys and not hasqx and not hasdxrd, '51713', NA_Player) --暗影之舞
					or NA_Fire(UnitPower(NA_Player,4)>4, '2098', NA_Target) --刺骨
					or NA_Fire(not hasyhdj and W_GetSpellCooldown(1856)>60 and W_GetSpellCooldown(14185)<=0, '14185', NA_Player) --伺机待发
					or NA_Fire(UnitPower(NA_Player,3)<=75 and UnitPower(NA_Player,3)>=45 and UnitPower(NA_Player,4)<=3 and not hasayzw and not hasmrds and not hasdxrd, '1856', NA_Player) --消失
					or NA_Fire(hasayzw, '152151', NA_Player) --152151
					or NA_Fire(UnitPower(NA_Player,4)==5 and W_BuffTime(NA_player, 1943)<4, '5171', NA_Player) --切割
					or NA_Fire(W_BuffTime(NA_Target, 1943)<7, '1943', NA_Target) --割裂

        ))then return true; end
  
        if(NA_IsAOE and (false

        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target) and UnitIsPlayer(NA_Target))then
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Assassination
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Combat
        
				
        if(false

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Subtlety
        
				
        if(false

        )then return true; end
      end
      return false;
    elseif(NA_IsSolo)then
      return NA_ChagetTarget();      
    end
  else    
    if(NA_ProfileNo < 0)then return false;
    elseif(NA_ProfileNo == 0)then --Assassination
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --2823
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --108211

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Combat
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --2823
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --108211

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Subtlety
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 1784, true), '1784', NA_Player) --潜行
					or NA_Fire(W_TargetCanAttack(), '8676', NA_Target) --伏击
					or NA_Fire(not W_RetainBuff(NA_Player, 2823, true), '2823', NA_Player) --2823
					or NA_Fire(not W_RetainBuff(NA_Player, 108211, true), '108211', NA_Player) --108211

      )then return true; end
    end
  end
  return false;
end
