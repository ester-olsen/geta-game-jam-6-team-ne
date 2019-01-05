var player_controller = instance_find(obj_player_controller, 0);

if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, id)) {
	with (player_controller) {
		if (mana_points >= 1) {
			var is_enhanced = false;
			
			with (obj_enhancement_card) {
				if (is_selected) {
					is_enhanced = true;
					instance_destroy();
				}
			}
			
			with (instance_create_layer(16, 144, layer, obj_unit)) {
				id.is_enhanced = is_enhanced;
			}
			
			mana_points--;
			instance_destroy(other);
		}
	}
}
