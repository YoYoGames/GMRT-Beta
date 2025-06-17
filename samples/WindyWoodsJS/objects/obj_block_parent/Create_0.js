// This is the target position of the block on the Y axis. The block always moves to this
// position when it's not already there, so this is used to animate the block on the Y axis,
// when the player hits it.
this.target_y = this.y;

// This is a fake Y position used to move the block up and down as it animates
// We're doing this so the instance doesn't actually move and its mask stays in the same place
// A moving mask was found to cause collision issues
this.fake_y = this.y;