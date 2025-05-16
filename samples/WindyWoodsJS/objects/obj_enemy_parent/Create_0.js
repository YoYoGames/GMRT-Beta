event_inherited();

// This is the amount of damage the enemy does to the player.
this.damage = 1;

// This sets the movement speed for the enemies.
this.move_speed = 2;

// This applies either move_speed or negative move_speed to the enemy's X velocity. This way the enemy will
// either move left or right (at random).
this.vel_x = choose(-this.move_speed, this.move_speed);

// This sets the friction to 0 so the enemy never comes to a stop.
this.friction_power = 0;