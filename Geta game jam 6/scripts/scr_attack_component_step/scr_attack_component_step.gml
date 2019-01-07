var unit_width = 32;
var unit = noone;

/// Get target
if (is_player) {
	unit = instance_position(x + unit_width, y - 1, parent_object);
}
else {
	unit = instance_position(x - unit_width, y - 1, parent_object);
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
	/// Deal damage
	var damage = 1;
	
	if (is_effective_against_small) && (unit.is_small_type) {
		damage++;
	}
	
	if (is_effective_against_medium) && (unit.is_medium_type) {
		damage++;
	}
	
	if (is_effective_against_large) && (unit.is_large_type) {
		damage++;
	}
	
	if (is_effective_against_fire) && (unit.has_fire_element) {
		damage++;
	}
	
	if (is_effective_against_water) && (unit.has_water_element) {
		damage++;
	}
	
	if (is_effective_against_grass) && (unit.has_grass_element) {
		damage++;
	}
	
	unit.hit_points -= damage;
	attack_timer = undefined;
	
	if (!is_undefined(attack_sprite)) {
		sprite_index = attack_sprite;
	}
}
