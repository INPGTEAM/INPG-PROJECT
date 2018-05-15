/// @description Player movement

if keyboard_check(vk_right){
	hspeed_ = 20;
}
else if keyboard_check(vk_left){
	hspeed_ = -20;
}
else { hspeed_ = 0; }

if place_meeting(x+hspeed_, y , o_ground){
	while !place_meeting(x+sign(hspeed_), y , o_ground) {x += sign(hspeed_);}
	
	hspeed_ = 0;
}

x += hspeed_;

if! place_meeting(x, y+1, o_ground){
	vspeed_+=gravity_;
}
else if keyboard_check(vk_up){
	vspeed_ = -30;
}



if place_meeting( x , y+vspeed_ , o_ground){
	while !place_meeting(x, y+sign(vspeed_) , o_ground) {y += sign(vspeed_);}
	
	vspeed_ = 0;
}

y += vspeed_;

