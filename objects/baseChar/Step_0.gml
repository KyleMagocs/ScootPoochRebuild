
if(speed < 0.1)
{
	speed = 0;
}
else
{
	speed = speed * .9;
}

if(speed > 0){ 
	headframe = (headframe + 0.3) % 9;
	larmframe = (larmframe + 0.3) % 9;
	rarmframe = (rarmframe + 0.3) % 9;
}
tailframe = (tailframe + 0.2) % 9;

camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2);