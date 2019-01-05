mana_points = 0;
mana_timer = -1;

with (obj_unit_card) {
	with (instance_create_layer(x, y, layer, obj_unit_card)) {
		switch (irandom_range(0, 3)) {
				case 0:
					unit_object_index = obj_small_fire_unit;
					label = "SF";
					break;
				case 1:
					unit_object_index = obj_small_water_unit;
					label = "SW";
					break;
				case 2:
					unit_object_index = obj_medium_fire_unit;
					label = "MF";
					break;
				case 3:
					unit_object_index = obj_medium_water_unit;
					label = "MW";
					break;
			}
	}
	
	instance_destroy();
}
