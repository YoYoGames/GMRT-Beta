// This calls event_perform to run the Key Down - Right event.
// Pressing D will mimic the behaviour of the Right key event. This is for players
// who prefer WASD controls over arrow keys.
// This way you can make two events perform the same actions.
event_perform(ev_keyboard, vk_right);