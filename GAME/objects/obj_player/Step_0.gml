/// @description Movement logic
// geting the input

//FIRST TYPE

// jumping
// for collision mask
var t1 = check_for_jumping_collision(tilemap);
if (t1 !=0){
	if (keyboard_check(vk_up)) {
		v_speed = (-jump_speed);
		jump_ref = 20
	}
}
//for one way tiles
var t1 = check_for_jumping_collision(tilemap2);
if (t1 !=0){
	if (keyboard_check(vk_up) && jump_ref <=0) {
		v_speed = (-jump_speed);
		jump_ref = 20;
	}
}
jump_ref -= 1;
// geting the input
var _direction = (keyboard_check(vk_right) - keyboard_check(vk_left));
var hsp = _direction * _spd;
var vsp = v_speed;
var dsh = keyboard_check(vk_shift);
if (_direction != 0) _facing = _direction;
v_speed += _gravity;

y += vsp;
// VERTICAL
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
//one way tiles mask
if(keyboard_check(vk_down)) refresh = 5;
if (vsp > 0 && refresh <= 0) { // downowards - one way tiles mask
	var t1 = check_for_vertical_collision(tilemap2, 0);
	if (t1 != 0){
		y = ((bbox_bottom & ~31)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
}
refresh -= 1;
//HORIZONTAL MOVE
//collision mask 
x = x+ dsh * _dash* _facing;
x += hsp;
if (hsp > 0 || dsh != 0) { //right - collision mask
	var t1 = check_for_horizontal_collision(tilemap, 0);
	if (t1 != 0){
		x = ((bbox_right & ~31)-1) - sprite_bbox_right;
	}
} 
if (hsp <= 0 || dsh != 0) { //left - collision mask
	var t1 = check_for_horizontal_collision(tilemap, 1);

	if (t1 != 0){
		x = ((bbox_left+ 32) & ~31) - sprite_bbox_left;
	}
}
