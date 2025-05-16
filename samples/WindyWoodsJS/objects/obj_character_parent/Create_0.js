// This is the horizontal movement speed of the character.
// It's in pixels per second.
this.move_speed = 8;

// This is the friction value applied to the character's horizontal movement every frame.
// This is applied in the Begin Step event. The friction is reduced when the character is in mid-air.
this.friction_power = 0.7;

// This is the jumping speed of the character.
this.jump_speed = 23;

// This is the gravity applied every frame.
this.grav_speed = 1;

// vel_x and vel_y are the X and Y velocities of the character.
// They store how much the character is moving in any given frame.
this.vel_x = 0;
this.vel_y = 0;

// grounded: This stores whether the character is currently on the ground.
// grounded_x: This stores the X position of the character when it was last on ground.
// grounded_y: Same but on the Y axis.
// These variables are used to put the player back on the ground after it has fallen.
this.grounded = false;
this.grounded_x = this.x;
this.grounded_y = this.y;

// 'max_hp' is the maximum health for the
// character.
// 'hp' is the actual health of the character.
// It's initialised at the same value as 'max_hp'.
this.max_hp = 3;
this.hp = this.max_hp;

// This variable is used to grant the player invincibility, after it's hit by an enemy or after it falls off ground.
// It stores the remaining number of frames where the player can't be hurt. If it's 0, it means the player is not invincible.
this.no_hurt_frames = 0;

// This is the object that replaces the character once it is defeated. By default it's set to 'obj_player_defeated'
// and its value may be changed in a child object.
this.defeated_object = obj_player_defeated;