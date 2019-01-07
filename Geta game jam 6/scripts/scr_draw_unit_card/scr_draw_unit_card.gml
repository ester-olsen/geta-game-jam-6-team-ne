/// @param x
/// @param y

var unit_card_x = argument0;
var unit_card_y = argument1;
var unit_card_object_index;
var unit_card;

//switch (irandom_range(0, 8)) {
//	case 0:
//		unit_card_object_index = obj_small_fire_unit_card;
//		break;
//	case 1:
//		unit_card_object_index = obj_small_water_unit_card;
//		break;
//	case 2:
//		unit_card_object_index = obj_small_grass_unit_card;
//		break;
//	case 3:
//		unit_card_object_index = obj_medium_fire_unit_card;
//		break;
//	case 4:
//		unit_card_object_index = obj_medium_water_unit_card;
//		break;
//	case 5:
//		unit_card_object_index = obj_medium_grass_unit_card;
//		break;
//	case 6:
//		unit_card_object_index = obj_large_fire_unit_card;
//		break;
//	case 7:
//		unit_card_object_index = obj_large_water_unit_card;
//		break;
//	case 8:
//		unit_card_object_index = obj_large_grass_unit_card;
//		break;
//}

unit_card_object_index = obj_medium_water_unit_card;

unit_card = instance_create_layer(unit_card_x, unit_card_y, "Cards", unit_card_object_index);

return unit_card;
