// Run the parent's User Event 0
event_inherited();

// Play the 'box hit' sound
audio_play_sound(snd_box_hit, 0, 0);

// If the block is already inactive,
if (this.sprite_index == spr_block_coins_inactive)
{
	// Exit the event
	return;
}

// Reduce the block's hits by 1
// (This variable is created in the Variable Definitions and controls how many times this block can be hit)
this.hits_left -= 1;

// Play the 'box get' sound
audio_play_sound(snd_box_get, 0, 0);

// If the block is out of hits,
if (this.hits_left <= 0)
{
	// Deactivate it by changing its sprite to the inactive block sprite
	this.sprite_index = spr_block_coins_inactive;
}

// Add the block's coins value to the player's coins variable
// (This variable is created in the Variable Definitions)
//instance_find(obj_player, 0).coins += this.coins;
obj_player.coins += this.coins;

// Create the block 'hit animation' instance above the block; see the sprite "spr_block_coins_hit_animation"
// On the X axis, it's created at the center of the instance, by adding half its width to the X (which is on the left)
// The Y is 90 pixels below the top border
instance_create_layer(this.x + this.sprite_width / 2, this.y + 90, this.layer, obj_block_coins_hit_animtion);