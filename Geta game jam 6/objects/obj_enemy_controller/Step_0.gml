/// Mana
var mana_timer_max = 2 * 60;

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

/// Hurt
with (parent_object) {
	var goal_line = room_width + sprite_width / 2;
	
	if (is_player) && (x > goal_line) {
		other.hit_points--;
		instance_destroy();
	}
}

/// Die
if (hit_points <= 0) {
	instance_destroy();
}


/// STATES ///

var cheapest_unit_card = noone;
var unprotected_lane = noone;

for (var i = 0; i < array_length_1d(unit_cards); i++) {
	if (!instance_exists(cheapest_unit_card)) || (unit_cards[i].mana_cost < cheapest_unit_card.mana_cost) {
		cheapest_unit_card = unit_cards[i];
	}
}

with (obj_lane) {
	if (player_units > 0) && (enemy_units == 0) {
		unprotected_lane = id;
	}
}

if (instance_exists(unprotected_lane)) && (mana_points >= cheapest_unit_card.mana_cost) {
	var unit_width = 32;
	var collision_x = room_width - unit_width + 1;
	var collision_y = unprotected_lane.y + unprotected_lane.sprite_height / 2;
	
	if (!position_meeting(collision_x, collision_y, parent_object)) {
		scr_spawn_unit(cheapest_unit_card.unit_object_index, unprotected_lane, false);
		mana_points--;
		
		for (var i = 0; i < array_length_1d(unit_cards); i++) {
			if (unit_cards[i] == cheapest_unit_card) {
				instance_destroy(cheapest_unit_card);
				unit_cards[i] = scr_draw_unit_card(-room_width, -room_height);
			}
		}
	}
}
