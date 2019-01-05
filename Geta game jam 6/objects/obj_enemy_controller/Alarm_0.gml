/// @description Deploy unit
with (instance_create_layer(464, 144, layer, obj_small_fire_unit)) {
	is_player = false;
}

alarm[0] = 5 * 60;
