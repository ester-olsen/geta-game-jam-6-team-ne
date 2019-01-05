/// Toggle fullscreen
var has_pressed_f = keyboard_check_pressed(ord("F"));
var is_fullscreen = window_get_fullscreen();

if (has_pressed_f) {
	window_set_fullscreen(!is_fullscreen);
}
