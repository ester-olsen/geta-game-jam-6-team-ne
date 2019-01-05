var player_controller = instance_find(obj_player_controller, 0);

if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, id)) {
	with (player_controller) {
		if (mana_points >= 1) {
			mana_points--;
		}
		
		instance_create_layer(16, 144, layer, obj_unit);
		instance_destroy(other);
	}
}
