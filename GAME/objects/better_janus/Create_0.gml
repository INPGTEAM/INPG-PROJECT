/// @description Insert description here
// You can write your code in this editor
hp = 100;
hit=0;
dir = -1;
_movespeed = 0.5;
_gravity = 5;
_hsp = 0;
v_speed = 0;
_dash = 10;
hit=5;
cooldown=0;
// Get the tile map id
var layer_id = layer_get_id("CollisionTiles");
_collision_tile_map_id = layer_tilemap_get_id(layer_id);
tilemap =  layer_tilemap_get_id(layer_id);

//sprite info

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

