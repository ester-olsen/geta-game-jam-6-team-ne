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
	var goal_line = 0 - sprite_width / 2;
	
	if (!is_player) && (x < goal_line) {
		other.hit_points--;
		instance_destroy();
	}
}

/// Die
if (hit_points <= 0) {
	instance_destroy();
}


/// STATES ///

if (!instance_exists(unit_card)) {
	/// Pick unit card
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, parent_unit_card)) {
		unit_card = instance_position(mouse_x, mouse_y, parent_unit_card);
	}
}
else {
	/// Pick lane
	unit_card.is_highlighted = true;
	
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, obj_lane)) && (mana_points >= unit_card.mana_cost) {
		var lane = instance_position(mouse_x, mouse_y, obj_lane);
		var unit_width = 32;
		
		if (position_meeting(unit_width - 1, lane.y + lane.sprite_height / 2, parent_object)) {
			unit_card.is_highlighted = false;
			unit_card = noone;
			return;
		}
		
		/// Spawn unit
		var unit_instance = scr_spawn_unit(unit_card.unit_object_index, lane, true);
		
		if (unit_instance.has_fire_element) {
			audio_play_sound(snd_summon_fire_unit, 50, false);
		}
		if (unit_instance.has_water_element) {
			audio_play_sound(snd_summon_water_unit, 50, false);
		}
		if (unit_instance.has_grass_element) {
			audio_play_sound(snd_summon_grass_unit, 50, false);
		}
		
		/// Pay mana cost
		mana_points -= unit_card.mana_cost;
		
		/// Replace card
		scr_draw_unit_card(unit_card.x, unit_card.y);
		instance_destroy(unit_card);
		unit_card = noone;
	}
	else if (mouse_check_button_pressed(mb_left)) {
		unit_card.is_highlighted = false;
		unit_card = noone;
	}
}
