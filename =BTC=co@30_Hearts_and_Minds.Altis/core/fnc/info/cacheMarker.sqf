
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_cacheMarker

Description:
    Fill me when you edit me !

Parameters:
    _position - Position of the cahce. [Array]
    _radius - Radius of the indication. [Number]

Returns:

Examples:
    (begin example)
        [btc_cache_pos, btc_cache_info] call btc_fnc_info_cacheMarker;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_position", btc_cache_pos, [[]]],
    ["_radius", btc_cache_info, [0]],
    ["_isReal", true, [true]],
    ["_showHint", 0, [0]]
];

private _pos = [_position, _radius] call CBA_fnc_randPos;

if !(_isReal) then {
    private _axis = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize") / 2;
    _pos = [[_axis, _axis, 0], _radius + _axis] call CBA_fnc_randPos;
};

private _marker = createMarker [format ["%1", _pos], _pos];
_marker setMarkerType "hd_unknown";
_marker setMarkerText format ["%1m", _radius];
_marker setMarkerSize [0.5, 0.5];
_marker setMarkerColor "ColorRed";

btc_cache_markers pushBack _marker;

if (_showHint > 0) then {[1] remoteExec ["btc_fnc_show_hint", 0];};

_radius - btc_info_cache_ratio
