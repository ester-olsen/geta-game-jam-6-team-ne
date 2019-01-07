hit_points = 5;

mana_points = 0;
mana_timer = -1;

unit_card = noone;

/// Draw unit cards
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
					mana_cost = 2;
					label = "MF";
					break;
				case 3:
					unit_object_index = obj_medium_water_unit;
					mana_cost = 2;
					label = "MW";
					break;
			}
	}
	
	instance_destroy();
}
