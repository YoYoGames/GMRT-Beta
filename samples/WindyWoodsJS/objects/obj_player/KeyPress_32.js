// This checks if the 'grounded' variable is true, meaning the player is standing on the ground, and can jump.
if (this.grounded)
{
	// This sets the Y velocity to negative jump_speed, making the player immediately jump upwards. It
	// will automatically be brought down by the gravity code in the parent's Begin Step event.
	this.vel_y = -this.jump_speed;

	// This changes the player's sprite to the jump sprite, and resets the frame to 0.
	this.sprite_index = spr_player_jump;
	this.image_index = 0;

	// This sets 'grounded' to false, so that any events after this know that the player is not supposed
	// to be on the ground anymore.
	this.grounded = false;

	// This creates an instance of obj_effect_jump at the bottom of the player's mask. This is the
	// jump VFX animation.
	instance_create_layer(this.x, this.bbox_bottom, "Instances", obj_effect_jump);
	
	// Play the jump sound with a random pitch
	var _sound = audio_play_sound(snd_jump, 0, 0);
	audio_sound_pitch(_sound, random_range(0.8, 1));
}