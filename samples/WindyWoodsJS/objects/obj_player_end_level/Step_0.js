// This runs the parent's Step event.
event_inherited();

// This checks if the current X position is not equal to the end gate's X position, meaning the
// player is not standing in the center of the gate.
// In that case we want to move it there before fading it.
if (this.x != obj_end_gate.x)
{
	// This sets the X velocity so the player moves to the center of the gate.
	// The velocity is calculated by getting the relative X value from the player to the end gate, then getting
	// its sign (1 or -1) and multiplying that by 4 (which becomes the speed).
	this.vel_x = sign(obj_end_gate.x - this.x) * 4;

	// This changes the sprite of the instance to the walking sprite, as the player is currently walking to the
	// center of the gate.
	this.sprite_index = spr_player_walk;

	// This reduces the animation speed slightly as the player is supposed to be walking slower than usual.
	this.image_speed = 0.7;

	// This checks if the absolute difference between the player and the gate (on the X axis) is less than 5, meaning the
	// player has (almost) reached the center of the gate.
	if (Math.abs(obj_end_gate.x - this.x) < 5)
	{
		// In that case we set the player's X position to the gate's X position so it jumps there.
		this.x = obj_end_gate.x;
	
		// Then we reset the X velocity to 0 so the player stops.
		this.vel_x = 0;
	}
}
// This else part runs when the player is standing at the center of the gate, meaning it can fade now.
else
{
	// This changes the sprite to the idle sprite as the player is now standing.
	this.sprite_index = spr_player_idle;

	// This reduces the alpha of the instance, making it fade away.
	this.image_alpha += -0.02;

	// This sets the animation speed back to normal (as it was changed during the walking state).
	this.image_speed = 1;

	// This checks if the alpha is at or below 0, meaning the instance is invisible now.
	if (this.image_alpha <= 0)
	{
		// In that case we move to the next room.
		room_goto_next();
	}
}