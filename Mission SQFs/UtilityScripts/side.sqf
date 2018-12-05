["PM-Side", "Side - select - change to Civilian",
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
		private _oldGroup = group _x; 
		private _newSide = civilian;
		private _newGroup = createGroup _newSide;
		(units _oldGroup) joinSilent _newGroup;
		deleteGroup _oldGroup;
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;

["PM-Side", "Side - select - change to Indfor",
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
		private _oldGroup = group _x; 
		private _newSide = resistance;
		private _newGroup = createGroup _newSide;
		(units _oldGroup) joinSilent _newGroup;
		deleteGroup _oldGroup;
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;

["PM-Side", "Side - select - change to WEST",
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
		private _oldGroup = group _x; 
		private _newSide = WEST;
		private _newGroup = createGroup _newSide;
		(units _oldGroup) joinSilent _newGroup;
		deleteGroup _oldGroup;
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;

["PM-Side", "Side - select - change to EAST",
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
		private _oldGroup = group _x; 
		private _newSide = EAST;
		private _newGroup = createGroup _newSide;
		(units _oldGroup) joinSilent _newGroup;
		deleteGroup _oldGroup;
	} forEach _selectedObjects;
}] call Ares_fnc_RegisterCustomModule;