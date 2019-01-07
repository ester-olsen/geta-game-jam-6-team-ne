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

var unprotected_lane = noone;

with (obj_lane) {
	if (player_units > 0) && (enemy_units == 0) {
		unprotected_lane = id;
	}
}

if (instance_exists(unprotected_lane)) && (mana_points > 0) {
	var unit_width = 32;
	
	if (!position_meeting(room_width - unit_width + 1, unprotected_lane.y + unprotected_lane.sprite_height / 2, parent_object)) {
		scr_spawn_unit(obj_small_fire_unit, unprotected_lane, false);
		mana_points--;
	}
}
