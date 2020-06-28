
draw_sprite_ext(larmsprite, larmframe, x, y, z_height, z_height, direction-90, cr_none, z_height);
draw_sprite_ext(rarmsprite, rarmframe, x, y, z_height, z_height, direction-90, cr_none, z_height);
draw_sprite_ext(bodysprite, bodyframe, x, y, z_height, z_height, direction-90, cr_none, z_height);
draw_sprite_ext(tailsprite, tailframe, x, y, z_height, z_height, direction-90, cr_none, z_height);
draw_sprite_ext(headsprite, headframe, x, y, z_height, z_height, direction-90, cr_none, z_height);

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
//draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom, c_purple, c_purple, c_black, c_white, false);