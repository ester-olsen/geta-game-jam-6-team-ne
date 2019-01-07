hit_points = 5;

mana_points = 0;
mana_timer = -1;

unit_card = noone;

/// Draw unit cards
with (obj_unit_card) {
	scr_draw_unit_card(x, y);
	instance_destroy();
}
