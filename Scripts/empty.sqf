["PM Gear Scripts ", "!!Empty",
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
		removeAllWeapons _x;
		removeHeadgear _x;
		removeUniform _x;
		removeVest _x;
		removeBackpack _x;
		removeAllItems _x;
		removeAllWeapons _x;
		removeAllAssignedItems _x;
		removeGoggles _x;
	} forEach _selectedObjects

}] call Ares_fnc_RegisterCustomModule;