if (instance_exists(obj_player))
{
		move_towards_point(obj_player.x,obj_player.y,1);
		
}	

image_angle = direction;

if(hp<4) sprite_index = spr_enemy_triggered;

if (hp<=0) instance_destroy();