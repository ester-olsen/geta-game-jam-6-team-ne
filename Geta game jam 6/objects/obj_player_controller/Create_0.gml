mana_points = 0;
mana_timer = -1;

with (obj_unit_card) {
	with (instance_create_layer(x, y, layer, obj_unit_card)) {
		switch (irandom_range(0, 1)) {
			case 0:
				unit_object_index = obj_red_unit;
				label = "Fire";
				break;
			case 1:
				unit_object_index = obj_blue_unit;
				label = "Water";
				break;
		}
	}
	
	instance_destroy();
}
