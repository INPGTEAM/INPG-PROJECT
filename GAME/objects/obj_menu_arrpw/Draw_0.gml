/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fnt_menu);
draw_set_color(c_white);

var m;
for (m=0; m<array_length_1d(menu); m+=1)
{
	draw_text(x-11, y+(m*space), string(menu[m]))
}

draw_sprite(sprite_index, 0, x-48, y+mpos*space);