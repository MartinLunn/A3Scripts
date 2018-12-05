["PM Gear Scripts ", "Civ - Middle Eastern - Armed Revolver 01",
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
	
	_PM_Uniform = "LOP_U_CHR_Woodlander_06";
	_PM_Vest = "";
	_PM_Backpack = "B_LegStrapBag_Coyote_F";
	_PM_Headgear = "H_Shemag_olive_hs";
	_PM_Goggles = "";
	
	_PM_PrimaryWeapon = "";
	_PM_PrimarySight = "";
	_PM_PrimaryRailAttachment = "";
	_PM_PrimaryMuzzleAttachment = "";
	_PM_PrimaryBipod = "";
	_PM_PrimaryLoadedMag = "6Rnd_45ACP_Cylinder";
	_PM_Primary_LoadedMag = "";
	_PM_Primary_LoadedSecondaryMag = "";
	_PM_PrimaryAmmo1 = "";
	_PM_PrimaryAmmo1Count = 0;
	_PM_PrimaryAmmo2 = "";
	_PM_PrimaryAmmo2Count = 0;
	_PM_PrimaryAmmo3 = "";
	_PM_PrimaryAmmo3Count = 0;
	
	_PM_Launcher = "";
	_PM_LauncherLoadedMag = "";
	_PM_LauncherSight = "";
	_PM_LauncherRailAttachment = "";
	_PM_LauncherAmmo1 = "";
	_PM_LauncherAmmo1Count = 0;
	_PM_LauncherAmmo2 = "";
	_PM_LauncherAmmo2Count = 0;
	_PM_LauncherAmmo3 = "";
	_PM_LauncherAmmo3Count = 0;
	
	_PM_Handgun = "hgun_Pistol_heavy_02_F";
	_PM_HandgunSight = "";
	_PM_HandgunRailAttachment = "";
	_PM_HandgunMuzzleAttachment = "";
	_PM_HandgunLoadedMag = "6Rnd_45ACP_Cylinder";
	_PM_HandgunAmmo1 = "6Rnd_45ACP_Cylinder";
	_PM_HandgunAmmo1Count = 5;
	_PM_HandgunAmmo2 = "";
	_PM_HandgunAmmo2Count = 0;
	
	
	
	{
		if (!(_x isKindOf "Man")) exitWith { systemChat format ["Zeus is an idiot, and tried to load custom gear for a vehicle."]; };
		
		if (uniform _x != _PM_Uniform) then {
			removeUniform _x;
			_x forceAddUniform _PM_Uniform;
		};
		
		if (vest _x != _PM_Vest) then {
			removeVest _x;
			_x addVest _PM_Vest;
		};
		
		if (backpack _x != _PM_Backpack) then {
			removeBackpack _x;
			_x addBackpack _PM_Backpack;
		};
		
		if (headgear _x != _PM_Headgear) then {
			removeHeadgear _x;
			_x addHeadgear _PM_Headgear;
		};

		if (goggles _x != _PM_Goggles) then {
			removeGoggles _x;
			_x addGoggles _PM_Goggles;
		};
		
		removeAllWeapons _x;
		
		_x addMagazine _PM_Primary_LoadedMag;
		_x addMagazine _PM_Primary_LoadedSecondaryMag;
		_x addWeapon _PM_PrimaryWeapon;
		_x addPrimaryWeaponItem _PM_PrimarySight;
		_x addPrimaryWeaponItem _PM_HandgunRailAttachment;
		_x addPrimaryWeaponItem _PM_PrimaryMuzzleAttachment;
		_x addPrimaryWeaponItem _PM_PrimaryBipod;
		_x addMagazines [_PM_PrimaryAmmo1, _PM_PrimaryAmmo1Count];
		_x addMagazines [_PM_PrimaryAmmo2, _PM_PrimaryAmmo2Count];
		_x addMagazines [_PM_PrimaryAmmo3, _PM_PrimaryAmmo3Count];
		
		_x addMagazine _PM_LauncherLoadedMag;
		_x addWeapon _PM_Launcher;
		_x addSecondaryWeaponItem _PM_LauncherSight;
		_x addSecondaryWeaponItem _PM_LauncherRailAttachment;
	
		_x addMagazines [_PM_LauncherAmmo1, _PM_LauncherAmmo1Count];
		_x addMagazines [_PM_LauncherAmmo2, _PM_LauncherAmmo2Count];
		
		_x addMagazine _PM_HandgunLoadedMag;
		_x addWeapon _PM_Handgun;
		_x addHandgunItem _PM_HandgunSight;
		_x addHandgunItem _PM_HandgunRailAttachment;
		_x addHandgunItem _PM_HandgunMuzzleAttachment;
		_x addMagazines [_PM_HandgunAmmo1, _PM_HandgunAmmo1Count];
		_x addMagazines [_PM_HandgunAmmo2, _PM_HandgunAmmo2Count];

		removeAllItems _x;
		removeAllAssignedItems _x;
		
	} forEach _selectedObjects;

}] call Ares_fnc_RegisterCustomModule;