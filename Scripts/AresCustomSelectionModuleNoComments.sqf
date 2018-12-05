["My Category", "My Module",
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
	systemChat format ["Position: %1 and Selected objects: %2", _position, _selectedObjects];
}] call Ares_fnc_RegisterCustomModule;