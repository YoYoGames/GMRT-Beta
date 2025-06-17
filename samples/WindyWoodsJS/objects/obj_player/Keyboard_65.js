// This calls event_perform to run the Key Down - Left event.
// Pressing A will mimic the behaviour of the Left key event. This is for players
// who prefer WASD controls over arrow keys.
// This way you can make two events perform the same actions.
event_perform(ev_keyboard, vk_left);