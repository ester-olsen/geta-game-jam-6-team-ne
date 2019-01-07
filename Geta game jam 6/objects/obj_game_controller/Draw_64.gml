var text_x = view_get_wport(view_current) / 2;
var text_y = view_get_hport(view_current) / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

if (state == "winning") {
	draw_text(text_x, text_y, "You win!");
}
else if (state == "losing") {
	draw_text(text_x, text_y, "You lose...");
}
