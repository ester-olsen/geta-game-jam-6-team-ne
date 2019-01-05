var unit = noone;

if (is_player) {
	unit = instance_position(x + sprite_width, y, obj_unit);
	
	if (!instance_exists(unit)) {
		unit = instance_position(x + sprite_width, y, obj_base);
	}
}
else {
	unit = instance_position(x - sprite_width, y, obj_unit);
	
	if (!instance_exists(unit)) {
		unit = instance_position(x - sprite_width, y, obj_base);
	}
}

if (instance_exists(unit)) && (unit.is_player == is_player) {
	target_unit = noone;
	friendly_unit = unit;
}
else if (instance_exists(unit)) && (unit.is_player != is_player) {
	target_unit = unit;
	friendly_unit = noone;
}
else {
	target_unit = noone;
	friendly_unit = noone;
}


/// STATES ///

if (state == "moving") {
	/// Move
	var movement = 1;

	if (is_player) {
		x += movement;
	}
	else {
		x -= movement;
	}
	
	if (instance_exists(target_unit)) {
		state = "attacking";
	}
	else if (instance_exists(friendly_unit)) {
		state = "waiting";
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
else if (state == "waiting") {
	/// Wait
	if (!instance_exists(friendly_unit)) {
		state = "moving";
	}
}


/// DIE ///
if (hit_points <= 0) {
	alarm[0] = -1;
	instance_destroy();
}
