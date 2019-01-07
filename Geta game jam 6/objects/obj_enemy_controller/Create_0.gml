hit_points = 5;

mana_points = 0;
mana_timer = -1;

if (!layer_exists("Cards")) {
	layer_create(-200, "Cards");
}

unit_cards[0] = scr_draw_unit_card(-room_width, -room_height);
unit_cards[1] = scr_draw_unit_card(-room_width, -room_height);
unit_cards[2] = scr_draw_unit_card(-room_width, -room_height);
