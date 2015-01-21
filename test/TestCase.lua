package.path = '../src/?.lua;' .. package.path

require "mock"
require "NAutil"
require "NAUIutil"
require "NAcore"
require "NAdeathknight"
require "NAdruid"
require "NAhunter"
require "NAmage"
require "NAmonk"
require "NApaladin"
require "NApriest"
require "NArogue"
require "NAshaman"
require "NAwarlock"
require "NAwarrior"
require "NAframe"

NA_LogLevel = 3;
NA_IsTest = true;

function NA_TestMaxDPS(no)
	local tmpNA_IsTest = NA_IsTest;
	local tmpNA_LogLevel = NA_LogLevel;

	NA_IsTest = true;
	NA_LogLevel = 1;
	NA_InitProfile(no);
	W_Log(1, NA_MaxDps());

	NA_IsTest = tmpNA_IsTest;
	NA_LogLevel = tmpNA_LogLevel;
end

function NA_UnitTest()
	testSlashHandler();
	NA_TestMaxDPS(0);
	NA_TestMaxDPS(1);
	testColor();
	W_Log(1,GetInventoryItemCooldown("player",13));
	W_Log(1,GetInventoryItemCooldown("player",14));
end

function testSlashHandler()
	NA_SlashHandler("init1");
	NA_SlashHandler("options");
	NA_SlashHandler("opt");
	NA_SlashHandler("version");
	NA_SlashHandler("ver");
	NA_SlashHandler("toggle");
	NA_SlashHandler("toggle");
	NA_SlashHandler("mykey");
	NA_SlashHandler("xxxxx");
end

function testColor()
	for value=0,0xfff,1 do
		if value >= 1000 then break end
		local color = NAParseValue2Color(value)
		local value2 = NAParseColor2Value(color);
		--print(value..'::'..color .. '-->'..value2);
		NA_ShowVars(value);
	end
end

function testBuffs()
	print('凜冬號角:'..tostring(W_HasBuff('player', 57330, true)));
	print('凜冬號角:'..tostring(W_BuffTime('player', 57330, true)));
	print('杀戮机器:'..tostring(W_HasBuff('player', 51124, true)));
	print('冰冻之雾:'..tostring(W_HasBuff('player', 59052, true)));
	print('冰霜疫病:'..tostring(W_RetainBuff('target', -55095, true)));
	print('血之疫病:'..tostring(W_RetainBuff('target', -55078, true)));
end

function testAllSpellInfo()
	local allClassName = {'PALADIN', 'HUNTER', 'DEATHKNIGHT', 'MAGE', 'WARLOCK'};
	for k,v in pairs(allClassName) do
		for pno=0,2,1 do
			NA_initClassData(v, pno);

			W_Log(3,v..'=============='..NA_CurrTelant);
			for k,v in pairs(NA_Actions) do
				if(listSpell[v] == nil) then
					W_Log(4, v..'---'..listSpell[v]);
				end
			end
		end
	end
end

NA_ClassName="DEATHKNIGHT";
NA_init()
NA_InitProfile(1);
--NA_TestMaxDPS(0);
--testColor();
--testBuffs();
--for k in pairs(NA_ClassInfo) do
--	if(NA_ClassInfo[k] ~= nil)then
--		print(k..'---'..NA_ClassInfo[k].keyNo);
--		NA_ShowVars(NA_ClassInfo[k].keyNo);
--	end
--end
--testAllSpellInfo();
