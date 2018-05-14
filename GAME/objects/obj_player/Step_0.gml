/// @description Movement logic
// geting the input
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
