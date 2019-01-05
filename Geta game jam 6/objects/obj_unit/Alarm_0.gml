/// @description Attack
var target_unit = noone;

if (is_player_unit) {
	target_unit = instance_position(x + sprite_width, y, obj_unit);
}
else {
	target_unit = instance_position(x - sprite_width, y, obj_unit);
}

if (instance_exists(target_unit)) && (target_unit.is_player_unit != is_player_unit) {
	target_unit.hit_points--;
}
