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


/// STATES ///

if (!instance_exists(unit_card)) {
	/// Pick unit card
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, obj_unit_card)) {
		unit_card = instance_position(mouse_x, mouse_y, obj_unit_card);
	}
}
else {
	/// Pick lane
	unit_card.is_highlighted = true;
	
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, obj_lane)) && (mana_points >= unit_card.mana_cost) && (!position_meeting(31, 144, parent_object)) {
		var lane = instance_position(mouse_x, mouse_y, obj_lane);
		var unit_instance_x = lane.x + 16;
		var unit_instance_y = lane.y + lane.sprite_height / 2;
		
		instance_create_layer(unit_instance_x, unit_instance_y, "Units", unit_card.unit_object_index);
		
		with (instance_create_layer(unit_card.x, unit_card.y, layer, obj_unit_card)) {
			switch (irandom_range(0, 3)) {
				case 0:
					unit_object_index = obj_small_fire_unit;
					label = "SF";
					break;
				case 1:
					unit_object_index = obj_small_water_unit;
					label = "SW";
					break;
				case 2:
					unit_object_index = obj_medium_fire_unit;
					label = "MF";
					break;
				case 3:
					unit_object_index = obj_medium_water_unit;
					label = "MW";
					break;
			}
		}
		
		mana_points -= unit_card.mana_cost;
		instance_destroy(unit_card);
		unit_card = noone;
	}
	else if (mouse_check_button_pressed(mb_left)) {
		unit_card.is_highlighted = false;
		unit_card = noone;
	}
}
