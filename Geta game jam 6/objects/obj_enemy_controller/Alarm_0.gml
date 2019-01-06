/// @description Deploy unit
var lane_number = irandom_range(0, instance_number(obj_lane) - 1);
var lane = instance_find(obj_lane, lane_number);

with (instance_create_layer(464, lane.y + lane.sprite_height / 2, "Units", obj_small_fire_unit)) {
	is_player = false;
}

alarm[0] = 5 * 60;
