SlashCmdList={};
strlen = string.len
strsub = string.sub

MockUserInfo={
	player={
		level=90,
		name = 'xxx',
		classname = '死亡骑士',
		enclassname = 'DEATHKNIGHT',
		buff={
			{"熔岩护甲", 2, "", 0, 0, 0},
			{"杀戮机器", 2, "", 0, 0, 0},
		},
		debuff={
			{"火球!", 2, "", 0, 0, 0, 0, 0, 0},
		},
	},
	target={
		level=90,

	}
}

function getglobal(name)
	return nil;
end

--name, rank, iconTexture, count, duration, timeLeft = UnitBuff(UnitId,i);
function UnitBuff(UnitId,i)
	if(MockUserInfo[UnitId] ~= nil and MockUserInfo[UnitId].buff ~= nil)then
		return MockUserInfo[UnitId].buff[i];
	end
	return nil;
end

--name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable =  UnitDebuff(UnitId,i);
function UnitDebuff(UnitId,i)
	if(MockUserInfo[UnitId] ~= nil and MockUserInfo[UnitId].debuff ~= nil)then
		return MockUserInfo[UnitId].debuff[i];
	end
	return nil;
end

function UnitLevel(UnitId)
	return MockUserInfo[UnitId]['level'];
end


function GetSpellInfo(spellID)
	return NA_getSpellName(spellID), "rank", "icon", 10, true, 1, 10, 0, 40;
end

function IsUsableAction(slot)
	if(slot>0 and slot<25) then return true; end
	return false;
end

function IsSpellInRange(spellName, UnitId)
	return 1;
end

function ItemHasRange(itemName, UnitId)
	return 1;
end

function IsItemInRange(itemName, UnitId)
	return 1;
end

function UnitName(UnitId)
	return MockUserInfo[UnitId].name;
end

function UnitClass(UnitId)
	return MockUserInfo[UnitId].classname, MockUserInfo[UnitId].enclassname;
end

function UnitIsDead(UnitId)
	return false;
end

function UnitExists(UnitId)
	return true;
end

function UnitCanAttack(UnitId)
	return 1;
end

function UnitCanAssist(UnitId)
	return false;
end

function UnitInVehicle(UnitId)
	return false;
end

function UnitPower(UnitId)
	return 1000;
end

function UnitPowerMax()
	return 10000;
end

function UnitInRaid(UnitId)
	return nil;
end

function GetActionCooldown(slot)
	if(slot>0 and slot<25) then return 0,0,1; end
	return time(),100, 0;
end

function CheckInteractDistance(UnitId, type)
	return true;
end

function IsMounted()
	return false;
end

function IsFlying()
	return false;
end

function SpellHasRange(UnitId)
	return 1;
end

function IsUsableSpell(spell)
	return 1, nil;
end

function IsUsableItem(item)
	return 1,0;
end

function GetItemCooldown(item)
	return 0,0,1;
end

function GetSpellCooldown(spell)
	return 0,0,1;
end

function GetInventoryItemCooldown(solt)
	return 0,0,1;
end

function UnitIsEnemy(UnitId1,UnitId2)
	return true;
end

function UnitIsTapped(UnitId)
	return true;
end

function UnitAffectingCombat(UnitId)
	return 1;
end

function UnitHealthMax(UnitId)
	return 100000;
end

function UnitHealth(UnitId)
	return 100000;
end

function UnitCastingInfo(UnitId)
	return nil;
end

function UnitChannelInfo(UnitId)
	return nil;
end

function UnitClassification(UnitId)
	return "normal"
end

function UnitIsPlayer(UnitId)
	return true;
end

function UnitIsVisible(UnitId)
	return 1;
end

function SaveBindings(type)
	return;
end

function SetBinding(key,cmd)
	W_Log(1, "SetBinding:["..key.."]"..cmd);
	return;
end

function SetBindingSpell(key,cmd)
	W_Log(1, "SetBindingSpell:["..key.."]"..cmd);
	return;
end

function SetBindingItem(key,cmd)
	W_Log(1, "SetBindingItem:["..key.."]"..cmd);
	return;
end

function SetBindingMacro(key,cmd)
	W_Log(1, "SetBindingMacro:["..key.."]"..cmd);
	return;
end

function GetShapeshiftForm()
	return 3;
end

function GetTime()
	return 60123.558;
end
