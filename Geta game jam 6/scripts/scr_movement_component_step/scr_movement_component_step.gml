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

if (instance_exists(unit)) {
	if (unit.is_player == is_player) {
		sprite_index = idle_sprite;
	}
	
	return;
}

/// Move
var movement = 0.5;

if (is_player) {
	x += movement;
}
else {
	x -= movement;
}

if (!is_undefined(walk_sprite)) {
	sprite_index = walk_sprite;
}
