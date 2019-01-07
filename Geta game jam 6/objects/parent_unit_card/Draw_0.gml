/// Draw highlight
if (is_highlighted) {
	draw_sprite_ext(spr_rectangle, 0, x + 4, y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_rectangle, 0, x, y - 4, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_rectangle, 0, x - 4, y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_rectangle, 0, x, y + 4, 1, 1, 0, c_white, 1);
}

/// Draw self
draw_self();
