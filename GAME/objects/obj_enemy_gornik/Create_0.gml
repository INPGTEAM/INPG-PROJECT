/// @description Variables
//Variables init

hp = 20;

dir = -1;
_movespeed = 1.4;
_gravity = 1.3;
_hsp = 0;
v_speed = 0;
_dash = 10;
_facing=1;

// Get the tile map id
var layer_id = layer_get_id("CollisionTiles");
_collision_tile_map_id = layer_tilemap_get_id(layer_id);
tilemap =  layer_tilemap_get_id(layer_id);

//sprite info

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);