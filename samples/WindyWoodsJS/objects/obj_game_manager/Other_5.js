// Restore ambient audio volumes
audio_sound_gain(snd_amb_cave_01, this.vol_cave_1, 0);

audio_sound_gain(snd_amb_cave_02, this.vol_cave_2, 0);

audio_sound_gain(snd_amb_trees, this.vol_trees, 0);

audio_sound_gain(snd_amb_wind, this.vol_wind, 0);

// Stop music and ambient audio
audio_stop_sound(snd_music_level);

audio_stop_sound(snd_amb_cave_01);

audio_stop_sound(snd_amb_cave_02);

audio_stop_sound(snd_amb_trees);

audio_stop_sound(snd_amb_wind);

// Restore the leaf count for the leaves effect
fx_set_parameter(this.effect_leaf, "param_num_particles", this.leaf_count);