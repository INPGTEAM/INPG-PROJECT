/// @description Movement logic


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
var hsp ;
var vsp = v_speed;
var dsh = keyboard_check(vk_shift);
if (_direction != 0) _facing = _direction;
v_speed += _gravity;
// jumping
// for collision mask
var t2 = check_for_horizontal_collision(tilemap,0);
if (t2 !=0) blink_max = 1;
var t1 = check_for_jumping_collision(tilemap);
if (t1 !=0 ){
	on_ground = true;
	_jumps = 1;
	blink_max =1;
} else {
	on_ground = false;
}

if (on_ground== true) {
	v_speed = 0;
	if(keyboard_check(vk_up)){
		v_speed = (-jump_speed);
	}
}
if (on_ground == false && _jumps >0){
	if(keyboard_check_pressed(vk_up)){
		v_speed = (-jump_speed);
		_jumps -=1;
	}
}
/*var t1 = test_one(tilemap);
var t2 = test_two(tilemap);
if (t1 !=0 || t2 != 0){
	hsp = 0;
}*/
// VERTICAL
//collision mask
y += vsp;
if (vsp > 0) { // downowards - collision mask
	var t1 = check_for_vertical_collision(tilemap, 0);
	if (t1 != 0){
		y = ((bbox_bottom & ~15)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
} else { //upwards - collision mask
	var t1 = check_for_vertical_collision(tilemap, 1);
	if (t1 != 0 ){
		y = ((bbox_top + 16) & ~15) - sprite_bbox_top;
		v_speed = 0;
	}
}
//one way tiles mask
if(keyboard_check(vk_down)) refresh = 5;
if (vsp > 0 && refresh <= 0) { // downowards - one way tiles mask
	var t1 = check_for_vertical_collision(tilemap2, 0);
	if (t1 != 0){
		y = ((bbox_bottom & ~15)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
}
refresh -= 1;

//HORIZONTAL MOVE
//collision mask 
//dash
if(on_ground == true){
	if(keyboard_check_pressed(vk_shift)) dash_timeleft=15;
	if (dash_timeleft > 0){
		hsp = 0;
		x = x+  _dash* _facing;
		if (_facing >0) { //right - collision mask
		var t1 = check_for_horizontal_collision(tilemap, 0);
		if (t1 != 0){
			x = ((bbox_right & ~15)-2) - sprite_bbox_right;
			}
		} 
		if (_facing < 0) { //left - collision mask
			var t1 = check_for_horizontal_collision(tilemap, 1);
			if (t1 != 0){
				x = ((bbox_left+ 16) & ~15) - sprite_bbox_left;
			}
		}
	}
	if (dash_timeleft >0) hsp =0;
}
dash_timeleft = dash_timeleft -1;
//move
hsp = _direction * _spd;
x += hsp;
if (_direction > 0 ) { //right - collision mask
	var t1 = check_for_horizontal_collision(tilemap,0);
	if (t1 != 0){
		hsp = 0;
		x = bbox_right & ~(15);
		x -= bbox_right-x+2 ;
	}
} 
if (_direction < 0) { //left - collision mask
	var t1 = check_for_horizontal_collision(tilemap,1);

	if(t1 != 0){
		hsp =0;
		x = bbox_left & ~(15);
		x += 16+x-bbox_left +2;
	}
}


//Shooting
if mouse_check_button(mb_left) && (cooldown<1)
{
	instance_create_layer(x,y, "Instances", obj_bullet_dx);
	cooldown = 7;
}

cooldown = cooldown -1;


//blink
/*if(on_ground == false && blink_max > 0){
	if(keyboard_check_pressed(vk_shift)){
		blink_timeleft=4;
	}
	if (blink_timeleft > 0){
		hsp = 0;
		vsp = 0;
		x = x+  _blink* _facing;
		if (_facing >0) { //right - collision mask
		var t1 = check_for_horizontal_collision(tilemap, 0);
		if (t1 != 0){
			x = ((bbox_right & ~15)-1) - sprite_bbox_right;
			}
		} 
		if (_facing < 0) { //left - collision mask
			var t1 = check_for_horizontal_collision(tilemap, 1);
			if (t1 != 0){
				x = ((bbox_left+ 16) & ~15) - sprite_bbox_left;
			}
		}
		if(blink_timeleft == 1) blink_max -= 1;
	}
}
blink_timeleft -=1; */