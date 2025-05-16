// If the player is in a cave, fade out all overworld ambience (trees and wind), and
// fade in all cave ambience, over a period of 2 seconds
if (this.in_cave)
{
	audio_sound_gain(snd_amb_trees, 0, 2000);

	audio_sound_gain(snd_amb_wind, 0, 2000);

	audio_sound_gain(snd_amb_cave_01, this.vol_cave_1, 2000);

	audio_sound_gain(snd_amb_cave_02, this.vol_cave_2, 2000);
}

// If the player is not in a cave, fade out all cave ambience, and fade in overworld ambience (trees and wind)
else
{
	audio_sound_gain(snd_amb_cave_01, 0, 2000);

	audio_sound_gain(snd_amb_cave_02, 0, 2000);

	audio_sound_gain(snd_amb_trees, this.vol_trees, 2000);

	audio_sound_gain(snd_amb_wind, this.vol_wind, 2000);
}