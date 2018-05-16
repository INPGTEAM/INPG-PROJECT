/// @description Movement variables
_spd = 8;
_gravity = 1.3;
jump_speed = 26;
v_speed =0;

// Get the tile map id
var layer_id = layer_get_id("CollisionTiles");
_collision_tile_map_id = layer_tilemap_get_id(layer_id);
tilemap =  layer_tilemap_get_id(layer_id);
// one way tiles
var layer_id2 = layer_get_id("OneWayTiles");
tilemap2 = layer_tilemap_get_id(layer_id2);
refresh = 0;
jump_ref =0;
//sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
