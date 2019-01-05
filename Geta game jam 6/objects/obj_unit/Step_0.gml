if (is_player_unit) {
	target_unit = instance_position(x + sprite_width, y, obj_unit);
}
else {
	target_unit = instance_position(x - sprite_width, y, obj_unit);
}

if (instance_exists(target_unit)) && (target_unit.is_player_unit == is_player_unit) {
	target_unit = noone;
}


/// STATES ///

if (state == "moving") {
	/// Move
	var movement = 1;

	if (is_player_unit) {
		x += movement;
	}
	else {
		x -= movement;
	}
	
	if (instance_exists(target_unit)) {
		state = "attacking";
	}
}
else if (state == "attacking") {
	/// Attack
	if (alarm[0] == -1) {
		alarm[0] = random_range(0.9, 1.1) * 60;
	}
	
	if (!instance_exists(target_unit)) {
		state = "moving";
	}
}


/// DIE ///
if (hit_points <= 0) {
	alarm[0] = -1;
	instance_destroy();
}
