/// Toggle fullscreen
var has_pressed_f = keyboard_check_pressed(ord("F"));
var is_fullscreen = window_get_fullscreen();

if (has_pressed_f) {
	window_set_fullscreen(!is_fullscreen);
}

/// Check game end
var is_game_over = true;

with (obj_base) {
	if (is_player) {
		is_game_over = false;
	}
}

if (is_game_over) {
	instance_deactivate_all(true);
}
