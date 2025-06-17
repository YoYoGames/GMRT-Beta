// Increase the cell size by 1
// This event runs when the first room is ending, so the pixelation is increased
this.cellSize += 1;

// Apply the new cell size to the filter
fx_set_parameter(this.transition_filter, "g_CellSize", this.cellSize);

// Run Alarm 0 again in the next frame
alarm_set(0, 1);