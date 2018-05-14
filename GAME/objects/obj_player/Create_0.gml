/// @description Movement variables
_velocity = [0, 0];
_gravity = 1.5;
jump_speed = 28;
max_velocity_ = [8, 32];
acceleration = 2.5;

// Get the tile map id
var layer_id = layer_get_id("CollisionTiles");
_collision_tile_map_id = layer_tilemap_get_id(layer_id);