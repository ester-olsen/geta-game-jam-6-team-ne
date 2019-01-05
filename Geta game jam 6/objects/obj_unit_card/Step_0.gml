if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, id)) {
	instance_create_layer(16, 144, layer, obj_unit);
	instance_destroy();
}
