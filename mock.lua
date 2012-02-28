SlashCmdList={};

--name, rank, iconTexture, count, duration, timeLeft = UnitBuff(UnitId,i); 
function UnitBuff(UnitId,i)
	if(UnitId == "player" and i==1) then
		return "熔岩护甲", 2, "", 0, 0, 0;
	end
end

--name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable =  UnitDebuff(UnitId,i);
function UnitDebuff(UnitId,i)
	if(UnitId == "player" and i==1) then
		return "火球!", 2, "", 0, 0, 0, 0, 0, 0;
	end
end

function GetSpellInfo(SpellID)
	return "name", "rank", "icon", 10, true, 1, 10, 0, 40;
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
	return "xxx";
end

function UnitClass(UnitId)
	return NA_ClassName,NA_ClassName;
end

function UnitIsDead(UnitId)
	return false;
end

function UnitExists(UnitId)
	return true;
end

function UnitCanAttack(UnitId)
	return true;
end

function UnitCanAssist(UnitId)
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
	return 1, 0;
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
	return true;
end

function UnitHealthMax(UnitId)
	return 100000;
end

function UnitHealth(UnitId)
	return 10000;
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
