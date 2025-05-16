// Create a layer for the pixelate filter
this.transition_layer = layer_create(-10000);

// Create the pixelate filter itself
this.transition_filter = fx_create("_filter_pixelate");

// Assign the filter to the layer
layer_set_fx(this.transition_layer, this.transition_filter);

// Initialize the cell size used for the pixelate filter
this.cellSize = 1;

// Assign the cell size to the filter
fx_set_parameter(this.transition_filter, "g_CellSize", this.cellSize);

// Start Alarm 0
alarm_set(0, 1);