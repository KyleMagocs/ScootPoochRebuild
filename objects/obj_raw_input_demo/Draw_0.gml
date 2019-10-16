/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 510DCB33
/// @DnDArgument : "code" "draw_set_font(fnt_raw_input_demo);$(13_10)draw_set_color(c_white);$(13_10)raw_input_update();$(13_10)var n = raw_mouse_get_count();$(13_10)var kn = raw_keyboard_get_count();$(13_10)draw_text(4, room_height - 24, string_hash_to_newline(string(n) + " potential mice, "$(13_10)+ string(kn) + " potential keyboards."));$(13_10)var gw = window_get_width();$(13_10)var gh = window_get_height();$(13_10)for (var i = 0; i < n; i++) {$(13_10)    var s = "mouse " + string(i);$(13_10)    //s += "#" + string_replace_all(raw_mouse_get_device_name(i), "#", "\#");$(13_10)    var mx = raw_mouse_x(i);$(13_10)    var my = raw_mouse_y(i);$(13_10)    if (raw_mouse_is_absolute(i)) {$(13_10)        // absolute-coordinate devices (like graphic tablet styluses) are measured$(13_10)        // in 0...65536, relative to desktop dimensions$(13_10)        mx = round(gw * mx / $10000);$(13_10)        my = round(gh * my / $10000);$(13_10)        s += " (abs.)";$(13_10)    } else {$(13_10)        // _x/_y are convenience functions for relative mice,$(13_10)        // it is up to you to decide if you want to clamp them and how$(13_10)        // (in this case, to game window bounds)$(13_10)        mx = clamp(mx, 0, gw);$(13_10)        my = clamp(my, 0, gh);$(13_10)        raw_mouse_set(i, mx, my);$(13_10)    }$(13_10)    //$(13_10)    draw_circle(mx, my, 10, true);$(13_10)    for (var b = mb_left; b <= mb_middle; b++) {$(13_10)        s += "#";$(13_10)        switch (b) {$(13_10)            case mb_left: s += "mb_left"; break;$(13_10)            case mb_right: s += "mb_right"; break;$(13_10)            case mb_middle: s += "mb_middle"; break;$(13_10)        }$(13_10)        s += ": ";$(13_10)        if (raw_mouse_check_button_released(i, b)) {$(13_10)            s += "released";$(13_10)        } else if (raw_mouse_check_button_pressed(i, b)) {$(13_10)            s += "pressed";$(13_10)        } else if (raw_mouse_check_button(i, b)) {$(13_10)            s += "down";$(13_10)        } else s += "up";$(13_10)    }$(13_10)    // unlike raw_mouse_wheel_up/down, _delta_z$(13_10)    // accounts for multiple wheel ticks between game frames$(13_10)    var dz = raw_mouse_delta_z(i);$(13_10)    s += "#wheel: " + string(dz);$(13_10)    // exponential speed controls:$(13_10)    var sp = raw_mouse_get_speed(i);$(13_10)    s += "#speed: " + string(sp);$(13_10)    if (dz != 0) {$(13_10)        raw_mouse_set_speed(i, power(2, log2(sp) + dz / 4));$(13_10)    }$(13_10)    //$(13_10)    draw_text(mx + 15, my - 15, string_hash_to_newline(s));$(13_10)$(13_10)}$(13_10)// show keyboard buttons:$(13_10)var kf = 0;$(13_10)draw_set_valign(2);$(13_10)draw_set_halign(2);$(13_10)for (var i = 0; i < kn; i++) {$(13_10)    for (var k = 0; k < 256; k++) {$(13_10)        if (raw_keyboard_check(i, k)) {$(13_10)            var s = scr_raw_input_demo_keyboard_key_name(k);$(13_10)            if (s == "") s = "Key " + string(k);$(13_10)            draw_text(gw - 4, gh - 4 - kf * 20, string_hash_to_newline(s + " on kb " + string(i)));$(13_10)            kf++;$(13_10)        }$(13_10)    }$(13_10)}$(13_10)draw_set_valign(0);$(13_10)draw_set_halign(0);$(13_10)$(13_10)"
draw_set_font(fnt_raw_input_demo);
draw_set_color(c_white);
raw_input_update();
var n = raw_mouse_get_count();
var kn = raw_keyboard_get_count();
draw_text(4, room_height - 24, string_hash_to_newline(string(n) + " potential mice, "
+ string(kn) + " potential keyboards."));
var gw = window_get_width();
var gh = window_get_height();
for (var i = 0; i < n; i++) {
    var s = "mouse " + string(i);
    //s += "#" + string_replace_all(raw_mouse_get_device_name(i), "#", "\#");
    var mx = raw_mouse_x(i);
    var my = raw_mouse_y(i);
    if (raw_mouse_is_absolute(i)) {
        // absolute-coordinate devices (like graphic tablet styluses) are measured
        // in 0...65536, relative to desktop dimensions
        mx = round(gw * mx / $10000);
        my = round(gh * my / $10000);
        s += " (abs.)";
    } else {
        // _x/_y are convenience functions for relative mice,
        // it is up to you to decide if you want to clamp them and how
        // (in this case, to game window bounds)
        mx = clamp(mx, 0, gw);
        my = clamp(my, 0, gh);
        raw_mouse_set(i, mx, my);
    }
    //
    draw_circle(mx, my, 10, true);
    for (var b = mb_left; b <= mb_middle; b++) {
        s += "#";
        switch (b) {
            case mb_left: s += "mb_left"; break;
            case mb_right: s += "mb_right"; break;
            case mb_middle: s += "mb_middle"; break;
        }
        s += ": ";
        if (raw_mouse_check_button_released(i, b)) {
            s += "released";
        } else if (raw_mouse_check_button_pressed(i, b)) {
            s += "pressed";
        } else if (raw_mouse_check_button(i, b)) {
            s += "down";
        } else s += "up";
    }
    // unlike raw_mouse_wheel_up/down, _delta_z
    // accounts for multiple wheel ticks between game frames
    var dz = raw_mouse_delta_z(i);
    s += "#wheel: " + string(dz);
    // exponential speed controls:
    var sp = raw_mouse_get_speed(i);
    s += "#speed: " + string(sp);
    if (dz != 0) {
        raw_mouse_set_speed(i, power(2, log2(sp) + dz / 4));
    }
    //
    draw_text(mx + 15, my - 15, string_hash_to_newline(s));

}
// show keyboard buttons:
var kf = 0;
draw_set_valign(2);
draw_set_halign(2);
for (var i = 0; i < kn; i++) {
    for (var k = 0; k < 256; k++) {
        if (raw_keyboard_check(i, k)) {
            var s = scr_raw_input_demo_keyboard_key_name(k);
            if (s == "") s = "Key " + string(k);
            draw_text(gw - 4, gh - 4 - kf * 20, string_hash_to_newline(s + " on kb " + string(i)));
            kf++;
        }
    }
}
draw_set_valign(0);
draw_set_halign(0);