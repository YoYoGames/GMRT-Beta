// This event runs when the player collides with an enemy.
// It checks if the player has fallen on top of the enemy, in which case the enemy is defeated. Otherwise, the player
// gets hurt.
// This condition checks if the player's vertical velocity is greater than 0, meaning it's falling down.
if (this.vel_y > 0)
{
	// This checks if the bottom point of the player's collision mask was above the enemy mask's top
	// point, in the previous frame.
	// If this is true, it proves that the player is falling on top of the enemy from above, as it was
	// previously above it.
	// We get the bottom position for the previous frame by subtracting this frame's Y velocity from it.
	if ((this.bbox_bottom - this.vel_y) < (other.bbox_top - other.vel_y))
	{
		// Set the HP of the 'other' instance (which is the enemy) to 0, so that it's defeated.
		other.hp = 0;
	
		// Set the vertical velocity of the player to -jump_speed so it bounces off the enemy.
		this.vel_y = -this.jump_speed;
	
		// Change the sprite to spr_player_jump as the player is now jumping (and not falling anymore).
		this.sprite_index = spr_player_jump;
		this.image_index = 0;
	
		// The animation speed at this point would be 0 if the fall animation had finished, so we reset
		// it to 1 so the jump animation can play.
		this.image_speed = 1;
	
		// This creates an instance of obj_effect_jump at the bottom of the player's mask. This is the
		// jump VFX animation.
		instance_create_layer(this.x, this.bbox_bottom, "Instances", obj_effect_jump);
	
		// Play the enemy hit sound effect
		audio_play_sound(snd_enemy_hit, 0, 0);
		
		// Play the jump sound with a random pitch
		var _sound = audio_play_sound(snd_jump, 0, 0);
		audio_sound_pitch(_sound, random_range(0.8, 1));
	
		// Finally, exit the event so the rest of the actions don't run (they make the player hurt)
		return;
	}
}

// This checks if the player is invincible, by checking if no_hurt_frames is greater than 0.
if (this.no_hurt_frames > 0)
{
	// In that case we exit the event so the player is not hurt by the enemy.
	return;
}

// This section hurts the player, because it only runs if the player was not found to be jumping on the enemy's head.
// This action gets the sign (1, 0 or -1) from the enemy's position to the player's position.
var _x_sign = Math.sign(this.x - other.x);

// That sign is multiplied by 15, and applied to vel_x as the knockback.
this.vel_x = _x_sign * 15;

// This first reduces the player's health by the damage amount in the 'other' instance
// (which is the enemy).
// Then it sets 'in_knockback' to true to tell the player that it's in knockback.
this.hp -= other.damage;
this.in_knockback = true;

// This sets no_hurt_frames to 120, so the player is invincible for the next 2 seconds (as one second contains 60 frames).
this.no_hurt_frames = 120;

// This changes the sprite to the hurt sprite.
this.sprite_index = spr_player_hurt;
this.image_index = 0;

// Set Alarm 0 to run after 15 frames; that event stops the player's horizontal velocity, ending the knockback
alarm_set(0, 15);

// Play the 'life lost' sound effect
audio_play_sound(snd_life_lost_01, 0, 0);