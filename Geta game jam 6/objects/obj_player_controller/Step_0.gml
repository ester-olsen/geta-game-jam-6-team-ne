/// Play unit card
var unit_card = instance_position(mouse_x, mouse_y, obj_unit_card)

if (mouse_check_button_pressed(mb_left)) && (instance_exists(unit_card)) && (!is_undefined(unit_card.unit_object_index)) {
	if (mana_points >= unit_card.mana_cost) {
		/// Create unit
		mana_points -= unit_card.mana_cost;
		instance_create_layer(16, 144, layer, unit_card.unit_object_index);
		
		/// Draw card
		instance_create_layer(unit_card.x, unit_card.y, layer, obj_unit_card);
		
		/// Destroy old card
		instance_destroy(unit_card);
	}
}

/// Mana
var mana_timer_max = 3 * 60;

if (mana_timer == -1) {
	mana_timer = mana_timer_max;
}

if (mana_timer == 0) {
	if (mana_points < 3) {
		mana_points++;
		mana_timer = mana_timer_max;
	}
}
else if (mana_timer > 0) {
	mana_timer--;
}
