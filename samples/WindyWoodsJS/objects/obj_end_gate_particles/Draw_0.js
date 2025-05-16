// This event changes the blend mode to Add,
// draws the instance, and resets the blend mode
gpu_set_blendmode(bm_add);

draw_self();

gpu_set_blendmode(bm_normal);