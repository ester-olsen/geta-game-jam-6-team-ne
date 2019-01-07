/// @param object_index
/// @param lane

var unit_object_index = argument0;
var lane = argument1;
var unit_x = lane.x + 16;
var unit_y = lane.y + lane.sprite_height / 2;

instance_create_layer(unit_x, unit_y, "Units", unit_object_index);
