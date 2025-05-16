// This event runs some time after the player is hit by an enemy, so the player's knockback can be stopped.
// This sets the 'in_knockback' variable to false, so the player knows it's not in knockback anymore, and it can move again.
this.in_knockback = false;

// This changes the sprite back to the idle one, as the knockback would have been using the hurt sprite.
this.sprite_index = spr_player_idle;
this.image_index = 0;