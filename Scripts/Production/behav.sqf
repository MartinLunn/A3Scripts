["PM-Behavior", "All - slow and careless", 
{
	{
		group _x setBehaviour "CARELESS";
		group _x setSpeedMode "LIMITED";
		group _x setCombatMode "BLUE";
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "All - normal", 
{
	{
		group _x setBehaviour "AWARE";
		group _x setSpeedMode "NORMAL";
		group _x setCombatMode "YELLOW";
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "All - combat and fast", 
{
	{
		group _x setBehaviour "COMBAT";
		group _x setSpeedMode "FULL";
		group _x setCombatMode "RED";
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Civ - global - slow and careless", 
{
	{
		if (side group _x == civilian) 
		then 
		{ 
			group _x setBehaviour "CARELESS";
			group _x setSpeedMode "LIMITED";
			group _x setCombatMode "BLUE";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Civ - global - normal", 
{
	{
		if (side group _x == civilian) 
		then 
		{ 
			group _x setBehaviour "AWARE";
			group _x setSpeedMode "NORMAL";
			group _x setCombatMode "YELLOW";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Civ - global - combat and fast", 
{
	{
		if (side group _x == civilian) 
		then 
		{ 
			group _x setBehaviour "COMBAT";
			group _x setSpeedMode "FULL";
			group _x setCombatMode "RED";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "EAST - global - slow and careless", 
{
	{
		if (side group _x == EAST) 
		then 
		{ 
			group _x setBehaviour "CARELESS";
			group _x setSpeedMode "LIMITED";
			group _x setCombatMode "BLUE";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "EAST - global - normal", 
{
	{
		if (side group _x == EAST) 
		then 
		{ 
			group _x setBehaviour "AWARE";
			group _x setSpeedMode "NORMAL";
			group _x setCombatMode "YELLOW";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "EAST - global - combat and fast", 
{
	{
		if (side group _x == EAST) 
		then 
		{ 
			group _x setBehaviour "COMBAT";
			group _x setSpeedMode "FULL";
			group _x setCombatMode "RED";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "WEST - global - slow and careless", 
{
	{
		if (side group _x == WEST) 
		then 
		{ 
			group _x setBehaviour "CARELESS";
			group _x setSpeedMode "LIMITED";
			group _x setCombatMode "BLUE";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "WEST - global - normal", 
{
	{
		if (side group _x == WEST) 
		then 
		{ 
			group _x setBehaviour "AWARE";
			group _x setSpeedMode "NORMAL";
			group _x setCombatMode "YELLOW";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "WEST - global - combat and fast", 
{
	{
		if (side group _x == WEST) 
		then 
		{ 
			group _x setBehaviour "COMBAT";
			group _x setSpeedMode "FULL";
			group _x setCombatMode "RED";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Ind - global - slow and careless", 
{
	{
		if (side group _x == resistance) 
		then 
		{ 
			group _x setBehaviour "CARELESS";
			group _x setSpeedMode "LIMITED";
			group _x setCombatMode "BLUE";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Ind - global - normal", 
{
	{
		if (side group _x == resistance) 
		then 
		{ 
			group _x setBehaviour "AWARE";
			group _x setSpeedMode "NORMAL";
			group _x setCombatMode "YELLOW";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "Ind - global - combat and fast", 
{
	{
		if (side group _x == resistance) 
		then 
		{ 
			group _x setBehaviour "COMBAT";
			group _x setSpeedMode "FULL";
			group _x setCombatMode "RED";
		}
	} forEach allUnits;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "All - select - slow and careless",
{
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _selectedObjects = if (isNull _objectUnderCursor) then
	{
		["Objects"] call Achilles_fnc_SelectUnits;
	}
	else
	{
		[_objectUnderCursor];
	};
	if (isNil "_selectedObjects") exitWith {};
	if (_selectedObjects isEqualTo []) exitWith 
	{
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};
	{
		group _x setBehaviour "CARELESS";
		group _x setSpeedMode "LIMITED";
		group _x setCombatMode "BLUE";
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "All - select - normal",
{
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _selectedObjects = if (isNull _objectUnderCursor) then
	{
		["Objects"] call Achilles_fnc_SelectUnits;
	}
	else
	{
		[_objectUnderCursor];
	};
	if (isNil "_selectedObjects") exitWith {};
	if (_selectedObjects isEqualTo []) exitWith 
	{
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};
	{
		group _x setBehaviour "AWARE";
		group _x setSpeedMode "NORMAL";
		group _x setCombatMode "YELLOW";
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;

["PM-Behavior", "All - select - combat and fast",
{
	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
	private _selectedObjects = if (isNull _objectUnderCursor) then
	{
		["Objects"] call Achilles_fnc_SelectUnits;
	}
	else
	{
		[_objectUnderCursor];
	};
	if (isNil "_selectedObjects") exitWith {};
	if (_selectedObjects isEqualTo []) exitWith 
	{
		["No object was selected!"] call Achilles_fnc_showZeusErrorMessage;
	};
	{
		group _x setBehaviour "COMBAT";
		group _x setSpeedMode "FULL";
		group _x setCombatMode "RED";
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;