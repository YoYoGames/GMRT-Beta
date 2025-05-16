// Reduce the cell size by 2
// This event runs when the second room has started, so the pixelation is decreased
this.cellSize -= 2;

// Apply the new cell size to the filter
fx_set_parameter(this.transition_filter, "g_CellSize", this.cellSize);

// If the cell size is at or below 2,
if (this.cellSize <= 2)
{
	// Destroy this instance
	instance_destroy();

	// Destroy the filter layer
	layer_destroy(this.transition_layer);
}
// Otherwise,
else
{
	// Run Alarm 1 again in the next frame
	alarm_set(1, 1);
}