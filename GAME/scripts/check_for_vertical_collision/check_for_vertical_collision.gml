//cheking for collision

tilemask = argument0;
variant = argument1; // 0 for downward collision 1 for upward;

if (variant == 0){
	var sum; 
	sum = tilemap_get_at_pixel(tilemask, bbox_left, bbox_bottom+1) & tile_index_mask;
	sum = sum + tilemap_get_at_pixel(tilemask, bbox_right, bbox_bottom+1) & tile_index_mask;
	if (sum != 0) return 1;
	for(var i = 1.1; i < 10; i = i+0.1){
		sum = sum + tilemap_get_at_pixel(tilemask, (bbox_right + (bbox_left - bbox_right) / i), bbox_bottom+1) & tile_index_mask;
		if (sum != 0) return 1;
	}
	return 0;
}
if (variant == 1) {
	var sum; 
	sum = tilemap_get_at_pixel(tilemask, bbox_left, bbox_top) & tile_index_mask;
	sum = sum + tilemap_get_at_pixel(tilemask, bbox_right, bbox_top) & tile_index_mask;
	if (sum != 0) return 1;
	for(var i = 1.1; i < 10; i = i+0.1){
		sum = sum + tilemap_get_at_pixel(tilemask, (bbox_right + (bbox_left - bbox_right) / i), bbox_top) & tile_index_mask;
		if (sum != 0) return 1;
	}
	return 0;
}
//return 0 if there is no collision