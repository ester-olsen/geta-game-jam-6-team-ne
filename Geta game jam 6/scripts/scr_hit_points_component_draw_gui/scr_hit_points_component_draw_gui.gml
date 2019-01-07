var unit_height = 32;
var meter_width = 24;
var meter_height = 4;
var meter_margin_bottom = 6;
var meter_x1 = x - meter_width / 2;
var meter_y1 = y - unit_height - meter_margin_bottom - meter_height;
var meter_x2 = x + meter_width / 2;
var meter_y2 = y - unit_height - meter_margin_bottom;
var fill_width = meter_width * (hit_points / maximum_hit_points);
var fill_x2 = meter_x1 + fill_width;
var fill_color;

if (is_player) {
	fill_color = c_white;
}
else {
	fill_color = c_red;
}

/// Draw background
draw_rectangle_color(meter_x1, meter_y1, meter_x2, meter_y2, c_black, c_black, c_black, c_black, false);

/// Draw fill
draw_rectangle_color(meter_x1, meter_y1, fill_x2, meter_y2, fill_color, fill_color, fill_color, fill_color, false);
