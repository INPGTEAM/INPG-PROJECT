/// @description Movement logic
// geting the input

//FIRST TYPE

// jumping
// for collision mask
var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom+1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom+1) & tile_index_mask;
var t3 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 2), bbox_bottom+1) & tile_index_mask;
if (t1 !=0 || t2 != 0 || t3 !=0){
	if (keyboard_check(vk_up)) {
		v_speed = (-jump_speed);
		jump_ref = 20
	}
}
//for one way tiles
var t1 = tilemap_get_at_pixel(tilemap2, bbox_left, bbox_bottom+1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap2, bbox_right, bbox_bottom+1) & tile_index_mask;
var t3 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 2), bbox_bottom+1) & tile_index_mask;
if (t1 !=0 || t2 != 0 || t3 !=0){
	if (keyboard_check(vk_up) && jump_ref <=0) {
		v_speed = (-jump_speed);
		jump_ref = 20;
	}
}
jump_ref -= 1;
// geting the input
var hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * _spd;
var vsp = v_speed;
v_speed += _gravity;

y += vsp;
// VERTICAL
//collision mask
if (vsp > 0) { // downowards - collision mask
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 2), bbox_bottom) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 1.5), bbox_bottom) & tile_index_mask;
	var t5 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 3), bbox_bottom) & tile_index_mask;
	var t6 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 1.25), bbox_bottom) & tile_index_mask;
	var t7 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 4), bbox_bottom) & tile_index_mask;
	if (t1 != 0 || t2 != 0 || t3 != 0 || t4 !=0 || t5 !=0 || t6 != 0 || t7 != 0 ){
		y = ((bbox_bottom & ~31)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
} else { //upwards - collision mask
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right)/ 2), bbox_top) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 1.5), bbox_bottom) & tile_index_mask;
	var t5 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 3), bbox_bottom) & tile_index_mask;
	var t6 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 1.25), bbox_bottom) & tile_index_mask;
	var t7 = tilemap_get_at_pixel(tilemap, (bbox_right + (bbox_left - bbox_right) / 4), bbox_bottom) & tile_index_mask;
	if (t1 != 0 || t2 != 0 || t3 != 0 || t4 !=0 || t5 !=0 || t6 != 0 || t7 != 0 ){
		y = ((bbox_top + 32) & ~31) - sprite_bbox_top;
		v_speed = 0;
	}
}
//one way tiles mask
if(keyboard_check(vk_down)) refresh = 5;
if (vsp > 0 && refresh <= 0) { // downowards - one way tiles mask
	var t1 = tilemap_get_at_pixel(tilemap2, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap2, bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 2), bbox_bottom) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 1.5), bbox_bottom) & tile_index_mask;
	var t5 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 3), bbox_bottom) & tile_index_mask;
	var t6 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 1.25), bbox_bottom) & tile_index_mask;
	var t7 = tilemap_get_at_pixel(tilemap2, (bbox_right + (bbox_left - bbox_right) / 4), bbox_bottom) & tile_index_mask;
	if (t1 != 0 || t2 != 0 || t3 != 0 || t4 !=0 || t5 !=0 || t6 != 0 || t7 != 0){
		y = ((bbox_bottom & ~31)-1) - sprite_bbox_bottom;
		v_speed = 0;
	}
}
refresh -= 1;
//HORIZONTAL MOVE
//collision mask 
x += hsp;
if (hsp > 0) { //right - collision mask
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top + (bbox_bottom-bbox_top)/2)) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top + (bbox_bottom-bbox_top)/1.5)) & tile_index_mask;
	var t5 = tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top + (bbox_bottom-bbox_top)/3)) & tile_index_mask;
	var t6 = tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top + (bbox_bottom-bbox_top)/1.25)) & tile_index_mask;
	var t7 = tilemap_get_at_pixel(tilemap, bbox_right, (bbox_top + (bbox_bottom-bbox_top)/4)) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0  || t3 != 0 || t4 !=0 || t5 !=0 || t6 != 0 || t7 != 0){
		x = ((bbox_right & ~31)-1) - sprite_bbox_right;
	}
} else { //left - collision mask
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top + (bbox_bottom-bbox_top)/2)) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top + (bbox_bottom-bbox_top)/1.5)) & tile_index_mask;
	var t5 = tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top + (bbox_bottom-bbox_top)/3)) & tile_index_mask;
	var t6 = tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top + (bbox_bottom-bbox_top)/1.25)) & tile_index_mask;
	var t7 = tilemap_get_at_pixel(tilemap, bbox_left, (bbox_top + (bbox_bottom-bbox_top)/4)) & tile_index_mask;

	if (t1 != 0 || t2 != 0 || t3 !=0 || t4 !=0 || t5 !=0 || t6 != 0 || t7 != 0){
		x = ((bbox_left+ 32) & ~31) - sprite_bbox_left;
	}
}

/* SECOND TYPE
var x_input = (keyboard_check(vk_right) - keyboard_check(vk_left)) * acceleration;

// vector variable
var vector2_x = 0;
var vector2_y = 1;

// horizontal movement
_velocity[vector2_x] = clamp(_velocity[vector2_x]+x_input, ~max_velocity_[vector2_x], max_velocity_[vector2_x]);

// friction
if x_input == 0 {
	_velocity[vector2_x] = lerp(_velocity[vector2_x], 0, 0.2);
}

// gravity
_velocity[vector2_y] += _gravity;

// move and contact tiles
move_and_contact_tiles(_collision_tile_map_id, 64, _velocity);

// jumping
var on_ground = tile_collide_at_points(_collision_tile_map_id, [bbox_left, bbox_bottom], [bbox_right-1, bbox_bottom]);
if on_ground {
	if keyboard_check(vk_up){
	_velocity[vector2_y] = -jump_speed;
	}
} else {
	if keyboard_check_released(vk_up) && _velocity[vector2_y] <= -(jump_speed/3) {
		_velocity[vector2_y] = -(jump_speed/3);
	}
}
