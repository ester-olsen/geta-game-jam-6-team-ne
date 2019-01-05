var mana_timer_max = 5 * 60;

if (mana_timer == -1) {
	mana_timer = mana_timer_max;
}

if (mana_timer == 0) {
	if (mana_points < 3) {
		mana_points++;
		mana_timer = mana_timer_max;
	}
}
else if (mana_timer > 0) {
	mana_timer--;
}
