// This event runs when a Broadcast Message is received.
// We're expecting the "footstep" message set in spr_player_walk, which tells when the player has put a foot down.
// This reads the received message from the event_data map, where it's stored in the "message" key.
// The returned value is stored in a local variable.
var _message = event_data["message"];

// This checks if the message is "footstep", meaning the player has put a foot down. In that case we will create a dust effect.
if (_message == "footstep")
{
	// This creates an instance of obj_effect_walk at the bottom of the player's mask. This is the
	// walking dust animation.
	// The ID of the created instance is stored in a local variable.
	var _effect = instance_create_layer(this.x, this.bbox_bottom, "Instances", obj_effect_walk);

	// This sets the horizontal scale of the effect to the player's horizontal scale. This way
	// it flips based on which direction the player is moving in.
	_effect.image_xscale = this.image_xscale;

	// Choose a random sound to play on footstep
	var _sound = choose(snd_footstep_01, snd_footstep_02, snd_footstep_03);

	// Play that sound
	audio_play_sound(_sound, 0, 0);
}