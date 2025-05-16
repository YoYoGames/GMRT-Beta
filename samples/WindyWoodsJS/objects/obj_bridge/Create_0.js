// Use the "left end" frame by default
this.image_index = 1;

// If there is a bridge piece on the left,
if (place_meeting(this.x - 1, this.y, obj_bridge))
{
	// Use the "right end" frame
	this.image_index = 2;

	// If there is also a bridge piece on the right,
	if (place_meeting(this.x + 1, this.ystart, obj_bridge))
	{
		// Use the "middle" frame
		this.image_index = 0;
	}
}