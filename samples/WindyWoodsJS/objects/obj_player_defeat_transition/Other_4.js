// This event runs when the new room starts, and it creates the filter just like the Create event
this.transition_layer = layer_create(-10000);

this.transition_filter = fx_create("_filter_pixelate");

layer_set_fx(this.transition_layer, this.transition_filter);

fx_set_parameter(this.transition_filter, "g_CellSize", this.cellSize);

// Start Alarm 1
alarm_set(1, 1);