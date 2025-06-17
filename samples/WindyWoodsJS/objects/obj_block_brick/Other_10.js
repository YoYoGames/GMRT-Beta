// Run the parent's User Event 0
event_inherited();

// Create an instance of the brick block destroy object, which is an animation that shows the
// block being destroyed
// It's created at the same position and in the same layer as the block itself
instance_create_layer(this.x + 0, this.y + 0, this.layer, obj_block_brick_destroy);

// Choose a random block hit sound and play it
var _sound = choose(snd_dirt_block_hit_01, snd_dirt_block_hit_02, snd_dirt_block_hit_02);

audio_play_sound(_sound, 0, 0);

// Destroy the brick block
instance_destroy();