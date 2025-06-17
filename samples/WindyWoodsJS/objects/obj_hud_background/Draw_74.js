// If the player instance does not exist,
if (!instance_exists(obj_player))
{
	// Exit the event so it does not run
	return;
}

// Draw the object itself. It's drawn in Draw GUI Begin
// so it appears behind other HUD elements, which are
// drawn in Draw GUI.
draw_self();