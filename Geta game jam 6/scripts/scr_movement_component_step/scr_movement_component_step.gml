/// Do not move while attacking
if (!is_undefined(attack_timer)) {
	return;
}

/// Do not move while blocked
var unit = noone;

if (is_player) {
	unit = instance_position(x + sprite_width, y, parent_object);
}
else {
	unit = instance_position(x - sprite_width, y, parent_object);
}

if (instance_exists(unit)) && (unit.object_index != obj_base) {
	return;
}

/// Move
var movement = 1;

if (is_player) {
	x += movement;
}
else {
	x -= movement;
}
