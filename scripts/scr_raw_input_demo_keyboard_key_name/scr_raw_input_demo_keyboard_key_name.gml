/// @description  keyboard_key_name(keycode:int)
/// @param keycode:int
var name = global.keyboard_key_to_name[?argument0];
if (name == undefined) return "";
return name;
