//Move

if(keyboard_check(vk_right)) x=spd+x;
if(keyboard_check(vk_left)) x=-spd+x;
if(keyboard_check(vk_up)) y=-spd+y;
if(keyboard_check(vk_down)) y=spd+y;
if(keyboard_check(vk_shift)) spd=10;
	else spd=4;
image_angle=point_direction(x,y,mouse_x,mouse_y);	
//Shot
if(mouse_check_button(mb_left)) && (cooldown < 1)
{
	//|Lukasz to chuj xDDDDDDDD ~ pozdro starosta
	instance_create_layer(x,y,"bullets", obj_bullet);
	cooldown=0;
}
cooldown=cooldown-1;