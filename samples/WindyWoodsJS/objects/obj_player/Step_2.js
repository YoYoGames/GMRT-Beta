// This runs the parent's End Step event, which handles flipping the character's sprite left or right.
event_inherited();

// This is a switch statement that runs on the 'sprite_index' variable, which stores the sprite
// currently assigned to the instance.
// This allows us to transition to some other sprite, depending on the currently assigned sprite, and some additional conditions.
switch (this.sprite_index)
{
	// Code under this case runs if the assigned sprite is 'spr_player_walk', meaning the player is walking.
	case spr_player_walk:
		// Set the animation speed to 1, as it may have been set to 0 during the jump animation.
		this.image_speed = 1;
	
		// This checks if the X velocity is 0, meaning the player is not moving horizontally.
		if (this.vel_x == 0)
		{
			// In that case we change its sprite to the idle one.
			this.sprite_index = spr_player_idle;
		}
	
		// This checks if the Y velocity of the player is greater than 1, meaning it is falling down.
		// This would happen when the player walks off a ledge.
		if (this.vel_y > 1)
		{
			// In that case we change its sprite to the fall one, and reset the frame to 0.
			this.sprite_index = spr_player_fall;
			this.image_index = 0;
		}
		break;

	// Code under this case runs if the assigned sprite is 'spr_player_jump', meaning the player was in the middle of a jump.
	case spr_player_jump:
		// This checks if the Y velocity is equal to, or greater than 0, meaning the player has now started falling downward.
		if (this.vel_y >= 0)
		{
			// In that case we change its sprite to the fall sprite, and reset the frame to 0.
			this.sprite_index = spr_player_fall;
			this.image_index = 0;
		
			// We also reset the animation speed to 1, as it was set to 0 at the end of the jump animation.
			this.image_speed = 1;
		}
		break;

	// Code under this case runs if the assigned sprite is 'spr_player_fall', meaning the player was falling downward.
	case spr_player_fall:
		// This checks if the player is now on the ground
		if (this.grounded)
		{
			// In that case we change its sprite to the idle sprite.
			this.sprite_index = spr_player_idle;
		
			// We also reset the animation speed to 1, as it was set to 0 at the end of the fall animation.
			this.image_speed = 1;
		
			// Play the landing sound effect
			audio_play_sound(snd_land_01, 0, 0);
		}
		break;

	// Code under this case runs if the assigned sprite is 'spr_player_hurt', meaning the player is in the middle of a knockback.
	case spr_player_hurt:
		// This checks if the player is grounded, so the dust VFX can be created.
		if (this.grounded)
		{
			// This creates an instance of obj_effect_knockback, which appears at the player's feet when it's in knockback.
			// It's created at the bottom point of the player's mask, in the player's layer.
			// The ID of the created instance is stored in a local variable called 'dust', because we want to modify its horizontal (X) scale.
			var _dust = instance_create_layer(this.x, this.bbox_bottom, this.layer, obj_effect_knockback);
		
			// Here we're modifying the X scale of the dust
			// instance to match the X scale of the player.
			_dust.image_xscale = this.image_xscale;
		}
		break;

	// 'default' code runs when none of the other cases are valid, meaning the currently assigned sprite is not covered by any
	// of the cases above.
	default:
		// For all other sprites we set the animation speed to 1.
		this.image_speed = 1;
		break;
}