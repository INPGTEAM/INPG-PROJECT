/// @description Melee attack
// You can write your code in this editor

	sprite_index=spr_attack;
	image_xscale=sign(_facing);
	
	image_speed=0.7;
	
	
	if(image_index>12)&&(image_index<14)
	{
		with(instance_create_layer(x,y,"Instances",obj_attack_hitbox))
		{
			image_xscale=other.image_xscale;
			
		}
	}
	

