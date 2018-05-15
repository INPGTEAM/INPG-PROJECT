//Moving

if keyboard_check(ord("D")) x = x + 3;
if keyboard_check(ord("A")) x = x - 3;
if keyboard_check(ord("W")) y = y - 3;
if keyboard_check(ord("S")) y = y + 3;

image_angle = point_direction(x,y,mouse_x,mouse_y);


//Shooting projectiles

if mouse_check_button(mb_left) && (cooldown<1)
{
	instance_create_layer(x,y, "Projectile_layer", obj_projectile);
	cooldown = 7;
}

cooldown = cooldown -1;