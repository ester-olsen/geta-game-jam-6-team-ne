var cheapest_unit_card = noone;
var strongest_unit_card = noone;
var unprotected_lane = noone;
var empty_lane = noone;

/// Get unit cards
for (var i = 0; i < array_length_1d(unit_cards); i++) {
	if (!instance_exists(cheapest_unit_card)) || (unit_cards[i].mana_cost < cheapest_unit_card.mana_cost) {
		cheapest_unit_card = unit_cards[i];
	}
	
	if (!instance_exists(strongest_unit_card)) || (unit_cards[i].mana_cost > strongest_unit_card.mana_cost) {
		strongest_unit_card = unit_cards[i];
	}
}

/// Get lanes
with (obj_lane) {
	if (player_units > 0) && (enemy_units == 0) {
		unprotected_lane = id;
	}
	else if (player_units == 0) && (enemy_units == 0) {
		empty_lane = id;
	}
}

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

var unit_card = noone;
var lane = noone;

if (instance_exists(unprotected_lane)) {
	/// Protect lane
	unit_card = cheapest_unit_card;
	lane = unprotected_lane;
}
else if (instance_exists(empty_lane)) && (mana_points >= strongest_unit_card.mana_cost) {
	/// Attack open lane
	unit_card = strongest_unit_card;
	lane = empty_lane;
}
else {
	/// Stack least stacked lane
	if (mana_points >= strongest_unit_card.mana_cost) {
		unit_card = strongest_unit_card;
	}
	else {
		unit_card = cheapest_unit_card;
	}
	
	with (obj_lane) {
		if (!instance_exists(lane)) || (enemy_units < lane.enemy_units) {
			lane = id;
		}
	}
}

/// Spawn unit
if (instance_exists(unit_card)) && (instance_exists(lane)) && (mana_points >= unit_card.mana_cost) {
	var unit_width = 32;
	var collision_x = room_width - unit_width + 1;
	var collision_y = lane.y + lane.sprite_height / 2;
	
	if (!position_meeting(collision_x, collision_y, parent_object)) {
		scr_spawn_unit(unit_card.unit_object_index, lane, false);
		mana_points -= unit_card.mana_cost;
		
		for (var i = 0; i < array_length_1d(unit_cards); i++) {
			if (unit_cards[i] == unit_card) {
				instance_destroy(unit_card);
				unit_cards[i] = scr_draw_unit_card(-room_width, -room_height);
			}
		}
	}
}
