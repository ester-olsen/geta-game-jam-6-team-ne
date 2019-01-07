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
