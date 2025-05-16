// This runs the parent's Step event.
// The rest of the event handles changing the sprite of the block depending on the blocks surrounding it.
// It can be a "single" block, a "left" block in a row of blocks, a "right" block, or a "middle" block.
event_inherited();

// This local variable stores the frame that should be applied to the block by the end of the event.
// Here it is set to the current frame (image_index).
var _frame = this.image_index;

// This checks if there is another brick block to the left of the current block.
if (place_meeting(this.x - 1, this.y, obj_block_brick))
{
	// In that case the current block uses the "right" block frame.
	_frame = 3;

	// However if there is also a block to the right of the block,
	if (place_meeting(this.x + 1, this.y, obj_block_brick))
	{
		// Then we use the "middle" block frame
		_frame = 2;
	}
}
// This runs if there is no block to the left
else
{
	// If there is only a block to the right,
	if (place_meeting(this.x + 1, this.y, obj_block_brick))
	{
		// Then we use the "left" block frame
		_frame = 1;
	}
	// This runs if no surrounding blocks were found
	else
	{
		// Then we just use the "single" block frame
		_frame = 0;
	}
}

// This applies the new frame value to the image index of the block.
this.image_index = _frame;