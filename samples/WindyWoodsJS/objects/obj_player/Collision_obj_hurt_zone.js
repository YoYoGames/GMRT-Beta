// This reduces the health by 1.
this.hp -= 1;

// If the player still has hp left,
if (this.hp > 0)
{
	// This moves the player to the position stored in the grounded_x and _y variables,
	// which is the position when it was last on ground.
	this.x = this.grounded_x;
	this.y = this.grounded_y;

	// This gives 2 seconds of invincibility to the player.
	this.no_hurt_frames += 120;

	// This resets the X and Y velocities of the player so it stops all movement.
	this.vel_x = 0;
	this.vel_y = 0;

	// This sets a knockback state for 20 frames (using the Alarm below) so user input is
	// disabled for that period, meaning the player doesn't immediately fall into the hurt zone
	// again.
	this.in_knockback = true;

	alarm_set(0, 20);

	// Play the 'life lost' sound effect
	audio_play_sound(snd_life_lost_01, 0, 0);
}