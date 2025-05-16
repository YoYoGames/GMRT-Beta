// This section flips the character's sprite depending on whether it's moving left or right.
// This condition checks if the X velocity is less than 0, meaning the character is moving left.
if (this.vel_x < 0)
{
	// In that case, the horizontal scale of the instance is set to -1. This flips the sprite the other way around,
	// making it face left.
	this.image_xscale = -1;
	this.image_yscale = 1;
}
// Otherwise - if the character is not moving left, this checks if the X velocity is greater than 0, meaning the character is moving right.
else if (this.vel_x > 0)
{
	// In that case, the horizontal scale is set to 1, so the character faces right again.
	this.image_xscale = 1;
	this.image_yscale = 1;
}

// This checks if the character's health is at, or below, 0, meaning it has been defeated.
// In that case we want to replace the character instance with its defeated object.
if (this.hp <= 0)
{
	// This creates an instance of the character's 'defeated_object'. E.g. it will be obj_player_defeated
	// for obj_player.
	// It's created at the same position as the character itself.
	// It's created in the same layer as the character, by using its 'layer' variable.
	instance_create_layer(this.x, this.y, this.layer, this.defeated_object);

	// This destroys the character instance itself.
	instance_destroy();
}

// This checks if no_hurt_frames is greater than 1, meaning the character is currently invincible and can't be hurt.
if (this.no_hurt_frames > 0)
{
	// In that case we reduce the variable by 1, as one frame as passed. Eventually it will reach 0 again and the character will be able
	// to be hurt.
	this.no_hurt_frames -= 1;

	// This part handles making the character flash on and off when it's invincible, by changing its alpha between 0 and 1.
	// If the remainder of no_hurt_frames divided by 12 is above 6, we'll set the alpha to 0.
	// Otherwise we'll set it to 1.
	if (this.no_hurt_frames % 12 > 6)
	{
		// This makes the character invisible.
		this.image_alpha = 0;
	}
	else
	{
		// This makes the character visible again.
		this.image_alpha = 1;
	}
}