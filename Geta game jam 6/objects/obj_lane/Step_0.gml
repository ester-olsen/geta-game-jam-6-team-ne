/// Get number of player units
player_units = 0;

with (parent_object) {
	if (is_player) && (place_meeting(x, y, other)) {
		other.player_units++;
	}
}

/// Get number of enemy units
enemy_units = 0;

with (parent_object) {
	if (!is_player) && (place_meeting(x, y, other)) {
		other.enemy_units++;
	}
}
