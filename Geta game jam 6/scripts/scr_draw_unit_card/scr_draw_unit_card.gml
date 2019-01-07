/// @param x
/// @param y

var unit_card_x = argument0;
var unit_card_y = argument1;

if (!layer_exists("Cards")) {
	layer_create(-200, "Cards");
}

var unit_card = instance_create_layer(unit_card_x, unit_card_y, "Cards", obj_unit_card);

switch (irandom_range(0, 3)) {
	case 0:
		unit_card.unit_object_index = obj_small_fire_unit;
		unit_card.label = "SF";
		break;
	case 1:
		unit_card.unit_object_index = obj_small_water_unit;
		unit_card.label = "SW";
		break;
	case 2:
		unit_card.unit_object_index = obj_medium_fire_unit;
		unit_card.mana_cost = 2;
		unit_card.label = "MF";
		break;
	case 3:
		unit_card.unit_object_index = obj_medium_water_unit;
		unit_card.mana_cost = 2;
		unit_card.label = "MW";
		break;
}

return unit_card;
