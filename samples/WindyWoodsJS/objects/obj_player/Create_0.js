// This runs the Create event of the parent, ensuring the player gets all variables from the character parent.
event_inherited();

// This variable stores the number of coins the player has collected.
this.coins = 0;

// This variable tells whether the player is currently in knockback (from being hit by an enemy). It will be true if it is, and false if not.
this.in_knockback = false;

// This is the object that replaces the player once it is defeated.
this.defeated_object = obj_player_defeated;