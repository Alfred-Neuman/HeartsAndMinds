
/* ----------------------------------------------------------------------------
Function: btc_body_fnc_bagRecover

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _logistic - Logistic pad. [Object]

Returns:

Examples:
    (begin example)
        {_x addCuratorEditableObjects [btc_body_deadPlayers, false];} forEach allCurators; 
        [btc_create_object_point] call btc_body_fnc_bagRecover;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_logistic", objNull, [objNull]]
];

private _array = nearestObjects [_logistic, ["ACE_bodyBagObject", "CAManBase"], 10];
_array = _array select {
    _x isKindOf "CAManBase" ||
    _x isKindOf "ACE_bodyBagObject"
};
if (_array isEqualTo []) exitWith {
    localize "STR_BTC_HAM_O_BODYBAG_NO" call CBA_fnc_notify;
};

[_array select 0, player] remoteExecCall ["btc_body_fnc_bagRecover_s", 2];
