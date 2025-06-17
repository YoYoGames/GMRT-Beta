// With this function call, we are checking if there is a collision 1 pixel below the character. This means the character is standing
// on ground.
// We're doing this in the Begin Step event, so the events that run later (Step and End Step) know whether the player is on ground
// or not.
// The result of the function (true or false) is stored in the  'grounded' variable, which was initialised in the Create event.
this.grounded = check_collision_js(0, 1);

// This checks if 'grounded' is true. This means the character is standing on ground.
if (this.grounded)
{
	// This stores the character's current position in the 'grounded_x' and 'grounded_y' variables.
	// Since these variables are only changed when the character is on ground, they only store the position
	// for when the character was last on ground. These values can then be used to restore the player's position after
	// it falls off a platform into a pit.
	this.grounded_x = this.x;
	this.grounded_y = this.y;
}

// In this part we are applying friction to the player's velocity, so it eventually comes to a stop when there is no input.
// The 'round' function rounds the X velocity to the nearest integer. Then it checks if that integer is NOT 0. This means there is an
// active velocity of (or more than) 0.5 pixels in either direction.
if (Math.round(this.vel_x) != 0)
{
	// Here we calculate the friction that should be applied this frame. It is calculated by multiplying the sign of the X velocity (which
	// will be -1 or 1) with the friction power. The result is stored in a local variable.
	var _friction_applied = Math.sign(this.vel_x) * this.friction_power;

	// This checks if the character is NOT grounded, meaning it's in mid-air. In that case we want to reduce the friction that is applied (so in 
	// mid-air the player takes more time to slow down).
	if (!this.grounded)
	{
		// This divides the applied friction by 4.
		_friction_applied = _friction_applied / 4;
	}

	// The friction value is then subtracted from the X velocity.
	this.vel_x -= _friction_applied;
}
// This 'else' block runs when there is no X velocity, or it's less than 0.5 pixels in either direction.
else
{
	// In that case we reset the X velocity to 0 so the character comes to a complete stop.
	this.vel_x = 0;
}

// This adds the grav_speed value to the vel_y variable.
// Doing so applies gravity to the character's vertical velocity, pulling it down each frame to make it fall.
this.vel_y += this.grav_speed;