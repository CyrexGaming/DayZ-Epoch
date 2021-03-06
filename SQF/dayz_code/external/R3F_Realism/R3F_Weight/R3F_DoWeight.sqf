/****************************************************************************
Copyright (C) 2010 Team ~R3F~
This program is free software under the terms of the GNU General Public License version 3.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
@authors team-r3f.org
@version 1.00
@date 20101006
*****************************************************************************/

#include "R3F_WEIGHT_Configuration.sqf"

call compile preprocessFile "\z\addons\dayz_code\external\R3F_Realism\R3F_Weight\R3F_Weight_Fnct.sqf";

private ["_n","_gearbox_visible","_control","_display","_initial_text"];

disableSerialization;

R3F_Weight = call R3F_WEIGHT_FNCT_GetWeight;

_initial_text = "";
_n = 0;
while {true} do
{
	uiSleep R3F_WEIGHT_SHORT_DELAY;
	
	#ifdef R3F_WEIGHT_SHOW_WEIGHT
	_display = findDisplay ARMA2_RSCDISPLAYGEARBOX;
	_gearbox_visible = ( (str _display) != "No display");
	#else
	_gearbox_visible = false;
	#endif
	
	if (_gearbox_visible) then {
		//Moved code to object_monitorGear.sqf
		_n = 0;
	}else{
		if( _n > R3F_WEIGHT_LONG_DELAY) then {
			R3F_Weight = call R3F_WEIGHT_FNCT_GetWeight;
			_n = 0;
		};
		_n = _n + 1 ;
	};
};
