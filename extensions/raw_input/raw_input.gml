#define raw_mouse_preinit
/// @description  ()~
// Layout:
// 0: x, 1: y, 2: dx, 3: dy, 4: dz
// 5: is_absolute, 6: is_virtual,
// 7+: 3x(check,pressed,released)
// 16: (speed-1)
global.g_raw_mouse_grid = ds_grid_create(1, 17);
global.g_raw_mouse_buffer = buffer_create(16, buffer_grow, 1);
global.g_raw_mouse_count = 0;
global.g_raw_keyboard_buffer = buffer_create(256, buffer_grow, 1);
global.g_raw_keyboard_count = 0;

#define raw_input_init
/// @description  (flags = raw_input_watch_hid_mice|raw_input_watch_hid_keyboards)
/// @param flags = raw_input_watch_hid_mice|raw_input_watch_hid_keyboards
//#macro raw_input_watch_hid_mice 1
//#macro raw_input_watch_system_mouse 2
//#macro raw_input_watch_rdp_mice 4
//#macro raw_input_watch_hid_keyboards 8
var l_flags; if (argument_count > 0) l_flags = argument[0]; else l_flags = raw_input_watch_hid_mice|raw_input_watch_hid_keyboards;
return raw_mouse_init_raw(window_handle(), l_flags);

#define raw_mouse_cleanup
/// @description  ()~
return raw_mouse_cleanup_raw();

#define raw_input_update
/// @description  () : Call once per frame!
//!#import buffer_* in Buffer:
var n = raw_mouse_get_count_raw();
var d = global.g_raw_mouse_grid;
var i = global.g_raw_mouse_count;
var b/*:Buffer*/ = global.g_raw_mouse_buffer;
if (i != n) {
	global.g_raw_mouse_count = n;
	ds_grid_resize(d, n, ds_grid_height(d));
	if (n > i) buffer_resize(b, buffer_sizeof(buffer_s32) * 4 * n);
}
if (!raw_mouse_get_data_raw(buffer_get_address(b))) {
	return false;
}
buffer_seek(b, 0, 0);
for (i = 0; i < n; i++) {
	var dx = buffer_read(b, buffer_s32);
	var dy = buffer_read(b, buffer_s32);
	var dz = buffer_read(b, buffer_s32);
	var df = buffer_read(b, buffer_s32);
	if (df & 8) {
		d[#i, 2] = dx - d[#i, 0];
		d[#i, 3] = dy - d[#i, 1];
		d[#i, 0] = dx;
		d[#i, 1] = dy;
	} else {
		var dm = d[#i, 16] + 1;
		dx *= dm;
		dy *= dm;
		d[#i, 0] += dx;
		d[#i, 1] += dy;
		d[#i, 2] = dx;
		d[#i, 3] = dy;
	}
	d[#i, 4] = dz;
	d[#i, 5] = (df & 8) != 0;
	d[#i, 6] = (df & 16) != 0;
	for (var k = 0; k < 3; k++) {
		var v0 = d[#i, 7 + 3 * k];
		var v1 = (df & (1 << k)) != 0;
		d[#i, 7 + 3 * k] = v1;
		d[#i, 8 + 3 * k] = v1 && !v0;
		d[#i, 9 + 3 * k] = !v1 && v0;
	}
}
//
b = global.g_raw_keyboard_buffer;
i = global.g_raw_keyboard_count;
n = raw_keyboard_get_count_raw();
if (n > i) buffer_resize(b, 256 * n);
global.g_raw_keyboard_count = n;
raw_keyboard_get_data_raw(buffer_get_address(b));
return true;

#define raw_keyboard_get_count
/// @description  ()
return global.g_raw_keyboard_count;

#define raw_keyboard_check_raw
/// @description  (index, key, state)~
/// @param index
/// @param  key
/// @param  state
if (argument0 < 0 || argument0 >= global.g_raw_keyboard_count) return false;
if (argument1 < 0 || argument1 >= 256) return false;
//show_debug_message(string(argument0) + " " + string(argument1));
return (buffer_peek(global.g_raw_keyboard_buffer, 256 * argument0 + argument1, buffer_u8) & (1 << argument2)) != 0;

#define raw_keyboard_check
/// @description  (index, key)
/// @param index
/// @param  key
return raw_keyboard_check_raw(argument0, argument1, 0);

#define raw_keyboard_check_pressed
/// @description  (index, key)
/// @param index
/// @param  key
return raw_keyboard_check_raw(argument0, argument1, 1);

#define raw_keyboard_check_released
/// @description  (index, key)
/// @param index
/// @param  key
return raw_keyboard_check_raw(argument0, argument1, 2);

#define raw_mouse_get_count
/// @description  ()
return global.g_raw_mouse_count;

#define raw_mouse_x
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
return global.g_raw_mouse_grid[#argument0, 0];

#define raw_mouse_y
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
return global.g_raw_mouse_grid[#argument0, 1];

#define raw_mouse_set
/// @description  (index, x, y)
/// @param index
/// @param  x
/// @param  y
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
global.g_raw_mouse_grid[#argument0, 0] = argument1;
global.g_raw_mouse_grid[#argument0, 1] = argument2;

#define raw_mouse_get_speed
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 1;
return 1 + global.g_raw_mouse_grid[#argument0, 16];

#define raw_mouse_set_speed
/// @description  (index, new_multiplier)
/// @param index
/// @param  new_multiplier
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 1;
global.g_raw_mouse_grid[#argument0, 16] = argument1 - 1;

#define raw_mouse_delta_x
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
return global.g_raw_mouse_grid[#argument0, 2];

#define raw_mouse_delta_y
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
return global.g_raw_mouse_grid[#argument0, 3];

#define raw_mouse_delta_z
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return 0;
return global.g_raw_mouse_grid[#argument0, 4];

#define raw_mouse_wheel_up
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return false;
return global.g_raw_mouse_grid[#argument0, 4] < 0;

#define raw_mouse_wheel_down
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return false;
return global.g_raw_mouse_grid[#argument0, 4] > 0;

#define raw_mouse_check_button_raw
/// @description  (index, mb, offset)~
/// @param index
/// @param  mb
/// @param  offset
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return false;
switch (argument1) {
	case mb_any:
		for (var k = 0; k < 3; k++) {
			if (global.g_raw_mouse_grid[#argument0, 7 + k * 3 + argument2]) return true;
		}
		return false;
	case mb_none:
		for (var k = 0; k < 3; k++) {
			if (global.g_raw_mouse_grid[#argument0, 7 + k * 3 + argument2]) return false;
		}
		return true;
	case mb_left: return global.g_raw_mouse_grid[#argument0, 7 + argument2];
	case mb_right: return global.g_raw_mouse_grid[#argument0, 10 + argument2];
	case mb_middle: return global.g_raw_mouse_grid[#argument0, 13 + argument2];
	default: return false;
}

#define raw_mouse_check_button
/// @description  (index, mb)
/// @param index
/// @param  mb
return raw_mouse_check_button_raw(argument0, argument1, 0);

#define raw_mouse_check_button_pressed
/// @description  (index, mb)
/// @param index
/// @param  mb
return raw_mouse_check_button_raw(argument0, argument1, 1);

#define raw_mouse_check_button_released
/// @description  (index, mb)
/// @param index
/// @param  mb
return raw_mouse_check_button_raw(argument0, argument1, 2);

#define raw_mouse_is_absolute
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return false;
return global.g_raw_mouse_grid[#argument0, 5];

#define raw_mouse_is_virtual_desktop
/// @description  (index)
/// @param index
if (argument0 < 0 || argument0 >= global.g_raw_mouse_count) return false;
return global.g_raw_mouse_grid[#argument0, 6];

