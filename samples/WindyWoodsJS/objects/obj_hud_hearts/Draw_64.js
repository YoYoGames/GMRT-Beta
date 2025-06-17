// If the player instance does not exist,
if (!instance_exists(obj_player))
{
	// Exit the event so it does not run
	return;
}

// Draw the empty heart sprites up to the player's max hp value
var _width = sprite_get_width(spr_hud_heart_empty);
var _x_pos = 0;

for (var i = obj_player.max_hp; i > 0; --i)
{
	draw_sprite(spr_hud_heart_empty, 0, this.x + _x_pos, this.y);
	
	_x_pos += _width;
}

// Draw the full heart sprites up to the player's hp
_width = sprite_get_width(spr_hud_heart_full);
_x_pos = 0;

for (var i = obj_player.hp; i > 0; --i) {
	draw_sprite(spr_hud_heart_full, 0, this.x + _x_pos, this.y);
	
	_x_pos += _width;
}