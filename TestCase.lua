dofile "tests\\wow_api.lua"
dofile "mock.lua"
dofile "NAutil.lua"
dofile "NAcore.lua"
dofile "NAframe.lua"
dofile "NA_Mage.lua"
--dofile "NA_Druid.lua"
dofile "NA_Hunter.lua"
if(1==1)then 
	dofile "NA_Druid.lua"
	dofile "NA_DK.lua"
	dofile "NA_Paladin.lua"
end

NA_LogLevel = 3;
NA_IsTest = true;

function NA_UnitTest()
	-- NA_init();

	NA_SlashHandler("init1");
	NA_SlashHandler("options");
	NA_SlashHandler("opt");
	NA_SlashHandler("version");
	NA_SlashHandler("ver");
	NA_SlashHandler("toggle");
	NA_SlashHandler("toggle");
	NA_SlashHandler("mykey");
	NA_SlashHandler("xxxxx");

	local name, rank, iconTexture, count, duration, timeLeft = UnitBuff("player",1)
	--print(name);
	--print(NA_Spells[30482][3]);
	--W_Log(1,W_checkBuffs({30482}, "player"));

	NA_TestMaxDPS(0);
	NA_TestMaxDPS(1);

	for v = 0, 0xfff, 1 do 
		if v ~= NAParseColor2Value(NAParseValue2Color(v)) then 
			W_Log(1,v .."--".. NAParseColor2Value(NAParseValue2Color(v)) .. "--" ..NAParseValue2Color(v));
		end
	end
	
	W_Log(1,GetInventoryItemCooldown("player",13));
	W_Log(1,GetInventoryItemCooldown("player",14));
end

--NA_ClassName="MAGE";
--NA_UnitTest();
--NA_ClassName="HUNTER";
--NA_UnitTest();
NA_ClassName="DRUID";
NA_UnitTest();
NA_TestMaxDPS(2);

--local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iSellPrice = GetItemInfo(16846);
--message(sName..","..iRarity..","..sType..","..iStackCount);
