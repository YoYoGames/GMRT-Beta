// This condition checks if the player is found 1 pixel below the block.
// If the player is there, we'll check if it's jumping up, and run the block's User Event 0
// (which means the block has been hit).
if (place_meeting(this.x, this.y + 1, obj_player))
{
	// To hit a block, the player has to be jumping up.
	// However after a collision was found, then the Y velocity will already have been set to 0, so we can't use that
	// to check if the player is jumping.
	// We instead check if the player's previous Y position (from the last frame) was greater than its current Y
	// position, meaning it moved upwards. This satisfies our conditions for hitting a block.
	if (obj_player.yprevious > obj_player.y)
	{
		// This runs User Event 0 for this block.
		event_user(0);
	
		// This changes the Y velocity of the player so it falls faster, as feedback for hitting the block.
		obj_player.vel_y = 4;
	}
}