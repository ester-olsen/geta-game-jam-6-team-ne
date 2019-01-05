var unit = noone;

/// Get target
if (is_player) {
	unit = instance_position(x + sprite_width, y, parent_object);
}
else {
	unit = instance_position(x - sprite_width, y, parent_object);
}

if (!instance_exists(unit)) {
	return;
}

if (!unit.has_hit_points_component) {
	return;
}

if (unit.is_player == is_player) {
	return;
}

if (is_undefined(attack_timer)) {
	/// Start timer
	attack_timer = random_range(0.9, 1.1) * 60;
}
else if (attack_timer > 0) {
	/// Increment timer
	attack_timer--;
}
else if (attack_timer <= 0) {
	/// Attack
	unit.hit_points--;
	attack_timer = undefined;
}
