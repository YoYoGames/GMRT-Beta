// Set the Y target to 32 pixels above the block's starting position, so it moves there
this.target_y = this.ystart - 32;

// Set Alarm 0 to run after 4 frames, which will reset the Y target, causing the block to move back
alarm_set(0, 4);