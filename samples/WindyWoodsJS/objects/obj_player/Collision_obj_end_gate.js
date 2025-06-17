// 'obj_end_gate' is the goal of every level, so when the player collides with this, the level should end.
// This creates an instance of obj_player_fade, at the player's position.
// This new instance will fade away over time and once it has faded, it will start the next room.
instance_create_layer(this.x, this.y, this.layer, obj_player_end_level);

// This destroys the player instance as it's no longer needed.
instance_destroy();