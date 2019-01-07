/// Quit game
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

/// Check room
if (room == rm_start) {
	if (mouse_check_button_pressed(mb_left)) {
		room_goto_next();
	}
	
	return;
}

/// STATES ///

if (state == "playing") {
	/// Check for end of game
	if (!instance_exists(obj_enemy_controller)) {
		state = "winning";
	}
	
	if (!instance_exists(obj_player_controller)) {
		state = "losing";
	}
}
else if (state == "winning") {
	/// Game clear
	with (obj_player_controller) {
		instance_destroy();
	}
	
	with (parent_object) {
		is_paused = true;
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		game_restart();
	}
}
else if (state == "losing") {
	/// Game over
	with (obj_enemy_controller) {
		instance_destroy();
	}
	
	with (parent_object) {
		is_paused = true;
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		game_restart();
	}
}
