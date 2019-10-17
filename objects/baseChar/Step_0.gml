
// decelerate
if(speed < 0.1) speed = 0;
else speed = speed * .9; 

z_height += z_speed
// falling
z_speed -= 0.02
if (z_height < 1){
    z_height = 1
    z_speed = 0
    jumping = false;
}

// jumping
if (jumping){
	bodyframe++;
	if(bodyframe > 8) bodyframe = 8;
}
else bodyframe = 0;
// this is for jumping on top of things
//if (z_height < min_z){
 //   z_height = min_z
 //   z_speed = 0
    // jump_state = 0
//}

// animation
if(speed > 0){ 
	headframe = (headframe + 0.3) % 9;
	larmframe = (larmframe + 0.3) % 9;
	rarmframe = (rarmframe + 0.3) % 9;
}
tailframe = (tailframe + 0.2) % 9;

//camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2);