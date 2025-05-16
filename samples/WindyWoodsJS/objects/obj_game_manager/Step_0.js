// If the "EffectLeaf" layer exists,
if (layer_exists("EffectLeaf"))
{
	// If the player exists,
	if (instance_exists(obj_player))
	{
		// If the player is colliding with a  "stop leaf effect" instance,
		var _player_colliding = false;
		
		//with (obj_player) {
            var playerInst = instance_find(obj_player, 0);
			_player_colliding = place_meeting.call(playerInst, playerInst.x, playerInst.y, obj_stop_leaf_effect);
		//}
		
		if (_player_colliding)
		{
			// Set leaf particle count to 0
			fx_set_parameter(this.effect_leaf, "param_num_particles", 0);
		
			// Set in_cave to true for ambient audio
			this.in_cave = true;
		
			// Call User Event 0 which switches ambient audio depending on in_cave
			event_user(0);
		}
		// Otherwise,
		else
		{
			// Restore leaf count
			fx_set_parameter(this.effect_leaf, "param_num_particles", this.leaf_count);
		
			// Set in_cave to false for ambient audio
			this.in_cave = false;
		
			// Call User Event 0 which switches ambient audio depending on in_cave
			event_user(0);
		}
	}
}