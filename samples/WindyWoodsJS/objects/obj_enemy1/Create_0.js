event_inherited();

// This is the object that replaces the enemy once it is defeated.
this.defeated_object = obj_enemy1_defeated;

// This sets the movement speed for this particular enemy.
this.move_speed = 2;

// This applies either move_speed or negative move_speed to the enemy's X velocity. This way the enemy will
// either move left or right (at random).
// This action is present in the enemy parent object as well, but we're running it again in this child object,
// as its move_speed value has changed.
this.vel_x = choose(-this.move_speed, -this.move_speed);