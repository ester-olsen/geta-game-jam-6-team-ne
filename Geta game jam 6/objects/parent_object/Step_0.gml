/// Pause
if (is_paused) {
	return;
}

/// Components
if (has_hit_points_component) {
	scr_hit_points_component_step();
}

if (has_attack_component) {
	scr_attack_component_step();
}

if (has_movement_component) {
	scr_movement_component_step();
}
