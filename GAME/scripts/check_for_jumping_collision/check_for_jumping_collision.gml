//check for jumping collision

tilemask = argument0;

var sum; 
sum = tilemap_get_at_pixel(tilemask, bbox_left, bbox_bottom+1) & tile_index_mask;
sum = sum + tilemap_get_at_pixel(tilemask, bbox_right, bbox_bottom+1) & tile_index_mask;
if (sum != 0) return 1;
for(var i = 1.1; i < 10; i = i+0.1){
	sum = sum + tilemap_get_at_pixel(tilemask, (bbox_right + (bbox_left - bbox_right) / i), bbox_bottom+1) & tile_index_mask;
	if (sum != 0) return 1;
}
return 0;