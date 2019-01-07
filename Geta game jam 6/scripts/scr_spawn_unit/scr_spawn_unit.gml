/// @param object_index
/// @param lane
/// @param is_player

/// Parameters
var unit_object_index = argument0;
var lane = argument1;
var is_player = argument2;

/// Variables
var unit_width = 32;
var unit_x;
var unit_y = lane.y + lane.sprite_height / 2 + 4;

if (is_player) {
	unit_x = lane.x + unit_width / 2;
}
else {
	unit_x = lane.x + lane.sprite_width - unit_width / 2;
}

/// Spawn unit
var unit_instance = instance_create_layer(unit_x, unit_y, lane.layer, unit_object_index);

with (unit_instance) {
	id.is_player = is_player;
	
	if (!is_player) {
		image_xscale = -1;
	}
}

return unit_instance;
