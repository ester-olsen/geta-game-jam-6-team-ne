/// Draw self
if (is_player_unit) {
	draw_self();
}
else {
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_red, 1);
}

/// Hit points
var text_y = y - sprite_height - 8;

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if (is_player_unit) {
	draw_set_color(c_white);
}
else {
	draw_set_color(c_red);
}

draw_text(x, text_y, string(hit_points));
