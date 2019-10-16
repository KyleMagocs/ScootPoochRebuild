mySurf = surface_create(60, 60);
surface_set_target(mySurf); 
draw_clear_alpha(c_white,0);
// draw sprite to surface

draw_sprite(beeflarm, larmframe, 0, 0);
draw_sprite(beefrarm, rarmframe, 0, 0);
draw_sprite(beefbody, bodyframe, 30, 30);
draw_sprite(beeftail, tailframe, 0, 0);
draw_sprite(beefhead, headframe, -3, 0);
surface_reset_target();

draw_surface_ext(mySurf, x, y, z_height, z_height, angle, cr_none, 1);

surface_free(mySurf);
headframe = (headframe + 0.3) % 9;
larmframe = (larmframe + 0.3) % 9;
rarmframe = (rarmframe + 0.3) % 9;
tailframe = (tailframe + 0.2) % 9;