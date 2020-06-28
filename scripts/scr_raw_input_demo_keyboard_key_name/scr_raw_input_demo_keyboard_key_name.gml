/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 23587551
/// @DnDArgument : "code" "/// @description  keyboard_key_name(keycode:int)$(13_10)/// @param keycode:int$(13_10)var name = global.keyboard_key_to_name[?argument0];$(13_10)if (name == undefined) return "";$(13_10)return name;$(13_10)"
/// @description  keyboard_key_name(keycode:int)
/// @param keycode:int
var name = global.keyboard_key_to_name[?argument0];
if (name == undefined) return "";
return name;