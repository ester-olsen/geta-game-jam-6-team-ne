/// Draw highlight
if (is_highlighted) {
	draw_sprite_ext(sprite_index, 0, x + 1, y, 1, 1, 0, c_green, 1);
	draw_sprite_ext(sprite_index, 0, x, y - 1, 1, 1, 0, c_green, 1);
	draw_sprite_ext(sprite_index, 0, x - 1, y, 1, 1, 0, c_green, 1);
	draw_sprite_ext(sprite_index, 0, x, y + 1, 1, 1, 0, c_green, 1);
}

/// Draw self
draw_self();

/// Draw text
var text_y = y - sprite_height / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

draw_text(x, text_y, label);
