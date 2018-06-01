/// @description Movement

//Speed
var hsp = dir*_movespeed;
var vsp = v_speed;
v_speed += _gravity;

//Collision
//vertical:
y += vsp
//collision mask

if (vsp > 0) { // downowards - collision mask
	var t1 = check_for_vertical_collision(tilemap, 0);
	if (t1 != 0){
		y = ((bbox_bottom & ~31)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
} else { //upwards - collision mask
	var t1 = check_for_vertical_collision(tilemap, 1);
	if (t1 != 0 ){
		y = ((bbox_top + 32) & ~31) - sprite_bbox_top;
		v_speed = 0;
	}
}

//Horizontal:
x += hsp;
if (hsp > 0) { //right - collision mask
	var t1 = check_for_horizontal_collision(tilemap, 0);
	if (t1 != 0){
		x = ((bbox_right & ~31)-1) - sprite_bbox_right;
		dir= -(dir);
	}
} else { //left - collision mask
	var t1 = check_for_horizontal_collision(tilemap, 1);

	if (t1 != 0){
		x = ((bbox_left+ 32) & ~31) - sprite_bbox_left;
		dir= -(dir);
	}
}

var _direction = sign(hsp)

if (_direction != 0) _facing = _direction;
image_xscale=sign(_facing);

//Dyin

if(hp<=0) instance_destroy();