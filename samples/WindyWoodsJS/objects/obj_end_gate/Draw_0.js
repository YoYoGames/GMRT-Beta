// Before drawing the end gate itself, we want to draw its inside, using the Add blend mode
// so it appears bright.
// We're calling the gpu_set_blendmode function to change the blend mode to Add.
gpu_set_blendmode(bm_add);

// This draws the inside part of the end gate, at the position of the gate itself.
draw_sprite(spr_end_gate_glow, 0, this.x, this.y);

// This resets the blend mode to Normal, which is necessary to do once you are done using your
// changed blend mode.
gpu_set_blendmode(bm_normal);

// This draws the end gate instance itself.
draw_self();