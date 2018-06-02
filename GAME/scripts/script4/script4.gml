x += hsp;
if (_direction > 0 ) { //right - collision mask
	var t1 = check_for_horizontal_collision(tilemap,0);
	if (t1 != 0){
		hsp = 0;
		x = (bbox_right) & ~(15);
		x -= bbox_right-x+3 ;
	}
} 
if (_direction < 0) { //left - collision mask
	var t1 = check_for_horizontal_collision(tilemap,1);

	if(t1 != 0){
		hsp =0;
		x = bbox_left & ~(15);
		x += 16+x-bbox_left +2;
	}
}
if (on_ground ==true && hsp != 0)
{
	sprite_index = spr_run;
	image_speed=1;
	x += hsp;
} else sprite_index =s_p_right;
if (keyboard_check_pressed(vk_space)) atack_time = 48;
if(atack_time >1)
{
	hsp =0;
	sprite_index=spr_attack;
	image_xscale=sign(_facing);
	
	image_speed=1;
	if(image_index>12)&&(image_index<14)
	{
		with(instance_create_layer(x,y,"Instances",obj_attack_hitbox))
		{
			image_xscale=other.image_xscale;
			
		}
	}
} 
if (atack_time == 1) sprite_index=s_p_right;

atack_time -=1;