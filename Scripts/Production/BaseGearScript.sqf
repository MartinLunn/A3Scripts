@PinkMunn you can do it by making your composition, then getting the position of one thing and then spawning everything else with its pos relative to the first thing using getpos. 
Then put that into an ares custom module and use _this select 0 for the position of the first thing. https://github.com/ArmaAchilles/Achilles/wiki/Custom-Modules
It’ll take fucking ages and is in no way worth it, 
just build the thing in the editor, save a composition there and place it down wherever you need it before a mission, 
then run it in single player and use the save to sqf module in zeus


-----------------------------

So if I understand the process correctly, I set down a CSAT squad then execute the code locally?
Katla_Haddock10/21/2018
Yeah
it works with anyone but only CSAT AR/ heavy gunner would get an machine gun
russian pkm gunner would get a rifleman loadout


Gear Module (AI)
Execute the code as local: Placing this module anywhere in the world after CSAT units have been placed by the zeus, 
will change the gear of all currently placed AI on the map. 
This script will only change certain CSAT units such as CSAT Squad leaders, Riflemen(AT), Heavy gunner, Ect.


KS_GEAR = {
_KS_Uniform = "m93_od";
_KS_Vest = "mbavr_r";
_KS_Backpack = "rhs_sidor";
_KS_Headgear = "rhssaf_helmet_m59_85_nocamo";
_KS_NVGS = false;

_KS_Rifle = "hlc_rifle_M1903A1";
_KS_GL = "hlc_rifle_M1903A1";
_KS_LMG = "hlc_rifle_rpk";
_KS_MMG = "hlc_lmg_MG42";
_KS_LAT = "rhs_weap_rpg26";
_KS_MAT = "rhs_weap_rpg26";
_KS_Sniper = "hlc_rifle_M1903A1_unertl";

_KS_Rifle_Ammo = ["hlc_5rnd_3006_1903", 12];
_KS_Sniper_Ammo = ["hlc_5rnd_3006_1903", 6];
_KS_LMG_Ammo = ["hlc_45Rnd_762x39_t_rpk", 8];
_KS_MMG_Ammo = ["hlc_100Rnd_792x57_T_MG42", 3];
_KS_MAT_HEAmmo = ["rhs_rpg7_OG7V_mag", 5];
_KS_MAT_Ammo = ["", 0];
_KS_LAT_Ammo = ["", 0];
_KS_GL_HE = "rhs_VOG25";
_KS_GL_Smoke = "rhs_GRD40_White";

_Attach = "";
_Optic = "";

{if ((side _x) == East && !(_x getVariable ["Katla_Has_a_Small_Penis", false])) then {
    removeHeadgear _x;
    removeAllItems _x;
    removeAllWeapons _x;
    removeAllAssignedItems _x;

    if (uniform _x != _KS_Uniform) then {
        removeUniform _x;
        _x forceAddUniform _KS_Uniform;
    };
    if (vest _x != _KS_Vest) then {
        removeVest _x;
        _x addVest _KS_Vest;
    };
    if (backpack _x != _KS_Backpack) then {
        removeBackpack _x;
        _x addBackpack _KS_Backpack;
    };
    if (headGear _x != _KS_Headgear) then {
        removeHeadgear _x;
        _x addHeadGear _KS_Headgear;
    };
    if (_KS_NVGS) then {
        _x linkItem "NVGoggles_OPFOR";
    };
    switch (typeOf _x) do {
        case ("O_Soldier_SL_F"): {
            _x addMagazines _KS_Rifle_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_Rifle;
        };
        case ("O_Soldier_AR_F"): {
            _x addMagazines _KS_LMG_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_LMG;
        };
        case ("O_HeavyGunner_F"): {
            _x addMagazines _KS_MMG_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_MMG;
        };
        case ("O_Soldier_LAT_F"): {
            _x addMagazines _KS_Rifle_Ammo;
            _x addMagazines _KS_LAT_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_Rifle;
            _x addWeapon _KS_LAT;
        };
        case ("O_Soldier_AT_F"): {
            _x addWeapon _KS_Rifle;
            _X addWeapon _KS_MAT;
            _x addMagazines _KS_MAT_HEAmmo;
            _x addMagazines _KS_MAT_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
        };
        case ("O_soldier_M_F"): {
            _x addMagazines _KS_Sniper_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_Sniper;
            _x addPrimaryWeaponItem "rhs_acc_pso1m21";
        };
        default {
            _x addMagazines _KS_Rifle_Ammo;
            _x addMagazine "HandGrenade";
            _x addMagazine "SmokeShell";
            _x addWeapon _KS_Rifle;
        };
    };
    _x addPrimaryWeaponItem _Attach;
    _x enableGunLights "forceOn";
    if (25 > random 100) then {_x addPrimaryWeaponItem _Optic;};
    _x setVariable ["Katla_Has_a_Small_Penis", true, true];
    _x addeventhandler ["KILLED",{
        _this spawn {_unit = _this select 0; removeAllPrimaryWeaponItems _unit; _unit unlinkItem "NVGoggles_OPFOR";};
    }];
};
}forEach allUnits;
};

["Katla Stuff", "Gear5",
{
call KS_GEAR;

}] call Ares_fnc_RegisterCustomModule;

