["PM Gear Scripts ", "!!Test",
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

	_loadout = [/* this is the loadout array */];
	{
	  _x setUnitLoadout _loadout;
	} forEach _selectedObjects;

}] call Ares_fnc_RegisterCustomModule;
